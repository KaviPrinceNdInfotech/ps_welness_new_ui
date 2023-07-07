import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/driver_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/1_user_view_controller/ambulance/get_ambulancetype_controller.dart';

class Driver_List_LocationId extends StatelessWidget {
  Driver_List_LocationId({Key? key, this.driverlist}) : super(key: key);
  DriverListApi? driverlist;

  //DriverPayoutController _driverPayoutController =
  // Get.put(DriverPayoutController());

  // DriverlistnearController _nearambulancelistController =
  //     Get.put(DriverlistnearController());

  AmbulancegetController _ambulancegetController =
      Get.put(AmbulancegetController());
  // get kButtonAnimationDuration => null;

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
            () => _ambulancegetController.isLoading.isFalse
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.04,
                        //bottom: size.height * 0.64,
                        //left: -30,
                        right: -size.width * 0.024,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.20,
                            width: size.width * 0.5,
                            decoration: BoxDecoration(
                                //color: Colors.,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/image/psambulance.png',
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
                                  'Available Driver\'s',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.022,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),

                          Expanded(
                            child: SizedBox(
                                //height: size.height * 0.76,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: driverlist?.message?.length
                                    //.driverlist?.message?.length,
                                    ,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // DateTime? now =
                                      //     _driverPayoutHistoryController
                                      //         .foundpayoutdriver?[index]
                                      //         .joiningDate;
                                      // String Date = DateFormat('dd-MM-yyyy')
                                      //     .format(now!);
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.03,
                                            vertical: size.height * 0.0005),
                                        child: Container(
                                          height: size.height * 0.2,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 30 / 5),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                                fit: BoxFit.fill),
                                            //color: MyTheme.containercolor8,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(-0, -0),
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                color: Colors.grey.shade100,

