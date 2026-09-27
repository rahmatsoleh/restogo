import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restogo_app/providers/theme_provider.dart';
import 'package:restogo_app/screen/detail/detail_screen.dart';
import 'package:restogo_app/screen/home/home_screen.dart';
import 'package:restogo_app/screen/search/search_screen.dart';
import 'package:restogo_app/static/navigation_route.dart';
import 'package:restogo_app/style/theme/restogo_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return ThemeProvider();
      },
      child: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<ThemeProvider>(context, listen: false).loadMode();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: "RestoGo App",
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode
          ? RestogoTheme.darkTheme
          : RestogoTheme.lightTheme,
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
