part of 'geolocation_bloc.dart';


abstract class GeolocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GeolocationLoading extends GeolocationState {}


class GeoLocationLoaded extends GeolocationState {
  final Position position;

  GeoLocationLoaded({required this.position});

  @override
  List<Object?> get props => [position];
}
class GeolocationError extends GeolocationState {}

