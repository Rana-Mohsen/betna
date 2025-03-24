import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/core/widgets/custom_item_card.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  State<FavoriteViewBody> createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 25,
        children: [
          SearchTextfield(cameraIcon: false),
          SizedBox(
            height: 43.h,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => CustomItemCard(),
            ),
          ),
          CustomButton(onTap: () {}, text: "Add all item to cart"),
        ],
      ),
    );
  }
}
