/*
 * @author kevin
 * @date 2020/7/17 5:46 下午
 * @Description: flutter
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_flutter/application.dart';

class DraggableScrollableSheetPage extends StatefulWidget {
  @override
  _DraggableScrollableSheetPageState createState() =>
      _DraggableScrollableSheetPageState();
}

class _DraggableScrollableSheetPageState
    extends State<DraggableScrollableSheetPage> {
  bool _showModal = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DraggableScrollableSheetPage')),
      body: Stack(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _showModal = true;
              });
            },
            child: Text('data'),
          ),
          _showModal
              ? Positioned(
                  child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showModal = false;
                    });
                  },
                  child: Container(
                    width: Application.screenWidth,
                    height: Application.screeHeight,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    child:
                        NotificationListener<DraggableScrollableNotification>(
                      onNotification: (notification) {
//                        print("${notification.extent}");
                        if (notification.extent <= 0.15) {
                          setState(() {
                            _showModal = false;
                          });
                        }
                        return true;
                      },
                      child: DraggableScrollableSheet(
                        minChildSize: 0,
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
                                          onPressed: () {
                                            setState(() {
                                              _showModal = false;
                                            });
                                          }),
                                      IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () {
                                            setState(() {
                                              _showModal = false;
                                            });
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
                ))
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
