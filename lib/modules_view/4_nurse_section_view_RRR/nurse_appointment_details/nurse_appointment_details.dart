import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_appointment_detail_controller/nurse_appointment_nurse_detailsss.dart';

//import '../../../controllers/4_nurse_controller_RRR/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';

//import '../../../controllers/4_nurse_controller/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';

class NurseeAppointmentDetail extends StatelessWidget {
  NurseeAppointmentDetail({Key? key}) : super(key: key);

  NurseAppointmentNurseDetailController _nurseappointmentnursedetailController =
      Get.put(NurseAppointmentNurseDetailController());

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
          () => (_nurseappointmentnursedetailController.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.08,
                        right: -size.width * 0.12,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.22,
                            width: size.width * 0.58,
                            decoration: const BoxDecoration(
                                //color: Colors.,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/user_assets/appointment_nurse.png',
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
                                vertical: size.height * 0.012),
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
                                  'Appointment Details',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.029,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  //color: Colors.white,
                                  gradient: MyTheme.gradient7,
                                  //gradient10
                                ),
                                width: size.width * 0.72,
                                height: size.height * 0.06,
                                margin:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 10),
                                padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      splashColor: Colors.transparent),
                                  child: TextField(
                                    // controller: _nurseappointmentnursedetailController
                                    //     .appointmentController,
                                    // onTap: () {
                                    //   _nurseappointmentnursedetailController
                                    //       .chooseDate();
                                    // },
                                    onChanged: (value) =>
                                        _nurseappointmentnursedetailController
                                            .filterAppointNurse(value),

                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 15.0, color: MyTheme.blueww),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Search Name...',
                                      contentPadding: const EdgeInsets.only(
                                          left: 10.0, bottom: 12.0, top: 6.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.075,
                                width: size.width * 0.2,
                                decoration: BoxDecoration(
                                  //color: Colors.white30,
                                  //gradient: MyTheme.gradient10,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Lottie.asset(
                                  'lib/assets/image/70361-searching.zip',
                                  width: 400,
                                  height: 400,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.0,
                          ),
                          _nurseappointmentnursedetailController
                                  .foundAppointmentnurse.value.isEmpty
                              ? Center(child: Text('No List'))
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          _nurseappointmentnursedetailController
                                              .nurseappointmentdetail
                                              ?.result
                                              ?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final item =
                                            _nurseappointmentnursedetailController
                                                .nurseappointmentdetail?.result;
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
                                                        vertical: 30 / 6),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient:
                                                      const LinearGradient(
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
                                                      color:
                                                          Colors.red.shade300,
                                                    ),
                                                    BoxShadow(
                                                      offset: Offset(4, 4),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color:
                                                          Colors.red.shade300,
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  //clipBehavior: Clip.none,
                                                  children: [
                                                    Positioned(
                                                      top: -60,
                                                      left: -125,
                                                      child: Material(
                                                        shadowColor:
                                                            Colors.transparent,
                                                        color:
                                                            Colors.transparent,
                                                        // color: Colors.tra
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(900),
                                                        //shape: BoxShape.circle,
                                                        elevation: 10,

                                                        //borderRadius

                                                        //shape: BoxShape.circle,
                                                        child: Container(
                                                          height: size.height *
                                                              0.39,
                                                          width:
                                                              size.width * 0.77,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            //borderRadius: BorderRadius.circular(100),
                                                            //color: Colors.blueGrey,
                                                            gradient: MyTheme
                                                                .gradient81,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
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
                                                                style:
                                                                    GoogleFonts
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
                                                                style:
                                                                    GoogleFonts
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
                                                                style:
                                                                    GoogleFonts
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
                                                                style:
                                                                    GoogleFonts
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
                                                                'Working Shift :',
                                                                style:
                                                                    GoogleFonts
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
                                                          SizedBox(
                                                            // height:
                                                            //     size.height *
                                                            //         0.03,
                                                            width: size.width *
                                                                0.45,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  //"${_nurseappointmentdetailController.nurseappointmentdetail!.result![index].contactNumber}.toString()"
                                                                  '${item?[index]?.patientName}'
                                                                      .toString(),

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
                                                                  '${item?[index].contactNumber}',
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
                                                                  '₹ ${'${item?[index].totalFee}'}'
                                                                      .toString(),
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
                                                                  '${item?[index]}',
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
                                                                  '${item?[index].paymentDate}',
                                                                  // '20 dec 2023-28 jan 2023',
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
                                                                  '24 hours',
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
                                                              ],
                                                            ),
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
                          //),
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
