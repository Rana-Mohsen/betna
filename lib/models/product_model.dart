
class ProductModel {
    final int id;
    final String name;
    final String description;
    final String price;
    final String categoryName;
    final List<String> images;

    ProductModel({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.categoryName,
        required this.images,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        categoryName: json["category_name"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category_name": categoryName,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
