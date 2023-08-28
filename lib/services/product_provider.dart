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

  Future saveOrCreateProduct(Product product) async {
    isUpdating = true;
    notifyListeners();

    if (product.id == null) {
      await _createProduct(product);
    } else {
      await _updateProduct(product);
    }

    isUpdating = false;
    notifyListeners();
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

  Future _updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    await http.post(url, body: product.toJson());
    // final decodedRes = jsonDecode(res.body);

    _updateProductList(product);
  }

  Future _createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final res = await http.post(url, body: product.toJson());
    final decodedRes = jsonDecode(res.body);

    product.id = decodedRes['name'];

    productsList.add(product);
  }

  _updateProductList(Product product) {
    final index =
        productsList.indexWhere((element) => element.id == product.id);

    productsList[index] = product;
  }
}
