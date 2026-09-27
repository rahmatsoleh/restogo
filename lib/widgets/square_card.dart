import 'package:flutter/material.dart';

class SquareCard extends StatelessWidget {
  final String label;

  const SquareCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: ColorScheme.of(context).secondary),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(label, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
