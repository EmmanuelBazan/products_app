import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isUpdating = false;
  late Product selectedProduct;
  final List<Product> productsList = [];
  final String _baseUrl = 'productos-app-8ad02-default-rtdb.firebaseio.com';

  ProductProvider() {
    getProducts();
  }

  Future<List<Product>> getProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, '/products.json');
    final res = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(res.body);

    productsMap.forEach((key, value) {
      final temp = Product.fromMap(value);
      temp.id = key;
      productsList.add(temp);
    });

    isLoading = false;
    notifyListeners();

    return productsList;
  }

  Future updateProduct(Product product) async {
    isUpdating = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final res = await http.put(url, body: product.toJson());
    final decodedRes = res.body;

    updateProductList(product);

    isUpdating = false;
    notifyListeners();
  }

  updateProductList(Product product) {
    final index =
        productsList.indexWhere((element) => element.id == product.id);

    productsList[index] = product;
  }
}
