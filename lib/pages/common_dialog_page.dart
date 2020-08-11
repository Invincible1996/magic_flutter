/*
 * @author kevin
 * @date 2020/7/28 11:02 AM
 * @Description: flutter
*/
import 'package:flutter/material.dart';
import 'package:magic_flutter/components/common_dialog.dart';

class CommonDialogPage extends StatefulWidget {
  @override
  _CommonDialogPageState createState() => _CommonDialogPageState();
}

class _CommonDialogPageState extends State<CommonDialogPage> {
  int _count = 0;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CommonDialogPage')),
      body: Container(
        color: Colors.green,
        child: RaisedButton(
          onPressed: _showDialog,
          child: Text('show dialog'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) => CommonDialog(
              child: Container(
//                alignment: Alignment.center,
                child: Container(
//                  color: Colors.white,
                  child: NotificationListener<DraggableScrollableNotification>(
                    onNotification: (notification) {
                      print("${notification.extent}");
                      if (notification.extent == 0.2) {
                        _count++;
                        debugPrint('53---common_dialog_page-----');
                        if (_count == 1) {
                          Navigator.of(context).pop();
//                          _count = 0;
                        }
                      }
                      return true;
                    },
                    child: DraggableScrollableSheet(
                      minChildSize: 0.2,
                      maxChildSize: 0.8,
                      expand: false,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(
                                          Icons.arrow_downward,
                                          color: Colors.transparent,
                                        ),
                                        onPressed: () {}),
                                    IconButton(
                                        icon: Icon(Icons.arrow_downward),
                                        onPressed: () {}),
                                    IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        })
                                  ],
                                );
                              }
                              return ListTile(title: Text('Item $index'));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
//                color: Colors.white,
              ),
            ));
  }
}
