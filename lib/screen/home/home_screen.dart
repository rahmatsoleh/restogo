import 'package:flutter/material.dart';
import 'package:restogo_app/data/api/api_services.dart';
import 'package:restogo_app/data/model/retaurant_list_response.dart';
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
  RestaurantListResponse? _futureRestaurantResponse;
  bool _isLoading = false;
  bool _hasError = false;

  Future<void> loadData() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      final response = await ApiServices().getRestaurantList();
      setState(() {
        _futureRestaurantResponse = response;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
      });

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget displayRestaurant() {
    return _isLoading
        ? SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
        : (_hasError
              ? RestaurantsExceptionHome(actionButton: loadData)
              : SliverRestaurantsHome(
                  restaurants: _futureRestaurantResponse!.restaurants,
                ));
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
            displayRestaurant(),
            SliverToBoxAdapter(child: SizedBox(height: 50)),
          ],
        ),
      ),
    );
  }
}
