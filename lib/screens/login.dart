import 'package:flutter/material.dart';
import 'package:products_app/widgets/login/card_container.dart';
import 'package:products_app/widgets/login/login_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoginBackground(
            child: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 250,
        ),
        CardContainer(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text('Login', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(
              height: 30,
            ),
            const _LoginForm(),
            const SizedBox(
              height: 30,
            )
          ],
        )),
        const SizedBox(
          height: 50,
        ),
        const Text('Crear una nueva cuenta'),
      ]),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.deepPurple,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                )),
                hintText: 'john.doe@gmail.com',
                labelText: 'Corre electronico',
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.alternate_email_rounded,
                  color: Colors.deepPurple,
                )),
          ),
        ],
      )),
    );
  }
}
