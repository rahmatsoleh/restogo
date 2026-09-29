import 'package:flutter/material.dart';

class NotfoundSearch extends StatelessWidget {
  final String message;
  const NotfoundSearch({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
