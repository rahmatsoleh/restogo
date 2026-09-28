import 'package:flutter/material.dart';
import 'package:restogo_app/data/api/api_services.dart';
import 'package:restogo_app/data/model/restaurant_detail_response.dart';
import 'package:restogo_app/screen/detail/templates/appbar_detail.dart';
import 'package:restogo_app/screen/detail/templates/categories_detail.dart';
import 'package:restogo_app/screen/detail/templates/error_detail.dart';
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
  bool _isLoading = false;
  bool _hasError = false;

  List<Category>? _categories;
  Menus? _menus;
  List<CustomerReview>? _customerReviews;
  Restaurant? _restaurant;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  Future<void> loadData() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      final response = await ApiServices().getDetailRestaurant(widget.restoId);
      setState(() {
        _restaurant = response.restaurant;
        _menus = _restaurant!.menus;
        _categories = _restaurant!.categories;
        _customerReviews = _restaurant!.customerReviews;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
      });

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
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

    try {
      final response = await ApiServices().postCustomerReview(
        id: widget.restoId,
        name: _nameController.text,
        review: _reviewController.text,
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
        _customerReviews = response.customerReviews;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : (_hasError
                ? ErrorDetail(actionButton: loadData)
                : CustomScrollView(
                    slivers: [
                      AppbarDetail(
                        name: _restaurant!.name,
                        pictureId: _restaurant!.pictureId,
                      ),
                      RestaurantDetail(
                        address: _restaurant!.address,
                        city: _restaurant!.city,
                        description: _restaurant!.description,
                        rating: _restaurant!.rating,
                      ),
                      CategoriesDetail(categories: _categories!),
                      MenuList(menus: _menus!.foods, label: "Menu Makanan"),
                      MenuList(menus: _menus!.drinks, label: "Menu Minuman"),
                      ReviewsDetail(reviews: _customerReviews!),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: ColorScheme.of(
                                              context,
                                            ).tertiary,
                                          ),
                                    ),
                                  )
                                : SizedBox(height: 20),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  )),
    );
  }
}
