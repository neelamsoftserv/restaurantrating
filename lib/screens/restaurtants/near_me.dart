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

class NearMeRestaurant extends StatefulWidget {
  final int itemIndex;
  const NearMeRestaurant({super.key, required this.itemIndex});

  @override
  State<NearMeRestaurant> createState() => _NearMeRestaurantState();
}

class _NearMeRestaurantState extends State<NearMeRestaurant> {

  final RestaurantBloc restaurantBloc = RestaurantBloc();
  final GeoLocationBloc geoLocationBloc = GeoLocationBloc(geoLocationRepository: GeoLocationRepository());

  StreamSubscription<Position>? positionSubscription;


  @override
  void initState() {
    restaurantBloc.add(GetRestaurantList());
      positionSubscription = Geolocator.getPositionStream().listen((position) {
        restaurantBloc.add(GetRestaurantList());
        geoLocationBloc.add(UpdateGeoLocation(position: position));
      });

    super.initState();
  }
  LocationSettings? locationSettings;

  @override
  dispose() {
    positionSubscription?.cancel();
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                 return _buildLoading();
               }
               else if(state is RestaurantLoaded){

                 return BlocBuilder<GeoLocationBloc,GeolocationState>(
                   builder: (context,stategeo) {
                     if(stategeo is GeolocationLoading){
                       print(stategeo);
                       return _buildLoading();
                     }
                     else if(stategeo is GeoLocationLoaded){
                       if(widget.itemIndex == 0){
                         restaurantBloc.restData = sortRestroList(restaurantBloc.restData,stategeo.position.longitude,stategeo.position.latitude);
                       }
                       else if(widget.itemIndex == 1){
                         restaurantBloc.restData = sortListAccordingRating(restaurantBloc.restData);
                       }
                       return ListView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: restaurantBloc.restData.length,
                           shrinkWrap: true,
                           itemBuilder: (BuildContext context, index){
                             var item = restaurantBloc.restData[index];
                             return RestaurantItem(
                                 item:item
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
