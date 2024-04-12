part of 'restaurant_bloc.dart';


abstract class RestaurantState extends Equatable {
  const RestaurantState();
  @override
  List<Object?> get props => [];
}

class RestaurantInitial extends RestaurantState {

}

class RestaurantLoaded extends RestaurantState {
  final List <RestaurantListResponse>  resList;
  const RestaurantLoaded(this.resList);
}

// Step 2: Define States
enum LocationPermissionStatus { granted, denied, unknown }

class LocationPermissionState  extends RestaurantState {
  final LocationPermissionStatus status;

  LocationPermissionState(this.status);
}


/*
class GetRestaurantList extends RestaurantState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}*/
