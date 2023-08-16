import 'package:flutter/material.dart';
import 'package:products_app/widgets/login/login_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginBackground());
  }
}
