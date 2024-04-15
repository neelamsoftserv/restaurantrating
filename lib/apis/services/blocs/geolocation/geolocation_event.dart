part of 'geolocation_bloc.dart';



abstract class GeoLocationEvent extends Equatable {
  const GeoLocationEvent();

  @override
  List<Object?> get props => [];
}

class LoadGeoLocation extends GeoLocationEvent {

}

class UpdateGeoLocation extends GeoLocationEvent {
  final Position position;

  const UpdateGeoLocation({ required this.position});

  @override
  List<Object?> get props => [position];
}
