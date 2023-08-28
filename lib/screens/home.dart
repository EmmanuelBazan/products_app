import 'package:flutter/material.dart';
import 'package:products_app/screens/edit_product_screes.dart';
import 'package:products_app/services/product_provider.dart';
import 'package:products_app/widgets/global/full_screen_loading.dart';
import 'package:products_app/widgets/home/product_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        centerTitle: true,
      ),
      body: productProvider.isLoading
          ? const FullScreenLoading()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  itemCount: productProvider.productsList.length,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 350,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                        onTap: () {
                          productProvider.selectedProduct =
                              productProvider.productsList[index].copy();
                          Navigator.pushNamed(
                              context, EditProductScreen.routeName);
                        },
                        child: ProductCard(
                            product: productProvider.productsList[index]),
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
