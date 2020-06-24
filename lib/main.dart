import 'package:flutter/material.dart';
import 'package:magic_flutter/pages/splash_page.dart';
import 'package:magic_flutter/provider/shop_cart_provider.dart';
import 'package:magic_flutter/style/custom_style.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        textStyle: TextStyle(fontSize: 19.0, color: Colors.white),
        backgroundColor: Colors.black,
        radius: 20.0,
        animationCurve: Curves.easeIn,
        animationBuilder: Miui10AnimBuilder(),
        animationDuration: Duration(milliseconds: 200),
        duration: Duration(seconds: 3),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ShopCartProvider(),
            )
          ],
          child: MaterialApp(
            title: 'Magic Flutter',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: CustomStyle.themeColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              buttonColor: CustomStyle.themeColor,
            ),
            home: SplashPage(),
          ),
        ));
  }
}
