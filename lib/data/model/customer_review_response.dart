import 'package:restogo_app/data/model/customer_review.dart';

class CustomerReviewResponse {
  bool error;
  String message;
  List<CustomerReview> customerReviews;

  CustomerReviewResponse({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  factory CustomerReviewResponse.fromJson(Map<String, dynamic> json) {
    return CustomerReviewResponse(
      error: json["error"],
      message: json["message"],
      customerReviews: (json["customerReviews"] as List)
          .map((item) => CustomerReview.fromJson(item))
          .toList(),
    );
  }
}
