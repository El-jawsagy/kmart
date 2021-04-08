
import 'package:flutter/material.dart';

class CartItem {
  String id;
  Map<String, dynamic> product;
  int quentity;

  CartItem({
    this.id,
    this.product,
    this.quentity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItem = {};

  Map<String, CartItem> get cartItems => _cartItem;

  int get cartCounterByProduct => _cartItem.length;

  double get cartAmount {
    double total = 0.0;
    _cartItem.forEach((key, value) {
      total += value.product["price"] * value.quentity;
    });
    return total;
  }

  bool isProductInCart(String productId) => _cartItem.containsKey(productId);
  int get cartCounterByQuentity {
    int counter = 0;
    _cartItem.forEach((key, value) {
      counter += value.quentity;
    });
    return counter;
  }

  /// this method used to adding product and  controll with quentity of this product and remove it if quentity is
  void addProductToOrder(
    String itemId,
    Map productDetails,
    int quentity,
  ) {
    if (_cartItem.containsKey(itemId)) {
      //change quentity

      if (quentity > 0) {
        //increase quentity
        _cartItem.update(
          itemId,
          (existingItem) => CartItem(
            id: existingItem.id,
            product: existingItem.product,
            quentity: existingItem.quentity + quentity,
          ),
        );
      } else {
        if (cartItems[itemId].quentity > 1) {
          //decrease quentity

          _cartItem.update(
            itemId,
            (existingItem) => CartItem(
              id: existingItem.id,
              product: existingItem.product,
              quentity: existingItem.quentity + quentity,
            ),
          );
        } else {
          //remove product in case that quentity is 1 and ned to decrease it

          _cartItem.removeWhere((key, value) => key == itemId);
        }
      }
    } else {
      //add new item to order list
      _cartItem.putIfAbsent(
          itemId,
          () => CartItem(
                id: DateTime.now().toString(),
                product: productDetails,
                quentity: quentity,
              ));
    }
    notifyListeners();
  }

  void removeProductToOrder(String productId) {
    _cartItem.removeWhere((key, value) => key == productId);
    notifyListeners();
  }

  void cartReset() {
    _cartItem.clear();
    notifyListeners();
  }
}
