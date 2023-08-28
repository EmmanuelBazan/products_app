import 'package:flutter/material.dart';
import 'package:products_app/models/product.dart';

class EditProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Product product;

  EditProductFormProvider(this.product);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  updateAvailability(bool value) {
    product.available = value;
    notifyListeners();
  }
}
