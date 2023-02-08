import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/my_theme.dart';

class TextFieldDecorator extends StatelessWidget {
  final Widget child;
  TextFieldDecorator({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
      decoration: BoxDecoration(
        color: MyTheme.loginPageBoxColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
