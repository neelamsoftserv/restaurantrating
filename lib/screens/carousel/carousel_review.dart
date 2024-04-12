import 'package:flutter/material.dart';
import 'package:restaurantrating/common/widgets.dart';
import 'package:restaurantrating/constants/image_constants.dart';
import 'package:restaurantrating/models/restaurant_model.dart';

class CarouselReviews extends StatefulWidget {
  final RestaurantListResponse restaurantItem;
  const CarouselReviews({super.key, required this.restaurantItem,
  });

  @override
  State<CarouselReviews> createState() => _CarouselReviewsState();
}

class _CarouselReviewsState extends State<CarouselReviews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageConstants.customerPiceFemale,width: 24,height: 24,),
                const SizedBox(width: 5,),
                Text("Jordan",style: Widgets.common16px400(),),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageConstants.star,width: 24,height:20,),
                const SizedBox(width: 5,),
                Text("4.5/5",style: Widgets.common16px400(),)
              ],
            )

          ],),
          const SizedBox(height: 5,),
          Text("Excellent services and consultation 🥇",style: Widgets.common18px600(),),
          Expanded(child: Text("Lorem ipsum dolor sit amet consectetur. Tristique ulla lpmcor per magna in odio quis lectus eget. Sed posu ere turpis eget mas olsa magna in lacus lorem eget. Vitae interdum pulvinar et eget dui vitae dignissim.",
            style: Widgets.common16px400(),
          ))
        ],
      ),
    );
  }
}
