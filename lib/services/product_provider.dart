import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  bool isLoading = true;
  final List<Product> productsList = [];
  final String _baseUrl =
      'https://productos-app-8ad02-default-rtdb.firebaseio.com';

  ProductProvider() {
    getProducts();
  }

  Future getProducts() async {
    final url = Uri.https(_baseUrl, '/products.json');
    final res = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(res.body);

    print(productsMap);
  }
}
