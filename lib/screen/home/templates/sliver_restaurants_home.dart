import 'package:flutter/material.dart';
import 'package:restogo_app/static/navigation_route.dart';
import 'package:restogo_app/widgets/list_item_restaurant.dart';

class SliverRestaurantsHome extends StatelessWidget {
  const SliverRestaurantsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
    );
  }
}
