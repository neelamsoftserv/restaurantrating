import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/apis/services/repositories/geolocation/geolocation_repository.dart';
import 'package:restaurantrating/common/widgets.dart';
import 'package:restaurantrating/constants/image_constants.dart';
import 'package:restaurantrating/constants/label_constants.dart';
import 'package:restaurantrating/models/restaurant_model.dart';
import 'package:restaurantrating/screens/carousel/carosel_item.dart';
import 'package:restaurantrating/screens/restaurtants/related_restaurants.dart';
import 'package:restaurantrating/screens/restaurtants/restaurant_menu.dart';
import 'package:restaurantrating/screens/review/restaurant_review.dart';

import '../../constants/color_constants.dart';

class RestaurantDetail extends StatefulWidget {
 final RestaurantListResponse restaurantItem;
 final double endLatitude;
 final double endLongitude;
  const RestaurantDetail({super.key,
    required this.restaurantItem, required this.endLatitude,
    required this.endLongitude
  });
  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState(restaurantItem);
}
class _RestaurantDetailState extends State<RestaurantDetail> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> imgList = ["","","","",""];

  bool isDescriptionTapped = false;
  bool isLocationTapped = false;
  final RestaurantListResponse restaurantItem;
  _RestaurantDetailState(this.restaurantItem);
  String distance = "";

  GeoLocationBloc geoLocationBloc = GeoLocationBloc(geoLocationRepository: GeoLocationRepository());

  @override
  void initState() {
   debugPrint("${widget.endLatitude}");
   debugPrint("${widget.endLongitude}");
   debugPrint("reviews${restaurantItem.reviews?.length}");
   distance = Widgets().calculateDistance(
       startLatitude: restaurantItem.contact?.location!=null?
       restaurantItem.contact!.location![0]:0.0,
       startLongitude:restaurantItem.contact?.location!=null ?
       restaurantItem.contact!.location![1]:0.0,
       endLatitude: widget.endLatitude,
       endLongitude: widget.endLongitude);
  /* if(widget.endLongitude == 0.0 && widget.endLatitude == 0.0){
    geoLocationBloc.add(LoadGeoLocation());
   }*/

    super.initState();
  }

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
                InkWell(
                  onTap: (){},
                  child: const Icon(
                      CupertinoIcons.heart,color: Colors.black,
                  ),
                ),
      
              ],
            )
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            CarouselSlider(
              carouselController: _controller,
              items: [
                CarouselItem(
                   restaurantItem : widget.restaurantItem),
                CarouselItem(
                    restaurantItem : widget.restaurantItem),
                CarouselItem(
                    restaurantItem : widget.restaurantItem),
                CarouselItem(
                    restaurantItem : widget.restaurantItem),
                CarouselItem(
                    restaurantItem : widget.restaurantItem)
              ],
              options: CarouselOptions(
                viewportFraction: 1.0,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key ?ColorConstants.blueColor:Colors.black.withOpacity(_current == entry.key ? 0.9 : 0.4)
                  ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Center(child: Text(LabelConstants.about,style: Widgets.common28px700(),)),
            const SizedBox(height: 20),
            isDescriptionTapped?
            InkWell(
                onTap: (){
                  if(isDescriptionTapped){
                    isDescriptionTapped = false;
                  }
                  else{
                    isDescriptionTapped = true;
                  }
                  setState(() {

                  });
                },
                child: Widgets().rowExpandedTile(label: LabelConstants.description, desc: LabelConstants.dummyText )):
            InkWell(
              onTap: (){
                if(isDescriptionTapped){
                  isDescriptionTapped = false;
                }
                else{
                  isDescriptionTapped = true;
                }
                setState(() {

                });
              },
                child: Widgets().rowTile(label: LabelConstants.description)),
            const SizedBox(height: 10,),
            isLocationTapped?
            InkWell(
                onTap: (){
                  if(isLocationTapped){
                    isLocationTapped = false;
                  }
                  else{
                    isLocationTapped = true;
                  }
                  setState(() {

                  });
                },
                child: Widgets().rowLocationTile(
                    label: LabelConstants.location,
                    location: restaurantItem.address.toString(),
                    distance: Widgets().calculateDistance(
                        startLatitude: restaurantItem.contact?.location!=null?
                        restaurantItem.contact!.location![0]:0.0,
                        startLongitude:restaurantItem.contact?.location!=null ?
                        restaurantItem.contact!.location![1]:0.0,
                        endLatitude: widget.endLatitude,
                        endLongitude: widget.endLongitude)
                )):
            InkWell(
                onTap: (){
                  if(isLocationTapped){
                    isLocationTapped = false;
                  }
                  else{
                    isLocationTapped = true;
                  }
                  setState(() {

                  });
                },
                child: Widgets().rowTile(label: LabelConstants.location)),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RestaurantMenu(
                  item: restaurantItem,
                    distance: distance
                )));
              },
                child: Widgets().rowTile(label: LabelConstants.viewMenu)),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(LabelConstants.customerReview,style: Widgets.common18px600(),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            ignoreGestures: true,
                            itemSize: 20.0,
                            initialRating: double.parse(restaurantItem.stars.toString()),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: ColorConstants.blueColor,
                              size: 2.0,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text("${restaurantItem.stars.toString()}/5", style: Widgets.common16px600Blue(),)
                        ],
                      ),
                      Text("${restaurantItem.noReviews.toString()} Reviews",
                          style:const  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                              decoration: TextDecoration.underline
                          ))
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Widgets().progressBarTile(
                    context:context,
                      starText: "5 Star",
                      progressImage: ImageConstants.fiveStarProgress,
                      progressPercentage: (restaurantItem.rating?.five??80).toString()),
                  const SizedBox(height: 10,),
                  Widgets().progressBarTile(
                      context:context,
                      starText: "4 Star",
                      progressImage: ImageConstants.fourStarProgress,
                      progressPercentage: (restaurantItem.rating?.four??70).toString()
                  ),
                  const SizedBox(height: 10,),
                  Widgets().progressBarTile(
                      context:context,
                      starText: "3 Star",
                      progressImage: ImageConstants.threeStarProgress,
                      progressPercentage: (restaurantItem.rating?.three??30).toString()),
                  const SizedBox(height: 10,),
                  Widgets().progressBarTile(
                      context:context,
                      starText: "2 Star",
                      progressImage: ImageConstants.twoStarProgress,
                      progressPercentage: (restaurantItem.rating?.two??60).toString()),
                  const SizedBox(height: 10,),
                  Widgets().progressBarTile(
                      context:context,
                      starText: "1 Star",
                      progressImage: ImageConstants.oneStarProgress,
                      progressPercentage: (restaurantItem.rating?.one??30).toString()),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,right: 20.0),
              child: Center(child: Text(LabelConstants.reviews,style: Widgets.common28px700(),)),
            ),
            restaurantItem.reviews!=null ?
            CarouselSlider.builder(
                itemCount: restaurantItem.reviews?.length,
                itemBuilder: (BuildContext context, int index, int realIndex ){
                  return reviewWidget(restaurantItem.reviews![index]);
                }, options: CarouselOptions(
                viewportFraction: 0.7,
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                })
               ):Container(),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: _current == entry.key ?40:12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        borderRadius:_current == entry.key ? BorderRadius.circular(20):null,
                        shape: _current == entry.key ?BoxShape.rectangle:BoxShape.circle,
                        color: _current == entry.key ?ColorConstants.blueColor:Colors.black.withOpacity(_current == entry.key ? 0.9 : 0.4)
                    )

                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Center(child: Text(LabelConstants.relatedRestro,style: Widgets.common28px700(),)),
            RelatedRestaurants(categories:  restaurantItem.categories,name: restaurantItem.name??""),
            const SizedBox(height: 20),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantReview(
                    restaurantItem : widget.restaurantItem,

                )));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConstants.blueColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                padding: const EdgeInsets.all(20),
                child: Text("Been here? Let us know 🤔💭",style: Widgets.common17px700(),),
              ),
            ),const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget reviewWidget(Reviews reviews){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(reviews.name.toString(),style: Widgets.common16px400(),),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(ImageConstants.star,width: 24,height:20,),
                  const SizedBox(width: 5,),
                  Text("${reviews.reviewRating}/5",style: Widgets.common16px400(),)
                ],
              )

            ],),
          const SizedBox(height: 5,),
          Text("${reviews.title} 🥇",style: Widgets.common18px600(),),
          Expanded(child: Text(reviews.text.toString(),
            style: Widgets.common16px400(),
            textAlign: TextAlign.justify,

          ))
        ],
      ),
    );
  }

}
