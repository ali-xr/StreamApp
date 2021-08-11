// import 'package:exam/ui/headPage.dart';
import 'package:exam/ui/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginPage',
      routes: {
        '/loginPage': (context) => LoginPage(),
      },
    );
  }
}
