import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/apis/services/repositories/geolocation/geolocation_repository.dart';
import 'package:restaurantrating/common/widgets.dart';
import 'package:restaurantrating/constants/image_constants.dart';
import 'package:restaurantrating/models/restaurant_model.dart';
import 'package:restaurantrating/screens/restaurtants/restaurant_details.dart';

class RestaurantItem extends StatefulWidget {
  final RestaurantListResponse item;
  const RestaurantItem({super.key,
    required this.item,
  });

  @override
  State<RestaurantItem> createState() => _RestaurantItemState(item);
}

class _RestaurantItemState extends State<RestaurantItem> {
  final RestaurantListResponse item;
  _RestaurantItemState(this.item);

  double? endLatitude;
  double? endLongitude;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantDetail(
            restaurantItem: item,
            endLatitude: endLatitude??0.0,
            endLongitude: endLongitude??0.0
        )));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 220,height: MediaQuery.of(context).size.height*.50,
              child:
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .08),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                padding: const EdgeInsets.only(bottom: 10),
                width: 220,height: MediaQuery.of(context).size.height*.20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: MediaQuery.of(context).size.height*.15,),
                    Container(
                        height: MediaQuery.of(context).size.height*.10,
                        alignment: Alignment.center,
                        child: Text(item.name.toString(),style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis
                        ),textAlign: TextAlign.center,maxLines: 3,)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(ImageConstants.star,width:20,height: 20,),
                                  const SizedBox(width: 5,),
                                  Text(item.stars.toString(),style: Widgets.common22px600(),),
                                ],
                              ),
                              BlocBuilder<GeoLocationBloc, GeolocationState>(
                                  builder: (context,state) {
                                    if(state is GeolocationLoading){
                                      return const Center(child: Text("Loading"));
                                    }
                                    else if(state is GeoLocationLoaded){
                                      endLatitude = state.position.latitude;
                                      endLongitude = state.position.longitude;

                                      return Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(ImageConstants.location,width:20,height: 20,),
                                          const SizedBox(width: 5,),
                                          Text(
                                            Widgets().calculateDistance(
                                              startLatitude: item.contact!.location![0],
                                              startLongitude: item.contact!.location![1],
                                              endLatitude: state.position.latitude,
                                              endLongitude: state.position.longitude
                                          ),style: Widgets.common22px600(),),
                                        ],
                                      );
                                    }
                                    else{
                                      return const Text("");
                                    }

                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: MediaQuery.of(context).size.height * .20, // Adjust this value to lift the image above the container
              child: Image.asset(
                item.image.toString(),
                width: 164.16,
                height: 164.16,fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
