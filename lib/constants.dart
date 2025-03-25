import 'package:betna/models/Item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kPrimaryColor = Color(0xff355B5E);
const kSecondaryColor = Color(0xffd4dddd);
const kBrownBlackColor = Color(0xff313131);
const kGrayColor = Color(0xff787676);
const kBackgroundColor = Color(0xffF1F4F4);

final List<ItemModel> itemList = [
  ItemModel(name: "chair", price: "50"),
  ItemModel(name: "sofa", price: "100"),
  ItemModel(name: "bed", price: "200"),
  ItemModel(name: "chair2", price: "80"),
  ItemModel(name: "chair3", price: "70"),
];
List<ItemModel> cartList = [];
