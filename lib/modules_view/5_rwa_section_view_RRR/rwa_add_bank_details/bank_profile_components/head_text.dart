import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

class AddRwaBankHeadText extends StatelessWidget {
  const AddRwaBankHeadText({Key? key}) : super(key: key);

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
          InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                  height: size.height * 0.03,
                  width: size.width * 0.06,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white70,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: size.height * 0.023,
                  )))),

          SizedBox(
            width: size.width * 0.0,
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            'ADD +',
            style: GoogleFonts.alatsi(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Color(0xff023382)),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Rwa Bank Details',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    //color: Color(0xff023382)
                  ),
                ),
                TextSpan(
                  text: '',
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
        ],
      ),
    );
  }
}
