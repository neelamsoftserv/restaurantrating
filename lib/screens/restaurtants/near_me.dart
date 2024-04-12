import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/apis/services/blocs/restaurant_blocs/restaurant_bloc.dart';
import 'package:restaurantrating/apis/services/repositories/geolocation/geolocation_repository.dart';
import 'package:restaurantrating/common/widgets.dart';
import 'package:restaurantrating/constants/image_constants.dart';
import 'package:restaurantrating/constants/label_constants.dart';
import 'package:restaurantrating/models/restaurant_model.dart';
import 'package:restaurantrating/screens/restaurtants/restaurant_item.dart';

class NearMeRestaurant extends StatefulWidget {
  const NearMeRestaurant({super.key});

  @override
  State<NearMeRestaurant> createState() => _NearMeRestaurantState();
}

class _NearMeRestaurantState extends State<NearMeRestaurant> {

  final RestaurantBloc restaurantBloc = RestaurantBloc();
  final GeoLocationBloc geoLocationBloc = GeoLocationBloc(geoLocationRepository: GeoLocationRepository());


  @override
  void initState() {
    restaurantBloc.add(GetRestaurantList());
    super.initState();
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
                 restaurantBloc.restData = sortRestroList(restaurantBloc.restData);
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

  List<RestaurantListResponse> sortRestroList(List<RestaurantListResponse> restData) {

    restData.sort((a,b){
      double startLatitudeA = a.contact!.location![0];
      double startLongitudeA = a.contact!.location![1];

      var distanceA =  calculateDistance(
          startLatitude: startLatitudeA,
          startLongitude: startLongitudeA,
          endLatitude: geoLocationBloc.position?.latitude??0.0,
          endLongitude: geoLocationBloc.position?.longitude??0.0);

      double startLatitudeB = b.contact!.location![0];
      double startLongitudeB = b.contact!.location![1];

      var distanceB =  calculateDistance(
          startLatitude: startLatitudeB,
          startLongitude: startLongitudeB,
          endLatitude: geoLocationBloc.position?.latitude??0.0,
          endLongitude: geoLocationBloc.position?.longitude??0.0);

      debugPrint('distanceA$distanceA');
      debugPrint('distanceB$distanceB');

      // var difference = distanceA-distanceB;

      return distanceA.compareTo(distanceB);

     /* if(difference <0){
        return -1;
      }
      else if(difference>0){
        return 1;
      }
      else{
        return 0 ;
      }*/


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
      debugPrint("distanceInKM${distanceInKM.toDouble().round()}");
      return distanceInKM.toDouble().round();
    }

  }
}
