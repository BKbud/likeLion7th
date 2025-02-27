import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];
  final String _storageKey = 'cart_data';

  // CartProvider 생성자를 호출할 때 SharedReference에 저장된 장바구니 데이터를 불러오도록 초기화
  CartProvider() {
    _loadPrefsToCart();
  }

  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(
    0.0,
    (total, current) => total + current.product.price * current.quantity,
  );

  int get itemCount =>
      _items.fold(0, (total, current) => total + current.quantity);

  void addToCart(Product product, {int quantity = 1}) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    // 상품이 장바구니에 없으면 추가, 있으면 수량만 변경
    if (index == -1) {
      _items.add(CartItem(product: product, quantity: quantity));
    } else {
      // 수량 변경시 기존 카트 아이템을 사용하는 것이 아니라 새로운 카트 아이템을 생성
      // 불변 객체를 사용하여 상태 관리를 쉽게 함
      _items[index] = _items[index].copyWith(
        newQuantity: _items[index].quantity + quantity,
      );
    }
    _saveCartToPrefs();
    notifyListeners();
  }

  void updateQuantity(int productId, int quantity) {
    if (quantity <= 0) {
      removeItem(productId);
      _saveCartToPrefs();
      return;
    }

    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index] = _items[index].copyWith(newQuantity: quantity);
      _saveCartToPrefs();
      notifyListeners();
    }
  }

  void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    _saveCartToPrefs();
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _saveCartToPrefs();
    notifyListeners();
  }

  // 현재의 _items를 JSON 형식으로 역파싱 후 shared references에 저장
  Future<void> _saveCartToPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // items 객체를 List로 변환
      final List<dynamic> cartDataList =
          _items.map((item) => item.toJson()).toList();
      // 변환된 String을 sharedPreference에 저장
      prefs.setString(_storageKey, jsonEncode(cartDataList));
    } catch (e) {
      print('Error: saving cart data ${e}');
    }
  }

  Future<void> _loadPrefsToCart() async {
    try {
      // preferences로부터 인스턴스를 받아온다. 비동기로 처리하므로 데이터를 받아올 때까지 기다린다.
      final prefs = await SharedPreferences.getInstance();
      // 저장소 고유 키값으로 저장된 값을 문자열로 가져온다.
      final cartDataString = prefs.getString(_storageKey);

      // 데이터가 있는지 확인
      if (cartDataString != null) {
        // 데이터가 있으므로 json 데이터를 파싱
        final List<dynamic> cartDataList =
            jsonDecode(cartDataString) as List<dynamic>;
        _items.clear();
        _items = cartDataList.map((item) => CartItem.fromJson(item)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Error loading cart data: ${e}');
    }
  }
}
