import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyTheme.ThemeColors,
        elevation: 0,
        title: Text('About Us'),
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
                    'About Us:',
                    style: GoogleFonts.poppins(
                        color: MyTheme.blueww,
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    """
With time our company has earned the trust of customers and has witnessed a tremendous rise in the medical and hospitality industry. Superior quality 24 hour medical and ambulance services are provided by our workforce. Our team of qualified doctors, nurses and other qualified workforce are passionate and completely crazy when it comes to perform humanitarian services. The humanitarian mode of our work has led to our rates being largely cost effective. Our ambulances contain all the modern equipments necessary for patients and our medical team is hard working enough to retain customers faith in us. 
Our equipments are procured from reliable manufacturers and they are randomly tested on international parameters before being put to use. Our diligent workforce has received enough compliments and praises due to their sensitive approach. We aim to completely utilize our services for the benefits of humankind. Our services are renowned due to their reliability, comfort level, efficiency, etc. However, the biggest credit goes to our mentor Mr. Nasib Singh whose thorough guidance and experience have resulted in our dramatic growth. Though, at present, we are catering to the subcontinent, our brand name keeps on growing with each passing day and we are keen to increase our quality services.""",
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
