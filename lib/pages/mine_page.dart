/*
 * @author kevin
 * @date 2020/6/23 4:35 PM
 * @Description: flutter
*/
import 'package:flutter/material.dart';
import 'package:magic_flutter/style/custom_style.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: ListTileTheme(
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Material(
                color: Colors.lightGreen,
                child: ListTile(
                  onTap: () {},
                  title: Text('data'),
                  leading: Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  trailing: Icon(Icons.star),
                ),
              ),
              Material(
                color: Colors.red,
                child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 45,
//                color: Colors.red,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                      width: 1,
                      color: CustomStyle.dividerColor,
                    ))),
                child: Row(
                  children: [
                    Expanded(
                        child: Container()),
                    Expanded(child: Container(child: Text('用时'))),
                    Expanded(child: Container(child: Text('总共用时：12345+6789'))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
