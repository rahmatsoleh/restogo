import 'package:flutter/material.dart';
import 'package:restogo_app/static/navigation_route.dart';
import 'package:restogo_app/widgets/list_item_restaurant.dart';

class ResultListSearch extends StatelessWidget {
  const ResultListSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: ListItemRestaurant(
              eventRoute: () {
                Navigator.pushNamed(
                  context,
                  NavigationRoute.detailRoute.name,
                  arguments: "helloworld",
                );
              },
            ),
          );
        },
      ),
    );
  }
}
