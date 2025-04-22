import 'package:betna/constants.dart';
import 'package:betna/core/widgets/custom_button.dart';
import 'package:betna/core/widgets/custom_item_card.dart';
import 'package:betna/core/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

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
          child: ListView.separated(
            shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: favList.length,
            separatorBuilder: (context, index) => const SizedBox(),

            itemBuilder:
                (context, index) => CustomItemCard(item: favList[index]),
          ),
        ),
        CustomButton(
          onTap: () {
            // for (var favItem in favList) {
            //   if (!cartList.contains(favItem)) {
            //     BlocProvider.of<CartListCubit>(context).addItem(favItem);
            //   }
            // }
            //snackBarMessage(context, "All items added to cart");
          },
          text: "Add all items to cart",
        ),
      ],
    );
  }
}
