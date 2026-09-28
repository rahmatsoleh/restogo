import 'package:flutter/material.dart';

class ErrorDetail extends StatelessWidget {
  final Function actionButton;
  const ErrorDetail({super.key, required this.actionButton});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Gagal mengambil data",
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
    );
  }
}
