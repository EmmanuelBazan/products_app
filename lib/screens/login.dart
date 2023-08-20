import 'package:flutter/material.dart';
import 'package:products_app/widgets/login/card_container.dart';
import 'package:products_app/widgets/login/login_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: LoginBackground(
            child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 250,
        ),
        CardContainer(child: Text('Holamundo'))
      ]),
    )));
  }
}
