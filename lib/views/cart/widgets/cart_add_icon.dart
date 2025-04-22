import 'package:betna/constants.dart';
import 'package:betna/core/Local_Storage/local_cart.dart';
import 'package:betna/core/Local_Storage/user_info.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAddIcon extends StatefulWidget {
  const CartAddIcon({super.key, this.size = 20, required this.item});
  final double? size;
  final CartModel item;

  @override
  State<CartAddIcon> createState() => _CartAddIconState();
}

class _CartAddIconState extends State<CartAddIcon> {
  int? productId;

  @override
  void initState() {
    getCartFromLocal();

    super.initState();
  }

  Future<void> getCartFromLocal() async {
    productId = await LocalCart().findProductId(
      UserInfo.userId!,
      widget.item.id,
    );
  }
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CartListCubit>(context);
    return GestureDetector(
      onTap: () {
        bloc.addItem({
          "user_id": UserInfo.userId,
          "product_id": productId,
          "quantity": 1,
        });

        BlocProvider.of<CartListCubit>(
          context,
        ).getCartList(UserInfo.userId ?? "");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Item added to cart')));
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor,
        ),
        child: Icon(Icons.add, size: widget.size, color: Colors.white),
      ),
    );
  }
}
