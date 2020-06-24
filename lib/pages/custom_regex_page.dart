/*
 * @author kevin
 * @date 2020/6/22 2:15 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class CustomRegexPage extends StatefulWidget {
  @override
  _CustomRegexPageState createState() => _CustomRegexPageState();
}

class _CustomRegexPageState extends State<CustomRegexPage> {
  TextEditingController _controller = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomRegexPage'),
      ),
      body: Container(
        child: Center(
          child: TextField(
            controller: _controller,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RegExp password =
              new RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,64}$");
          if (password.hasMatch(_controller.text)) {
            Widget widget = Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  color: Colors.grey.withOpacity(0.3),
                  child: Icon(
                    Icons.add,
                    size: 30.0,
                    color: Colors.green,
                  ),
                ),
              ),
            );
            ToastFuture toastFuture = showToastWidget(
              widget,
              duration: Duration(seconds: 3),
              onDismiss: () {
                print(
                    "the toast dismiss"); // the method will be called on toast dismiss.
              },
            );

            // can use future
            Future.delayed(Duration(seconds: 2), () {
              toastFuture.dismiss(); // dismiss
            });
            debugPrint('41---custom_regex_page-----');
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
