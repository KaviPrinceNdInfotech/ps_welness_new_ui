import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/my_ymwd_report_controller/my_ymwd_lab_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/my_y_m_w_d_reports_view_all/my_ymwd_lab_details/fr_lab_components/labss_credentials.dart';

class YmwdreportLab extends StatelessWidget {
  YmwdlabbbController _ymwdlabbbController = Get.put(YmwdlabbbController());

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
                top: size.height * 0.01,
                right: -size.width * 0.03,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.18,
                    width: size.width * 0.58,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/frlab1.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyYmwdreportlabbCredential(),
                  Obx(() => _ymwdlabbbController.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : _ymwdlabbbController.data.value.isEmpty
                          ? Center(child: Text('No List'))
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _ymwdlabbbController.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = _ymwdlabbbController.data;
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.0005),
                                  child: Container(
                                    height: size.height * 0.25,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 30 / 5),
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
                                              'https://images.unsplash.com/photo-1464618663641-bbdd760ae84a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Container(
                                      height: size.height * 0.3,
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
                                                //darkPrimary,
                                              ]),
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://images.unsplash.com/photo-1464618663641-bbdd760ae84a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
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
                                              color: Colors.blue.shade400,
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
                                              height: size.height * 0.3,
                                              width: size.width * 0.92,
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[900],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: const DecorationImage(
                                                      image: NetworkImage(
                                                          'https://images.unsplash.com/photo-1464618663641-bbdd760ae84a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
                                                      fit: BoxFit.cover),
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
                                                        'Lab Id:',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Lab Name:',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   'Landline no:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.black,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   'Mobile No:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.black,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   'Email:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.black,
                                                      //   ),
                                                      // ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.036,
                                                        child: Text(
                                                          'Address:',
                                                          style:
                                                              GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Licence:',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   'GST No:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.black,
                                                      //   ),
                                                      // ),
                                                      Text(
                                                        'Total Amt:',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   'Aadhaar:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.black,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   'Approval:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.black,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   'Action:',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors.black,
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
                                                        '${item?[index].lAbId}',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .brown.shade800,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${item?[index].labName}',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .brown.shade800,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   '${item?[index].phoneNumber}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors
                                                      //         .brown.shade600,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   '${item?[index].mobileNumber}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors
                                                      //         .brown.shade600,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   '${item?[index].emailId}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors
                                                      //         .brown.shade600,
                                                      //   ),
                                                      // ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.036,
                                                        width: size.width * 0.6,
                                                        child: Text(
                                                          '${item?[index].location}',
                                                          maxLines: 2,
                                                          style:
                                                              GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors
                                                                .brown.shade800,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${item?[index].licenceNumber}',
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .brown.shade800,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   '${item?[index].gstNumber}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors
                                                      //         .brown.shade600,
                                                      //   ),
                                                      // ),
                                                      Text(
                                                        //'Dynamic Amount required ',
                                                        '₹${item?[index].totalAmount ?? 00}',
                                                        //,
                                                        style: GoogleFonts.lato(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .brown.shade800,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   '${item?[index].aadharNumber}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors
                                                      //         .brown.shade600,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   '${item?[index].isApproved}',
                                                      //   style: GoogleFonts.lato(
                                                      //     fontSize:
                                                      //         size.width * 0.03,
                                                      //     fontWeight:
                                                      //         FontWeight.w700,
                                                      //     color: Colors
                                                      //         .green.shade900,
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
