import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/apis/services/blocs/restaurant_blocs/restaurant_bloc.dart';
import 'package:restaurantrating/apis/services/repositories/geolocation/geolocation_repository.dart';
import 'package:restaurantrating/common/widgets.dart';
import 'package:restaurantrating/constants/label_constants.dart';
import 'package:restaurantrating/models/restaurant_model.dart';
import 'package:restaurantrating/screens/restaurtants/restaurant_item.dart';

import '../../apis/services/blocs/applifecycleobserver/applifecycle_observer.dart';

class NearMeRestaurant extends StatefulWidget {
  final int itemIndex;
  const NearMeRestaurant({super.key, required this.itemIndex});

  @override
  State<NearMeRestaurant> createState() => _NearMeRestaurantState();
}

class _NearMeRestaurantState extends State<NearMeRestaurant> with WidgetsBindingObserver {

  final RestaurantBloc restaurantBloc = RestaurantBloc();
  final GeoLocationBloc geoLocationBloc = GeoLocationBloc(geoLocationRepository: GeoLocationRepository());

StreamSubscription<Position>? positionSubscription;
  bool isBlocClosed = false;


  @override
  void initState() {

    WidgetsBinding.instance.addObserver(this);
    restaurantBloc.add(GetRestaurantList());
    geoLocationBloc.add(LoadGeoLocation());

    Future.delayed(const Duration(seconds: 2),(){
      if(!isBlocClosed){
      positionSubscription = Geolocator.getPositionStream().listen((position) {
          geoLocationBloc.add(UpdateGeoLocation(position: position));

      });
      }
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<GeoLocationBloc>(context).add(LoadGeoLocation());
    }
  }

  @override
  dispose() {
    positionSubscription?.cancel();
    // Close blocs before disposing
    restaurantBloc.close();
    geoLocationBloc.close();
    isBlocClosed = true;

    WidgetsBinding.instance.removeObserver(this);
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
              child: BlocProvider(
                create: (_) => restaurantBloc,
                child: BlocListener<RestaurantBloc,RestaurantState>(
                  listener: (context, state){

                  },
                  child: BlocBuilder<RestaurantBloc,RestaurantState>(
                      builder: (context, state){
                        if(state is RestaurantInitial){
                          debugPrint("state$state");
                          return _buildLoading();
                        }
                        else if(state is RestaurantLoaded){
                          debugPrint("state$state");

                          return BlocProvider(
                            create: (_) => geoLocationBloc,
                            child: BlocBuilder<GeoLocationBloc,GeolocationState>(
                                builder: (context,stategeo) {
                                  if(stategeo is GeolocationLoading){
                                    debugPrint("state$stategeo");
                                    return _buildLoading();
                                  }
                                  else if(stategeo is GeoLocationLoaded){
                                    List<RestaurantListResponse> restData = [];
                                    debugPrint("state$stategeo");
                                    if(widget.itemIndex == 0){
                                      restData = sortRestroList(restaurantBloc.restData,stategeo.position.longitude,stategeo.position.latitude);
                                    }
                                    else if(widget.itemIndex == 1){
                                      restData = sortListAccordingRating(restaurantBloc.restData);
                                    }
                                    else {
                                      restData = restaurantBloc.restData;
                                    }
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: restData.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context, index){
                                          var item = restData[index];
                                          return RestaurantItem(
                                              item:item,
                                          );
                                        });
                                  }
                                  else if (stategeo is GeolocationError){
                                    print("error $stategeo");
                                    return Container();
                                  }
                                  else {
                                    return Container();
                                  }
                                }
                            ),
                          );
                        }
                        else{
                          return Container();
                        }
                      }
                  ),
                ),
              )
          ),
          InkWell(
            onTap: (){},
            child: Text(LabelConstants.seeMore,style: Widgets.common15px400Blue(),),
          )
        ],),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  List<RestaurantListResponse> sortRestroList(List<RestaurantListResponse> restData, double longitude, double latitude) {

    restData.sort((a,b){
      double startLatitudeA = a.contact!.location![0];
      double startLongitudeA = a.contact!.location![1];

      var distanceA =  calculateDistance(
          startLatitude: startLatitudeA,
          startLongitude: startLongitudeA,
          endLatitude: latitude,
          endLongitude: longitude);

      double startLatitudeB = b.contact!.location![0];
      double startLongitudeB = b.contact!.location![1];

      var distanceB =  calculateDistance(
          startLatitude: startLatitudeB,
          startLongitude: startLongitudeB,
          endLatitude: latitude,
          endLongitude: longitude);

      return distanceA.compareTo(distanceB);

    });

    return restData;
  }

  int calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required  double endLongitude
  }) {
    var distance = Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);






    var distanceInKM = distance/1000;


    if(distanceInKM<1){

      return distance.toDouble().round();
    }
    else{
      // debugPrint("distanceInKM${distanceInKM.toDouble().round()}");
      return distanceInKM.toDouble().round();
    }

  }

  List<RestaurantListResponse> sortListAccordingRating(List<RestaurantListResponse> restData) {
    restData.sort((a,b){

      int starA = a.stars??1;
      int starB = b.stars??1;

      return starA.compareTo(starB);

    });
    return restData.reversed.toList();
  }
}
