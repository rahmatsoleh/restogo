import 'package:flutter/material.dart';

class HeroHome extends StatelessWidget {
  const HeroHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Image.asset("assets/images/hero.jpg", fit: BoxFit.cover),
      ),
    );
  }
}
