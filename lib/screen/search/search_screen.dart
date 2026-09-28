import 'package:flutter/material.dart';
import 'package:restogo_app/data/api/api_services.dart';
import 'package:restogo_app/data/model/retaurant_list_response.dart';
import 'package:restogo_app/screen/search/templates/notfound_search.dart';
import 'package:restogo_app/screen/search/templates/result_list_search.dart';
import 'package:restogo_app/style/colors/restogo_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _query = TextEditingController();

  List<Restaurant> _restaurants = [];
  bool _isLoading = false;
  bool _hasError = false;

  Future<void> loadData() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      final response = await ApiServices().getSearchRestaurantList(_query.text);

      setState(() {
        _restaurants = response.restaurants;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
      });

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
                  onPressed: () => loadData(),
                  icon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ((_hasError || (_restaurants.isEmpty && _query.text.isNotEmpty))
                ? NotfoundSearch()
                : ResultListSearch(restaurants: _restaurants)),
      // body: NotfoundSearch(),
    );
  }
}
