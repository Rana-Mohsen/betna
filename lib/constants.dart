import 'package:betna/models/item_model.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff355B5E);
const kSecondaryColor = Color(0xffd4dddd);
const kBrownBlackColor = Color(0xff313131);
const kGrayColor = Color(0xff787676);
const kBackgroundColor = Color(0xffF1F4F4);
const kGrayTextColor = Color(0xff323232);

const kCartBox = 'cartBox';
const kMainPadding = EdgeInsets.all(16.0);
const kCircleProggress = CircularProgressIndicator(color: kPrimaryColor);

final List<String> categoriesList = ["Chair", "Sofa", "Antique"];
List<ItemModel> favList = [];
