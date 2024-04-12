import 'package:flutter/material.dart';
import 'package:restaurantrating/common/widgets.dart';
import 'package:restaurantrating/constants/color_constants.dart';
import 'package:restaurantrating/constants/image_constants.dart';
import 'package:restaurantrating/models/restaurant_model.dart';

class CarouselItem extends StatefulWidget {
  final RestaurantListResponse restaurantItem;

  const CarouselItem({super.key,
    required this.restaurantItem,

  });

  @override
  State<CarouselItem> createState() => _CarouselItemState(restaurantItem);
}

class _CarouselItemState extends State<CarouselItem> {
  final RestaurantListResponse restaurantItem;
  _CarouselItemState(this.restaurantItem, );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(

        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImageConstants.restroSquareImage,width: 91,height: 100,),
              // Image.asset(restaurantItem.image.toString(),width: 91,height: 100,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(restaurantItem.name.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis
                        ),maxLines: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(ImageConstants.star,width:20,height: 20,),
                              const SizedBox(width: 2,),
                              FittedBox(child: Text(restaurantItem.stars.toString(),style: Widgets.common16px400(),)),
                            ],
                          ),
                          const SizedBox(width: 10,),
                          Text("${restaurantItem.noReviews.toString()} Reviews",
                             style: const TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.green,
                                 decoration: TextDecoration.underline
                             )),
                        ],
                      ),
                      const Divider(
                        color: ColorConstants.greyColor,
                      ),
                      Text(restaurantItem.contact!.phone.toString(),style: Widgets.common15px400(),),
                      const Divider(
                        color: ColorConstants.greyColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageConstants.location,width:20,height: 20,),
                const SizedBox(width: 5,),
                Expanded(child: Text(
                  restaurantItem.address.toString(),style: Widgets.common15px400(),)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
