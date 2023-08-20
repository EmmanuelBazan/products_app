import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: const Stack(children: [
        _PurpleBox(),
        _HeaderIcon(),
      ]),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: const Icon(
        Icons.person_pin,
        color: Colors.white,
        size: 100,
      ),
    ));
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
      width: double.infinity,
      height: screenSize.height * 0.4,
      decoration: _backgroundDecoration(),
      child: const Stack(
        children: [
          Positioned(
            top: 90,
            left: 30,
            child: _Buble(),
          ),
          Positioned(
            top: -40,
            left: -30,
            child: _Buble(),
          ),
          Positioned(
            top: -50,
            right: -20,
            child: _Buble(),
          ),
          Positioned(
            bottom: -50,
            left: 10,
            child: _Buble(),
          ),
          Positioned(
            bottom: 120,
            right: 20,
            child: _Buble(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _backgroundDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromRGBO(63, 63, 156, 1),
      Color.fromRGBO(90, 70, 178, 1)
    ]));
  }
}

class _Buble extends StatelessWidget {
  const _Buble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
