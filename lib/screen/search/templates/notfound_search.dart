import 'package:flutter/material.dart';

class NotfoundSearch extends StatelessWidget {
  const NotfoundSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Pencarian anda tidak ditemukan.",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
