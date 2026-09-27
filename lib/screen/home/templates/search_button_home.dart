import 'package:flutter/material.dart';

class SearchButtonHome extends StatelessWidget {
  final Function eventToRoute;

  const SearchButtonHome({super.key, required this.eventToRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xffFFF3EA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => eventToRoute(),
        child: Row(
          children: [
            Icon(Icons.search, color: Color(0xff999999)),
            SizedBox(width: 8),
            Expanded(
              child: const Text(
                "Lagi pengen makan apa ?",
                style: TextStyle(color: Color(0xff555555)),
              ),
            ),
            Icon(Icons.restaurant, color: Color(0xffff1717)),
          ],
        ),
      ),
    );
  }
}
