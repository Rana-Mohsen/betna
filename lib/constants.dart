import 'package:betna/models/Item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kPrimaryColor = Color(0xff355B5E);
const kSecondaryColor = Color(0xffd4dddd);
const kBrownBlackColor = Color(0xff313131);
const kGrayColor = Color(0xff787676);
const kBackgroundColor = Color(0xffF1F4F4);
const kGrayTextColor = Color(0xff323232);

const kMainPadding = EdgeInsets.all(16.0);

final List<ItemModel> itemList = [
  ItemModel(
    name: "chair",
    price: "50",
    image: 'assets/images/items/chair1.png',
  ),
  ItemModel(name: "sofa", price: "100", image: 'assets/images/items/sofa1.png'),
  ItemModel(name: "bed", price: "200", image: 'assets/images/items/sofa2.png'),
  ItemModel(
    name: "antique",
    price: "80",
    image: 'assets/images/items/antique.png',
  ),
  ItemModel(
    name: "carpet",
    price: "70",
    image: 'assets/images/items/chair1.png',
  ),
  ItemModel(
    name: "cupboard",
    price: "70",
    image: 'assets/images/items/chair2.png',
  ),
  ItemModel(name: "lamp", price: "70", image: 'assets/images/items/lamp.png'),
];
List<ItemModel> cartList = [];
List<ItemModel> favList = [];
