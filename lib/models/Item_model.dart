import 'package:betna/models/product_model.dart';

class ItemModel {
  final int id;
  final String name;
  final String description;
  String price;
  final String categoryName;
  final List<String> images;
  bool isFav;
  int count;

  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryName,
    required this.images,
    this.isFav = false,
    this.count = 0,
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

  ItemModel copyWith({
    int? id,
    String? name,
    String? description,
    String? price,
    String? categoryName,
    List<String>? images,
    bool? isFav,
    int? count,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      categoryName: categoryName ?? this.categoryName,
      images: images ?? this.images,
      isFav: isFav ?? this.isFav,
      count: count ?? this.count,
    );
  }
}
