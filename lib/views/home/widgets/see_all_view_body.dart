import 'package:betna/constants.dart';
import 'package:betna/core/utils/functions/add_items_to_cart.dart';
import 'package:betna/core/utils/functions/snack_bar.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/core/widgets/custom_item_card.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllViewBody extends StatefulWidget {
  const SeeAllViewBody({super.key});

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
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: favList.length,
            itemBuilder:
                (context, index) => CustomItemCard(item: favList[index]),
          ),
        ),
        
      ],
    );
  }
}
