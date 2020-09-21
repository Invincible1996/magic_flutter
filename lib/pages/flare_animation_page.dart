/*
 * @author kevin
 * @date 2020/8/24 3:02 PM
 * @Description: flutter
*/
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareAnimationPage extends StatefulWidget {
  @override
  _FlareAnimationPageState createState() => _FlareAnimationPageState();
}

class _FlareAnimationPageState extends State<FlareAnimationPage> {
  bool isOpen = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlareAnimationPage')),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: FlareActor('assets/success.flr',
            alignment:Alignment.center, fit:BoxFit.contain, animation:"idle"),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
