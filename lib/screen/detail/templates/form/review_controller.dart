import 'package:flutter/material.dart';
import 'package:restogo_app/style/colors/restogo_colors.dart';

class ReviewController extends StatelessWidget {
  final TextEditingController value;

  const ReviewController({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Review', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8),
        TextFormField(
          controller: value,
          maxLines: 6,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
            hintText: 'Tuliskan pengalaman kamu...',
            filled: true,
            fillColor: ColorScheme.of(context).surfaceBright,
            errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorScheme.of(context).error,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorScheme.of(context).secondary,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: RestogoColors.brand.color,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Review wajib diisi';
            }

            return null;
          },
        ),
        SizedBox(height: 22),
      ],
    );
  }
}
