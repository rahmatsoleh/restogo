import 'package:flutter/material.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
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
          IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode, size: 30)),
        ],
      ),
    );
  }
}
