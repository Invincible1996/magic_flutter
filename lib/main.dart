import 'package:flutter/material.dart';
import 'package:magic_flutter/pages/splash_page.dart';
import 'package:magic_flutter/style/custom_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomStyle.themeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: CustomStyle.themeColor,
      ),
      home: SplashPage(),
    );
  }
}
