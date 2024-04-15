
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/apis/services/repositories/geolocation/geolocation_repository.dart';
import 'package:restaurantrating/constants/font_constant.dart';
import 'package:restaurantrating/screens/homepage.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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


