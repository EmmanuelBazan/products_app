import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_app/screens/screens.dart';
import 'package:uni_links/uni_links.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //ADD THIS FUNCTION TO HANDLE DEEP LINKS
    Future initUniLinks() async {
      try {
        Uri? initialLink = await getInitialUri();
        print(initialLink);
      } on PlatformException {
        print('platfrom exception unilink');
      }
    }

    initUniLinks();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => const HomeScreen()
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
      ),
    );
  }
}
