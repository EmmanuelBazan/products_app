import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: const Stack(children: [_PurpleBox()]),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.indigo,
      width: double.infinity,
      height: screenSize.height * 0.4,
    );
  }
}
