import 'package:flutter/material.dart';
import 'package:restogo_app/static/navigation_route.dart';
import 'package:restogo_app/widgets/list_item_restaurant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              bottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/icon.jpg",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "RestoGO",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: "ChangaOne",
                          color: Color(0xFFF86502),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.dark_mode, size: 30),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.list(
                    children: [
                      SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Image.asset(
                            "assets/images/hero.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffFFF3EA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              NavigationRoute.searchRoute.name,
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Color(0xff999999)),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "Lagi pengen makan apa ?",
                                  style: TextStyle(color: Color(0xff555555)),
                                ),
                              ),
                              Icon(Icons.restaurant, color: Color(0xffff1717)),
                            ],
                          ),
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
                  SliverList.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListItemRestaurant(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
