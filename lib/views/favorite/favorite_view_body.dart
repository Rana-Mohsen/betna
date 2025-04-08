import 'package:betna/constants.dart';
import 'package:betna/core/utils/functions/snack_bar.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/core/widgets/custom_item_card.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  State<FavoriteViewBody> createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
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
        CustomButton(
          onTap: () {
            favList.forEach((favItem) {
              if (!cartList.contains(favItem)) {
                BlocProvider.of<CartListCubit>(context).addItem(favItem);
              }
            });
            snackBarMessage(context, "All items added to cart");
          },
          text: "Add all items to cart",
        ),
      ],
    );
  }
}
