import 'package:betna/constants.dart';

import 'package:betna/core/widgets/custom_item_card.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

class SeeAllViewBody extends StatefulWidget {
  const SeeAllViewBody({super.key, required this.ctg});
  final String ctg;

  @override
  State<SeeAllViewBody> createState() => _SeeAllViewBodyState();
}

class _SeeAllViewBodyState extends State<SeeAllViewBody> {

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 5,
      children: [
        const SearchTextfield(cameraIcon: false),
        const SizedBox(height: 20),
        // Expanded(
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     //physics: const NeverScrollableScrollPhysics(),
        //     itemCount: itemList[widget.ctg]!.length,
        //     itemBuilder:
        //         (context, index) => CustomItemCard(item:  itemList[widget.ctg]![index]),
        //   ),
        // ),
        
      ],
    );
  }
}
