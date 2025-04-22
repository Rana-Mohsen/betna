import 'package:betna/constants.dart';
import 'package:betna/models/cart_model.dart';
import 'package:betna/models/local_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalCart {
  late Box<List<LocalCartModel>> box;

  Future<void> _initializeBox() async {
    if (!Hive.isBoxOpen(kCartBox)) {
      box = await Hive.openBox<List<LocalCartModel>>(kCartBox);
    } else {
      box = Hive.box<List<LocalCartModel>>(kCartBox);
    }
  }

  Future<List<LocalCartModel>> getCartItems(String userId) async {
    final raw = box.get(userId);
    final cartList = (raw ?? []).cast<LocalCartModel>();

    return cartList;
  }

  Future<dynamic> findProductId(String userId, int cartId) async {
    await _initializeBox();
    final raw = box.get(userId);
    final cartList = (raw ?? []).cast<LocalCartModel>();
    LocalCartModel? foundItem;
    try {
      foundItem = cartList.firstWhere((item) => item.cartId == cartId);
    } catch (e) {
      foundItem = null;
    }

    if (foundItem != null) {
      return foundItem.productId;
    } else {
      debugPrint('Found item: Product ID = null');
    }
  }

  Future<void> addItemToCart(String userId, int productId) async {
    await _initializeBox();
    final raw = box.get(userId);
    final cartList = (raw ?? []).cast<LocalCartModel>();

    bool exists = cartList.any((item) => item.productId == productId);
    if (!exists) {
      cartList.add(LocalCartModel(productId: productId));
      await box.put(userId, cartList);
    }
  }

  Future<void> updateCart(
    String userId,
    List<CartModel> fetchedCartList,
  ) async {
    await _initializeBox();
    final raw = box.get(userId);
    final cartList = (raw ?? []).cast<LocalCartModel>();
    //print("cartlist length:${cartList.length}");
    List<LocalCartModel> updatedItems = [];
    for (int i = 0; i < cartList.length; i++) {
      updatedItems.add(
        LocalCartModel(
          productId: cartList[i].productId,
          cartId: fetchedCartList[i].id,
          quantity: fetchedCartList[i].quantity,
          name: fetchedCartList[i].name,
          price: fetchedCartList[i].price,
        ),
      );
    }
    await box.put(userId, updatedItems);
  }

  Future<void> removeItemFromCart(String userId, int cartId) async {
    await _initializeBox();
    final raw = box.get(userId);
    final cartList = (raw ?? []).cast<LocalCartModel>();

    cartList.removeWhere((item) => item.cartId == cartId);
    await box.put(userId, cartList);
  }
}
