import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    var imageList = _imageList(context);
    return ImageView360(
      key: UniqueKey(),
      imageList: imageList,
      swipeSensitivity: 1, //Optional
      allowSwipeToRotate: true, //Optional
    );
  }

  List<ImageProvider<Object>> _imageList(BuildContext context) {
    List<ImageProvider> imageList = [];
    for (int i = 1; i <= 52; i++) {
      imageList.add(AssetImage('assets/sample/$i.png'));
      // To precache images so that when required they are loaded faster.
      precacheImage(AssetImage('assets/sample/$i.png'), context);
    }
    return imageList;
  }
}
