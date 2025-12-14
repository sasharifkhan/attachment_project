import 'package:flutter/material.dart';

class Categoriesprovider extends ChangeNotifier {
  final bool _isloading = false;
  get isloading => _isloading;

  final List<Map<String, String>> _productcategories = [
    {"name": "Beverages", "image": "assets/categories/beverage.png"},
    {"name": "Burger", "image": "assets/categories/burger.png"},
    {"name": "Dessert", "image": "assets/categories/dessert.png"},
    {"name": "Mexican", "image": "assets/categories/mexican.png"},
    {"name": "Pasta", "image": "assets/categories/pasta.png"},
    {"name": "Pizza", "image": "assets/categories/pizza.png"},
    {"name": "Salads", "image": "assets/categories/salads.png"},
    {"name": "Sandwich", "image": "assets/categories/sandwich.png"},
  ];
  get productcategories => _productcategories;
}
