import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_booking_history_controller.dart';

//import '../../../controllers/10_lab_controller/lab_appointment_controller/nurse_appointment_controller.dart';

class DriverOrderHistory extends StatelessWidget {
  DriverOrderHistory({Key? key}) : super(key: key);

  //DriverOrderController _driverOrderController =
  // Get.put(DriverOrderController());
  DriverBookingHistoryController _driverBookingHistoryController =
      Get.put(DriverBookingHistoryController());

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
            child: Obx(
          () => _driverBookingHistoryController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -size.height * 0.09,
                      right: -size.width * 0.04,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: size.height * 0.3,
                          width: size.width * 0.45,
                          decoration: const BoxDecoration(
                              //color: Colors.,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'lib/assets/background_stack_png/driver002.png',
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
                                'Driver\'s Booking History',
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
                                  _driverBookingHistoryController
                                      .filterdriverhistory(value),
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: MyTheme.blueww),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search patient-name',
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, bottom: 12.0, top: 6.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                        _driverBookingHistoryController
                                .foundhistorydriver.value.isEmpty
                            ? Center(
                                child: Text("No List"),
                              )
                            : Expanded(
                                child: SizedBox(
                                    //height: size.height * 0.77,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            _driverBookingHistoryController
                                                .foundhistorydriver.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final item =
                                              _driverBookingHistoryController
                                                  .foundhistorydriver;
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.03,
                                                vertical: size.height * 0.0005),
                                            child: Container(
                                              height: size.height * 0.32,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 30 / 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: const LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      lightPrimary1,
                                                      darkPrimary,
                                                    ]),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(-0, -0),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: Colors.cyan.shade300,

                                                    // color: darkShadow1,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(4, 4),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: Colors.cyan.shade300,
                                                  ),
                                                ],
                                              ),
                                              child: Stack(
                                                //clipBehavior: Clip.none,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                size.height *
                                                                    0.01,
                                                            horizontal:
                                                                size.width *
                                                                    0.02),
                                                    child: Material(
                                                      elevation: 6,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                      ),
                                                      child: Container(
                                                        width:
                                                            size.width * 0.35,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                          gradient:
                                                              MyTheme.gradient5,
                                                        ),
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
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .blueww,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035,
                                                              ),
                                                            ),
                                                            // Text(
                                                            //   'Driver Mobile :',
                                                            //   style: GoogleFonts
                                                            //       .poppins(
                                                            //     color:
                                                            //         MyTheme.blueww,
                                                            //     fontWeight:
                                                            //         FontWeight.w600,
                                                            //     fontSize:
                                                            //         size.width *
                                                            //             0.035,
                                                            //   ),
                                                            // ),
                                                            Text(
                                                              'State :',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .blueww,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035,
                                                              ),
                                                            ),
                                                            Text(
                                                              'City :',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .blueww,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035,
                                                              ),
                                                            ),
                                                            // Text(
                                                            //   'Pin :',
                                                            //   style: GoogleFonts
                                                            //       .poppins(
                                                            //     color: MyTheme
                                                            //         .blueww,
                                                            //     fontWeight:
                                                            //         FontWeight
                                                            //             .w600,
                                                            //     fontSize:
                                                            //         size.width *
                                                            //             0.035,
                                                            //   ),
                                                            // ),
                                                            ///phone no....
                                                            // Text(
                                                            //   'Mobile Number:',
                                                            //   style: GoogleFonts
                                                            //       .poppins(
                                                            //     color: MyTheme
                                                            //         .blueww,
                                                            //     fontWeight:
                                                            //         FontWeight
                                                            //             .w600,
                                                            //     fontSize:
                                                            //         size.width *
                                                            //             0.035,
                                                            //   ),
                                                            // ),
                                                            ///
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.042,
                                                              width:
                                                                  size.width *
                                                                      0.3,
                                                              child: Text(
                                                                'Pickup Address:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .blueww,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                            ),

                                                            ///
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.042,
                                                              width:
                                                                  size.width *
                                                                      0.3,
                                                              child: Text(
                                                                'End Address:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .blueww,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                            ),

                                                            ///

                                                            // Text(
                                                            //   'Status:',
                                                            //   style: GoogleFonts
                                                            //       .poppins(
                                                            //     color: MyTheme
                                                            //         .blueww,
                                                            //     fontWeight:
                                                            //         FontWeight
                                                            //             .w600,
                                                            //     fontSize:
                                                            //         size.width *
                                                            //             0.035,
                                                            //   ),
                                                            // ),
                                                            ///
                                                            // Text(
                                                            //   'Driver Record :',
                                                            //   style: GoogleFonts
                                                            //       .poppins(
                                                            //     color: MyTheme
                                                            //         .blueww,
                                                            //     fontWeight:
                                                            //         FontWeight
                                                            //             .w600,
                                                            //     fontSize:
                                                            //         size.width *
                                                            //             0.035,
                                                            //   ),
                                                            // ),
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                            ),
                                                            // Text(
                                                            //   '${item?[index].mobileNumber}',
                                                            //   style: GoogleFonts
                                                            //       .raleway(
                                                            //           color: Colors
                                                            //               .white,
                                                            //           fontWeight:
                                                            //               FontWeight
                                                            //                   .w700,
                                                            //           fontSize: size
                                                            //                   .width *
                                                            //               0.035),
                                                            // ),
                                                            Text(
                                                              '${item?[index].stateName}',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                            ),
                                                            Text(
                                                              '${item?[index].cityName}',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                            ),

                                                            ///todo: calll user...

                                                            // Row(
                                                            //   children: [
                                                            //     Text(
                                                            //       '${item?[index].mobileNumber}',
                                                            //       style: GoogleFonts.raleway(
                                                            //           color: Colors
                                                            //               .white,
                                                            //           fontWeight:
                                                            //               FontWeight
                                                            //                   .w700,
                                                            //           fontSize:
                                                            //               size.width *
                                                            //                   0.035),
                                                            //     ),
                                                            //     Padding(
                                                            //       padding: EdgeInsets.symmetric(
                                                            //           horizontal:
                                                            //               size.width *
                                                            //                   0.02),
                                                            //       child:
                                                            //           InkWell(
                                                            //         onTap: () {
                                                            //           Get.defaultDialog(
                                                            //               barrierDismissible: true,
                                                            //               title: "Welcome to PS Wellness",
                                                            //               confirm: Padding(
                                                            //                 padding:
                                                            //                     const EdgeInsets.all(6.0),
                                                            //                 child:
                                                            //                     PhysicalModel(
                                                            //                   color: MyTheme.white,
                                                            //                   shadowColor: Colors.blueGrey,
                                                            //                   elevation: 0,
                                                            //                   child: Padding(
                                                            //                     padding: const EdgeInsets.all(3.0),
                                                            //                     child: InkWell(
                                                            //                       onTap: () async {
                                                            //                         String telephoneNumber = '${item?[index].mobileNumber}';
                                                            //                         String telephoneUrl = "tel:$telephoneNumber";
                                                            //                         if (await canLaunch(telephoneUrl)) {
                                                            //                           await launch(telephoneUrl);
                                                            //                         } else {
                                                            //                           throw "Error occured trying to call that number.";
                                                            //                         }
                                                            //                         // launch('tel:+9111126194230');
                                                            //                       },
                                                            //                       child: Container(
                                                            //                           height: size.height * 0.04,
                                                            //
                                                            //                           /// width: size.width * 0.26,
                                                            //                           color: MyTheme.ThemeColors,
                                                            //                           child: Center(
                                                            //                               child: Row(
                                                            //                             mainAxisAlignment: MainAxisAlignment.center,
                                                            //                             children: [
                                                            //                               Icon(
                                                            //                                 Icons.phone,
                                                            //                                 color: Colors.white,
                                                            //                                 size: size.width * 0.05,
                                                            //                               ),
                                                            //                               SizedBox(
                                                            //                                 width: size.width * 0.03,
                                                            //                               ),
                                                            //                               Text(
                                                            //                                 'Call User',
                                                            //                                 style: TextStyle(
                                                            //                                   color: MyTheme.white,
                                                            //                                   fontSize: size.width * 0.03,
                                                            //                                   fontWeight: FontWeight.bold,
                                                            //                                 ),
                                                            //                               ),
                                                            //                             ],
                                                            //                           ))),
                                                            //                     ),
                                                            //                   ),
                                                            //                 ),
                                                            //               ),
                                                            //               // cancel: Padding(
                                                            //               //   padding:
                                                            //               //       const EdgeInsets.all(8.0),
                                                            //               //   child:
                                                            //               //       PhysicalModel(
                                                            //               //     color: MyTheme.blueww,
                                                            //               //     shadowColor: Colors.blueGrey,
                                                            //               //     elevation: 0,
                                                            //               //     child: Padding(
                                                            //               //       padding: const EdgeInsets.all(3.0),
                                                            //               //       child: InkWell(
                                                            //               //         onTap: () {
                                                            //               //           Get.back();
                                                            //               //           // _launchWhatsapp();
                                                            //               //         },
                                                            //               //         child: Container(
                                                            //               //             height: size.height * 0.04,
                                                            //               //             width: size.width * 0.26,
                                                            //               //             color: MyTheme.ThemeColors,
                                                            //               //             child: Center(
                                                            //               //                 child: Row(
                                                            //               //               mainAxisAlignment: MainAxisAlignment.center,
                                                            //               //               children: [
                                                            //               //                 Icon(
                                                            //               //                   Icons.cancel,
                                                            //               //                   color: Colors.white,
                                                            //               //                   size: size.height * 0.03,
                                                            //               //                 ),
                                                            //               //                 SizedBox(
                                                            //               //                   width: size.width * 0.03,
                                                            //               //                 ),
                                                            //               //                 Text(
                                                            //               //                   'NO',
                                                            //               //                   style: TextStyle(color: MyTheme.white, fontWeight: FontWeight.bold, fontSize: size.width * 0.03),
                                                            //               //                 ),
                                                            //               //               ],
                                                            //               //             ))),
                                                            //               //       ),
                                                            //               //     ),
                                                            //               //   ),
                                                            //               // ),
                                                            //               middleText: "Call User ?.",
                                                            //               backgroundColor: MyTheme.blueww,
                                                            //               titleStyle: GoogleFonts.alatsi(color: MyTheme.white, fontSize: size.height * 0.03, fontWeight: FontWeight.bold),
                                                            //               middleTextStyle: TextStyle(color: MyTheme.text1),
                                                            //               radius: 10);
                                                            //         },
                                                            //         child:
                                                            //             Container(
                                                            //           height: size
                                                            //                   .height *
                                                            //               0.04,
                                                            //           width: size
                                                            //                   .width *
                                                            //               0.08,
                                                            //           decoration:
                                                            //               BoxDecoration(
                                                            //             color: Colors
                                                            //                 .white30,
                                                            //             shape: BoxShape
                                                            //                 .circle,
                                                            //           ),
                                                            //           child:
                                                            //               Icon(
                                                            //             Icons
                                                            //                 .call,
                                                            //             color: Colors
                                                            //                 .red,
                                                            //           ),
                                                            //         ),
                                                            //       ),
                                                            //     ),
                                                            //   ],
                                                            // ),

                                                            ///todo: calll user...

                                                            // Text(
                                                            //   '${item?[index].paidAmount}',
                                                            //   style: GoogleFonts.raleway(
                                                            //       color: Colors
                                                            //           .white,
                                                            //       fontWeight:
                                                            //           FontWeight
                                                            //               .w700,
                                                            //       fontSize: size
                                                            //               .width *
                                                            //           0.035),
                                                            // ),
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.046,
                                                              width:
                                                                  size.width *
                                                                      0.5,
                                                              child: Text(
                                                                '${item?[index].pickUpLoaction}',
                                                                style: GoogleFonts.raleway(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.029),
                                                              ),
                                                            ),

                                                            ///drop address
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.046,
                                                              width:
                                                                  size.width *
                                                                      0.5,
                                                              child: Text(
                                                                '${item?[index].dropLocation}',
                                                                style: GoogleFonts.raleway(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.029),
                                                              ),
                                                            ),

                                                            ///
                                                            // Text(
                                                            //   '${item?[index].status}',
                                                            //   style: GoogleFonts.raleway(
                                                            //       color: Colors
                                                            //           .white,
                                                            //       fontWeight:
                                                            //           FontWeight
                                                            //               .w700,
                                                            //       fontSize: size
                                                            //               .width *
                                                            //           0.035),
                                                            // ),
                                                            // Text(
                                                            //   'Yes',
                                                            //   style: GoogleFonts.raleway(
                                                            //       color: Colors
                                                            //           .white,
                                                            //       fontWeight:
                                                            //           FontWeight
                                                            //               .w700,
                                                            //       fontSize: size
                                                            //               .width *
                                                            //           0.035),
                                                            // ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })),
                              ),
                      ],
                    ),
                  ],
                ),
        )),
      ),
    );
  }
}
