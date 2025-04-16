import 'package:betna/models/item_model.dart';

class CartModel {
    final int id;
    final int quantity;
    final String name;
    final String price;

    CartModel({
        required this.id,
        required this.quantity,
        required this.name,
        required this.price,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        quantity: json["quantity"],
        name: json["name"],
        price: json["price"],
    );
 factory CartModel.fromProductModel(ItemModel product,int count) => CartModel(
        id: product.id,
        quantity: count,
        name: product.name,
        price: product.price,
    );
    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "name": name,
        "price": price,
    };
}
