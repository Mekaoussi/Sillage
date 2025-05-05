import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  late bool _isloggedin;

  bool get isloggedin => _isloggedin;

  setLoggedin(bool stat) {
    _isloggedin = stat;
  }

  changeLog() {
    _isloggedin = !_isloggedin;
  }
}






