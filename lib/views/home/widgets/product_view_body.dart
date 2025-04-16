import 'package:betna/constants.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/models/item_model.dart';
import 'package:betna/views/home/widgets/home_app_bar.dart';
import 'package:betna/core/widgets/item_count.dart';
import 'package:betna/views/home/widgets/image_view.dart';
import 'package:betna/views/home/widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key, required this.item});
  final ItemModel item;
  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  final List<int> _colorList = const [0xff9D9484, 0xffFFB573, 0xff355B5E];
  int idx = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 10.h,
            child: SizedBox(
              width: 100.w,
              height: 45.h,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: 15.w,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  idx = index;
                                });
                              },
                              child: CircleAvatar(
                                radius: index == idx ? 23 : null,
                                backgroundColor: kPrimaryColor,
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: kBackgroundColor,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(_colorList[index]),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Flexible(child: FittedBox(child: ImageView())),
                ],
              ),
            ),
          ),
          Positioned(top: 5.h, child: HomeAppBar(item: widget.item)),
          Align(
            alignment: Alignment.bottomCenter,
            child: ItemDetails(item: widget.item),
          ),
          Positioned(
            bottom: 40.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: const Color(0xff73888A),
                border: Border.all(color: Colors.white, width: 6),
              ),
              child: ItemCount(
                item: widget.item,
                iconPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                countPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
