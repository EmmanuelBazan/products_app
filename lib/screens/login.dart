import 'package:flutter/material.dart';
import 'package:products_app/providers/login_form_provider.dart';
import 'package:products_app/screens/home.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:products_app/widgets/login/card_container.dart';
import 'package:products_app/widgets/login/login_background.dart';
import 'package:provider/provider.dart';

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
            ChangeNotifierProvider(
              create: (_) => LoginFormProvider(),
              child: const _LoginForm(),
            ),
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
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    return Container(
      child: Form(
          key: loginFormProvider.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Correo electronico',
                  prefixIcon: Icons.alternate_email_rounded,
                ),
                validator: (value) {
                  RegExp regExp = RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Correo electronico invalido';
                },
                onChanged: (value) => loginFormProvider.email = value,
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '********',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline,
                ),
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'La contraseña debe contener minimo 6 caracteres';
                },
                onChanged: (value) => loginFormProvider.password = value,
              ),
              const SizedBox(height: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  if (!loginFormProvider.isValidForm()) return;

                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
              )
            ],
          )),
    );
  }
}
