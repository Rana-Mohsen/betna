import 'package:betna/models/item_model.dart';
import 'package:betna/views/home/widgets/product_view_body.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductViewBody(item: item,));
  }
}
