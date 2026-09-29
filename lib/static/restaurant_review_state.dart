import 'package:restogo_app/data/model/customer_review.dart';

sealed class RestaurantReviewState {}

class RestaurantReviewNoneState extends RestaurantReviewState {}

class RestaurantReviewLoadingState extends RestaurantReviewState {}

class RestaurantReviewLoadedState extends RestaurantReviewState {
  final List<CustomerReview> data;

  RestaurantReviewLoadedState(this.data);
}

class RestaurantReviewErrorState extends RestaurantReviewState {
  final String message;

  RestaurantReviewErrorState(this.message);
}
