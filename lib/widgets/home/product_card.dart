import 'package:flutter/material.dart';
import 'package:products_app/models/product.dart';
import 'package:products_app/styles/font_styles.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _cardDecoration(),
        width: double.infinity,
        height: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _BackgroundImage(
              available: product.available,
              urlImage: product.picture,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: FontStyles.bodyBld14B,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description,
                    maxLines: 2,
                    softWrap: true,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: FontStyles.bodyReg14B,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$${product.price}',
                    textAlign: TextAlign.start,
                    style: FontStyles.bodyBld14Indg,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 7),
              blurRadius: 10,
            )
          ]);
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.red,
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final bool available;
  final String? urlImage;

  const _BackgroundImage({
    super.key,
    required this.available,
    this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  urlImage ?? 'https://via.placeholder.com/400x300/3700b3'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (!available)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              color: const Color.fromARGB(80, 0, 0, 0),
              child: const Text(
                'not available',
                style: FontStyles.headlineBld18White,
              ),
            ),
          )
      ],
    );
  }
}
