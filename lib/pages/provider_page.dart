/*
 * @Author: kevin
 * @Date: 2020-05-25 11:12:02
 * @LastEditTime: 2020-09-04 19:24:22
 * @Description: flutter
 */
import 'package:flutter/material.dart';
import 'package:magic_flutter/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  CounterProvider counterProvider;

  @override
  void initState() {
    super.initState();
//    Future.delayed(Duration.zero,(){
//      Provider.of<CounterProvider>(context,listen: false).count1 = 200;
//    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ProviderPage'),
        ),
        body: Container(
          child: Consumer<CounterProvider>(builder: (context, model, _) {
            return Item(
              model: model,
            );
          }),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final CounterProvider model;

  const Item({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('${model.count}'),
          RaisedButton(
            onPressed: () => model.increment(),
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
