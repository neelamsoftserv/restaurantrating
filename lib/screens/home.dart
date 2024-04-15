import 'package:flutter/material.dart';
import 'package:restaurantrating/apis/services/blocs/applifecycleobserver/applifecycle_observer.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/apis/services/repositories/geolocation/geolocation_repository.dart';
import 'package:restaurantrating/constants/color_constants.dart';
import 'package:restaurantrating/screens/restaurtants/near_me.dart';
import 'package:restaurantrating/screens/restaurtants/search_restaurant.dart';

import '../apis/services/blocs/restaurant_blocs/restaurant_bloc.dart';
import '../common/widgets.dart';
import '../constants/image_constants.dart';
import '../constants/label_constants.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ///to control the focus of search input field
  FocusNode searchFocus = FocusNode();

  ///search text editing controller
  TextEditingController searchController = TextEditingController();

  List<Widget> tabBarItems = const [
      Tab(
      child: Text(LabelConstants.nearMe, ),

    ),
     Tab(
      child: Text(LabelConstants.topRated, ),
    ),
    Tab(
      child: Text(LabelConstants.trending, ),
    ),
    Tab(
      child: Text(LabelConstants.newRes, ),),
  ];

  TabController? _tabController;

  @override
  void initState() {
    // Registering the observer to listen to app lifecycle changes
    WidgetsBinding.instance.addObserver(
      AppLifecycleObserver(appStateBloc: GeoLocationBloc(geoLocationRepository:  GeoLocationRepository()))
    );
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(
        AppLifecycleObserver(appStateBloc: GeoLocationBloc(geoLocationRepository:  GeoLocationRepository()))
    );
    super.dispose();
  }

  final RestaurantBloc restaurantBloc = RestaurantBloc();
  final GeoLocationBloc geoLocationBloc = GeoLocationBloc(geoLocationRepository: GeoLocationRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height*.22
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Image.asset(ImageConstants.menu,width: 30, height: 30,),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Image.asset(ImageConstants.profilepic,width: 30, height: 30,),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(LabelConstants.rateAndDiscover,style: Widgets.common34px700(),),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ///search box
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 8),
              child: TextFormField(
                readOnly: true,
                focusNode: searchFocus,
                controller: searchController,
                textInputAction: TextInputAction.done,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      const SearchRestaurant()
                  ));
                },
                style: const TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                      onTap: () {

                      },
                      child: const Icon(
                        Icons.search,
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
              ),
            ),
            Expanded(
              child: DefaultTabController(
                initialIndex: 0,
                length: 4,
                child: Column(
                  children: [
                    SizedBox(
                      height:40,
                      width: MediaQuery.of(context).size.width,
                      child: TabBar(
                          isScrollable: true,
                          controller: _tabController,
                          unselectedLabelStyle: Widgets.common17px400Grey(),
                          labelStyle: Widgets.common17px400Blue(),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding: const EdgeInsets.only(left: 8, right: 8),
                          indicatorColor: ColorConstants.blueColor,
                          indicatorWeight: 2,
                          tabs: tabBarItems,
                        onTap: (value){
                           /* if(value == 0){
                              restaurantBloc.add(GetRestaurantList());
                              geoLocationBloc.add(LoadGeoLocation());
                            }
*/
                        }
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const TabBarView(
                          children: <Widget>[
                            NearMeRestaurant(itemIndex:0),
                            NearMeRestaurant(itemIndex:1),
                            NearMeRestaurant(itemIndex:2),
                            NearMeRestaurant(itemIndex:3),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
