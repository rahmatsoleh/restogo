import 'package:flutter/material.dart';

class RestaurantsExceptionHome extends StatelessWidget {
  final Function actionButton;

  const RestaurantsExceptionHome({super.key, required this.actionButton});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Terjadi kesalahan",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () => actionButton(),
              icon: const Icon(Icons.refresh),
              label: const Text("Muat ulang"),
            ),
          ],
        ),
      ),
    );
  }
}
