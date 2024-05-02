import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/my_ymwd_report_controller/my_ymwd_chemistsss_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/my_y_m_w_d_reports_view_all/my_ymwd_chemist_details/fr_chemist_components/chemist_credentials.dart';

class YmwdreportChemist extends StatelessWidget {
  YmwdchemisttController _ymwdchemisttController = Get.put(YmwdchemisttController());
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
                right: -size.width * 0.01,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.17,
                    width: size.width * 0.32,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/chemist.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyYmwdreportchemisttCredential(),
                  Obx(()=> _ymwdchemisttController.isLoading.value
                      ? const Center(child: CircularProgressIndicator(),)
                      : _ymwdchemisttController.data.value.isEmpty
                      ? Center(child: Text('No List'))
                    : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _ymwdchemisttController.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = _ymwdchemisttController.data;
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.0005),
                                child: Container(
                                  height: size.height * 0.25,
                                  margin: const EdgeInsets.symmetric(vertical: 30 / 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-0, -0),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.pink.shade200,
                                      ),
                                      BoxShadow(
                                        offset: Offset(3, 3),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.pink.shade200,
                                      ),
                                    ],
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                          'https://images.unsplash.com/photo-1589691962030-8d2b7f2a1ffe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                                        ),
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
                                              'https://images.unsplash.com/photo-1589691962030-8d2b7f2a1ffe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(12),
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
                                            color: Colors.yellow.shade200,
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
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                      'https://images.unsplash.com/photo-1589691962030-8d2b7f2a1ffe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                                                    ),
                                                    fit: BoxFit.cover),
                                                boxShadow: const[
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
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Chemist Id:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Chemist Name:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   'Franchise/Id:',
                                                    //   style: GoogleFonts.lato(
                                                    //     fontSize:
                                                    //         size.width * 0.03,
                                                    //     fontWeight:
                                                    //         FontWeight.w700,
                                                    //     color: Colors.white,
                                                    //   ),
                                                    // ),
                                                    Text(
                                                      'Shop Name:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   'Mobile No:',
                                                    //   style: GoogleFonts.lato(
                                                    //     fontSize:
                                                    //         size.width * 0.03,
                                                    //     fontWeight:
                                                    //         FontWeight.w700,
                                                    //     color: Colors.white,
                                                    //   ),
                                                    // ),
                                                    // Text(
                                                    //   'Email:',
                                                    //   style: GoogleFonts.lato(
                                                    //     fontSize:
                                                    //         size.width * 0.03,
                                                    //     fontWeight:
                                                    //         FontWeight.w700,
                                                    //     color: Colors.white,
                                                    //   ),
                                                    // ),
                                                    Text(
                                                      'Address:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      'GST No:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Licence No:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white,
                                                      ),
                                                    ),

                                                    Text(
                                                      'Total Amt:',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                        size.width * 0.03,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   'Approval:',
                                                    //   style: GoogleFonts.lato(
                                                    //     fontSize:
                                                    //         size.width * 0.03,
                                                    //     fontWeight:
                                                    //         FontWeight.w700,
                                                    //     color: Colors.white,
                                                    //   ),
                                                    // ),
                                                    // Text(
                                                    //   'Action:',
                                                    //   style: GoogleFonts.lato(
                                                    //     fontSize:
                                                    //         size.width * 0.03,
                                                    //     fontWeight:
                                                    //         FontWeight.w700,
                                                    //     color: Colors.white,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('${item?[index].chemistId}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text('${item?[index].chemistName}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    // Text('${item?[index].franchise}',
                                                    //   style: GoogleFonts.lato(
                                                    //     fontSize:
                                                    //         size.width * 0.03,
                                                    //     fontWeight:
                                                    //         FontWeight.w700,
                                                    //     color: Colors.black,
                                                    //   ),
                                                    // ),
                                                    Text('${item?[index].shopName}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    // Text('${item?[index].mobileNumber}',
                                                    //   style: GoogleFonts.lato(
                                                    //     fontSize:
                                                    //         size.width * 0.03,
                                                    //     fontWeight:
                                                    //         FontWeight.w700,
                                                    //     color: Colors.black,
                                                    //   ),
                                                    // ),
                                                    // Text('${item?[index].emailId}',
                                                    //   style: GoogleFonts.lato(
                                                    //     fontSize:
                                                    //         size.width * 0.03,
                                                    //     fontWeight:
                                                    //         FontWeight.w700,
                                                    //     color: Colors.black,
                                                    //   ),
                                                    // ),
                                                    Text('${item?[index].location}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text('${item?[index].gstNumber}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text('${item?[index].licenceNumber}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                            size.width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Dynamic Amt required',
                                                     // '${item?[index].licenceNumber}',
                                                      style: GoogleFonts.lato(
                                                        fontSize:
                                                        size.width * 0.03,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    // Text('${item?[index].isApproved}',
                                                    //   style: GoogleFonts.lato(
                                                    //     fontSize:
                                                    //         size.width * 0.03,
                                                    //     fontWeight:
                                                    //         FontWeight.w700,
                                                    //     color:
                                                    //         Colors.green.shade900,
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
                            })
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
