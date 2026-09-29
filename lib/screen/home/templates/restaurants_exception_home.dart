import 'package:flutter/material.dart';

class RestaurantsExceptionHome extends StatelessWidget {
  final Function actionButton;
  final String message;

  const RestaurantsExceptionHome({
    super.key,
    required this.actionButton,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorScheme.of(context).error,
              ),
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
