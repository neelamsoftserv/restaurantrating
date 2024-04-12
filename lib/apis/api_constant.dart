
import 'package:http/http.dart' as http;

class ApiConstant{

  // static const String getMenuList = "https://mocki.io/v1/be72c270-638b-496a-b0a0-e63d34881aaf" ;
  static const String getMenuList = "https://mocki.io/v1/9291d614-b92a-41bb-a1a4-692749503d0a" ;
  // static const String getRestaurantList = "https://mocki.io/v1/4be3a620-be9d-42a1-a468-8be4a0fd405c" ;
  // static const String getRestaurantList = "https://mocki.io/v1/59fd563e-4ccf-4adf-9b09-12cca7dd2488" ;
  // static const String getRestaurantList = "https://62b00af1e460b79df03b9674.mockapi.io/api/v1/dish" ;
  static const String getRestaurantList = "https://raw.githubusercontent.com/Sanwal13/VPN/master/restList.json" ;


  Future<http.Response?> apiCall(apiUrl) async {
    http.Response response;
    try {
        response = await http.get(Uri.parse("$apiUrl"));

        print(response.request?.url);
        print(response.statusCode);

      return response;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return null;
    }
  }
}