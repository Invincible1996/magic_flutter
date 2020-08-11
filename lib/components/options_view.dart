/*
 * @Author: kevin
 * @Date: 2020-08-11 16:21:54
 * @LastEditTime: 2020-08-11 19:05:39
 * @Description: flutter
 */
import 'package:flutter/material.dart';
import 'package:magic_flutter/model/multi_choice_model.dart';
import 'package:magic_flutter/pages/multiple_choice_page.dart';

class OptionsView extends StatefulWidget {
  final List<Options> options;
  final List<String> rightAnswers;
  final Function(List<String>) onOptionSelect;

  const OptionsView({
    Key key,
    this.options,
    this.rightAnswers,
    this.onOptionSelect,
  }) : super(key: key);
  @override
  _OptionsViewState createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
  List<Options> options = [];
  List<String> _selectAnswers = [];
  @override
  initState() {
    super.initState();
    setState(() {
      options = widget.options;
    });
  }

  @override
  void didUpdateWidget(OptionsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      options = widget.options;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: options
            .asMap()
            .map((key, value) => MapEntry(
                key,
                ChoiceItem(
                  isRight: widget.rightAnswers.contains(value.choice),
                  index: key,
                  choice: value.choice,
                  value: value.value,
                  isCanCheck: value.isCanCheck,
                  isCheck: value.isCheck,
                  onItemChecked: (index, choice, isCheck) {
                    if (isCheck) {
                      _selectAnswers.add(choice);
                    } else {
                      _selectAnswers.remove(choice);
                    }

                    widget.onOptionSelect(_selectAnswers);
                    //
                    // List<Options> newOptions = options
                    //     .map((e) => Options(
                    //           isCheck: true,
                    //           isCanCheck: true,
                    //           isRight: e.isRight,
                    //           value: e.value,
                    //           choice: e.choice,
                    //         ))
                    //     .toList();
                    print('=======>>>>>>$index');
                    print('=======>>>>>>$choice');

                    // setState(() {
                    //   options = newOptions;
                    // });
                  },
                )))
            .values
            .toList(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
