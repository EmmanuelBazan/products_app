import 'package:flutter/material.dart';
import 'package:products_app/screens/edit_product_screes.dart';
import 'package:products_app/widgets/home/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: GridView.builder(
            itemCount: 50,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 350,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, EditProductScreen.routeName);
                  },
                  child: const ProductCard(),
                )),
      ),
      // ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (BuildContext context, int index) => const ProductCard(),
      // ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
