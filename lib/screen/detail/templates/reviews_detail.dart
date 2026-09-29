import 'package:flutter/material.dart';
import 'package:restogo_app/data/model/customer_review.dart';
import 'package:restogo_app/widgets/card_review.dart';

class ReviewsDetail extends StatelessWidget {
  final List<CustomerReview> reviews;

  const ReviewsDetail({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Apa kata mereka",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: 8.0),
        SizedBox(
          height: 150,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return CardReview(
                name: reviews[index].name,
                date: reviews[index].date,
                review: reviews[index].review,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16);
            },
          ),
        ),
      ],
    );
  }
}
