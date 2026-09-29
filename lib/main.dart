import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restogo_app/data/api/api_services.dart';
import 'package:restogo_app/providers/detail/restaurant_detail_provider.dart';
import 'package:restogo_app/providers/detail/restaurant_review_provider.dart';
import 'package:restogo_app/providers/home/restaurant_list_provider.dart';
import 'package:restogo_app/providers/search/restaurant_search_provider.dart';
import 'package:restogo_app/providers/theme_provider.dart';
import 'package:restogo_app/screen/detail/detail_screen.dart';
import 'package:restogo_app/screen/home/home_screen.dart';
import 'package:restogo_app/screen/search/search_screen.dart';
import 'package:restogo_app/static/navigation_route.dart';
import 'package:restogo_app/style/theme/restogo_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider();
  await themeProvider.loadMode();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeProvider),
        Provider(create: (context) => ApiServices()),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantListProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantDetailProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantSearchProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantReviewProvider(context.read<ApiServices>()),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

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
