import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restogo_app/providers/search/restaurant_search_provider.dart';
import 'package:restogo_app/screen/search/templates/notfound_search.dart';
import 'package:restogo_app/screen/search/templates/result_list_search.dart';
import 'package:restogo_app/static/restaurant_search_result_state.dart';
import 'package:restogo_app/style/colors/restogo_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _query = TextEditingController();

  void fetchingData() {
    if (!mounted) return;

    final provider = context.read<RestaurantSearchProvider>();

    Future.microtask(() {
      provider.fetchRestaurantSearch(_query.text);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _query,
                  focusNode: _searchFocusNode,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: RestogoColors.brand.color,
                  ),
                  decoration: InputDecoration(
                    hintText: "Cari resto atau makanan...",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey.shade500,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: RestogoColors.brand.color,
                        width: 1.5,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  color: RestogoColors.brand.color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => fetchingData(),
                  icon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<RestaurantSearchProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantSearchLoadingState() => Center(
              child: CircularProgressIndicator(),
            ),
            RestaurantSearchLoadedState(data: var restaurants) =>
              restaurants.isEmpty
                  ? NotfoundSearch(
                      message: "Pencarian ${_query.text} tidak ditemukan.",
                    )
                  : ResultListSearch(restaurants: restaurants),
            RestaurantSearchErrorState(message: var message) => NotfoundSearch(
              message: message,
            ),
            _ => Center(
              child: Text(
                "Lakukan pencarian pada kolom",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          };
        },
      ),
    );
  }
}
