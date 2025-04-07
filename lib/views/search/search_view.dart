import 'package:betna/constants.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:betna/views/search/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined),
        title: SearchTextfield(cameraIcon: false, nav: false),
      ),
      body: Padding(
        padding: kMainPadding,
        child: SearchViewBody(),
      ),
    );
  }
}
