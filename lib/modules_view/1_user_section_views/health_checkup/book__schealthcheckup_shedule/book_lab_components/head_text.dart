import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/constants/constants.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

class Lab2HeadText extends StatelessWidget {
  const Lab2HeadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.05),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'SIGN UP',
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    //color: Color(0xff023382)
                  ),
                ),
                TextSpan(
                  text: ' Step 2',
                  style: GoogleFonts.alatsi(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple.shade500,
                    //color: Color(0xff023382)
                  ),
                ),
              ],
            ),
          ),
          // Text(
          //   'Sign Up',
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontWeight: FontWeight.w600,
          //     //color: Color(0xff023382)
          //   ),
          // ),
          Text(
            'Lab!',
            style: GoogleFonts.alatsi(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Color(0xff023382)),
          ),
        ],
      ),
    );
  }
}
