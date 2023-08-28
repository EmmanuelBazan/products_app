import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_app/models/product.dart';
import 'package:products_app/services/edit_product_form_provider.dart';
import 'package:products_app/services/product_provider.dart';
import 'package:products_app/styles/font_styles.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  static const routeName = 'editProductScreen';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => EditProductFormProvider(productProvider.selectedProduct),
      child: EditProductBody(
        product: productProvider.selectedProduct,
      ),
    );
  }
}

class EditProductBody extends StatelessWidget {
  final Product product;

  const EditProductBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _productImage(
          context,
          product.picture,
        ),
        _editForm(context),
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  SingleChildScrollView _editForm(BuildContext context) {
    final editFormProvider = Provider.of<EditProductFormProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    Product currentProduct = editFormProvider.product;

    return SingleChildScrollView(
      child: Form(
          key: editFormProvider.formKey,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            margin: const EdgeInsets.only(top: 340),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  autocorrect: false,
                  initialValue: currentProduct.name,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Agrega un nombre a tu producto',
                    labelText: 'Nombre',
                  ),
                  onChanged: (value) {
                    currentProduct.name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autocorrect: false,
                  initialValue: currentProduct.description,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Agrega una descripcion a tu producto',
                    labelText: 'Descripcion',
                  ),
                  onChanged: (value) {
                    currentProduct.description = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La descripcion es obligatoria';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autocorrect: false,
                  initialValue: '\$${currentProduct.price}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Agrega un precio a tu producto',
                    labelText: 'Precio',
                  ),
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      currentProduct.price = 0;
                    } else {
                      currentProduct.price = double.parse(value);
                    }
                  },
                ),
                const SizedBox(height: 10),
                SwitchListTile(
                  value: currentProduct.available,
                  onChanged: (bool value) =>
                      editFormProvider.updateAvailability(value),
                  title: const Text('Disponible'),
                  contentPadding: const EdgeInsets.all(0),
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  onPressed: () async {
                    if (!editFormProvider.isValidForm()) return;

                    await productProvider.updateProduct(product);
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  disabledColor: Colors.grey,
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      'Guardar',
                      style: FontStyles.headlineBld18White,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          )),
    );
  }

  Stack _productImage(BuildContext context, String? urlImg) {
    return Stack(
      children: [
        Container(
          color: Colors.indigo,
          width: double.infinity,
          height: 350,
          child: FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                urlImg ?? 'https://via.placeholder.com/400x300/3700b3'),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: 350,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0, -0.5),
              end: Alignment(0, 0.1),
              colors: [
                Color.fromARGB(125, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
