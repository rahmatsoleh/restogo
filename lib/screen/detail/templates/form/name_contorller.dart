import 'package:flutter/material.dart';
import 'package:restogo_app/style/colors/restogo_colors.dart';

class NameContorller extends StatelessWidget {
  final TextEditingController value;
  const NameContorller({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nama', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8),
        TextFormField(
          controller: value,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Masukan nama kamu",
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
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
          validator: (val) {
            if (val == null || val.trim().isEmpty) {
              return "Nama wajib diisi";
            }

            return null;
          },
        ),
        SizedBox(height: 22),
      ],
    );
  }
}
