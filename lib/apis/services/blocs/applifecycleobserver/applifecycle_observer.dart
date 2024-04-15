import 'package:flutter/material.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';


class AppLifecycleObserver extends WidgetsBindingObserver {
  final GeoLocationBloc appStateBloc;

  AppLifecycleObserver({required this.appStateBloc});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.resumed) {
     appStateBloc.add(LoadGeoLocation());
    }
  }
}