import 'package:flutter/material.dart';
import 'package:products_app/styles/font_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _cardDecoration(),
        width: double.infinity,
        height: 350,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _BackgroundImage(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eu adipisicing nulla in officia tempor anim est sunt duis ullamco.',
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: FontStyles.bodyBld14B,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Culpa nulla occaecat laboris eiusmod duis qui ea reprehenderit commodo commodo ullamco cupidatat quis aliqua. Qui officia tempor ea sit fugiat anim reprehenderit exercitation ullamco reprehenderit eu occaecat. Consequat sint consequat exercitation occaecat ullamco est proident excepteur. Duis tempor minim quis id ad eiusmod labore consequat amet esse. Enim enim incididunt minim officia do sint reprehenderit velit ut aute consequat et labore irure.',
                    maxLines: 2,
                    softWrap: true,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: FontStyles.bodyReg14B,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '147.99',
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
  const _BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const SizedBox(
            width: double.infinity,
            height: 200,
            child: FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (false)
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
