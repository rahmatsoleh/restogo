import 'package:flutter/material.dart';
import 'package:restogo_app/screen/detail/detail_screen.dart';
import 'package:restogo_app/screen/home/home_screen.dart';
import 'package:restogo_app/screen/search/search_screen.dart';
import 'package:restogo_app/static/navigation_route.dart';
import 'package:restogo_app/style/theme/restogo_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RestoGo",
      debugShowCheckedModeBanner: false,
      theme: RestogoTheme.lightTheme,
      initialRoute: "/",
      routes: {
        NavigationRoute.mainRoute.name: (context) => const HomeScreen(),
        NavigationRoute.searchRoute.name: (context) => const SearchScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
          restoId: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}
