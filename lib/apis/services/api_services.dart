import '../api_constant.dart';

class ApiServices {
  static Future<String?> getRequest(String api, [var data]) async {
    print(api);
    var apiUrl;
    if (data != null) {
      apiUrl = "$api$data";
    } else {
      apiUrl = api;
    }
    print(apiUrl);

    final response = await ApiConstant().apiCall(apiUrl);


    if (response != null && response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}