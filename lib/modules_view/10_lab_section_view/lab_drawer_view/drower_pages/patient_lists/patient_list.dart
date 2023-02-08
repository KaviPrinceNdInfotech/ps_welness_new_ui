import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';

class PatientList extends StatelessWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // backgroundColor: MyTheme.ThemeColors,
        // appBar: AppBar(
        //   centerTitle: true,
        //   elevation: 0,
        //   title: Text('Patient List'),
        //   backgroundColor: MyTheme.ThemeColors,
        // ),
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -size.height * 0.15,
                //bottom: size.height * 0.64,
                //left: -30,
                right: -size.width * 0.006,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.28,
                    width: size.width * 0.69,
                    decoration: BoxDecoration(
                        //color: Colors.,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/user_assets/patient11.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.01),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: size.height * 0.026,
                            color: MyTheme.blueww,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'Patient Lists',
                          style: GoogleFonts.alatsi(
                              fontSize: size.height * 0.032,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff023382)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                      height: size.height * 0.8,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.0005),
                                  child: Container(
                                    height: size.height * 0.25,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 30 / 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            lightPrimary2,
                                            darkPrimary2,
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(-0, -0),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          color: Colors.red.shade300,

                                          // color: darkShadow1,
                                        ),
                                        BoxShadow(
                                          offset: Offset(4, 4),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          color: Colors.red.shade300,
                                        ),
                                      ],
                                      // image: DecorationImage(
                                      //     image: NetworkImage(
                                      //         'https://images.unsplash.com/photo-1626624340240-aadc087844fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Ymx1ciUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                      //     fit: BoxFit.cover)
                                    ),
                                    child: Stack(
                                      //clipBehavior: Clip.none,
                                      children: [
                                        Positioned(
                                          top: -60,
                                          left: -125,
                                          child: Container(
                                            height: size.height * 0.39,
                                            width: size.width * 0.77,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              //color: Colors.blueGrey,
                                              gradient: MyTheme.gradient10,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Patient Name:',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Patient Mobile :',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Paid Amount:',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Patient Address:',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Duration:',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Working Shift :',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Kavi Raj',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    '8977889999',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    '₹ 1000',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    'Sector 2, C 53 Noida',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    '2nov,2022 to 23 nov 2022',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    'Night',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })),
                ],
              ),

              // Positioned(
              //   top: 50,
              //   child: Container(
              //     height: size.height * 0.10,
              //     width: size.width * 0.19,
              //     decoration: BoxDecoration(
              //       color: Colors.green,
              //       shape: BoxShape.circle,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
