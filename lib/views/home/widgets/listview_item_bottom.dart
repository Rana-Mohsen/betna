import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/add_icon.dart';
import 'package:betna/core/widgets/item_rating.dart';
import 'package:flutter/material.dart';

class ListviewItemBottom extends StatelessWidget {
  const ListviewItemBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 5,
          children: [
            Text("Chair", style: FontStyles.textStyle16),
            ItemRating(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$100",
              style: FontStyles.textStyle16.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            AddIcon(),
          ],
        ),
      ],
    );
  }
}
