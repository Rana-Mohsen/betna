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

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "name": name,
        "price": price,
    };
}
