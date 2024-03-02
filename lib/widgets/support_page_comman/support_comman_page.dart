import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modules_view/1_user_section_views/user_drawer/drawer_pages_user/website_view/website_view.dart';

//import '../../../../1_user_section_views/user_drawer/drawer_pages_user/website_view/website_view.dart';

final Uri _url = Uri.parse('http://pswellness.in/');
final Uri _url2 = Uri.parse('info@pswellness.in/');
final Uri _url3 = Uri.parse('https://twitter.com/');

final Uri emailLaunchUri = Uri.parse('info@pswellness.in/');
//   scheme: 'mailto',
//   path: 'smith@example.com',
//   query: encodeQueryParameters(<String, String>{
//     'subject': 'Example Subject & Symbols are allowed!',
//   }),
// );

//launchUrl(emailLaunchUri);

_launchWhatsapp() async {
  var whatsapp = "+919868476173";
  var whatsappAndroid =
      Uri.parse("whatsapp://send?phone=$whatsapp&text=Hi Ps wellness");
  if (await canLaunchUrl(whatsappAndroid)) {
    await launchUrl(whatsappAndroid);
  } else {
    Get.snackbar(
      "Whats App not installed ",
      "Please install the what's app Prince",
      colorText: Colors.red.shade400,
      backgroundColor: Colors.white10,
      icon: Icon(Icons.person, color: Colors.red),
      snackPosition: SnackPosition.TOP,
    );
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("WhatsApp is not installed on the device"),
    //   ),
    // );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw 'Could not launch $_url';
  }
}

Future<void> _launchUrl3() async {
  if (!await launchUrl(_url3)) {
    throw 'Could not launch $_url';
  }
}

