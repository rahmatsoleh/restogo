import 'package:flutter/material.dart';
import 'package:restogo_app/style/colors/restogo_colors.dart';

class ButtonSubmit extends StatefulWidget {
  final Future<void> Function() onSubmit;
  const ButtonSubmit({super.key, required this.onSubmit});

  @override
  State<ButtonSubmit> createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit> {
  bool isLoading = false;

  Future<void> handleSubmit() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      await widget.onSubmit();
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: RestogoColors.brand.color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.send_rounded),
                  SizedBox(width: 10),
                  Text(
                    'Kirim Review',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                ],
              ),
      ),
    );
  }
}
