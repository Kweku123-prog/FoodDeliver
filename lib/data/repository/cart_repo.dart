import 'dart:convert';

import 'package:food_delivery/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharePreferences;

  CartRepo({required this.sharePreferences});

  List<String> cart = [];
  List<String> cartHistory = [];
  void addToCartList(List<CartModel> cartList) {
//  sharePreferences.remove("cart-list");
//  sharePreferences.remove("cart-history-list");
    var time = DateTime.now().toString();
    cart = [];

    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharePreferences.setStringList("cart-list", cart);
// print(sharePreferences.getStringList("Cart-list"));

//getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharePreferences.containsKey("cart-list")) {
      carts = sharePreferences.getStringList("cart-list")!;
    }

    List<CartModel> cartList = [];

    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharePreferences.containsKey("cart-history-list")) {
      cartHistory = [];
      cartHistory = sharePreferences.getStringList("cart-history-list")!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharePreferences.containsKey("cartListHistory")) {
      cartHistory = sharePreferences.getStringList("cartListHistory")!;
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharePreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
  }

  void removeCart() {
    cart = [];
    sharePreferences.remove("cart-list");
  }
}
