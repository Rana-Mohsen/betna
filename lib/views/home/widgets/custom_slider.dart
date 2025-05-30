import 'package:betna/views/home/widgets/slider_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      //width: 100.w,
      child: CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return const SliderItem();
        },
        options: CarouselOptions(
          autoPlayInterval: const Duration(seconds: 3),
          autoPlay: true,
          // enlargeCenterPage: true,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          initialPage: 0,
        ),
      ),
    );
  }
}
