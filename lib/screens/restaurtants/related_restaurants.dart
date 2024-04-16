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
    restaurantBlocRelated.add(GetRestaurantList());
    //restaurantList = filterRestaurantAccCate(widget.categories,restaurantBloc.restData);



    super.initState();
  }


  List<RestaurantListResponse> getRelatedRest(){
    List<RestaurantListResponse> restData = [];
    for(var item in restaurantBloc.restData){
      if(widget.name.toLowerCase()==item.name.toString().toLowerCase()){

      }
      else {
        restData.add(item);
      }

    }
    print("Called Case 2 ${restaurantBlocRelated.restData.length}");

    return restData;
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
                  List<RestaurantListResponse> restData = [];
                  //print("length${restaurantBlocRelated.restData.length}");
                  if(restaurantBlocRelated.restData.isNotEmpty){
                    print("Called Case 1 ${restaurantBlocRelated.restData.length}");
                     restData = getRelatedRest();
                  }else{
                    print("Called Case ===> ${restaurantBlocRelated.restData.length}");
                  }
                  return BlocBuilder<GeoLocationBloc,GeolocationState>(
                    builder: (context,geoState) {
                      if(geoState is GeoLocationLoaded){
                        return
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: restData.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index){
                                var item = restData[index];
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
                              });
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
    print("called ${restroList.length}");
    bool found = false;
    if(categories!=null && restroList.isNotEmpty){
      for(var restro in restroList){
        for(var resCat in restro.categories??[]){
          for(var item in categories){
            if(item == resCat){
              found = true;
              print("called");
              restaurantList.add(restro);
            }
          }
        }
      }
    }
    if(restaurantList.isNotEmpty){
      restaurantBloc.restData = restaurantList;
    }
    return restaurantList;
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
