import 'package:flutter/material.dart';

class Categoriesprovider extends ChangeNotifier {
  bool _isloading = false;
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

  //   categories() async{
  //     _isloading = true;
  //     var response = await http.get(Uri.parse("${Baseurl().baseurl}${Endpoints().categories}"));
  //     if (response.statusCode == 200 || response.statusCode == 201){
  //       final jsondata = jsonDecode(response.body);
  //       final categorisdata = jsondata['data']['categories'] as List;
  //       _productcategories = categorisdata.map((e) => Categoriesmodel.fromJson(e)).toList();
  //     }
  //     _isloading = false;
  //     notifyListeners();
  //   }
}
