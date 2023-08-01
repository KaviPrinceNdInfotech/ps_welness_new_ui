import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_home/lab_home_page.dart';

import '../../../controllers/10_lab_controller/lab_appointment_history_controllerrs/lab_appointments_history_controllers.dart';

//import '../../../controllers/10_lab_controller/lab_appointment_controller/nurse_appointment_controller.dart';

class LabAppointmentHistory extends StatelessWidget {
  LabAppointmentHistory({Key? key}) : super(key: key);

  // LabAppointmentController _labappointmentController =
  //     Get.put(LabAppointmentController());

  LabAppointmentHistoryyController _labAppointmentHistoryyController =
      Get.put(LabAppointmentHistoryyController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        //Get.offAll(LabHomePage());
        //Get.offAll(() => LabHomePage());
        Get.to(() => LabHomePage());
        return shouldPop;
      },
      child: Container(
        color: MyTheme.ThemeColors,
        height: size.height,
        width: size.width,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Obx(
            () => (_labAppointmentHistoryyController.isLoading.value)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: size.height * 0.04,
                          //bottom: size.height * 0.64,
                          //left: -30,
                          right: -size.width * 0.1,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: size.height * 0.25,
                              width: size.width * 0.65,
                              decoration: BoxDecoration(
                                  //color: Colors.,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'lib/assets/background_stack_png/lab1.png',
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
                                    'Booking Lab History',
                                    style: GoogleFonts.alatsi(
                                        fontSize: size.height * 0.032,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff023382)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(30.0)),
                                  color: Colors.white),
                              width: size.width * 0.9,
                              height: size.height * 0.06,
                              margin: new EdgeInsets.fromLTRB(20, 20, 20, 20),
                              padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  onChanged: (value) =>
                                      _labAppointmentHistoryyController
                                          .filterappinthispatient(value),
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: MyTheme.blueww),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Search Patient..',
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, bottom: 12.0, top: 6.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: size.height * 0.01,
                            // ),
                            _labAppointmentHistoryyController
                                    .foundpatienthistorylab.value.isEmpty
                                ? Center(
                                    child: Text("No List"),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            _labAppointmentHistoryyController
                                                .foundpatienthistorylab.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * 0.03,
                                                    vertical:
                                                        size.height * 0.0005),
                                                child: Container(
                                                  height: size.height * 0.25,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 30 / 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                        colors: [
                                                          lightPrimary2,
                                                          darkPrimary2,
                                                        ]),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: Offset(-0, -0),
                                                        spreadRadius: 0,
                                                        blurRadius: 0,
                                                        color: Colors
                                                            .yellow.shade300,

                                                        // color: darkShadow1,
                                                      ),
                                                      BoxShadow(
                                                        offset: Offset(4, 4),
                                                        spreadRadius: 0,
                                                        blurRadius: 0,
                                                        color: Colors
                                                            .yellow.shade300,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Stack(
                                                    //clipBehavior: Clip.none,
                                                    children: [
                                                      Positioned(
                                                        top: -60,
                                                        left: -125,
                                                        child: Container(
                                                          height: size.height *
                                                              0.39,
                                                          width:
                                                              size.width * 0.77,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            //color: Colors.blueGrey,
                                                            gradient: MyTheme
                                                                .gradient3,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
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
                                                                    color: MyTheme
                                                                        .text1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        size.width *
                                                                            0.035,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Patient Mobile :',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    color: MyTheme
                                                                        .text1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        size.width *
                                                                            0.035,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Paid Amount:',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    color: MyTheme
                                                                        .text1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        size.width *
                                                                            0.035,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Patient Address:',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    color: MyTheme
                                                                        .text1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        size.width *
                                                                            0.035,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Duration:',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    color: MyTheme
                                                                        .text1,
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
                                                                  '${_labAppointmentHistoryyController.foundpatienthistorylab[index].patientName}'
                                                                  // 'Vishal Mishra',
                                                                  ,
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade800,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                                Text(
                                                                  '${_labAppointmentHistoryyController.foundpatienthistorylab[index].mobileNumber}'
                                                                  //,'9987341967',
                                                                  ,
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade800,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                                Text(
                                                                  '${_labAppointmentHistoryyController.foundpatienthistorylab[index].amount}'
                                                                  //'1000',
                                                                  ,
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade800,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.6,
                                                                  child: Text(
                                                                    '${_labAppointmentHistoryyController.foundpatienthistorylab[index].location}'
                                                                    //'uu'
                                                                    //_labappointmentController.labHistorybylabIdList!.testList[index].patientAddress.toString()
                                                                    ,
                                                                    style: GoogleFonts.raleway(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade800,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            size.width *
                                                                                0.035),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.55,
                                                                  child: Text(
                                                                    '${_labAppointmentHistoryyController.foundpatienthistorylab[index].slotTime}'
                                                                    //'22 nov 2022-02 dec 2022',
                                                                    ,
                                                                    style: GoogleFonts.raleway(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade800,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            size.width *
                                                                                0.03),
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
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
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
        ),
      ),
    );
  }
}
