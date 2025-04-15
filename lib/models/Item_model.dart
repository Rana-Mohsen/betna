import 'package:betna/models/product_model.dart';

class ItemModel {
  final int id;
  final String name;
  final String description;
   String price;
  final String categoryName;
  final List<String> images;
  bool isFav = false;
  int count = 0;

  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryName,
    required this.images,
  });

  double totalPrice() {
    return double.parse(price) * count;
  }

  factory ItemModel.fromProductModel(ProductModel product) {
    return ItemModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      categoryName: product.categoryName,
      images: product.images,
    );
  }
}
