
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../repositories/geolocation/geolocation_repository.dart';


part 'geolocation_event.dart' ;
part 'geolocation_state.dart';

class GeoLocationBloc extends Bloc<GeoLocationEvent,GeolocationState>{

  final GeoLocationRepository _geoLocationRepository;

   Position? position;
   var distance ;

  GeoLocationBloc({ required GeoLocationRepository geoLocationRepository}) :
      _geoLocationRepository = geoLocationRepository,
        super(GeolocationLoading()){
    on<LoadGeoLocation>((event,emit) async {
      position = await _geoLocationRepository.getCurrentLocation();
      debugPrint("position${position?.latitude}");
      add(UpdateGeoLocation(position: position!));

    });
    on<UpdateGeoLocation>(
        (event,emit){
          emit(GeoLocationLoaded(position: event.position));
        }
    );

  }




/* Future<void> mapLoadGeoLocationToState() async {
    // _geolocationSubscription?.cancel();
    final Position position = await _geoLocationRepository.getCurrentLocation();
    debugPrint("called");
    add(UpdateGeoLocation(position: position));

  }
  mapUpdateGeoLocationToState(UpdateGeoLocation event) async* {

     GeoLocationLoaded(position: event.position);
  }*/


 /*@override
  Stream<GeolocationState> mapEventToState(GeoLocationEvent event) async* {
    debugPrint("called again");
    if (event is LoadGeoLocation) {
      yield* _mapLoadGeoLocationToState();
    } else if (event is UpdateGeoLocation) {
      yield* _mapUpdateGeoLocationToState(event);
    }
  }*/





}