import 'package:flutter/material.dart';
import 'package:restogo_app/screen/home/home_screen.dart';
import 'package:restogo_app/screen/search/search_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/search": (context) => const SearchScreen(),
      },
    );
  }
}
