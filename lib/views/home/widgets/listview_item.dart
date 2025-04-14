import 'package:betna/constants.dart';
import 'package:betna/core/utils/font_styles.dart';
import 'package:betna/core/widgets/favorite_icon.dart';
import 'package:betna/core/widgets/item_rating.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/views/home/product_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 31.w,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IgnorePointer(
                ignoring: false,
                child: FavoriteIcon(item: item),
              ),
            ),
            Positioned(
              top: 3.1.h,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductView(item: item),
                    ),
                  );
                },
                child: SizedBox(
                  width: 29.w,
                  height: 10.h,
                  child: Image.asset("assets/images/chair.png"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductView(item: item),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 9.h,
                  color: kSecondaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Flexible(
                            child: Text(
                              item.name,
                              style: FontStyles.textStyle16.copyWith(
                                overflow: TextOverflow.fade,
                              ),
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                          ItemRating(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${item.price}",
                            style: FontStyles.textStyle16.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          //AddIcon(item: item),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
