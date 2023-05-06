import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class AboutUsViewDriver extends StatelessWidget {
  const AboutUsViewDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyTheme.ThemeColors,
        elevation: 0,
        title: Text('About Driver'),
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
                    'About Driver:',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'A Driver is a professional who drives clients around in an efficient, safe and timely manner. In addition to maintaining regular cleaning services for their vehicle as well as managing payments on time each week/monthly cycle goes by; drivers also plan routes based on road conditions.',
                    style: GoogleFonts.roboto(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.037,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
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
