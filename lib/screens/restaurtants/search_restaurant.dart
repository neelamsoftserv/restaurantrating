import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/common/widgets.dart';
import 'package:restaurantrating/constants/color_constants.dart';
import 'package:restaurantrating/models/restaurant_model.dart';
import 'package:restaurantrating/screens/restaurtants/restaurant_details.dart';

import '../../apis/services/blocs/restaurant_blocs/restaurant_bloc.dart';
import '../../constants/image_constants.dart';
import '../../constants/label_constants.dart';

class SearchRestaurant extends StatefulWidget {
  const SearchRestaurant({super.key});

  @override
  State<SearchRestaurant> createState() => _SearchRestaurantState();
}

class _SearchRestaurantState extends State<SearchRestaurant> {

  ///to control the focus of search input field
  FocusNode searchFocus = FocusNode();

  ///search text editing controller
  TextEditingController searchController = TextEditingController();

  List restaurantList = [
    {
      "name": "Fit Fresh Bites",
      "image": ImageConstants.restroOne,
      "rating": "4.3",
      "distance":"5.2KM"
    },
    {
      "name": "Fit Fresh Bites",
      "image": ImageConstants.restroOne,
      "rating": "4.3",
      "distance":"5.2KM"
    },
    {
      "name": "Fit Fresh Bites",
      "image": ImageConstants.restroOne,
      "rating": "4.3",
      "distance":"5.2KM"
    },
    {
      "name": "Fit Fresh Bites",
      "image": ImageConstants.restroOne,
      "rating": "4.3",
      "distance":"5.2KM"
    },
    {
      "name": "Fit Fresh Bites",
      "image": ImageConstants.restroOne,
      "rating": "4.3",
      "distance":"5.2KM"
    },
    {
      "name": "Fit Fresh Bites",
      "image": ImageConstants.restroOne,
      "rating": "4.3",
      "distance":"5.2KM"
    }
  ];

  final RestaurantBloc restaurantBloc = RestaurantBloc();
  @override
  void initState() {
    restaurantBloc.add(GetRestaurantList());
    super.initState();
  }

  double? endLatitude;
  double? endLongitude;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height*.22
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
            child: TextFormField(
              readOnly: false,
              focusNode: searchFocus,
              controller: searchController,
              textInputAction: TextInputAction.done,

              style: const TextStyle(color: Colors.black, fontSize: 16),
              decoration: InputDecoration(
                isDense: true,
                  contentPadding: const EdgeInsets.all(8.0),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      searchFocus.unfocus();
                      Navigator.pop(context);

                    },
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: .5,
                      ),
                      borderRadius: BorderRadius.circular(25.0)),
                  fillColor: Colors.black12,
                  labelText: LabelConstants.search,
                  labelStyle: TextStyle(color: Colors.blueGrey[500]),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: .2,
                      ),
                      borderRadius: BorderRadius.circular(25.0))),
              onFieldSubmitted: (value){
                final restData = Widgets().searchValue(value,restaurantBloc.restData);
                if(restData.isNotEmpty){
                  restaurantBloc.restData = restData;
                }
                else {
                  searchController.text="";
                  restaurantBloc.add(GetRestaurantList());
                }
              },
             onChanged: (value){
                if(value.isEmpty){
                  restaurantBloc.add(GetRestaurantList());
                }
             }
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
          child: searchController.text.isEmpty?
              Center(child: Text("No Items",style: Widgets.common28px700(),)):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("Found ${restaurantBloc.restData.length} Results",style: Widgets.common28px700(),),
              ),
              Expanded(
                child: BlocProvider(
                  create: (_)=>restaurantBloc,
                  child: BlocBuilder<RestaurantBloc,RestaurantState>(
                    builder: (context, state) {
                      if(state is RestaurantInitial){
                        return _buildLoading();
                      }
                      else if (state is RestaurantLoaded){
                        return
                          GridView.custom(
                            semanticChildCount: restaurantBloc.restData.length,
                            gridDelegate: SliverStairedGridDelegate(
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 14,
                              // startCrossAxisDirectionReversed: true,
                              pattern: [
                                StairedGridTile(0.5, 2 / 4),
                                StairedGridTile(0.5, 2 / 4),
                              ],
                            ),
                            childrenDelegate: SliverChildBuilderDelegate(
                                childCount: restaurantBloc.restData.length,
                                    (context, index) {
                                  var item = restaurantBloc.restData[index];
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantDetail(
                                          restaurantItem: item,
                                          endLatitude: endLatitude??0.0,
                                          endLongitude: endLongitude??0.0
                                      )));
                                    },
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
                                          width: 220,height: 270,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(height: 50),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: FittedBox(
                                                  child: Text(item.name.toString(),style: Widgets.common22px600(),textAlign: TextAlign.center,),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Image.asset(ImageConstants.star,width:20,height: 20,),
                                                          const SizedBox(width: 5,),
                                                          FittedBox(child: Text(item.stars.toString(),style: Widgets.common16px400(),)),
                                                        ],
                                                      ),
                                                    )
                                                    ,
                                                    const SizedBox(width: 5,),
                                                    Expanded(
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Image.asset(ImageConstants.location,width:20,height: 20,),
                                                            const SizedBox(width: 5,),
                                                            Expanded(
                                                                child: BlocBuilder<GeoLocationBloc, GeolocationState>(
                                                                    builder: (context,state) {
                                                                      if(state is GeolocationLoading){
                                                                        return const Center(child: Text("Loading"));
                                                                      }
                                                                      else if (state is GeoLocationLoaded){
                                                                        return FittedBox(
                                                                          child:Text(calculateDistance(
                                                                              startLatitude: item.contact!.location![0],
                                                                              startLongitude: item.contact!.location![1],
                                                                              endLatitude: state.position.latitude,
                                                                              endLongitude: state.position.longitude
                                                                          ),style: Widgets.common22px600(),),
                                                                        );
                                                                      }
                                                                      else{
                                                                        return const Text("");
                                                                      }

                                                                    }
                                                                )

                                                            ),
                                                          ],
                                                        )
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          left: 20,
                                          bottom: 190, // Adjust this value to lift the image above the container
                                          child: Image.asset(
                                            item.image.toString(),
                                            width: 125.16,
                                            height: 125.16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                            ),
                          );
                      }
                      else {
                        return Container();
                      }

                    }
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  String calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required  double endLongitude
  }) {
    var distance = Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);

    var distanceInKM = distance/1000;

    if(distanceInKM<1){
      return "${distance.toDouble().round().toString()}m";
    }
    else{
      return "${distanceInKM.toDouble().round().toString()}KM";
    }

  }


}
