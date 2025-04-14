import 'package:betna/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kPrimaryColor = Color(0xff355B5E);
const kSecondaryColor = Color(0xffd4dddd);
const kBrownBlackColor = Color(0xff313131);
const kGrayColor = Color(0xff787676);
const kBackgroundColor = Color(0xffF1F4F4);
const kGrayTextColor = Color(0xff323232);

const kMainPadding = EdgeInsets.all(16.0);

const kCacheUserInfo = "CacheUserInfo";

final List<String> categoriesList = ["Chair", "Sofa", "Antique"];
List<ItemModel> cartList = [];
List<ItemModel> favList = [];
// final Map<String, List<ItemModel>> itemList = {
//   "chair": [
//     ItemModel(
//       name: "chair",
//       price: "50",
//       image: 'assets/images/items/chair1.png',
//     ),
//     ItemModel(
//       name: "chair",
//       price: "50",
//       image: 'assets/images/items/chair2.png',
//     ),
//     ItemModel(
//       name: "chair",
//       price: "50",
//       image: 'assets/images/items/chair1.png',
//     ),
//   ],
//   "sofa": [
//     ItemModel(
//       name: "sofa",
//       price: "100",
//       image: 'assets/images/items/sofa1.png',
//     ),
//     ItemModel(
//       name: "sofa",
//       price: "200",
//       image: 'assets/images/items/sofa2.png',
//     ),
//     ItemModel(
//       name: "sofa",
//       price: "100",
//       image: 'assets/images/items/sofa1.png',
//     ),
//   ],
//   "antique": [
//     ItemModel(
//       name: "antique",
//       price: "80",
//       image: 'assets/images/items/antique.png',
//     ),
//     ItemModel(
//       name: "antique",
//       price: "80",
//       image: 'assets/images/items/antique.png',
//     ),
//     ItemModel(
//       name: "antique",
//       price: "80",
//       image: 'assets/images/items/antique.png',
//     ),
//   ],
// };


