import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurantrating/apis/services/api_services.dart';
import 'package:restaurantrating/models/restaurant_menu_model.dart';
import 'package:restaurantrating/models/restaurant_model.dart';

import '../../../../common/restrolistdata.dart';
import '../../../api_constant.dart';
import 'package:location/location.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';


class RestaurantBloc extends Bloc<RestaurantEvent,RestaurantState>{

  List<RestaurantListResponse> restData = [];

  // Step 2: Define States
  RestaurantBloc(): super(RestaurantInitial()){

     on<GetRestaurantList>((event,emit) async{
      try{
        String api = ApiConstant.getRestaurantList;

         // var value = await ApiServices.getRequest(api);
         var value = await RestroData.restaurantData;

        RestaurantListModel restaurantListModel = RestaurantListModel.fromJson(json.decode(value));
        print(restaurantListModel.response?.length??0);

        restData = restaurantListModel.response??[];
        emit(RestaurantLoaded(restData));
      }
      catch(e,stactree){
        print(stactree);
        print(e);
      }


    });

  }
  }




