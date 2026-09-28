import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:restogo_app/data/model/customer_review_response.dart';
import 'package:restogo_app/data/model/restaurant_detail_response.dart';
import 'package:restogo_app/data/model/restaurant_search_response.dart';
import 'package:restogo_app/data/model/retaurant_list_response.dart';

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load restaurant list");
    }
  }

  Future<RestaurantSearchResponse> getSearchRestaurantList(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$query"));

    if (response.statusCode == 200) {
      return RestaurantSearchResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load restaurant list");
    }
  }

  Future<RestaurantDetailResponse> getDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load restaurant list");
    }
  }

  Future<CustomerReviewResponse> postCustomerReview({
    required String id,
    required String name,
    required String review,
  }) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/review"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": id, "name": name, "review": review}),
    );

    if (response.statusCode == 201) {
      return CustomerReviewResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to review restaurant");
    }
  }
}
