import 'dart:async'; /// Importing async library for asynchronous operations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/apis/services/repositories/geolocation/geolocation_repository.dart';
import 'package:restaurantrating/constants/font_constant.dart';
import 'package:restaurantrating/screens/splashscreen.dart';


/// Main function which starts the execution of the app
Future<void> main() async {
  runApp(const MyApp());
}

/// MyApp widget, which is the root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(   /// Provides multiple repositories to its descendants
        providers: [
         RepositoryProvider<GeoLocationRepository>(create: (_)=>
           GeoLocationRepository()) /// Creating an instance of GeoLocationRepository
        ],
        child: MultiBlocProvider(   /// Provides multiple BLoCs (Business Logic Components) to its descendants
          providers: [
            BlocProvider(
                create: (context)=> GeoLocationBloc(geoLocationRepository: context.read<GeoLocationRepository>())
                  ..add(LoadGeoLocation())  /// Dispatches an event to load geo location data
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
            home: const SplashScreen(),  /// Sets the SplashScreen widget as the home screen of the app
          ),
        )
    );


  }
}


