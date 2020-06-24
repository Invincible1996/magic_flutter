/*
 * @author kevin
 * @date 2020/4/7 2:38 PM
 * @Description: flutter
*/
import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stepper'),
      ),
      body: Container(
//        color: CustomStyle.themeColor,
        child: Stepper(
          steps: [
            Step(
              isActive: true,
              title: Text("Start"),
              subtitle: Text('StepperPage StepperPage StepperPage'),
//              state: StepState.disabled,
              content: Text("Before starting, we should create a page."),
            ),
            Step(
              isActive: true,
              title: Text("Constructor"),
              content: Text("Let's look at its construtor."),
            ),
          ],
        ),
      ),
    );
  }
}
