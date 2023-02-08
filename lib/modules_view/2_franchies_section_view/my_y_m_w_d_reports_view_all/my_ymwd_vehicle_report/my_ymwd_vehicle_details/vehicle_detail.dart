import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/my_y_m_w_d_reports_view_all/my_ymwd_vehicle_report/my_ymwd_vehicle_details/fr_vich_components3/credentials.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/my_y_m_w_d_reports_view_all/my_ymwd_vehicle_report/my_ymwd_vehicle_details/fr_vich_components3/credentials.dart';

//import 'fr_doc_components3/credentials.dart';

//import 'package:ps_welness/modules_view/lab_center/lab_signup2/lab_components2/credentials.dart';
//import 'package:ps_welness/modules_view/lab_center/lab_signup2/lab_components2/head_text.dart';

class Ymwdreportvehicle extends StatelessWidget {
  const Ymwdreportvehicle({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: size.height * 0.01,
                //bottom: size.height * 0.64,
                //left: -30,
                right: -size.width * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.18,
                    width: size.width * 0.58,
                    decoration: BoxDecoration(
                        //color: Colors.,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/vehicle.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // YmwdDoc3HeadText(),
                  MyYmwdreportVehicleeCredential(),
                  SizedBox(
                      height: size.height * 0.77,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 12,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.0005),
                              child: Container(
                                height: size.height * 0.25,
                                margin: EdgeInsets.symmetric(vertical: 30 / 5),
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
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'https://images.unsplash.com/photo-1516641051054-9df6a1aad654?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXxqV19HS251RzZOOHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                        //'https://images.unsplash.com/photo-1626668893632-6f3a4466d22f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwzNDgxNTl8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60'
                                        //'https://images.unsplash.com/photo-1543157145-f78c636d023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'
                                        ,
                                      ),
                                      fit: BoxFit.cover),
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
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1516641051054-9df6a1aad654?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXxqV19HS251RzZOOHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                            //'https://images.unsplash.com/photo-1626668893632-6f3a4466d22f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwzNDgxNTl8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60'
                                            //'https://images.unsplash.com/photo-1543157145-f78c636d023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'
                                            ,
                                          ),
                                          fit: BoxFit.cover),
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
                                          color: Colors.yellow.shade500,
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
                                          height: size.height * 0.23,
                                          width: size.width * 0.91,
                                          padding: EdgeInsets.all(8),
                                          // Image.asset(
                                          //   'lib/assets/icons/user.png',
                                          //   // "lib/assets/image/icons8-hospital-64.png",
                                          // ),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    'https://images.unsplash.com/photo-1516641051054-9df6a1aad654?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXxqV19HS251RzZOOHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'
                                                    //'https://images.unsplash.com/photo-1626668893632-6f3a4466d22f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwzNDgxNTl8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60'
                                                    // 'https://images.unsplash.com/photo-1543157145-f78c636d023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'
                                                    ,
                                                  ),
                                                  fit: BoxFit.cover),
                                              boxShadow: [
                                                const BoxShadow(
                                                  color: Colors.black38,
                                                  // Color(0xFFBEBEBE),
                                                  offset: Offset(3, 3),
                                                  blurRadius: 0,
                                                  spreadRadius: 1,
                                                ),
                                                const BoxShadow(
                                                  //color: Colors.white,
                                                  offset: Offset(-0, -0),
                                                  blurRadius: 0,
                                                  spreadRadius: 1,
                                                ),
                                              ]),

                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Srl no:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.red.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Vehicle No:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.red.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Ownership Name:',
                                                    style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors
                                                            .red.shade900),
                                                  ),
                                                  Text(
                                                    'Franchise:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.red.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Vehicle Type:',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.red.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Vehicle Category',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.red.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Driver Charges',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.red.shade900,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '40',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.036,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'RR 79 U 1298',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.036,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Ram ambulance Service',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.036,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Kavi Singh Bhat/FR02',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.036,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Normal',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.036,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Basic Life Support Ambulance',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.036,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    '800',
                                                    style: GoogleFonts.lato(
                                                      fontSize:
                                                          size.width * 0.036,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
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
    );
  }
}
