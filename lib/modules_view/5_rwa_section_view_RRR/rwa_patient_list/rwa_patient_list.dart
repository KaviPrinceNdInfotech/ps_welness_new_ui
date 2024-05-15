import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../controllers/5_rwa_controller_RRR/rwa_patient_list_controller/rwa_patient_list_controller.dart';
//import 'package:ps_welness/constants/my_theme.dart';

//import '../../../controllers/5_rwa_controller/rwa_patient_list_controller/rwa_patient_list_controller.dart';

class RwaPatientList extends StatelessWidget {
  RwaPatientList({Key? key}) : super(key: key);

  RwaPatientListController _rwaPatientListController =
      Get.put(RwaPatientListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => (_rwaPatientListController.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.041,
                        right: -size.width * 0.124,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.26,
                            width: size.width * 0.75,
                            decoration: BoxDecoration(
                                //color: Colors.,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/background_stack_png/rwa_patient_list2.png',
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
                                  'Patient List',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.032,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
                            ),
                          ),
                          //Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.01),
                            child: Container(
                              //height: size.height * 0.02,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(30.0)),
                                  color: Colors.white30),
                              width: size.width,
                              height: size.height * 0.06,
                              margin: new EdgeInsets.fromLTRB(10, 10, 10, 20),
                              padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  onChanged: (value) =>
                                      _rwaPatientListController
                                          .filterpatientrwa(value),
                                  //controller: _rwapaymentController
                                  // .appointmentController,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: MyTheme.blueww),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    filled: true,
                                    fillColor: Colors.white30,
                                    hintText: 'Search Name',
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, bottom: 12.0, top: 6.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white30),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white30),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          _rwaPatientListController.foundPatient.value.isEmpty
                              ? Center(
                                  child: Text("No Data"),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _rwaPatientListController
                                          .foundPatient.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var item = _rwaPatientListController
                                            .foundPatient;
                                        return Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.03,
                                                  vertical:
                                                      size.height * 0.0005),
                                              child: Container(
                                                height: size.height * 0.25,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 30 / 5),
                                                decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                      image: NetworkImage(
                                                          'https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60'),
                                                      fit: BoxFit.fill),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(-0, -0),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color: Colors
                                                          .yellow.shade800,
                                                    ),
                                                    BoxShadow(
                                                      offset: Offset(3, 3),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color: Colors
                                                          .yellow.shade800,
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  //clipBehavior: Clip.none,
                                                  children: [
                                                    Positioned(
                                                      top: -70,
                                                      right: 260,
                                                      child: Container(
                                                        height:
                                                            size.height * 0.2,
                                                        width: size.width * 0.4,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.blueGrey,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: -70,
                                                      left: 260,
                                                      child: Container(
                                                        height:
                                                            size.height * 0.2,
                                                        width: size.width * 0.5,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.blueGrey,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Patient Name:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Mobile No:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  // color: MyTheme.text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'EmailId:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  //color: MyTheme.text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              // Text(
                                                              //   'City:',
                                                              //   style:
                                                              //       GoogleFonts
                                                              //           .poppins(
                                                              //     //color: MyTheme.text1,
                                                              //     fontWeight:
                                                              //         FontWeight
                                                              //             .w600,
                                                              //     fontSize:
                                                              //         size.width *
                                                              //             0.035,
                                                              //   ),
                                                              // ),
                                                              Text(
                                                                'Address:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  //color: MyTheme.text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Pin Code:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  //color: MyTheme.text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${item?[index].patientName}',
                                                                style: GoogleFonts.raleway(
                                                                    color: MyTheme
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.035),
                                                              ),
                                                              Text(
                                                                '${item?[index].mobileNumber}',
                                                                style: GoogleFonts.raleway(
                                                                    color: MyTheme
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.035),
                                                              ),
                                                              Text(
                                                                '${item?[index].emailId}',
                                                                style: GoogleFonts.raleway(
                                                                    color: MyTheme
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.035),
                                                              ),
                                                              // Text(
                                                              //   '${item?[index].cityName}',
                                                              //   style: GoogleFonts.raleway(
                                                              //       color: MyTheme
                                                              //           .white,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w700,
                                                              //       fontSize: size
                                                              //               .width *
                                                              //           0.035),
                                                              // ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.5,
                                                                child: Text(
                                                                  '${item?[index].location}',
                                                                  maxLines: 2,
                                                                  style: GoogleFonts.raleway(
                                                                      color: MyTheme
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                              ),
                                                              Text(
                                                                '${item?[index].pincode}',
                                                                style: GoogleFonts.raleway(
                                                                    color: MyTheme
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.035),
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
                                      }),
                                ),
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
