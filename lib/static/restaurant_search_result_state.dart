import 'package:restogo_app/data/model/restaurant.dart';

sealed class RestaurantSearchResultState {}

class RestaurantSearchNoneState extends RestaurantSearchResultState {}

class RestaurantSearchLoadingState extends RestaurantSearchResultState {}

class RestaurantSearchLoadedState extends RestaurantSearchResultState {
  final List<Restaurant> data;

  RestaurantSearchLoadedState(this.data);
}

class RestaurantSearchErrorState extends RestaurantSearchResultState {
  final String message;

  RestaurantSearchErrorState(this.message);
}
