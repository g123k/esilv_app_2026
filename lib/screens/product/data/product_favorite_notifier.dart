import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductFavoriteNotifier extends ValueNotifier<bool?> {
  ProductFavoriteNotifier(this.barcode) : super(null) {
    _loadStatus();
  }

  final String barcode;

  Future<void> _loadStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getBool(barcode);
  }

  Future<void> toggle() async {
    value = !(value ?? false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(barcode, value ?? false);
  }
}
