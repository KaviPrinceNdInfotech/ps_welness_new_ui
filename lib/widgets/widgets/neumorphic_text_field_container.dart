import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

class NeumorphicTextFieldContainer extends StatelessWidget {
  final Widget child;

  const NeumorphicTextFieldContainer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //height: size.height * 0.06,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: appPadding / 2),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                lightPrimary,
                darkPrimary,
              ]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, -2),
              spreadRadius: 1,
              blurRadius: 4,
              color: darkShadow,
            ),
            BoxShadow(
              offset: Offset(2, 2),
              spreadRadius: 1,
              blurRadius: 4,
              color: lightShadow,
            ),
          ]),
      child: child,
    );
  }
}
