//provider
import '../../providers/cart/cart_provider.dart';

// Pub and core package
import 'package:flutter/material.dart';

class Favorite with ChangeNotifier {
  List<Map<String, dynamic>> _favoriteItems = [];

  List<Map<String, dynamic>> get favoriteItems => _favoriteItems;

  bool toggleProductTofavoriteItems(
    String itemId,
  ) {
    List fav = [];
    fav = _favoriteItems
        .where((item) => itemId == item.values.toList()[0]["id"])
        .toList();
    print(fav.length);
    if (fav.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  void addOrRemoveFavoritItem({
    String id,
    Map<String, dynamic> favoriteItem,
  }) {
    print(favoriteItem);
    print(toggleProductTofavoriteItems(favoriteItem["id"]));
    if (toggleProductTofavoriteItems(favoriteItem["id"])) {
      _favoriteItems.removeWhere((item) {
        print(favoriteItem["id"]);
        print(item["id"]);

        return favoriteItem["id"] == item.values.toList()[0]["id"];
      });
    } else {
      _favoriteItems.add(
        {
          id: favoriteItem,
        },
      );
    }
    notifyListeners();
  }
}
