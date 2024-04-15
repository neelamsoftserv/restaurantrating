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
      if(position!=null){
        debugPrint("position${position?.latitude}");
        add(UpdateGeoLocation(position: position!));
      }
    });
    on<UpdateGeoLocation>(
        (event,emit){
          emit(GeoLocationLoaded(position: event.position));
          debugPrint("updated state");
        }
    );
  }





}