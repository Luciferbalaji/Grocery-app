import 'package:flutter/material.dart';
class CartModel extends ChangeNotifier {
  final List<List<dynamic>> _shopItems = const [
     ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "lib/images/chicken.png", Colors.brown],
    ["Water", "1.00", "lib/images/water.png", Colors.blue],
    ["Carrot", "1.50", "lib/images/carrot.png", Colors.orange],
    ["Eggplant", "3.00", "lib/images/eggplant.png", Colors.purple],
    ["Corn", "2.00", "lib/images/corn.png", Colors.yellow],
    ["Vegetable Oil", "5.50", "lib/images/vegetable-oil.png", Colors.amber],
    ["Bell Pepper", "2.20", "lib/images/bell-pepper.png", Colors.red],
    ["Organic Food", "8.00", "lib/images/organic-food.png", Colors.green],
    ["Pea", "1.80", "lib/images/pea.png", Colors.green],
    ["Potato", "1.20", "lib/images/potato.png", Colors.brown],
    ["Tomato", "2.30", "lib/images/tomato.png", Colors.red],
    // ... other items
  ];

  List<List<dynamic>> _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  void addItemToCart(int index) {
    // Check if the same item is already in the cart
    bool alreadyAdded = false;
    int itemIndex = 0;
    for (List<dynamic> item in _cartItems) {
      if (item[0] == _shopItems[index][0]) {
        alreadyAdded = true;
        break;
      }
      itemIndex++;
    }

    if (alreadyAdded) {
      // If the same item is already in the cart, update its quantity
      int quantity = _cartItems[itemIndex][4];
      _cartItems[itemIndex][4] = quantity + 1;
    } else {
      // If the item is not in the cart, add it with quantity 1
      _cartItems.add([
        _shopItems[index][0],
        _shopItems[index][1],
        _shopItems[index][2],
        _shopItems[index][3],
        1, // Initial quantity set to 1
      ]);
    }

    notifyListeners();
  }

  void removeItemFromCart(int index) {
    // Check the quantity and remove if it's more than 1, otherwise remove the item
    if (_cartItems[index][4] > 1) {
      _cartItems[index][4] -= 1; // Decrease the quantity
    } else {
      _cartItems.removeAt(index); // Remove the item
    }
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]) * _cartItems[i][4]; // Multiply price by quantity
    }
    return totalPrice.toStringAsFixed(2);
  }
}