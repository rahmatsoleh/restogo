import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restogo_app/providers/home/restaurant_list_provider.dart';
import 'package:restogo_app/screen/home/templates/appbar_home.dart';
import 'package:restogo_app/screen/home/templates/hero_home.dart';
import 'package:restogo_app/screen/home/templates/restaurants_exception_home.dart';
import 'package:restogo_app/screen/home/templates/search_button_home.dart';
import 'package:restogo_app/screen/home/templates/sliver_restaurants_home.dart';
import 'package:restogo_app/static/navigation_route.dart';
import 'package:restogo_app/static/restaurant_list_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void loadData() {
    if (!mounted) return;

    final provider = context.read<RestaurantListProvider>();

    Future.microtask(() {
      provider.fetchRestaurantList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Consumer<RestaurantListProvider>(
              builder: (context, value, child) {
                return switch (value.resultState) {
                  RestaurantListLoadingState() => SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  RestaurantListLoadedState(data: var restaurantList) =>
                    SliverRestaurantsHome(restaurants: restaurantList),
                  RestaurantListErrorState(error: var message) =>
                    RestaurantsExceptionHome(
                      actionButton: loadData,
                      message: message,
                    ),
                  _ => SliverToBoxAdapter(child: SizedBox()),
                };
              },
            ),
            SliverToBoxAdapter(child: SizedBox(height: 50)),
          ],
        ),
      ),
    );
  }
}
