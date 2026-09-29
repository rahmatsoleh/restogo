import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restogo_app/data/model/customer_review.dart';
import 'package:restogo_app/data/model/restaurant_detail_response.dart';
import 'package:restogo_app/providers/detail/restaurant_detail_provider.dart';
import 'package:restogo_app/providers/detail/restaurant_review_provider.dart';
import 'package:restogo_app/screen/detail/templates/appbar_detail.dart';
import 'package:restogo_app/screen/detail/templates/categories_detail.dart';
import 'package:restogo_app/screen/detail/templates/error_detail.dart';
import 'package:restogo_app/screen/detail/templates/form_review.dart';
import 'package:restogo_app/screen/detail/templates/menu_list.dart';
import 'package:restogo_app/screen/detail/templates/restaurant_detail.dart';
import 'package:restogo_app/screen/detail/templates/reviews_detail.dart';
import 'package:restogo_app/static/restaurant_detail_result_state.dart';

class DetailScreen extends StatefulWidget {
  final String restoId;

  const DetailScreen({super.key, required this.restoId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool reviewed = false;
  List<CustomerReview>? _customerReviews;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  void fetchData() {
    if (!mounted) return;

    final provider = context.read<RestaurantDetailProvider>();

    Future.microtask(() {
      provider.fetchRestaurantDetail(widget.restoId);
    });
  }

  @override
  void initState() {
    super.initState();
    // loadData();
    fetchData();
  }

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

    final provider = context.read<RestaurantReviewProvider>();

    try {
      final customerReview = await provider.reviewCustomer(
        widget.restoId,
        _nameController.text,
        _reviewController.text,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Review berhasil dikirim"),
          behavior: SnackBarBehavior.floating,
        ),
      );

      _nameController.clear();
      _reviewController.clear();
      FocusScope.of(context).unfocus();

      setState(() {
        reviewed = true;
        _customerReviews = customerReview;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Widget bodyResult(
    Restaurant restaurant,
    List<CustomerReview> customerReview,
  ) {
    return CustomScrollView(
      slivers: [
        AppbarDetail(name: restaurant.name, pictureId: restaurant.pictureId),
        RestaurantDetail(
          address: restaurant.address,
          city: restaurant.city,
          description: restaurant.description,
          rating: restaurant.rating,
        ),
        CategoriesDetail(categories: restaurant.categories),
        MenuList(menus: restaurant.menus.foods, label: "Menu Makanan"),
        MenuList(menus: restaurant.menus.drinks, label: "Menu Minuman"),
        ReviewsDetail(reviews: customerReview),
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantDetailLoadingState() => Center(
              child: CircularProgressIndicator(),
            ),
            RestaurantDetailLoadedState(data: var restaurant) => bodyResult(
              restaurant,
              _customerReviews ?? restaurant.customerReviews,
            ),
            RestaurantDetailErrorState(message: var message) => ErrorDetail(
              actionButton: fetchData,
              message: message,
            ),
            _ => ErrorDetail(
              actionButton: fetchData,
              message: "Halaman tidak tersedia.",
            ),
          };
        },
      ),
    );
  }
}
