import 'package:Nectar/services/models/allproductmodel.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Nectar/services/apiservices/urls/baseurl.dart';
import 'package:Nectar/services/apiservices/urls/endpoints.dart';

class Productsprovider extends ChangeNotifier {
  final List<Map<String, dynamic>> _allproducts = [
    {
      "id": 1,
      "name": "7 Up",
      "price": 500,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "beverages",
      "stock": 1,
      "nutrition": 100,
      "review": 5,
      "image": "lib/assets/categories/images/beverages/7up.png",
    },
    {
      "id": 2,
      "name": "Cheer Up",
      "price": 450,
      "desc":
          "Cheer Up is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "beverages",
      "stock": 1,
      "nutrition": 150,
      "review": 4,
      "image": "lib/assets/categories/images/beverages/cheer_up.png",
    },
    {
      "id": 3,
      "name": "Lacchi",
      "price": 600,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "beverages",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/beverages/lacchi.png",
    },
    {
      "id": 4,
      "name": "Beef Lettuce",
      "price": 250,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "burger",
      "stock": 1,
      "nutrition": 50,
      "review": 5,
      "image": "lib/assets/categories/images/burger/beef_lettuce.png",
    },
    {
      "id": 5,
      "name": "Burger with Ingredian",
      "price": 600,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "burger",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image":
          "lib/assets/categories/images/burger/burger-with-floating-ingredient.png",
    },
    {
      "id": 6,
      "name": "Chicken Burger",
      "price": 800,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "burger",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image":
          "lib/assets/categories/images/burger/delicious-crispy-chicken-burger.png",
    },
    {
      "id": 7,
      "name": "Jilebi",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "dessert",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/dessert/jilebi-jangri.png",
    },
    {
      "id": 8,
      "name": "Candy",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "dessert",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/dessert/sweetness-candy.png",
    },
    {
      "id": 9,
      "name": "Mithai",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "dessert",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image":
          "lib/assets/categories/images/dessert/traditional-indian-mithai.png",
    },
    {
      "id": 10,
      "name": "Mexican Empanadas",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "mexican",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/mexican/mexican-empanadas.png",
    },
    {
      "id": 11,
      "name": "Rod Pozole With Chicken",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "mexican",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image":
          "lib/assets/categories/images/mexican/red-pozole-with-chicken.png",
    },
    {
      "id": 12,
      "name": "Tostadas Mexican",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "mexican",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/mexican/tostadas-mexican.png",
    },
    {
      "id": 13,
      "name": "Spicy Spaghetti",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "pasta",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image":
          "lib/assets/categories/images/pasta/delicious-spicy-spaghetti.png",
    },
    {
      "id": 14,
      "name": "Pasta Isolated",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "pasta",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/pasta/pasta-isolated.png",
    },
    {
      "id": 15,
      "name": "Pasta In Tomato",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "pasta",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/pasta/pngtpasta-in-tomato.png",
    },
    {
      "id": 16,
      "name": "Big Pizza",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "pizza",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/pizza/big-pizza.png",
    },
    {
      "id": 17,
      "name": "Hot Mini Pizza",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "pizza",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/pizza/hot-mini-pizza.png",
    },
    {
      "id": 18,
      "name": "Pepperoni Pizza",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "pizza",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/pizza/pepperoni-pizza.png",
    },
    {
      "id": 19,
      "name": "Chicken Salad",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "salads",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/salads/Chicken Salad.jpg",
    },
    {
      "id": 20,
      "name": "Green Salad",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "salads",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/salads/Green Salad.png",
    },
    {
      "id": 21,
      "name": "Vegetable Salads",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "salads",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/salads/Salad Vegetable.png",
    },
    {
      "id": 22,
      "name": "Club Sandwich",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "sandwich",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image": "lib/assets/categories/images/sandwich/Club Sandwich.png",
    },
    {
      "id": 23,
      "name": "Philly Cheese Steak Sandwich",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "sandwich",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image":
          "lib/assets/categories/images/sandwich/Philly Cheese Steak Sandwich.png",
    },
    {
      "id": 24,
      "name": "Savory Chicken Club Sandwich",
      "price": 120,
      "desc":
          "7UP is a popular lemon–lime–flavored carbonated soft drink known for its crisp and refreshing taste. It has a light, clean flavor made from natural lemon and lime essences. Because it contains no caffeine, it’s a convenient and worry-free choice for people of all ages.",
      "categories": "sandwich",
      "stock": 1,
      "nutrition": 150,
      "review": 5,
      "image":
          "lib/assets/categories/images/sandwich/Savory Chicken Club Sandwich.png",
    },
  ];
  get allproducts => _allproducts;

  //  Future<void> getallproduct() async {
  //   var response = await http.get(
  //     Uri.parse("${Baseurl().baseurl}${Endpoints().products}"),
  //   );

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     final jsondata = jsonDecode(response.body);
  //     final productlist = jsondata['data']['products'] as List;

  //     _allproducts = productlist
  //         .map((e) => Allproductmodel.fromJson(e))
  //         .toList();
  //   } else {

  //   }
  //   notifyListeners();
  // }
}
