import 'package:Nectar/services/providers/productsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Getsingleproduct extends ChangeNotifier {
  final List<Map<String, dynamic>> _productinfo = [];
  get productinfo => _productinfo;

  getsingleproduct(int id, BuildContext context) {
    _productinfo.clear();
    List<Map<String, dynamic>> allproducts = Provider.of<Productsprovider>(
      listen: false,
      context,
    ).allproducts;

    _productinfo.addAll(allproducts.where((p) => (p['id'] == id)));
    notifyListeners();
  }
}
