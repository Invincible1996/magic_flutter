import 'package:flutter/material.dart';

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProviderPage')),
      body: Column(
        children: <Widget>[
          Text('abc'),
          RaisedButton(
            onPressed: () {},
            child: Text('increment'),
          )
        ],
      ),
    );
  }
}
