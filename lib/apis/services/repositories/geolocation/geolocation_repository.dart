
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:restaurantrating/apis/services/repositories/geolocation/base_geolocation_repository.dart';
import 'package:location/location.dart' as loc;

class GeoLocationRepository extends BaseGeoLocationRepository{
  GeoLocationRepository();
  bool isGranted = false;
@override
Future<Position?> getCurrentLocation() async {

  bool serviceEnabled = false;
  // bool isGranted = false;

  return requestPermission().then((value) async {
    print('allowed$serviceEnabled}');
    print('isGranted$isGranted}');
    if(await enableLocation(serviceEnabled) && isGranted){

    return await Geolocator.getCurrentPosition(desiredAccuracy:  LocationAccuracy.high);
    }
    else{
    return null ;
    }
  });

}

  Future<void> requestPermission() async {

    var status = await Permission.location.status;
    if(status.isGranted){
      isGranted = true;
      print("granted");
    }
    else if(status.isDenied){
      await [
        Permission.location
      ].request().then((value) async {
        var newStatus = await Permission.location.status;
        if(newStatus.isGranted){
          isGranted = true;
        }
      });
    }
    else if(status.isPermanentlyDenied){
      openAppSettings();
    }
  }

  Future<bool> enableLocation(bool serviceEnabled) async {


    loc.Location location = loc.Location();

    if(await Permission.location.serviceStatus.isEnabled ){
      serviceEnabled = true;
      requestPermission();
    }
    else{
      serviceEnabled = await location.requestService();

      if(serviceEnabled){
        requestPermission();
      }
      else{
        do{
          serviceEnabled = await location.requestService();
        }
        while(!serviceEnabled);
        if(serviceEnabled){
          requestPermission();
        }
      }
    }
    return serviceEnabled;
  }
}