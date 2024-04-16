import 'package:flutter/material.dart';
import 'package:restaurantrating/apis/services/blocs/geolocation/geolocation_bloc.dart';
import 'package:restaurantrating/apis/services/blocs/restaurant_blocs/restaurant_bloc.dart';


class AppLifecycleObserver extends WidgetsBindingObserver {
  final GeoLocationBloc appStateBloc;

  AppLifecycleObserver({required this.appStateBloc});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.resumed) {
      RestaurantBloc().add(GetRestaurantList());
      appStateBloc.add(LoadGeoLocation());
    }
  }
}