
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
    return const Column(
      // spacing: 5,
      children: [
        SearchTextfield(cameraIcon: false),
        SizedBox(height: 20),
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
