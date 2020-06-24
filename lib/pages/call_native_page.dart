/*
 * @author kevin
 * @date 2020/5/12 10:32 上午
 * @Description: flutter
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CallNativePage extends StatefulWidget {
  @override
  _CallNativePageState createState() => _CallNativePageState();
}

class _CallNativePageState extends State<CallNativePage>
    with WidgetsBindingObserver {
  static const MethodChannel _channel = MethodChannel('com.kevin.hello');

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await _channel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _getBatteryLevel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CallNative'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _channel.invokeMethod('openLocationSetting');
              },
              child: Text('openLocationSetting'),
            ),
            Text('$_batteryLevel')
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
