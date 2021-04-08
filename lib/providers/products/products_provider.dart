import '../../data/dummy_data.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  List<Map> _productItem = DUMMY_PRODUCTS;

  String selectedCategoryId = "";

  List<Map<String, dynamic>> get categoryProductItems => DUMMY_PRODUCTS
      .where((product) => product["category"].contains(selectedCategoryId))
      .toList();

  List<Map> get productItems => _productItem;
  void changeSelectedCategoryIdToGetProducts(String categoryId) {
    selectedCategoryId = categoryId;
    // selectedCategory =
    //     DUMMY_CATEGORIES.firstWhere((category) => category["id"] == categoryId);
    notifyListeners();
  }
}
