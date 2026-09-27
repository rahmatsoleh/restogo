import 'package:flutter/material.dart';
import 'package:restogo_app/widgets/card_menu.dart';

class MenuList extends StatelessWidget {
  final String label;
  final List<Map<String, dynamic>> menus;

  const MenuList({super.key, required this.menus, required this.label});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label, style: Theme.of(context).textTheme.headlineSmall),
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: menus.length,
            itemBuilder: (context, index) {
              return CardMenu(name: menus[index]["name"]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 8);
            },
          ),
        ),
      ],
    );
  }
}
