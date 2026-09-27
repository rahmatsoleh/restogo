import 'package:flutter/material.dart';
import 'package:restogo_app/screen/home/templates/appbar_home.dart';
import 'package:restogo_app/screen/home/templates/hero_home.dart';
import 'package:restogo_app/screen/home/templates/restaurants_exception_home.dart';
import 'package:restogo_app/screen/home/templates/search_button_home.dart';
import 'package:restogo_app/screen/home/templates/sliver_restaurants_home.dart';
import 'package:restogo_app/static/navigation_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void reloadData() {
    print("Data Reloaded");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(titleSpacing: 0, title: AppbarHome()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 8),
                  HeroHome(),
                  SearchButtonHome(
                    eventToRoute: () => Navigator.pushNamed(
                      context,
                      NavigationRoute.searchRoute.name,
                    ),
                  ),
                  Text(
                    "Temukan Restaurant Favoritmu",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight(600),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            // RestaurantsExceptionHome(actionButton: reloadData),
            SliverRestaurantsHome(),
          ],
        ),
      ),
    );
  }
}
