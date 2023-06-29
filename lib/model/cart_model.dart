import 'package:flutter/material.dart';


class CartModel extends ChangeNotifier{
  final List _shopeItems = [
    ["Avacado", "4.00","img/avocado.png",Colors.green],
    ["Banana", "2.50","img/banana.png",Colors.yellow],
    ["Chicken", "12.80","img/roast-chicken.png",Colors.brown],
    ["Water", "1.00","img/plastic-bottle.png",Colors.blue],
  ];
List _cartItems = [];
  get shopeItems => _shopeItems;
  get cartItems => _cartItems;

  void addItemToCart(int index){
    _cartItems.add(_shopeItems[index]);
    notifyListeners();
  }


  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  String calculateTotal(){
    double totalPrice = 0;
    for(int i = 0 ; i< _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}