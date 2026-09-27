import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restogo_app/providers/theme_provider.dart';
import 'package:restogo_app/style/fonts/restogo_text_style.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              Text("RestoGO", style: RestogoTextStyle.changaHeadingMedium),
            ],
          ),
          IconButton(
            onPressed: () => themeProvider.changeTheme(),
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              size: 30,
              color: ColorScheme.of(context).primary,
            ),
          ),
        ],
      ),
    );
  }
}
