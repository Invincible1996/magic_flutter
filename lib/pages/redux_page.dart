/*
 * @Author: kevin
 * @Date: 2020-07-15 15:35:27
 * @LastEditTime: 2020-08-11 16:40:56
 * @Description: flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:magic_flutter/redux/action/action.dart';
import 'package:magic_flutter/redux/state/count_state.dart';

class ReduxPage extends StatefulWidget {
  @override
  _ReduxPageState createState() => _ReduxPageState();
}

class _ReduxPageState extends State<ReduxPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux'),
      ),
      body: StoreConnector<CountState, int>(
        converter: (store) => store.state.count,
        builder: (context, count) {
          return Center(
            child: Text(
              count.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
        },
      ),
      floatingActionButton: StoreConnector<CountState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(MActions.increment);
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
