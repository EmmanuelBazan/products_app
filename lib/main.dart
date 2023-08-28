import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_app/screens/edit_product_screes.dart';
import 'package:products_app/screens/screens.dart';
import 'package:products_app/services/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //^ ADD THIS FUNCTION TO HANDLE DEEP LINKS
    Future initUniLinks() async {
      try {
        Uri? initialLink = await getInitialUri();
        print(initialLink);
      } on PlatformException {
        print('platfrom exception unilink');
      }
    }

    // initUniLinks();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        EditProductScreen.routeName: (_) => const EditProductScreen()
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
      ),
    );
  }
}
