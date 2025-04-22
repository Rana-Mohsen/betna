import 'package:betna/core/widgets/custom_lable.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  final List<String> lables = ["Offers", "New Collections"];
  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 5,
      children: [
        const SearchTextfield(cameraIcon: false),
        const SizedBox(height: 20),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemExtent: 260,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder:
                (context, index) => Column(
                  spacing: 15,
                  children: [
                    CustomLable(lable: lables[index], onTap: () {}),
                    //CustomListView(categoryItemList: itemList['chair']!),
                  ],
                ),
          ),
        ),
      ],
    );
  }
}
