import 'package:flutter/material.dart';
import 'package:restogo_app/screen/detail/templates/appbar_detail.dart';
import 'package:restogo_app/screen/detail/templates/categories_detail.dart';
import 'package:restogo_app/screen/detail/templates/form_review.dart';
import 'package:restogo_app/screen/detail/templates/menu_list.dart';
import 'package:restogo_app/screen/detail/templates/restaurant_detail.dart';
import 'package:restogo_app/screen/detail/templates/reviews_detail.dart';

class DetailScreen extends StatefulWidget {
  final String restoId;

  const DetailScreen({super.key, required this.restoId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool reviewed = false;

  final List<Map<String, dynamic>> _categories = [
    {"name": "Italia"},
  ];

  final List<Map<String, dynamic>> _foods = [
    {"name": "Paket rosemary"},
    {"name": "Toastie salmon"},
    {"name": "Bebek crepes sambel tumpang plus ndog goreng"},
    {"name": "Salad lengkeng"},
  ];

  final List<Map<String, dynamic>> _reviews = [
    {
      "name": "Ahmad",
      "review": "Tidak direkomendasikan untuk pelajar",
      "date": "13 November 2019",
    },
    {
      "name": "Faisol",
      "review": "Restaurant kelas bintang 5",
      "date": "13 November 2019",
    },
    {
      "name": "Rena",
      "review": "Menu makananya enak",
      "date": "13 November 2019",
    },
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    setState(() {
      reviewed = false;
    });

    if (!_formKey.currentState!.validate()) return;

    await Future.delayed(const Duration(seconds: 5));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Review berhasil dikirim"),
        behavior: SnackBarBehavior.floating,
      ),
    );

    print("Name: " + _nameController.text);
    print("Review: " + _reviewController.text);
    _nameController.clear();
    _reviewController.clear();

    setState(() {
      reviewed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          AppbarDetail(
            name: "Devy's Cafe",
            imageUrl: "https://restaurant-api.dicoding.dev/images/medium/14",
          ),
          RestaurantDetail(),
          CategoriesDetail(categories: _categories),
          MenuList(menus: _foods, label: "Menu Makanan"),
          MenuList(menus: _foods, label: "Menu Minuman"),
          ReviewsDetail(reviews: _reviews),
          FormReview(
            formKey: _formKey,
            nameController: _nameController,
            reviewController: _reviewController,
            onSubmit: _submitReview,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                reviewed
                    ? Center(
                        child: Text(
                          'Terima kasih sudah memberikan feedback ❤️',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: ColorScheme.of(context).tertiary,
                              ),
                        ),
                      )
                    : SizedBox(height: 20),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
