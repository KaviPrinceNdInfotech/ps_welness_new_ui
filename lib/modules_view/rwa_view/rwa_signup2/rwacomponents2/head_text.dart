import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/rwa_view/rwa_signup1/rwa_signup1.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

class Rwa2HeadText extends StatelessWidget {
  const Rwa2HeadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          InkWell(
            onTap: () {
              Get.offAll(RwaSignup1());
              //Get.back();
            },
            child: Container(
              height: size.height * 0.03,
              width: size.width * 0.06,
              decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  size: size.height * 0.024,
                  color: MyTheme.blueww,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
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
            'RWA!',
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