                                                // color: darkShadow1,
                                              ),
                                              BoxShadow(
                                                offset: Offset(0, 0),
                                                spreadRadius: 0,
                                                blurRadius: 0,
                                                color: Colors.grey.shade200,
                                              ),
                                            ],
                                          ),
                                          child: Container(
                                            height: size.height * 0.093,
                                            width: double.infinity,
                                            margin: EdgeInsets.symmetric(
                                                vertical:
                                                    size.width * 0.0 / 05),
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      Color(0xffF0F3F8),
                                                      Color(0xffF0F3F8)
                                                      //darkPrimary,
                                                    ]),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(2, 2),
                                                    spreadRadius: 1,
                                                    blurRadius: 0,
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(2, 2),
                                                    spreadRadius: 1,
                                                    blurRadius: 3,
                                                    color: Colors.grey.shade500,
                                                  ),
                                                ]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: size.height * 0.08,
                                                    width: size.width * 0.17,
                                                    padding: EdgeInsets.all(8),
                                                    child: Image.asset(
                                                      'lib/assets/icons/user.png',
                                                      // "lib/assets/image/icons8-hospital-64.png",
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        boxShadow: [
                                                          const BoxShadow(
                                                            color: Color(
                                                                0xFFBEBEBE),
                                                            offset:
                                                                Offset(5, 5),
                                                            blurRadius: 10,
                                                            spreadRadius: 1,
                                                          ),
                                                          const BoxShadow(
                                                            color: Colors.white,
                                                            offset:
                                                                Offset(-5, -5),
                                                            blurRadius: 10,
                                                            spreadRadius: 1,
                                                          ),
                                                        ]),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.verified,
                                                            color: Color(
                                                                0xff12BFC4),
                                                          ),
                                                          Text(
                                                            "${driverlist?.message?[index].name}",
                                                            // 'Kumar Prince',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: MyTheme
                                                                  .blueww,
                                                            ),
                                                          ),

                                                          ///rating....
                                                          // SizedBox(
                                                          //   width: size.width *
                                                          //       0.01,
                                                          // ),
                                                          // Material(
                                                          //   elevation: 3,
                                                          //   borderRadius:
                                                          //       BorderRadius
                                                          //           .circular(
                                                          //               20),
                                                          //   child: Container(
                                                          //     height:
                                                          //         size.height *
                                                          //             0.024,
                                                          //     width:
                                                          //         size.width *
                                                          //             0.11,
                                                          //     decoration:
                                                          //         BoxDecoration(
                                                          //       color: Color(
                                                          //           0xff12BFC4),
                                                          //       borderRadius:
                                                          //           BorderRadius
                                                          //               .circular(
                                                          //                   20),
                                                          //     ),
                                                          //     child: Padding(
                                                          //       padding:
                                                          //           EdgeInsets
                                                          //               .all(
                                                          //                   2.0),
                                                          //       child: Row(
                                                          //         mainAxisAlignment:
                                                          //             MainAxisAlignment
                                                          //                 .spaceAround,
                                                          //         crossAxisAlignment:
                                                          //             CrossAxisAlignment
                                                          //                 .center,
                                                          //         children: [
                                                          //           Text(
                                                          //             '4.5',
                                                          //             style:
                                                          //                 TextStyle(
                                                          //               color: Colors
                                                          //                   .white,
                                                          //               fontSize:
                                                          //                   size.width *
                                                          //                       0.029,
                                                          //               fontWeight:
                                                          //                   FontWeight.bold,
                                                          //             ),
                                                          //           ),
                                                          //           Icon(
                                                          //             Icons
                                                          //                 .star,
                                                          //             size: size
                                                          //                     .height *
                                                          //                 0.017,
                                                          //             color: Colors
                                                          //                 .yellow,
                                                          //           ),
                                                          //         ],
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Total Distance :',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          // Icon(
                                                          //   Icons
                                                          //       .car_crash_sharp,
                                                          //   size: size.height *
                                                          //       0.02,
                                                          //   color: Colors
                                                          //       .grey.shade600,
                                                          // ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "${driverlist?.message?[index].km}",
                                                            //'2020 Honda Clive',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.027,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.grey
                                                                  .shade600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Total Price :',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "${driverlist?.message?[index].totalPrice}",
                                                            // '121234333377',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.grey
                                                                  .shade900,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'DL NO :',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "${driverlist?.message?[index].dl}",
                                                            //'ENP 2345',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.grey
                                                                  .shade900,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.015,
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.035,
                                                        width:
                                                            size.width * 0.17,
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    2, 2),
                                                                blurRadius: 4,
                                                                spreadRadius: 0,
                                                              ),
                                                              BoxShadow(
                                                                color: Colors
                                                                    .white,
                                                                offset: Offset(
                                                                    -2, -2),
                                                                blurRadius: 4,
                                                                spreadRadius: 0,
                                                              ),
                                                            ]),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0.0),
                                                              child: Text(
                                                                '\u{20B9}',
                                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                                style:
                                                                    GoogleFonts
                                                                        .actor(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.034,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  color: Colors
                                                                      .indigo,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.002,
                                                            ),
                                                            Text(
                                                              "${driverlist?.message?[index].charge}/Km",
                                                              // '10/km',
                                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize:
                                                                    size.width *
                                                                        0.028,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .red
                                                                    .shade900,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width * 0.2,
                                                        child: NeoPopButton(
                                                          color: Colors.black,
                                                          bottomShadowColor:
                                                              ColorUtils.getVerticalShadow(
                                                                      Colors
                                                                          .green
                                                                          .shade300)
                                                                  .toColor(),
                                                          rightShadowColor:
                                                              ColorUtils.getHorizontalShadow(
                                                                      Colors
                                                                          .green
                                                                          .shade300)
                                                                  .toColor(),
                                                          //animationDuration: kButtonAnimationDuration,
                                                          depth: kButtonDepth,
                                                          onTapUp: () async {
                                                            SharedPreferences
                                                                prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            prefs.setString(
                                                                "driverlistssId",
                                                                "${driverlist?.message?[index].driverId.toString()}");
                                                            prefs.setString(
                                                                "lng1",
                                                                "${driverlist?.startLong.toString()}");
                                                            prefs.setString(
                                                                "lat1",
                                                                "${driverlist?.startLat.toString()}");

                                                            prefs.setString(
                                                                "lng2",
                                                                "${driverlist?.endLong.toString()}");
                                                            prefs.setString(
                                                                "lat2",
                                                                "${driverlist?.endLat.toString()}");
                                                            prefs.setString(
                                                                "ambulance1",
                                                                "${driverlist?.ambulanceTypeId.toString()}");
                                                            prefs.setString(
                                                                "vehicle1",
                                                                "${driverlist?.vehicleTypeId.toString()}");

                                                            _ambulancegetController
                                                                .postAmbulancerequestApi2();
                                                          },
                                                          border: Border.all(
                                                            color:
                                                                Colors.black87,
                                                            width: 3,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        0,
                                                                    vertical:
                                                                        0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Text(
                                                                    "Book Driver",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // Container(
                                                      //   height: size.height *
                                                      //       0.04,
                                                      //   width:
                                                      //       size.width * 0.22,
                                                      //   padding:
                                                      //       EdgeInsets.all(8),
                                                      //   decoration:
                                                      //       BoxDecoration(
                                                      //           // color: Colors
                                                      //           //     .orange
                                                      //           //     .shade500,
                                                      //           gradient: MyTheme
                                                      //               .gradient35,
                                                      //           borderRadius:
                                                      //               BorderRadius
                                                      //                   .circular(
                                                      //                       8),
                                                      //           boxShadow: const [
                                                      //         BoxShadow(
                                                      //           color: Color(
                                                      //               0xFFBEBEBE),
                                                      //           offset:
                                                      //               Offset(
                                                      //                   5, 5),
                                                      //           blurRadius:
                                                      //               10,
                                                      //           spreadRadius:
                                                      //               1,
                                                      //         ),
                                                      //         BoxShadow(
                                                      //           color: Colors
                                                      //               .white,
                                                      //           offset:
                                                      //               Offset(-5,
                                                      //                   -5),
                                                      //           blurRadius:
                                                      //               10,
                                                      //           spreadRadius:
                                                      //               1,
                                                      //         ),
                                                      //       ]),
                                                      //   child: Center(
                                                      //     child: Text(
                                                      //       'BOOK DRIVER',
                                                      //       //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                      //       style: GoogleFonts
                                                      //           .alatsi(
                                                      //         fontSize:
                                                      //             size.width *
                                                      //                 0.027,
                                                      //         fontWeight:
                                                      //             FontWeight
                                                      //                 .w700,
                                                      //         color: Colors
                                                      //             .black87,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                          ),
                          //)
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
