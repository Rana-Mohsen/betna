import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/view_models/home/products_cubit/products_cubit.dart';
import 'package:betna/view_models/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key, this.cameraIcon = true, this.nav = false, this.keyboardOn = true});
  final bool cameraIcon;
  final bool nav;
  final bool keyboardOn;

  @override
  Widget build(BuildContext context) {
    return TextField(
        focusNode: FocusNode()..canRequestFocus = keyboardOn,
      onTap: () {
        if (nav) {
          GoRouter.of(context).push(AppRoutes.kSearchView);
        }
      },
      onChanged: (value) {
        var products = BlocProvider.of<ProductsCubit>(context).productList;
        BlocProvider.of<SearchCubit>(context).filterSearch(value, products);
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        filled: true,
        fillColor: kBackgroundColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(35),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(35),
        ),
        prefixIconColor: kGrayColor,
        prefixIcon: const Icon(Icons.search),
        suffixIconColor: kGrayColor,
        suffixIcon: Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // icons at the end of the input
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.mic_none_outlined),
            if (cameraIcon) const Icon(Icons.photo_camera),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
