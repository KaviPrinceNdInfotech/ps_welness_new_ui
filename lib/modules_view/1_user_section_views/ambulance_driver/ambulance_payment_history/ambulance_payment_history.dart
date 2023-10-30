import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/ambulance/driver_user_payment_list_controller/driver_user_paymenthistory_controller.dart';

class AmbulancePaymentHistory extends StatelessWidget {
  AmbulancePaymentHistory({Key? key}) : super(key: key);

  // DriverpaymentController _driverpaymentController =
  //     Get.put(DriverpaymentController());
  DriverUserPaymentHistoryController _driverUserPaymentHistoryController =
      Get.put(DriverUserPaymentHistoryController());
  // DriverPaymentHistoryController _driverPaymentHistoryController =
  //     Get.put(DriverPaymentHistoryController());

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
            () => _driverUserPaymentHistoryController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.041,
                        right: -size.width * 0.194,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.26,
                            width: size.width * 0.75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/background_stack_png/paymhis1.png',
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
                                  'Ambulance\'s History',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.032,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
                            ),
                          ),

                          //...
                          //...............
                          //Spacer(),
                          ///...search driver.....

                          // Container(
                          //   decoration: new BoxDecoration(
                          //       borderRadius: new BorderRadius.all(
                          //           new Radius.circular(30.0)),
                          //       color: Colors.white),
                          //   width: size.width * 0.9,
                          //   height: size.height * 0.06,
                          //   margin: new EdgeInsets.fromLTRB(20, 20, 20, 20),
                          //   padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                          //   child: Theme(
                          //     data: Theme.of(context)
                          //         .copyWith(splashColor: Colors.transparent),
                          //     child: TextField(
                          //       onChanged: (value) =>
                          //           _driverUserPaymentHistoryController
                          //               .founduserpaymenthistorydriver.value,
                          //       autofocus: false,
                          //       style: TextStyle(
                          //           fontSize: 15.0, color: MyTheme.blueww),
                          //       decoration: InputDecoration(
                          //         prefixIcon: Icon(Icons.search),
                          //         filled: true,
                          //         fillColor: Colors.white,
                          //         hintText: 'Search patient-name',
                          //         contentPadding: const EdgeInsets.only(
                          //             left: 10.0, bottom: 12.0, top: 6.0),
                          //         focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.white),
                          //           borderRadius: BorderRadius.circular(25.7),
                          //         ),
                          //         enabledBorder: UnderlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.white),
                          //           borderRadius: BorderRadius.circular(25.7),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          ///search...driver....
                          // Obx(
                          //() =>
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          _driverUserPaymentHistoryController
                                  .founduserpaymenthistorydriver.value.isEmpty
                              ? Center(
                                  child: Text('No List'),
                                )
                              : Expanded(
                                  child: SizedBox(
                                      //height: size.height * 0.76,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              _driverUserPaymentHistoryController
                                                  .founduserpaymenthistorydriver
                                                  .length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final item =
                                                _driverUserPaymentHistoryController
                                                    .founduserpaymenthistorydriver;
                                            //var now = item[index].joiningDate;
                                            // var formatter =
                                            // DateFormat('dd-MM-yyyy');
                                            // String date =
                                            //formatter.format(now!);
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
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 30 / 5),
                                                    decoration: BoxDecoration(
                                                      // image: DecorationImage(
                                                      //     image: NetworkImage(
                                                      //         'https://images.unsplash.com/photo-1633526544365-a98d534c9201?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'),
                                                      //     fit: BoxFit.fill),
                                                      //color: MyTheme.containercolor8,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          offset:
                                                              Offset(-0, -0),
                                                          spreadRadius: 0,
                                                          blurRadius: 0,
                                                          color: Colors
                                                              .yellow.shade300,
                                                        ),
                                                        BoxShadow(
                                                          offset: Offset(3, 3),
                                                          spreadRadius: 0,
                                                          blurRadius: 0,
                                                          color: Colors
                                                              .grey.shade300,
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
                                                                size.height *
                                                                    0.2,
                                                            width: size.width *
                                                                0.4,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              //color: Colors.blueGrey,
                                                              gradient: MyTheme
                                                                  .sweepGradient1,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: -120,
                                                          left: 200,
                                                          child: Container(
                                                            height:
                                                                size.height *
                                                                    0.32,
                                                            width: size.width *
                                                                0.62,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              gradient: MyTheme
                                                                  .gradient9,
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
                                                                    'Driver Name:',
                                                                    style: GoogleFonts
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
                                                                    'Paid Amount:',
                                                                    style: GoogleFonts
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
                                                                    'Total Amount:',
                                                                    style: GoogleFonts
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
                                                                    'Payment Date:',
                                                                    style: GoogleFonts
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
                                                                    'VehicleNumber:',
                                                                    style: GoogleFonts
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
                                                                    '${item?[index].driverName}',
                                                                    style: GoogleFonts.raleway(
                                                                        color: MyTheme
                                                                            .blueww,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            size.width *
                                                                                0.035),
                                                                  ),
                                                                  Text(
                                                                    '₹ ${item?[index].paidAmount}',
                                                                    style: GoogleFonts.raleway(
                                                                        color: MyTheme
                                                                            .blueww,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            size.width *
                                                                                0.035),
                                                                  ),
                                                                  Text(
                                                                    '₹ ${item?[index].totalPrice}',
                                                                    style: GoogleFonts.raleway(
                                                                        color: MyTheme
                                                                            .blueww,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            size.width *
                                                                                0.035),
                                                                  ),
                                                                  SizedBox(
                                                                    height: size
                                                                            .height *
                                                                        0.02,
                                                                    width:
                                                                        size.width *
                                                                            0.2,
                                                                    child: Text(
                                                                      "${_driverUserPaymentHistoryController.founduserpaymenthistorydriver[index].paymentDate ?? "00 / 00 / 0000"}",
                                                                      style: GoogleFonts.raleway(
                                                                          color: MyTheme
                                                                              .blueww,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                              size.width * 0.035),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        size.width *
                                                                            0.2,
                                                                    height: size
                                                                            .height *
                                                                        0.02,
                                                                    child: Text(
                                                                      _driverUserPaymentHistoryController
                                                                              .founduserpaymenthistorydriver?[index]
                                                                              .vehicleNumber ??
                                                                          "no data",
                                                                      style: GoogleFonts.raleway(
                                                                          color: MyTheme
                                                                              .blueww,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                              size.width * 0.035),
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
                                          })),
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

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: MyTheme.ThemeColors,
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   elevation: 0,
//       //   title: Text('Appintment History'),
//       //   backgroundColor: MyTheme.ThemeColors,
//       // ),
//       body: Column(
//         //clipBehavior: Clip.none,
//         children: [
//           SizedBox(
//             height: size.height * 0.07,
//           ),
//           SizedBox(
//             height: size.height * 0.0,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//             child: Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Container(
//                       height: size.height * 0.032,
//                       width: size.width * 0.071,
//                       decoration: BoxDecoration(
//                         color: Colors.white70,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_ios_outlined,
//                         size: size.height * 0.022,
//                       )),
//                 ),
//                 SizedBox(
//                   width: size.width * 0.02,
//                 ),
//                 Text(
//                   ' See Your Appointment History',
//                   style: TextStyle(
//                     color: MyTheme.blueww,
//                     fontSize: size.width * 0.045,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Container(
//                 decoration: new BoxDecoration(
//                     borderRadius:
//                         new BorderRadius.all(new Radius.circular(30.0)),
//                     color: Colors.white),
//                 width: size.width * 0.72,
//                 height: size.height * 0.06,
//                 margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
//                 child: Theme(
//                   data: Theme.of(context)
//                       .copyWith(splashColor: Colors.transparent),
//                   child: Obx(
//                     () => (_nurseappointmentController.isLoading.value)
//                         ? Center(child: CircularProgressIndicator())
//                         : TextField(
//                             controller: _nurseappointmentController
//                                 .appointmentController,
//                             onTap: () {
//                               _nurseappointmentController.chooseDate();
//                             },
//                             autofocus: false,
//                             style: TextStyle(
//                                 fontSize: 15.0, color: MyTheme.blueww),
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.search),
//                               filled: true,
//                               fillColor: Colors.white,
//                               hintText: 'dd-mm-yyyy',
//                               contentPadding: const EdgeInsets.only(
//                                   left: 10.0, bottom: 12.0, top: 0.0),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(25.7),
//                               ),
//                               enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(25.7),
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: size.height * 0.06,
//                 width: size.width * 0.2,
//                 decoration: BoxDecoration(
//                   color: MyTheme.blueww,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Center(
//                     child: Text(
//                   'Search',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: size.width * 0.035,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )),
//               ),
//             ],
//           ),
//           SizedBox(
//               height: size.height * 0.75,
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 7,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: size.width * 0.03,
//                           vertical: size.height * 0.0005),
//                       child: Container(
//                         height: size.height * 0.25,
//                         margin: EdgeInsets.symmetric(vertical: 30 / 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           gradient: LinearGradient(
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                               colors: [
//                                 lightPrimary2,
//                                 darkPrimary2,
//                               ]),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: Offset(-0, -0),
//                               spreadRadius: 0,
//                               blurRadius: 0,
//                               color: darkShadow,
//                             ),
//                             BoxShadow(
//                               offset: Offset(1, 3),
//                               spreadRadius: 0,
//                               blurRadius: 0,
//                               color: Colors.grey,
//                             ),
//                           ],
//                           // image: DecorationImage(
//                           //     image: AssetImage(
//                           //         'lib/assets/background_stack_png/appointment6.png'),
//                           //     fit: BoxFit.cover)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Patient Name:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Mobile :',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Email:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Location:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient City:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient State :',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Kishor Kumar',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     '9977889999',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'ksk@gmail.com',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'Sector 12, C 59',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'Lakhnaw',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'UP',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   })),
//           // Positioned(
//           //   top: 50,
//           //   child: Container(
//           //     height: size.height * 0.10,
//           //     width: size.width * 0.19,
//           //     decoration: BoxDecoration(
//           //       color: Colors.green,
//           //       shape: BoxShape.circle,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
