import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  //Function onButtonPress;
  //final Gradient gradient;

  GradientButton({
    required this.onPressed,
    required this.child,
    // required this.gradient
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      /// onPressed: onPressed,
      onPressed: () {
        Get.back();
      },
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black38,
              Colors.black12,
              Colors.black12,
              Colors.black38,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: child),
      ),
      splashColor: Colors.black12,
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(32.0),
      ),
    );
  }
}
