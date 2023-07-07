import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class SupportView extends StatelessWidget {
  const SupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyTheme.ThemeColors,
        elevation: 0,
        title: Text('Support'),
        //leading: Icon(Icons.arrow_back_ios_outlined),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address:',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Head Office:-',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    '278B, 1ST FLOOR, LEERA RAM MARKET MASJID MOTH,'
                    'SOUTH EX. PAPER-2, Masjid Moth Village, South Extension.'
                    'II, New Delhi, Delhi 110049.',
                    style: GoogleFonts.roboto(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.037,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Branch Office',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    'No. 224, 1st Floor, Humayunpur, safdasrjang Enclav,Humayupur, Safadrazganj Enclav, Humayupiur, safdarjung Enclav, New Delhi, Delhi 110029.',
                    style: GoogleFonts.roboto(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.037,
                        fontWeight: FontWeight.w400),
                  ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Noida:',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.005,
                  // ),
                  // Text(
                  //   'No. 224, 1st Floor, Humayunpur, safdasrjang Enclav,Humayupur, Safadrazganj Enclav, Humayupiur, safdarjung Enclav, New Delhi, Delhi 110029.',
                  //   style: GoogleFonts.raleway(
                  //       color: MyTheme.blueww,
                  //       fontSize: size.width * 0.033,
                  //       fontWeight: FontWeight.w500),
                  // ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Gurgaon:',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.005,
                  // ),
                  // Text(
                  //   'No. 224, 1st Floor, Humayunpur, safdasrjang Enclav,Humayupur, Safadrazganj Enclav, Humayupiur, safdarjung Enclav, New Delhi, Delhi 110029.',
                  //   style: GoogleFonts.raleway(
                  //       color: MyTheme.blueww,
                  //       fontSize: size.width * 0.033,
                  //       fontWeight: FontWeight.w500),
                  // ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Punjab:',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  // Text(
                  //   'No. 224, 1st Floor, Humayunpur, safdasrjang Enclav,Humayupur, Safadrazganj Enclav, Humayupiur, safdarjung Enclav, New Delhi, Delhi 110029.',
                  //   style: GoogleFonts.raleway(
                  //       color: MyTheme.blueww,
                  //       fontSize: size.width * 0.033,
                  //       fontWeight: FontWeight.w500),
                  // ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Phone: +9111126194230',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Text(
                        'Email: ',
                        style: GoogleFonts.poppins(
                          color: MyTheme.blueww,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600,
                          //decoration: TextDecoration.underline,
                        ),
                      ),
                      Text(
                        ' info@pswellness.in',
                        style: GoogleFonts.poppins(
                          color: MyTheme.blueww,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
