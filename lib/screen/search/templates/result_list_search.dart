import 'package:flutter/material.dart';
import 'package:restogo_app/data/model/retaurant_list_response.dart';
import 'package:restogo_app/static/navigation_route.dart';
import 'package:restogo_app/widgets/list_item_restaurant.dart';

class ResultListSearch extends StatelessWidget {
  final List<Restaurant> restaurants;

  const ResultListSearch({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: ListItemRestaurant(
              restaurant: restaurants[index],
              eventRoute: () {
                Navigator.pushNamed(
                  context,
                  NavigationRoute.detailRoute.name,
                  arguments: restaurants[index].id,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
