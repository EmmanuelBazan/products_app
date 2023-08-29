import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:products_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  File? newPictureFile;
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

  updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isUpdating = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dzlpbanqa/image/upload?upload_preset=imuv7oed');

    final req = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    req.files.add(file);

    final streamRes = await req.send();
    final res = await http.Response.fromStream(streamRes);

    if (res.statusCode != 200 && res.statusCode != 201) {
      return null;
    }

    newPictureFile = null;

    final decoded = jsonDecode(res.body);
    return decoded['secure_url'];
  }
}
