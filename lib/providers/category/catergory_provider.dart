// use a dummyy data
import '../../data/dummy_data.dart';

// Pub and core package
import 'package:flutter/material.dart';

class Category with ChangeNotifier {
  List<Map> _categoryItem = DUMMY_CATEGORIES;
  // Map<String, dynamic> selectedCategory = {};

  List<Map<String, dynamic>> get categoryItems => _categoryItem;



  
}
