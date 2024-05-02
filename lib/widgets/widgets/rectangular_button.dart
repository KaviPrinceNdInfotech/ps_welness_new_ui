import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

class RectangularButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const RectangularButton({Key? key, required this.text, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding:
            const EdgeInsets.only(top: appPadding / 8, bottom: appPadding / 6),
        child: Container(
          width: double.infinity,
          height: size.height * 0.075,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    darkPrimary,
                    lightPrimary,
                  ]),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 3),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: darkShadow,
                ),
                BoxShadow(
                  offset: Offset(-3, -2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: lightShadow,
                ),
              ]),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: size.width * 0.049,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
