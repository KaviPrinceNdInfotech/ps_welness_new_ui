import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class AboutFranchiseeView extends StatelessWidget {
  const AboutFranchiseeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyTheme.ThemeColors,
        elevation: 0,
        title: Text('About Franchies'),
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
                    'About Franchies:',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Choose the preschool experts to get complete support for your very own EuroKids franchise. Invest in your success with a great business franchise - your very own EuroKids preschool. Trusted Business Brand. Start your Preschool. Best Education Brand. Franchise Opportunity. Edge 360 Advantage. Leading Preschool Chain. Amenities: Infrastructure Design, Furniture & Equipment.',
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
