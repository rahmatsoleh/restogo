import 'package:flutter/material.dart';

class RestaurantDetail extends StatelessWidget {
  final String address;
  final String city;
  final String description;
  final double rating;
  const RestaurantDetail({
    super.key,
    required this.address,
    required this.city,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorScheme.of(context).secondary,
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          city,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amberAccent),
                    Text(
                      rating.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(width: 8.0),
                  ],
                ),
              ],
            ),
            SizedBox(height: 22),
            Text(
              "Tentang Restauran",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
