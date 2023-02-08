import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';

class ComplaintHeadText extends StatelessWidget {
  const ComplaintHeadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios_outlined)),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                'Register Complain',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            '24*7 availability',
            style: GoogleFonts.alatsi(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color(0xff023382)),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          // RichText(
          //   text: TextSpan(
          //     children: <TextSpan>[
          //       TextSpan(
          //         text: 'Please enter your complain.',
          //         style: GoogleFonts.poppins(
          //           fontSize: 23,
          //           color: Colors.black87,
          //           fontWeight: FontWeight.w600,
          //           //color: Color(0xff023382)
          //         ),
          //       ),
          //       TextSpan(
          //         text: '',
          //         style: GoogleFonts.alatsi(
          //           fontSize: 20,
          //           fontWeight: FontWeight.w600,
          //           color: Colors.deepPurple.shade500,
          //           //color: Color(0xff023382)
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Text(
          //   'Sign Up',
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontWeight: FontWeight.w600,
          //     //color: Color(0xff023382)
          //   ),
          // ),
        ],
      ),
    );
  }
}
