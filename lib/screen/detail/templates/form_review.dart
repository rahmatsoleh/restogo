import 'package:flutter/material.dart';
import 'package:restogo_app/screen/detail/templates/form/button_submit.dart';
import 'package:restogo_app/screen/detail/templates/form/name_contorller.dart';
import 'package:restogo_app/screen/detail/templates/form/review_controller.dart';

class FormReview extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController reviewController;
  final Future<void> Function() onSubmit;

  const FormReview({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.reviewController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Masukan review dari anda",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameContorller(value: nameController),
                  ReviewController(value: reviewController),
                  ButtonSubmit(onSubmit: onSubmit),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
