/*
 * @author kevin
 * @date 2020/4/7 10:42 AM
 * @Description: flutter
*/
import 'dart:async';

import 'package:flutter/material.dart';

class ExceptionPage extends StatefulWidget {
  @override
  _ExceptionPageState createState() => _ExceptionPageState();
}

class _ExceptionPageState extends State<ExceptionPage> {
  @override
  void initState() {
    super.initState();
    try {
      throw StateError('This is a Dart exception');
    } catch (e) {
      print('异常------$e');
    }

    //使用catchError捕获异步异常
    Future.delayed(Duration(seconds: 1))
        .then((e) => throw StateError('This is a Dart exception in Future.'))
        .catchError((e) => print(e));
    asyncException();

    //同步抛出异常
    runZoned(() {
      throw StateError('This is a Dart exception.');
    }, onError: (dynamic e, StackTrace stack) {
      print('Sync error caught by zone 1');
    });

//异步抛出异常
    runZoned(() {
      Future.delayed(Duration(seconds: 1))
          .then((e) => throw StateError('This is a Dart exception in Future.'));
    }, onError: (dynamic e, StackTrace stack) {
      print('Async error aught by zone 2');
    });
  }

  asyncException() async {
    //以下代码无法捕获异步异常
    try {
      var response = await Future.delayed(Duration(seconds: 1));
      if (response == null)
        throw StateError('This is a Dart exception in Future');
      print(response);
    } catch (e) {
      print(e);
    } finally {
      print('代码执行完毕');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exception Page'),
      ),
    );
  }
}
