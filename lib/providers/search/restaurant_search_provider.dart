import "package:flutter/widgets.dart";
import "package:restogo_app/data/api/api_services.dart";
import "package:restogo_app/static/restaurant_search_result_state.dart";

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantSearchProvider(this._apiServices);

  RestaurantSearchResultState _resultState = RestaurantSearchNoneState();

  RestaurantSearchResultState get resultState => _resultState;

  Future<void> fetchRestaurantSearch(String query) async {
    try {
      _resultState = RestaurantSearchLoadingState();
      notifyListeners();

      final result = await _apiServices.getSearchRestaurantList(query);

      if (result.error) {
        _resultState = RestaurantSearchErrorState("Terjadi kesalahan");
        notifyListeners();
      } else {
        _resultState = RestaurantSearchLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantSearchErrorState(e.toString());
      notifyListeners();
    }
  }
}
