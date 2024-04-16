import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurantrating/common/widgets.dart';
import 'package:restaurantrating/constants/image_constants.dart';
import 'package:restaurantrating/constants/label_constants.dart';
import 'package:restaurantrating/models/restaurant_model.dart';
import 'package:restaurantrating/screens/carousel/carosel_item.dart';
import 'package:restaurantrating/screens/homepage.dart';

import '../../constants/color_constants.dart';

class RestaurantReview extends StatefulWidget {
  final RestaurantListResponse restaurantItem;
  const RestaurantReview({super.key,
    required this.restaurantItem,

  });

  @override
  State<RestaurantReview> createState() => _RestaurantReviewState();
}

class _RestaurantReviewState extends State<RestaurantReview> {

  String ratingImage = ImageConstants.rateExp;
  String ratingText = LabelConstants.rateYourExperience;

  FocusNode focusText = FocusNode();
  TextEditingController reviewController = TextEditingController();

  int maxLength = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
       backgroundColor: ColorConstants.backgroundColor,
       /// App bar with back button and title
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
                      child: Center(child: Text(LabelConstants.addYourReview,style: Widgets.common18px600(),)))
               ],
             )
         ),
       ),
       body: ListView(
         padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 0.0),
         children: [
           /// Text introducing the feedback section
           Text(LabelConstants.weValueFeedback,style: Widgets.common34px700(),),
           const SizedBox(height: 10,),
           /// Carousel to display restaurant item
           SizedBox(
             height: MediaQuery.of(context).size.height *.25,
             child: CarouselItem(
                 restaurantItem:widget.restaurantItem),
           ),
           const SizedBox(height: 20,),
           /// Container for rating selection
           Container(
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(20),
             ),
             padding: const EdgeInsets.all(10),
             child: Column(
               children: [
                 /// Image and text to represent selected rating
                 rateImageWidget(image: ratingImage,imageText: ratingText),
                 const SizedBox(height: 10,),
                 /// Rating bar to select rating
                 RatingBar.builder(
                   itemSize: 35.0,
                   initialRating: 0,
                   minRating: 1,
                   direction: Axis.horizontal,
                   allowHalfRating: false,
                   itemCount: 5,
                   itemPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                   itemBuilder: (context, _) => const Icon(
                     Icons.star,
                     color: ColorConstants.blueColor,
                     size: 2.0,
                   ),
                   onRatingUpdate: (rating) {
                     print(rating);
                     calculateRating(rating);
                   },
                 ),
               ],
             ),
           ),
           const SizedBox(height: 20,),
           /// Text form field for entering review
           TextFormField(
             readOnly: false,
             focusNode: focusText,
             controller: reviewController,
             textInputAction: TextInputAction.done,
             style: TextStyle(color: Colors.black, fontSize: 16),
             maxLength: maxLength,
             maxLines: 5,
             buildCounter: (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) {
               return Text('${reviewController.text.length}/$maxLength');
             },
             decoration: InputDecoration(
               // counterText: "${reviewController.text.length}/$maxLength",
                 filled: true,
                 focusedBorder: OutlineInputBorder(
                     gapPadding: 0.0,
                     borderSide: const BorderSide(
                       color: Colors.white,
                       width: .001,
                     ),
                     borderRadius: BorderRadius.circular(25.0)),
                 fillColor: Colors.white,
                 hintText: LabelConstants.reviewHint,
                 hintStyle: TextStyle(color: Colors.blueGrey[500]),
                 enabledBorder: OutlineInputBorder(
                     borderSide: const BorderSide(
                       color: Colors.white,
                       width: .001,
                     ),
                     borderRadius: BorderRadius.circular(25.0))),
           ),
           const SizedBox(height: 10,),
           /// Button to submit review
           InkWell(
             onTap: (){
               showModalBottomSheet(context: context, builder: (context){
                 return SizedBox(
                   height:MediaQuery.of(context).size.height *.20,
                   child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment:  MainAxisAlignment.center,
                     children: [
                       const Icon(
                         Icons.check,size: 50,color: Colors.green,
                       ),
                       Text("Review Submited",style: Widgets.common28px700(),),
                       const SizedBox(height: 5,),
                       InkWell(
                         onTap: (){
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                         },
                         child: Container(
                           width: 150,
                           decoration: BoxDecoration(
                             color: ColorConstants.blueColor,
                             borderRadius: BorderRadius.circular(25),
                           ),
                             padding: const EdgeInsets.all(10),
                             alignment: Alignment.center,
                             child: Text("OK",style: Widgets.common17px700(),)),
                       )
                     ],
                   ),
                 );
               });
             },
             child: Container(
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 color: ColorConstants.blueColor,
                 borderRadius: BorderRadius.circular(25.0),
               ),
               padding: const EdgeInsets.all(20),
               child: Text(LabelConstants.submit,style: Widgets.common17px700(),),
             ),
           ),
           const SizedBox(height: 20,),
         ],
       ),
     ));
  }

  /// Widget to display an image with accompanying text for a rating category
 Widget rateImageWidget({required String image,required String imageText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center ,
      children: [
        /// Display the image
        Image.asset(image,width: 100,height: 100,),
        const SizedBox(height: 10,),
        /// Display the text below the image
        Text(imageText,style: Widgets.common16px400(),)
      ],
    );
 }

  /// Method to calculate the rating text and corresponding image based on the numeric rating
  void calculateRating(double rating) {
    /// Check the value of the rating and assign appropriate text and image
    if(rating == 1.0){
      ratingText = "Poor";
      ratingImage = ImageConstants.poorRating;
    }
    else if(rating == 2.0){
      ratingText = "Okay";
      ratingImage = ImageConstants.okayRating;
    }
    else if(rating == 3.0){
      ratingText = "Good";
      ratingImage = ImageConstants.goodRating;
    }
    else if(rating == 4.0){
      ratingText = "Great";
      ratingImage = ImageConstants.greatRating;
    }
    else if(rating == 5.0){
      ratingText = "Superb";
      ratingImage = ImageConstants.superbRating;
    }
    else{
      /// If the rating is not within the expected range, display a default image
      ratingImage = ImageConstants.rateExp;
      ratingText = LabelConstants.rateYourExperience;
    }
    setState(() {

    });
  }

}
