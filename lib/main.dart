import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:magic_flutter/pages/splash_page.dart';
import 'package:magic_flutter/provider/shop_cart_provider.dart';
import 'package:magic_flutter/redux/state/count_state.dart';
import 'package:magic_flutter/style/custom_style.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'redux/reducers/count_reducer.dart';

void main() {
  final store =
      Store<CountState>(reducer, initialState: CountState.initState());
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<CountState> store;

  const MyApp({Key key, this.store}) : super(key: key);

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
          child: StoreProvider<CountState>(
              store: store,
              child: MaterialApp(
                title: 'Magic Flutter',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: CustomStyle.themeColor,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  buttonColor: CustomStyle.themeColor,
                ),
                home: SplashPage(),
              )),
        ));
  }
}
