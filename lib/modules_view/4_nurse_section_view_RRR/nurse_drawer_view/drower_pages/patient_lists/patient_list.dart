import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

//import 'package:ps_welness_new_ui/controllers/4_nurse_controller/nurse_patientlist_controller.dart';

import '../../../../../controllers/4_nurse_controller_RRR/nurse_patientlist_controller.dart';

class PatientListNurse extends StatelessWidget {
  PatientListNurse({Key? key}) : super(key: key);
  // PatientListController _patientListController = Get.put(PatientListController());
  NursePatientListController _nursePatientListController =
      Get.put(NursePatientListController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -size.height * 0.15,
                right: -size.width * 0.006,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.28,
                    width: size.width * 0.69,
                    decoration: const BoxDecoration(
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
                    height: size.height * 0.08,
                  ),
                  Obx(
                    () => (_nursePatientListController.isLoading.value)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: size.height * 0.8,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: _nursePatientListController
                                    .getNursePatientList?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var item = _nursePatientListController
                                      .getNursePatientList;
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.03,
                                            vertical: size.height * 0.0005),
                                        child: Container(
                                          height: size.height * 0.25,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 30 / 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient: const LinearGradient(
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
                                              ),
                                              BoxShadow(
                                                offset: Offset(4, 4),
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                color: Colors.red.shade300,
                                              ),
                                            ],
                                          ),
                                          child: Stack(
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
                                                    gradient:
                                                        MyTheme.gradient10,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.text1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Patient Mobile :',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.text1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Paid Amount:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.text1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Patient Address:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.text1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                          ),
                                                        ),
                                                        Text(
                                                          'StartSlotTime:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.text1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                          ),
                                                        ),
                                                        Text(
                                                          'EndSlotTime:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.text1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Working Shift :',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.text1,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                        ),
                                                        Text(
                                                          '${item?[index].mobileNumber}',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                        ),
                                                        Text(
                                                          '₹ ${'${item?[index].amount}'}',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                        ),
                                                        Text(
                                                          '${item?[index].location}',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                        ),
                                                        Text(
                                                          '${item?[index].startSlotTime}',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                        ),
                                                        Text(
                                                          '${item?[index].endSlotTime}',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                        ),
                                                        Text(
                                                          '${item?[index].workingShift}',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
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
                                })),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
