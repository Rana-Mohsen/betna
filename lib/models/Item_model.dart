class ItemModel {
  final String image;
  final String name;
  final String price;
  bool isFav = false;
  int count = 0;

  ItemModel({required this.image, required this.name, required this.price});

  double totalPrice() {
    return double.parse(price) * count;
  }
}
