/*
 * @author kevin
 * @date 2020/4/7 1:34 PM
 * @Description: FutureBuilderTest
*/

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future _future;

  @override
  initState() {
    super.initState();
    _future = getData();
  }

  Future<String> getData() async {
    Dio dio = Dio();
    var response = await dio.get('https://jsonplaceholder.typicode.com/users');

    print(response);
//      throw StateError('message');
//    await Future.delayed(Duration(milliseconds: 2000));
    return response.data.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder'),
      ),
      body: FutureBuilder(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('none');
              case ConnectionState.active:
                return Text('active');
              case ConnectionState.waiting:
                return Center(child: CupertinoActivityIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView(children: <Widget>[
                    Text(snapshot.data)
                  ],);
                } else if (snapshot.hasError) {
                  return Center(child: Text('网络错误'));
                }

                print(snapshot.hasError);
                print(snapshot.data);
                return Text(snapshot.data);
            }
            return null;
          }),
    );
  }
}
