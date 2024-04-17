import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/constants/image_constants.dart';
import 'package:restaurantrating/models/restaurant_model.dart';
import 'package:restaurantrating/screens/restaurtants/restaurant_details.dart';

import '../../apis/services/blocs/restaurant_blocs/restaurant_bloc.dart';
import '../../common/widgets.dart';

class RelatedRestaurants extends StatefulWidget {
  final List <String>? categories;
  final String name;
  const RelatedRestaurants({super.key,required this.categories,required this.name});

  @override
  State<RelatedRestaurants> createState() => _RelatedRestaurantsState();
}

class _RelatedRestaurantsState extends State<RelatedRestaurants> {

  List<RestaurantListResponse> restaurantList = [];

  final RestaurantBloc restaurantBloc = RestaurantBloc();
  final RestaurantBloc restaurantBlocRelated = RestaurantBloc();

  @override
  void initState() {
    restaurantBloc.add(GetRestaurantList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*.40,
          child: BlocProvider(
            create: (_) => restaurantBloc,
            child: BlocBuilder<RestaurantBloc,RestaurantState>(
              builder: (context,state) {
                if(state is RestaurantInitial){
                  return _buildLoading();
                }
                else if(state is RestaurantLoaded){
                 restaurantList = filterRestaurantAccCate(widget.categories,restaurantBloc.restData);
                  return BlocBuilder<GeoLocationBloc,GeolocationState>(
                    builder: (context,geoState) {
                      if(geoState is GeoLocationLoaded){
                        return restaurantList.isNotEmpty?
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: restaurantList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index){
                                var item = restaurantList[index];
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                        RestaurantDetail(
                                        restaurantItem: item,
                                        endLatitude: geoState.position.latitude,
                                        endLongitude: geoState.position.longitude)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(top: 50),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          padding: const EdgeInsets.only(bottom: 10),
                                          width: 190,height: 270,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(item.name.toString(),style: Widgets.common22px600(),textAlign: TextAlign.center,),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                                                child: FittedBox(
                                                  child: Center(
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Image.asset(ImageConstants.star,width:20,height: 20,),
                                                        Text(item.stars.toString(),style: Widgets.common22px600(),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          left: 20,
                                          bottom: 150, // Adjust this value to lift the image above the container
                                          child: Image.asset(
                                            item.image.toString(),                   width: 150.16,
                                            height: 150.16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }):
                         Center(
                          child: Text("No Related Restaurants",style: Widgets.common28px700(),),
                        );
                      }
                      else if(geoState is GeolocationLoading){
                        return _buildLoading();
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
      ],);
  }

  List<RestaurantListResponse> filterRestaurantAccCate(List<String>? categories, List<RestaurantListResponse> restroList) {
    List<RestaurantListResponse> filteredList = [];
    if(categories!=null && restroList.isNotEmpty){
      for(var restro in restroList){
        if(restro.name.toString().toLowerCase() != widget.name.toString().toLowerCase()){
          for(var resCat in restro.categories??[]){
            if(categories.contains(resCat)){
              filteredList.add(restro);
              break;
            }
          }
        }

      }
    }
    return filteredList;
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
