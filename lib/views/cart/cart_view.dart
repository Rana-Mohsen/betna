import 'package:betna/constants.dart';
import 'package:betna/core/Local_Storage/user_info.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/snack_bar.dart';
import 'package:betna/core/widgets/custom_appbar.dart';
import 'package:betna/view_models/cart/cart_list/cart_list_cubit.dart';
import 'package:betna/view_models/home/products_cubit/products_cubit.dart';
import 'package:betna/views/cart/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    var products = BlocProvider.of<ProductsCubit>(context).productList;
    BlocProvider.of<CartListCubit>(context).getCartList(UserInfo.userId ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "My Cart",
        onTapBackIcon: () {
          context.go(AppRoutes.kBottomNavigation, extra: 0);
        },
      ),
      body: BlocConsumer<CartListCubit, CartListState>(
        listener: (context, state) {
          if (state is CartError) {
            return snackBarMessage(
              context,
              "Cart Error! \n ${state.errMessage}",
            );
          }
        },
        builder: (context, state) {
          if (state is CartListEmpty) {
            return const Center(child: Text("Empty cart! \n Add items"));
          } else if (state is CartListLoading) {
            return const Center(child: kCircleProggress);
          } else {
            return const Padding(padding: kMainPadding, child: CartViewBody());
          }
        },
      ),
    );
  }
}
