import 'package:flutter/material.dart';
import 'package:products_app/styles/font_styles.dart';
import 'package:products_app/ui/input_decorations.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  static const routeName = 'editProductScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _productImage(context),
        _editForm(),
        Padding(
          padding: EdgeInsets.only(top: 60),
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

  SingleChildScrollView _editForm() {
    return SingleChildScrollView(
      child: Form(
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
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Agrega un nombre a tu producto',
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Agrega una descripcion a tu producto',
                labelText: 'Descripcion',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Agrega un precio a tu producto',
                labelText: 'Precio',
              ),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              value: true,
              onChanged: (bool value) {},
              title: const Text('Disponible'),
              contentPadding: const EdgeInsets.all(0),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              onPressed: () {},
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

  Stack _productImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.indigo,
          width: double.infinity,
          height: 350,
          child: const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://via.placeholder.com/400x300/3700b3'),
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
