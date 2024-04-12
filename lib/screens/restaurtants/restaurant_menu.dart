import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../common/widgets.dart';
import '../../constants/color_constants.dart';
import '../../constants/image_constants.dart';
import '../../constants/label_constants.dart';

class RestaurantMenu extends StatefulWidget {
  const RestaurantMenu({super.key});

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}

List restaurantList = [
  {
    "name": "Ceaser Salad",
    "image": ImageConstants.salad,
    "rating": "4.3",
    "distance":"5.2KM"
  },
  {
    "name": "Cold Coffee",
    "image": ImageConstants.coldCoffee,
    "rating": "4.3",
    "distance":"5.2KM"
  },
  {
    "name": "Garlic Bread",
    "image": ImageConstants.garlicBread,
    "rating": "4.3",
    "distance":"5.2KM"
  },
  {
    "name": "Salted Fries",
    "image": ImageConstants.saltedFries,
    "rating": "4.3",
    "distance":"5.2KM"
  },
  {
    "name": "Veg Sandwich",
    "image": ImageConstants.vegSandwich,
    "rating": "4.3",
    "distance":"5.2KM"
  },
  {
    "name": "Hot Chocolate",
    "image": ImageConstants.hotChocolate,
    "rating": "4.3",
    "distance":"5.2KM"
  }
];

class _RestaurantMenuState extends State<RestaurantMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstants.backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height*.10
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_sharp,color: Colors.black,
                      ),
                    ),
                    Expanded(
                        child: Center(child: Text(LabelConstants.menu,style: Widgets.common18px600(),)))
                  ],
                )
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                  child: topWidget(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                    child: GridView.custom(
                      semanticChildCount: restaurantList.length,
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
                          childCount: restaurantList.length,
                              (context, index) {
                            var item = restaurantList[index];
                            return InkWell(
                              onTap: (){
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
                                            child: Text(item["name"],style: Widgets.common22px600(),textAlign: TextAlign.center,),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                                          child: Text("Rs 500",style: Widgets.common16px400(),)
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    bottom: 185, // Adjust this value to lift the image above the container
                                    child: Image.asset(
                                      item["image"],
                                      width: 125.16,
                                      height: 125.16,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget topWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(ImageConstants.restroOne,width: 48,height: 48,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Fit Fresh Bites",style: Widgets.common18px600(),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(ImageConstants.location,width:20,height: 20,),
                              const SizedBox(width: 3,),
                              Text(
                                "0.9 KM",style: Widgets.common15px400(),),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(ImageConstants.star,width:20,height: 20,),
                              FittedBox(child: Text("4.2",style: Widgets.common16px400(),)),
                            ],
                          ),
                          const SizedBox(width: 10,),
                          const Expanded(
                            child: Text("12.7k Reviews",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green,
                                    decoration: TextDecoration.underline
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
