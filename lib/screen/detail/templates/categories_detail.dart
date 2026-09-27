import 'package:flutter/material.dart';
import 'package:restogo_app/widgets/square_card.dart';

class CategoriesDetail extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const CategoriesDetail({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Kategori Restaurant",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(categories.length, (index) {
              return SquareCard(label: categories[index]["name"]);
            }),
          ),
        ),
      ],
    );
  }
}
