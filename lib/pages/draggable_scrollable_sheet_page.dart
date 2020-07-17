/*
 * @author kevin
 * @date 2020/7/17 5:46 下午
 * @Description: flutter
*/
import 'package:flutter/material.dart';
class DraggableScrollableSheetPage extends StatefulWidget {
  @override
  _DraggableScrollableSheetPageState createState() => _DraggableScrollableSheetPageState();
}

class _DraggableScrollableSheetPageState extends State<DraggableScrollableSheetPage> {
    
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DraggableScrollableSheetPage')),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        ),
      ),
    );
  }
  
    @override
  void dispose() {
    super.dispose();
  }
}
