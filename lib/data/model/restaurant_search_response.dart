import 'package:restogo_app/data/model/restaurant.dart';

class RestaurantSearchResponse {
  bool error;
  int founded;
  List<Restaurant> restaurants;

  RestaurantSearchResponse({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory RestaurantSearchResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantSearchResponse(
      error: json["error"],
      founded: json["founded"] as int,
      restaurants: (json["restaurants"] as List)
          .map((item) => Restaurant.fromJson(item))
          .toList(),
    );
  }
}
