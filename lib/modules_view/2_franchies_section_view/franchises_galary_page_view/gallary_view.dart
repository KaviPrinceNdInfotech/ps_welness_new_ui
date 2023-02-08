import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_galary_page_view/galary_components/credentials.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/franchises_galary_page_view/galary_components/credentials.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/profile_page_view/profile_components/credentials.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/profile_page_view/profile_components/head_text.dart';

class FranchisesgalaryPage extends StatelessWidget {
  const FranchisesgalaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: MyTheme.ThemeColors,
        //   elevation: 0,
        //   title: Text('Update Profile'),
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size.height * 0.0,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  right: -size.width * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.3,
                      width: size.width * 0.75,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/galary.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.03),
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
                                color: Colors.white70,
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
                            'Add Gallery',
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
                    //FranchisesGallaryHeadText(),
                    franchiesGalarryCredentials(),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: size.width * 0.08,
                    //       vertical: size.height * 0.003),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         'Image Name',
                    //         style: GoogleFonts.roboto(
                    //           backgroundColor: Colors.white70,
                    //           fontSize: size.width * 0.04,
                    //           fontWeight: FontWeight.w400,
                    //           color: MyTheme.blueww,
                    //         ),
                    //       ),
                    //       Text(
                    //         'Image',
                    //         style: GoogleFonts.roboto(
                    //           backgroundColor: Colors.white70,
                    //           fontSize: size.width * 0.04,
                    //           fontWeight: FontWeight.w400,
                    //           color: MyTheme.blueww,
                    //         ),
                    //       ),
                    //       Text(
                    //         'Action',
                    //         style: GoogleFonts.roboto(
                    //           backgroundColor: Colors.white70,
                    //           fontSize: size.width * 0.04,
                    //           fontWeight: FontWeight.w400,
                    //           color: MyTheme.blueww,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: size.height * 0.0,
                    // ),

                    SizedBox(
                        height: size.height * 0.7,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.0005),
                                child: Container(
                                  height: size.height * 0.25,
                                  margin:
                                      EdgeInsets.symmetric(vertical: 30 / 5),
                                  decoration: BoxDecoration(
                                    // image: DecorationImage(
                                    //     image: NetworkImage(
                                    //         'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                    //     fit: BoxFit.fill),
                                    //color: MyTheme.containercolor8,
                                    borderRadius: BorderRadius.circular(20),

                                    // gradient: LinearGradient(
                                    //     begin: Alignment.centerLeft,
                                    //     end: Alignment.centerRight,
                                    //     colors: [
                                    //       lightPrimary,
                                    //       darkPrimary,
                                    //     ]),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-0, -0),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.pink.shade900,

                                        // color: darkShadow1,
                                      ),
                                      BoxShadow(
                                        offset: Offset(3, 3),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.pink.shade800,
                                      ),
                                    ],
                                    // image: DecorationImage(
                                    //     image: NetworkImage(
                                    //         'https://images.unsplash.com/photo-1626624340240-aadc087844fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Ymx1ciUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                    //     fit: BoxFit.cover)
                                  ),
                                  child: Container(
                                    height: size.height * 0.24,
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(
                                        vertical: size.width * 0.0 / 05),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xffffffff),
                                              Color(0xffF0FFF0)
                                              //darkPrimary,
                                            ]),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(-0, -0),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: Colors.green.shade200,
                                          ),
                                          BoxShadow(
                                            offset: Offset(3, 3),
                                            spreadRadius: 2,
                                            blurRadius: 0,
                                            color: Colors.blue.shade700,
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.01),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: size.height * 0.22,
                                            width: size.width * 0.6,
                                            padding: EdgeInsets.all(8),

                                            child: Center(
                                              child: Text(
                                                '',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.050,
                                                  fontWeight: FontWeight.w600,
                                                  color: MyTheme.blueww,
                                                ),
                                              ),
                                            ),
                                            // Image.asset(
                                            //   'lib/assets/icons/user.png',
                                            //   // "lib/assets/image/icons8-hospital-64.png",
                                            // ),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      'https://images.unsplash.com/photo-1538438253612-287c9fc9217e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQyfHxiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                                    ),
                                                    fit: BoxFit.cover),
                                                boxShadow: [
                                                  const BoxShadow(
                                                    color: Colors.black38,
                                                    // Color(0xFFBEBEBE),
                                                    offset: Offset(3, 3),
                                                    blurRadius: 0,
                                                    spreadRadius: 0,
                                                  ),
                                                  const BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(-1, -1),
                                                    blurRadius: 1,
                                                    spreadRadius: 1,
                                                  ),
                                                ]),
                                          ),
                                          // Spacer(),
                                          // Column(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   children: [
                                          //     Text(
                                          //       'Driver Name:',
                                          //       style: GoogleFonts.roboto(
                                          //         fontSize: size.width * 0.03,
                                          //         fontWeight: FontWeight.w500,
                                          //         color: MyTheme.blueww,
                                          //       ),
                                          //     ),
                                          //     SizedBox(
                                          //       height: size.height * 0.02,
                                          //     ),
                                          //     Container(
                                          //       height: size.height * 0.05,
                                          //       width: size.width * 0.37,
                                          //       padding: EdgeInsets.all(2),
                                          //       child: Center(
                                          //         child: Text(
                                          //           'Ram Kumar',
                                          //           overflow:
                                          //               TextOverflow.ellipsis,
                                          //           maxLines: 2,
                                          //           style: GoogleFonts.roboto(
                                          //             fontSize:
                                          //                 size.width * 0.033,
                                          //             fontWeight:
                                          //                 FontWeight.w600,
                                          //             color:
                                          //                 MyTheme.ThemeColors,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //       // Image.asset(
                                          //       //   'lib/assets/icons/user.png',
                                          //       //   // "lib/assets/image/icons8-hospital-64.png",
                                          //       // ),
                                          //       decoration: BoxDecoration(
                                          //           color: Colors.grey[300],
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   10),
                                          //           boxShadow: [
                                          //             const BoxShadow(
                                          //               color: Colors.black38,
                                          //               // Color(0xFFBEBEBE),
                                          //               offset: Offset(3, 3),
                                          //               blurRadius: 0,
                                          //               spreadRadius: 0,
                                          //             ),
                                          //             const BoxShadow(
                                          //               color: Colors.white,
                                          //               offset:
                                          //                   Offset(-1, -1),
                                          //               blurRadius: 1,
                                          //               spreadRadius: 1,
                                          //             ),
                                          //           ]),
                                          //     ),
                                          //   ],
                                          // ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                height: size.height * 0.11,
                                                width: size.width * 0.3,
                                                padding: EdgeInsets.all(3),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Image Name:',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: GoogleFonts.roboto(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: MyTheme.blueww,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          size.height * 0.01,
                                                    ),
                                                    // Spacer(),
                                                    Text(
                                                      'Inaugration  Ceremoneydas',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      style: GoogleFonts.roboto(
                                                        fontSize:
                                                            size.width * 0.033,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors
                                                            .grey.shade900,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // Image.asset(
                                                //   'lib/assets/icons/user.png',
                                                //   // "lib/assets/image/icons8-hospital-64.png",
                                                // ),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      const BoxShadow(
                                                        color: Colors.blue,
                                                        // Color(0xFFBEBEBE),
                                                        offset: Offset(3, 3),
                                                        blurRadius: 0,
                                                        spreadRadius: 0,
                                                      ),
                                                      const BoxShadow(
                                                        color: Colors.white,
                                                        offset: Offset(-1, -1),
                                                        blurRadius: 1,
                                                        spreadRadius: 1,
                                                      ),
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Container(
                                                height: size.height * 0.06,
                                                width: size.width * 0.16,
                                                padding: EdgeInsets.all(2),
                                                child: Center(
                                                  child: Text(
                                                    'Delete',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: GoogleFonts.roboto(
                                                      fontSize:
                                                          size.width * 0.033,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.red,
                                                      //MyTheme.ThemeColors,
                                                    ),
                                                  ),
                                                ),
                                                // Image.asset(
                                                //   'lib/assets/icons/user.png',
                                                //   // "lib/assets/image/icons8-hospital-64.png",
                                                // ),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      const BoxShadow(
                                                        color: Colors.red,
                                                        // Color(0xFFBEBEBE),
                                                        offset: Offset(3, 3),
                                                        blurRadius: 0,
                                                        spreadRadius: 0,
                                                      ),
                                                      const BoxShadow(
                                                        color: Colors.white,
                                                        offset: Offset(-1, -1),
                                                        blurRadius: 1,
                                                        spreadRadius: 1,
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                          // Column(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   children: [
                                          //     Text(
                                          //       'Kumar Prince',
                                          //       style: GoogleFonts.roboto(
                                          //         fontSize: size.width * 0.045,
                                          //         fontWeight: FontWeight.w500,
                                          //         color: MyTheme.blueww,
                                          //       ),
                                          //     ),
                                          //     SizedBox(
                                          //       height: size.height * 0.02,
                                          //     ),
                                          //     Text(
                                          //       '04 Dec, 2022',
                                          //       style: GoogleFonts.roboto(
                                          //         fontSize: size.width * 0.03,
                                          //         fontWeight: FontWeight.w400,
                                          //         color: Colors.grey,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          // Column(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   children: [
                                          //     Text(
                                          //       '₹ 900',
                                          //       style: GoogleFonts.roboto(
                                          //         fontSize: size.width * 0.05,
                                          //         fontWeight: FontWeight.w700,
                                          //         //color: Colors.red,
                                          //       ),
                                          //     ),
                                          //     SizedBox(
                                          //       height: size.height * 0.02,
                                          //     ),
                                          //     Text(
                                          //       'Received',
                                          //       style: GoogleFonts.roboto(
                                          //         fontSize: size.width * 0.03,
                                          //         fontWeight: FontWeight.w500,
                                          //         color: Colors.green,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                    // child: child,
                                  ),
                                ),
                              );
                            })),
                    //HospitalSocial(),
                    //Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
