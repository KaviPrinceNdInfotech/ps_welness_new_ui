import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestPickerWidget extends StatefulWidget {
  @override
  _TestPickerWidgetState createState() => _TestPickerWidgetState();
}

var selectedDate = DateTime.now();

class _TestPickerWidgetState extends State<TestPickerWidget> {
  late DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        //height: 100,
        child: Center(
          child: TextFormField(
            //initialValue: ('DD-MM-yyyy'),
            focusNode: AlwaysDisabledFocusNode(),
            controller: _textEditingController,
            onTap: () {
              _selectDate(context);
            },
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
      // builder: (BuildContext context, Widget child) {
      //   return child: child;
      //
      //   //   Theme(
      //   //   data: ThemeData.dark().copyWith(
      //   //     colorScheme: ColorScheme.dark(
      //   //       primary: Colors.deepPurple,
      //   //       onPrimary: Colors.white,
      //   //       surface: Colors.blueGrey,
      //   //       onSurface: Colors.yellow,
      //   //     ),
      //   //    // dialogBackgroundColor: Colors.blue[500],
      //   //   ),
      //   //   ,
      //   // );
      // }
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
