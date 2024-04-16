
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiConstant{

  static const String getMenuList = "https://mocki.io/v1/9291d614-b92a-41bb-a1a4-692749503d0a" ;
  static const String getRestaurantList = "https://raw.githubusercontent.com/Sanwal13/VPN/master/restList.json" ;


  Future<http.Response?> apiCall(apiUrl) async {
    http.Response response;
    try {
        response = await http.get(Uri.parse("$apiUrl"));

        debugPrint(response.request?.url.toString());
        debugPrint(response.statusCode.toString());

      return response;
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      return null;
    }
  }
}