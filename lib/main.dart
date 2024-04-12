
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/apis/services/repositories/geolocation/geolocation_repository.dart';
import 'package:restaurantrating/constants/font_constant.dart';
import 'package:restaurantrating/screens/homepage.dart';

Future<void> main() async {
  runApp(const MyApp());
  Location location = Location();

  bool _serviceEnabled;

  if(await Permission.location.serviceStatus.isEnabled ){
     var status = await Permission.location.status;
     if(status.isGranted){
       print("granted");
     }
     else if(status.isDenied){
       await [
         Permission.location
       ].request();
     }
     else if(status.isPermanentlyDenied){
       openAppSettings();
     }
  }
  else{
    do{
      _serviceEnabled = await location.requestService();
      print(_serviceEnabled);
    }
    while(!_serviceEnabled);

  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
         RepositoryProvider<GeoLocationRepository>(create: (_)=>
           GeoLocationRepository())
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> GeoLocationBloc(geoLocationRepository: context.read<GeoLocationRepository>())..add(
              LoadGeoLocation()
            )
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Restaurant Rating',
            theme: ThemeData(
              fontFamily: FontConstant.nunito,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: false,
            ),
            home: const HomePage(),
          ),
        )
    );


  }
}
