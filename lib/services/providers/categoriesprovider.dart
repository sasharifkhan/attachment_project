import 'package:flutter/material.dart';

class Categoriesprovider extends ChangeNotifier {
  final bool _isloading = false;
  get isloading => _isloading;

  final List<Map<String, String>> _productcategories = [
    {"name": "Beverages", "image": "lib/assets/categories/beverage.png"},
    {"name": "Burger", "image": "lib/assets/categories/burger.png"},
    {"name": "Dessert", "image": "lib/assets/categories/dessert.png"},
    {"name": "Mexican", "image": "lib/assets/categories/mexican.png"},
    {"name": "Pasta", "image": "lib/assets/categories/pasta.png"},
    {"name": "Pizza", "image": "lib/assets/categories/pizza.png"},
    {"name": "Salads", "image": "lib/assets/categories/salads.png"},
    {"name": "Sandwich", "image": "lib/assets/categories/sandwich.png"},
  ];
  get productcategories => _productcategories;
}
