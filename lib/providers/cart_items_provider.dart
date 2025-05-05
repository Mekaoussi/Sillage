import 'package:flutter/material.dart';
import 'package:seanotes/cart_page/cart_item.dart';

class CartItemsprovider extends ChangeNotifier {
  List<CartItem> _cartitem = [];
  int total = 0;
  int countitems = 0;

  addtocounter() {
    countitems += 1;
  }

  decrescounter() {
    if (countitems >= 1) {
      countitems -= 1;
    }
  }

  clearcounter() {
    countitems = 0;
  }

  calctotal() {
    // ignore: unused_local_variable
    total = 0;
    for (int i = 0; i < _cartitem.length; i++) {
      total += _cartitem[i].price * _cartitem[i].quantity;
    }

    notifyListeners();
  }

  List<Map<String, int>> getOreder() {
    List<Map<String, int>> order = [];
    Map<String, int> orderitem = {};
    total = 0;
    for (int i = 0; i < _cartitem.length; i++) {
      orderitem = {
        "product_id": _cartitem[i].id,
        "quantity": _cartitem[i].quantity,
      };
      order.add(orderitem);
    }
    return order;
  }

  getTotal() {
    return total;
  }

  List<CartItem> get cartitem => _cartitem;

  removeFromCart(int id) {
    for (int i = 0; i < _cartitem.length; i++) {
      if (id == _cartitem[i].id) {
        _cartitem.remove(_cartitem[i]);
      }
      notifyListeners();
    }
  }

  addToCart(CartItem product) {
    for (int i = 0; i < _cartitem.length; i++) {
      if (product.id == _cartitem[i].id) {
        return false;
      }
    }

    _cartitem.add(product);
    _cartitem = _cartitem.reversed.toList();
    notifyListeners();
  }

  clearCart() {
    _cartitem.clear();
    notifyListeners();
  }
}
