//provider

// Pub and core package
import 'package:flutter/material.dart';

class Address with ChangeNotifier {
  List<Map<String, dynamic>> _adddresItems = [];

  List<Map<String, dynamic>> get addressItems => _adddresItems;

  void addAddressToList({
    String id,
    Map<String, dynamic> address,
  }) {
    _adddresItems.add(
      {
        "id": id,
        "address": address,
      },
    );
  }

  void updateAddressToList({
    String id,
    Map<String, dynamic> address,
  }) {
    int index_of_item = _adddresItems.indexWhere(
      (address) => address["id"] == id,
    );
    _adddresItems[index_of_item].update("address", (value) => address);
  }

  void removeAddressToList({
    String id,
  }) {
    _adddresItems.removeWhere(
      (address) => address["id"] == id,
    );
  }
}
