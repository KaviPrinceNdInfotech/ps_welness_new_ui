import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/about_us_rwa/aboutus_rwa.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class AboutUsView extends StatelessWidget {
  AboutUsView({Key? key}) : super(key: key);
  final RwaAboutusController _rwaAboutusController =
      Get.put(RwaAboutusController());

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
        //leading: Icon(Icons.arrow_back_ios_outlined),
      ),
      body: Obx(
        () => (_rwaAboutusController.isLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                              "${_rwaAboutusController.rwaaboutusModel?.about.toString()}"),
//                     Text(
//                       """"The Authority offers you a ton of benefits for registering your housing society under the RWA. We have enlisted some of the benefits of RWA registration for you in the following points:
//
// 1. For one, a Society must have a Residential Welfare Association.
//
// 2. Some perks associated with it affect all of that Society's residents.
//
// 3. With registration, the Housing Society is further legitimized.
//
// 4. An RWA entails the rules and regulations pertaining to some societal amenities that every resident should conduct.
//
// Governed under the Societies Act, Delhi's residential welfare registration process is the same as the Society Registration.
//
// At Pswelness, we can assist you with the registration process for RWA. Our team will ensure you access an RWA as soon as possible. Get in touch with us to know more. """
//                       //'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
//                       ,
//                       style: GoogleFonts.roboto(
//                           color: MyTheme.blueww,
//                           fontSize: size.width * 0.037,
//                           fontWeight: FontWeight.w400),
//                     ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
