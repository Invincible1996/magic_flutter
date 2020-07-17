import 'package:flutter/material.dart';
import 'package:magic_flutter/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProviderPage')),
      body: Consumer<CounterProvider>(builder: (context, counter, _) {
        return Text('${counter.count}');
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterProvider>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
