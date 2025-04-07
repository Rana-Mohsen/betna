import 'package:betna/views/search/widgets/search_category.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  List<Map<String, dynamic>> categories = [
    {"image": "assets/images/chair.png", "name": "Chair"},
    {"image": "assets/images/chair.png", "name": "Chair"},
    {"image": "assets/images/chair.png", "name": "Chair"},
    {"image": "assets/images/chair.png", "name": "Chair"},
    {"image": "assets/images/chair.png", "name": "Chair"},
    {"image": "assets/images/chair.png", "name": "Chair"},
    {"image": "assets/images/chair.png", "name": "Chair"},
    {"image": "assets/images/chair.png", "name": "Chair"},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(right: 16.0),
      crossAxisCount: 4,
      childAspectRatio: 4 / 5,
      // crossAxisSpacing: 4,
      // mainAxisSpacing: 4,
      children: List.generate(7, (index) {
        return SearchCategory(
          image: categories[index]["image"],
          name: categories[index]["name"],
        );
      }),
    );
  }
}
