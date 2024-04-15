part of 'restaurant_bloc.dart';


abstract class RestaurantState extends Equatable {
  const RestaurantState();
  @override
  List<Object?> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List <RestaurantListResponse>  resList;
  const RestaurantLoaded(this.resList);
}
