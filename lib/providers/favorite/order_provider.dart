

// Pub and core package
import 'package:flutter/material.dart';

class OrderItem {
  Map<String, dynamic> product;
  double price;

  OrderItem({
    this.product,
    this.price,
  });
}

class Order with ChangeNotifier {
  List<Map<String, OrderItem>> _orderItems = [];

  List<Map<String, OrderItem>> get orderItems => _orderItems;

  void toggleProductToOrderItems(
    String itemId,
  ) {
    notifyListeners();
  }

  void addOrderToList({
    String id,
    OrderItem order,
  }) {
    _orderItems.add({
      id: order,
    },);
  }
}