class SupportViewPsComman extends StatelessWidget {
  const SupportViewPsComman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: MyTheme.ThemeColors,
      //   elevation: 0,
      //   title: Text('Support'),
      //   //leading: Icon(Icons.arrow_back_ios_outlined),
      // ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -size.height * 0.02,
              //bottom: size.height * 0.64,
              //left: -30,
              right: -size.width * 0.124,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: size.height * 0.22,
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                      //color: Colors.,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                            'lib/assets/background_stack_png/contactus.png',
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.0,
                            vertical: size.height * 0.01),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: size.height * 0.03,
                                width: size.width * 0.1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: size.height * 0.022,
                                  color: MyTheme.blueww,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Text(
                              'CONTACT SUPPORT',
                              style: GoogleFonts.alatsi(
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.w600,
                                color: MyTheme.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
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
                        'Registered Office:-',
                        style: GoogleFonts.poppins(
                            color: MyTheme.blueww,
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Text(
                        'A 151, Gali No 8, Nasirpur Colony, Palam, South West Delhi 110045',
                        // '278B, 1ST FLOOR, LEERA RAM MARKET MASJID MOTH,'
                        // 'SOUTH EX. PAPER-2, Masjid Moth Village, South Extension.'
                        // 'II, New Delhi, Delhi 110049.',
                        style: GoogleFonts.roboto(
                            color: MyTheme.blueww,
                            fontSize: size.width * 0.037,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        'Corporate Office',
                        style: GoogleFonts.poppins(
                            color: MyTheme.blueww,
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Text(
                        '278 B 1st Floor, Leela Ram Market,South Extension Part 2, New Delhi 110049',
                        //'No. 224, 1st Floor, Humayunpur, safdasrjang Enclav,Humayupur, Safadrazganj Enclav, Humayupiur, safdarjung Enclav, New Delhi, Delhi 110029.',
                        style: GoogleFonts.roboto(
                            color: MyTheme.blueww,
                            fontSize: size.width * 0.037,
                            fontWeight: FontWeight.w400),
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      // Text(
                      //   'Noida:',
                      //   style: GoogleFonts.poppins(
                      //       color: MyTheme.blueww,
                      //       fontSize: size.width * 0.04,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // // SizedBox(
                      // //   height: size.height * 0.005,
                      // // ),
                      // // Text(
                      // //   'No. 224, 1st Floor, Humayunpur, safdasrjang Enclav,Humayupur, Safadrazganj Enclav, Humayupiur, safdarjung Enclav, New Delhi, Delhi 110029.',
                      // //   style: GoogleFonts.raleway(
                      // //       color: MyTheme.blueww,
                      // //       fontSize: size.width * 0.033,
                      // //       fontWeight: FontWeight.w500),
                      // // ),
                      //
                      // SizedBox(
                      //   height: size.height * 0.03,
                      // ),
                      // Text(
                      //   'Gurgaon:',
                      //   style: GoogleFonts.poppins(
                      //       color: MyTheme.blueww,
                      //       fontSize: size.width * 0.04,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      ///
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
                      // Text(
                      //   'Punjab:',
                      //   style: GoogleFonts.poppins(
                      //       color: MyTheme.blueww,
                      //       fontSize: size.width * 0.04,
                      //       fontWeight: FontWeight.bold),
                      // ),
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

                      Row(
                        children: [
                          Text(
                            'Contact : 01141101286',
                            style: GoogleFonts.poppins(
                                color: MyTheme.blueww,
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                  barrierDismissible: true,
                                  title: "Welcome to PS Wellness",
                                  confirm: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: PhysicalModel(
                                      color: MyTheme.blueww,
                                      shadowColor: Colors.blueGrey,
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: InkWell(
                                          onTap: () async {
                                            String telephoneNumber =
                                                '01141101286';
                                            String telephoneUrl =
                                                "tel:$telephoneNumber";
                                            if (await canLaunch(telephoneUrl)) {
                                              await launch(telephoneUrl);
                                            } else {
                                              throw "Error occured trying to call that number.";
                                            }
                                            // launch('tel:+9111126194230');
                                          },
                                          child: Container(
                                              height: size.height * 0.04,
                                              width: size.width * 0.26,
                                              color: MyTheme.ThemeColors,
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    color: Colors.white,
                                                    size: size.width * 0.05,
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.03,
                                                  ),
                                                  Text(
                                                    'Call',
                                                    style: TextStyle(
                                                      color: MyTheme.white,
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  cancel: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PhysicalModel(
                                      color: MyTheme.blueww,
                                      shadowColor: Colors.blueGrey,
                                      elevation: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: InkWell(
                                          onTap: () {
                                            _launchWhatsapp();
                                          },
                                          child: Container(
                                              height: size.height * 0.04,
                                              width: size.width * 0.26,
                                              color: MyTheme.ThemeColors,
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.message,
                                                    color: Colors.white,
                                                    size: size.height * 0.03,
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.03,
                                                  ),
                                                  Text(
                                                    'Whatsapp',
                                                    style: TextStyle(
                                                        color: MyTheme.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            size.width * 0.03),
                                                  ),
                                                ],
                                              ))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  middleText:
                                      "We are giving two options to our customer for contact with us.",
                                  backgroundColor: MyTheme.blueww,
                                  titleStyle: GoogleFonts.alatsi(
                                      color: MyTheme.white,
                                      fontSize: size.height * 0.03,
                                      fontWeight: FontWeight.bold),
                                  middleTextStyle:
                                      TextStyle(color: MyTheme.text1),
                                  radius: 10);
                            },
                            child: Container(
                              height: size.height * 0.04,
                              width: size.width * 0.08,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.call,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
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
                          InkWell(
                            onTap: () async {
                              String email = 'info@pswellness.in';
                              String subject = 'This is a test email';
                              String body = 'This is a test email body';

                              String emailUrl =
                                  "mailto:$email?subject=$subject&body=$body";

                              if (await canLaunch(emailUrl)) {
                                await launch(emailUrl);
                              } else {
                                throw "Error occured sending an email";
                              }

                              //_launchUrl2();
                            },
                            child: Row(
                              children: [
                                //_launchUrl2
                                Text(
                                  ' info@pswellness.in',
                                  style: GoogleFonts.poppins(
                                    color: MyTheme.blueww,
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.white30,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            'Website: ',
                            style: GoogleFonts.poppins(
                              color: MyTheme.blueww,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w600,
                              //decoration: TextDecoration.underline,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //_launchUrl();
                              Get.to(WebViewPswebsite());
                              print("clickios");
                            },
                            child: Row(
                              children: [
                                Text(
                                  'www.pswellness.in',
                                  style: GoogleFonts.poppins(
                                    color: MyTheme.blueww,
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.white30,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
