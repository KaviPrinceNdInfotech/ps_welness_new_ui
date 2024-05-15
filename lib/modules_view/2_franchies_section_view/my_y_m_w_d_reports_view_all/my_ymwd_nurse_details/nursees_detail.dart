import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/my_ymwd_report_controller/my_ymwd_nursesss_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/my_y_m_w_d_reports_view_all/my_ymwd_nurse_details/fr_nurse_components/nurseees_credentials.dart';

class YmwdreportNurses extends StatelessWidget {
  YmwdnursesssController _ymwdnursesssController =
      Get.put(YmwdnursesssController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
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
                top: size.height * 0.015,
                right: -size.width * 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.38,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/n1.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyYmwdreportNursessCredential(),
                  Obx(() => _ymwdnursesssController.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : _ymwdnursesssController.data.value.isEmpty
                          ? Center(child: Text('No List'))
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _ymwdnursesssController.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = _ymwdnursesssController.data;
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.0005),
                                  child: Container(
                                    height: size.height * 0.25,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 30 / 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(-0, -0),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          color: Colors.pink.shade900,
                                        ),
                                        BoxShadow(
                                          offset: Offset(3, 3),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          color: Colors.pink.shade800,
                                        ),
                                      ],
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1614854262318-831574f15f1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Container(
                                      height: size.height * 0.27,
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(
                                          vertical: size.width * 0.0 / 05),
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color(0xffffffff),
                                                Color(0xffF0FFF0)
                                              ]),
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://images.unsplash.com/photo-1614854262318-831574f15f1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(-0, -0),
                                              spreadRadius: 0,
                                              blurRadius: 0,
                                              color: Colors.red.shade200,
                                            ),
                                            BoxShadow(
                                              offset: Offset(3, 3),
                                              spreadRadius: 2,
                                              blurRadius: 0,
                                              color: Colors.green.shade100,
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
                                              height: size.height * 0.27,
                                              width: size.width * 0.92,
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[900],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  // image: const DecorationImage(
                                                  //     image: NetworkImage(
                                                  //         'https://images.unsplash.com/photo-1614854262318-831574f15f1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                                                  //     fit: BoxFit.cover),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      offset: Offset(3, 3),
                                                      blurRadius: 0,
                                                      spreadRadius: 0,
                                                    ),
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      offset: Offset(-1, -1),
                                                      blurRadius: 1,
                                                      spreadRadius: 1,
                                                    ),
                                                  ]),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Nurse Id:',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.033,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Nurse Name:',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.033,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Nurse Type:',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.033,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   'Franchise:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.red,
                                                      //   ),
                                                      // ),
                                                      ///
                                                      // Text(
                                                      //   'Mobile No:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.red,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   'Email:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.red,
                                                      //   ),
                                                      // ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.04,
                                                        child: Text(
                                                          'Address:',
                                                          style:
                                                              GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.033,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Total Amt:',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.033,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   'Certificate:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.red,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   'Approval:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.red,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   'Action:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.red,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${item?[index].nurseId}',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${item?[index].nurseName}',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white,
                                                          // .brown.shade600,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${item?[index].nurseTypeName}',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white,
                                                          //.brown.shade600,
                                                        ),
                                                      ),
                                                      // Text('${item?[index].franchise}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.white,
                                                      //     //.brown.shade600,
                                                      //   ),
                                                      // ),
                                                      // Text('${item?[index].mobileNumber}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.white,
                                                      //     //.brown.shade600,
                                                      //   ),
                                                      // ),
                                                      // Text('${item?[index].emailId}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.white,
                                                      //     //.brown.shade600,
                                                      //   ),
                                                      // ),
                                                      SizedBox(
                                                        width: size.width * 0.6,
                                                        height:
                                                            size.height * 0.036,
                                                        child: Text(
                                                          '${item?[index].location}',
                                                          maxLines: 2,
                                                          style:
                                                              GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.034,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        //"dynamic amt required",
                                                        '₹${item?[index].totalAmount}',
                                                        style: GoogleFonts.lato(
                                                          fontSize:
                                                              size.width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      // Text('${item?[index].certificateNumber}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize: size.width * 0.03,
                                                      //     fontWeight: FontWeight.w700,
                                                      //     color: Colors.white,
                                                      //   ),
                                                      // ),
                                                      // Text('${item?[index].isApproved}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize: size.width * 0.03,
                                                      //     fontWeight: FontWeight.w700,
                                                      //     color: Colors.green.shade200,
                                                      //   ),
                                                      // ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
