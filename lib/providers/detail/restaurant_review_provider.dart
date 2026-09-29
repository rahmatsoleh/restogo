import 'package:flutter/widgets.dart';
import 'package:restogo_app/data/api/api_services.dart';
import 'package:restogo_app/data/model/customer_review.dart';
import 'package:restogo_app/static/restaurant_review_state.dart';

class RestaurantReviewProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantReviewProvider(this._apiServices);

  RestaurantReviewState _resultState = RestaurantReviewNoneState();
  RestaurantReviewState get resultState => _resultState;

  Future<List<CustomerReview>> reviewCustomer(
    String id,
    String name,
    String review,
  ) async {
    try {
      _resultState = RestaurantReviewLoadingState();
      notifyListeners();

      final result = await _apiServices.postCustomerReview(
        id: id,
        name: name,
        review: review,
      );

      if (result.error) {
        _resultState = RestaurantReviewErrorState(result.message);
        notifyListeners();

        throw Exception(result.message);
      }

      _resultState = RestaurantReviewLoadedState(result.customerReviews);
      notifyListeners();

      return result.customerReviews;
    } on Exception catch (e) {
      _resultState = RestaurantReviewErrorState(e.toString());
      notifyListeners();

      rethrow;
    }
  }
}
