import 'package:hive/hive.dart';

part 'local_cart_model.g.dart';

@HiveType(typeId: 0)
class LocalCartModel {
  @HiveField(0)
   int? productId;
  @HiveField(1)
   int? cartId;
  @HiveField(2)
   int? quantity;
  @HiveField(3)
   String? name;
  @HiveField(4)
   String? price;

  LocalCartModel({
    this.productId,
    this.cartId,
    this.quantity,
    this.name,
    this.price,
  });
}
