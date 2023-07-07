import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.buttonColor,
    required this.buttontext,
    required this.textColor,
    required this.handleButtonClick,
  }) : super(key: key);

  final Color buttonColor;
  final String buttontext;
  final Color textColor;
  final Function handleButtonClick;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(),
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(50),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 12, horizontal: 10)),
              backgroundColor: MaterialStateProperty.all(buttonColor)),
          onPressed: () {
            handleButtonClick();
          },
          child: Text(
            buttontext,
            style: GoogleFonts.alatsi(
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: textColor),
          ),
        ),
      ),
    );
  }
}
