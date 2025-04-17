import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
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
    BlocProvider.of<CartListCubit>(context).getCartList(kUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "My Cart",
        onTapBackIcon: () => context.go(AppRoutes.kBottomNavigation, extra: 0),
      ),
      body: BlocBuilder<CartListCubit, CartListState>(
        builder: (context, state) {
          if (state is CartListEmpty) {
            return Center(child: Text("Empty cart! \n Add items"));
          } else if (state is CartError) {
            return Center(child: Text("Cart Error! \n ${state.errMessage}"));
          } else if (state is CartSuccess || state is CartListItemChanged) {
            return Padding(padding: kMainPadding, child: CartViewBody());
          } else {
            return Center(child: kCircleProggress);
          }
        },
      ),
    );
  }
}
