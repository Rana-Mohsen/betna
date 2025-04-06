import 'package:betna/constants.dart';
import 'package:betna/core/utils/app_routes.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key, this.cameraIcon = true, this.nav = true});
  final bool cameraIcon;
  final bool nav;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        if (nav) {
          GoRouter.of(context).push(AppRoutes.kSearchView);
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        filled: true,
        fillColor: kBackgroundColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(35),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(35),
        ),
        prefixIconColor: kGrayColor,
        prefixIcon: Icon(Icons.search),
        suffixIconColor: kGrayColor,
        suffixIcon: Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // icons at the end of the input
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.mic_none_outlined),
            if (cameraIcon) Icon(Icons.photo_camera),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
