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
        color: ColorScheme.of(context).secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => eventToRoute(),
        child: Row(
          children: [
            Icon(Icons.search, color: Color(0xff999999)),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                "Lagi pengen makan apa ?",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Color(0xff999999)),
              ),
            ),
            Icon(Icons.restaurant, color: Color(0xffff1717)),
          ],
        ),
      ),
    );
  }
}
