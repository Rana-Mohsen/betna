import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/widgets/custom_lable.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/view_models/home/category_cubit/categories_cubit.dart';
import 'package:betna/view_models/home/products_cubit/products_cubit.dart';
import 'package:betna/views/home/widgets/custom_choice_chip.dart';
import 'package:betna/views/home/widgets/custom_listview.dart';
import 'package:betna/views/home/widgets/home_body_top.dart';
import 'package:betna/views/home/widgets/shimmer_home_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    //context.read<ProductsCubit>().getProducts();
if (BlocProvider.of<CategoriesCubit>(context).ctgList.isEmpty) {
      context.read<ProductsCubit>().getProducts();
    }
    if (context.read<ProductsCubit>().productList.isEmpty) {
      context.read<ProductsCubit>().getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: kMainPadding,
          child: SizedBox(height: 50.h, child: const HomeBodyTop()),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 14,
            children: [
              CustomLable(
                lable: "Categories",
                onTap: () {
                  context.push(AppRoutes.kSearchView);
                },
              ),
              const CustomChoiceChip(),
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesChoosed && state.lable != "All") {
                    return BlocBuilder<ProductsCubit, ProductsState>(
                      builder: (context, productState) {
                        if (productState is ProductsSuccess) {
                          var pl = productState.products;
                          return Column(
                            spacing: 15,
                            children: [
                              CustomLable(
                                lable: state.lable,
                                onTap: () {
                                  // context.push(
                                  //   AppRoutes.kSeeAllview,
                                  //   extra: pl[index].name,
                                  // );
                                },
                              ),

                              CustomListView(categoryItemList: pl),
                            ],
                          );
                        } else if (productState is ProductsError) {
                          return Text(productState.errMessage);
                        } else {
                          return const ShimmerHomeList();
                        }
                      },
                    );
                  } else {
                    return BlocBuilder<ProductsCubit, ProductsState>(
                      builder: (context, productState) {
                        if (productState is ProductsSuccess) {
                          List<ItemModel> pl = productState.products;
                          var ctg =
                              BlocProvider.of<CategoriesCubit>(context).ctgList;
                          //print("ctg:$ctg\npl:${pl.length}");
                          return ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemExtent: 260,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: ctg.length,
                            itemBuilder: (context, index) {
                              return Column(
                                spacing: 15,
                                children: [
                                  CustomLable(
                                    lable: ctg[index].name,
                                    onTap: () {
                                      context.push(
                                        AppRoutes.kSeeAllview,
                                        extra: pl[index].name,
                                      );
                                    },
                                  ),

                                  CustomListView(categoryItemList: pl),
                                ],
                              );
                            },
                          );
                        } else if (productState is ProductsError) {
                          return Text(productState.errMessage);
                        } else {
                          return const ShimmerHomeList();
                        }
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
