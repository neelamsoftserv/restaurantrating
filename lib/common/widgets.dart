import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:restaurantrating/constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/image_constants.dart';
import '../models/restaurant_model.dart';

class Widgets {
  static TextStyle common34px700() {
    return const TextStyle(
        fontSize: 34, fontWeight: FontWeight.w700, color: Colors.black);
  }

  static TextStyle common17px400Grey() {
    return const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: ColorConstants.greyColor
        // color: Colors.black
        );
  }

  static TextStyle common17px400Blue() {
    return const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xff0F2C90));
  }

  static TextStyle common22px600() {
    return const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static TextStyle common28px700() {
    return const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );
  }

  static TextStyle common16px400() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  static TextStyle common16px600Blue() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorConstants.blueColor,
    );
  }

  static TextStyle common18px600() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static TextStyle common17px700() {
    return const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  static TextStyle common15px400() {
    return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: ColorConstants.greyColor,
    );
  }

  static TextStyle common15px400Blue() {
    return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: ColorConstants.blueColor,
    );
  }

  static TextStyle common11px400() {
    return const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: ColorConstants.blueColor,
    );
  }

  static TextStyle common11px400Grey() {
    return const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Color(0xff6D6A6A),
    );
  }

  Widget rowTile({required String label}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Widgets.common18px600(),
          ),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget rowExpandedTile({required String label, required String desc}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Widgets.common18px600(),
              ),
              const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.black,
              )
            ],
          ),
          Text(
            desc,
            style: Widgets.common16px400(),
          )
        ],
      ),
    );
  }

  Widget rowLocationTile(
      {required String label,
      required String location,
      required String distance}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Widgets.common18px600(),
              ),
              const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.black,
              )
            ],
          ),
          Text(
            location,
            style: Widgets.common15px400(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImageConstants.location,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Expanded(
                        child: Text(
                      "$distance from Location",
                      style: Widgets.common15px400(),
                    )),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    openMapWithAddress(location);
                  },
                  child: const Text(
                    "View on Google Maps",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        color: ColorConstants.blueColor),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget progressBarTile(
      {required BuildContext context,
      required String starText,
      required String progressImage,
      required String progressPercentage}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(starText, style: common11px400()),
        const SizedBox(
          width: 10,
        ),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 200,
          animation: true,
          lineHeight: 8.0,
          animationDuration: 2000,
          barRadius: const Radius.circular(25),
          percent: double.parse(progressPercentage) / 100.0,
          progressColor: ColorConstants.blueColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text("$progressPercentage%", style: common11px400Grey()),
      ],
    );
  }

  String calculateDistance(
      {required double startLatitude,
      required double startLongitude,
      required double endLatitude,
      required double endLongitude}) {
    var distance = Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);

    var distanceInKM = distance / 1000;

    if (distanceInKM < 1) {
      return "${distance.toDouble().round().toString()}m";
    } else {
      return "${distanceInKM.toDouble().round().toString()}KM";
    }
  }

  List<RestaurantListResponse> searchValue(String value, restroList) {
    final restData = value.isNotEmpty
        ? restroList
            .where((element) =>
                (element.name != null &&
                    element.name!
                        .toLowerCase()
                        .startsWith(value.toLowerCase())) ||
                (element.name != null &&
                    element.name!
                        .toLowerCase()
                        .contains(value.toLowerCase())) ||
                (element.address != null &&
                    element.address!
                        .toLowerCase()
                        .startsWith(value.toLowerCase())) ||
                (element.address != null &&
                    element.address!
                        .toLowerCase()
                        .contains(value.toLowerCase())) ||
                (element.categories != null &&
                    element.categories!.any((category) =>
                        category != null &&
                        category.toLowerCase().contains(value.toLowerCase()))))
            .toList()
        : restroList;
    return restData;
  }

  Future<void> openMapWithAddress(String address) async {
    print(address);
    final googleUrl =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$address');
    print('googleUrl ${googleUrl}');

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  Widget buildLoading() => const Center(child: CircularProgressIndicator());


}
