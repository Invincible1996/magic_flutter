/*
 * @Author: kevin
 * @Date: 2020-07-22 17:27:41
 * @LastEditTime: 2020-07-29 11:07:11
 * @Description: flutter
 */
import 'package:flutter/material.dart';

class HeroAnimationPage extends StatefulWidget {
  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HeroAnimationPage')),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page2()),
            );
          },
          child: Hero(
              tag: "profile-image",
              child: CircleAvatar(
                maxRadius: 100.0,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/flagged/photo-1566127992631-137a642a90f4",
                ),
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Hero(
          tag: "profile-image",
          child: Container(
            width: double.infinity,
            height: 400.0,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/flagged/photo-1566127992631-137a642a90f4",
                    ),
                    fit: BoxFit.cover)),
          ),
        ));
  }
}
