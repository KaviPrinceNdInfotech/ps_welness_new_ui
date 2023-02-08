import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';

import '../../../controllers/4_nurse_controller/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';

class NurseeAppointmentDetail extends StatelessWidget {
  NurseeAppointmentDetail({Key? key}) : super(key: key);

  NurseAppointmentDetailController _nurseappointmentdetailController =
      Get.put(NurseAppointmentDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // backgroundColor: MyTheme.ThemeColors,
        // appBar: AppBar(
        //   centerTitle: true,
        //   elevation: 0,
        //   title: Text('Patient List'),
        //   backgroundColor: MyTheme.ThemeColors,
        // ),
        body: Obx(
          () => (_nurseappointmentdetailController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : _nurseappointmentdetailController.nurseappointmentdetail != null
                  ? Center(
                      child: Text('No Data'),
                    )
                  : SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -size.height * 0.08,
                            //bottom: size.height * 0.64,
                            //left: -30,
                            right: -size.width * 0.12,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: size.height * 0.22,
                                width: size.width * 0.58,
                                decoration: BoxDecoration(
                                    //color: Colors.,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'lib/assets/user_assets/appointment_nurse.png',
                                          //'lib/assets/user_assets/nurse33.png',
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
                                    //height: size.height * 0.02,
                                    decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(30.0)),
                                        color: Colors.white),
                                    width: size.width * 0.72,
                                    height: size.height * 0.06,
                                    margin:
                                        new EdgeInsets.fromLTRB(10, 20, 10, 20),
                                    padding:
                                        new EdgeInsets.fromLTRB(5, 8, 8, 8),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          splashColor: Colors.transparent),
                                      child: Obx(
                                        () => (_nurseappointmentdetailController
                                                .isLoading.value)
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : TextField(
                                                controller:
                                                    _nurseappointmentdetailController
                                                        .appointmentController,
                                                onTap: () {
                                                  _nurseappointmentdetailController
                                                      .chooseDate();
                                                },
                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: MyTheme.blueww),
                                                decoration: InputDecoration(
                                                  prefixIcon:
                                                      Icon(Icons.search),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: 'dd-mm-yyyy',
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 10.0,
                                                          bottom: 12.0,
                                                          top: 0.0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.7),
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.7),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: size.height * 0.06,
                                    width: size.width * 0.2,
                                    decoration: BoxDecoration(
                                      //color: MyTheme.blueww,
                                      gradient: MyTheme.gradient10,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Search',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.width * 0.035,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Obx(
                                () => (_nurseappointmentdetailController
                                        .isLoading.value)
                                    ? Center(child: CircularProgressIndicator())
                                    : _nurseappointmentdetailController
                                                ?.nurseappointmentdetail !=
                                            null
                                        //.getcatagartlist!.result!.isEmpty
                                        ? Center(
                                            child: Text('No List'),
                                          )
                                        : SizedBox(
                                            height: size.height * 0.71,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount:
                                                    _nurseappointmentdetailController
                                                        .nurseappointmentdetail
                                                        ?.result
                                                        ?.length,
                                                //1,
                                                // _nurseappointmentdetailController
                                                //     .nurseappointmentdetail!
                                                //     .result!
                                                //     .length,
                                                ///
                                                // _nurseappointmentdetailController
                                                //     .nurseappointmentdetail!
                                                //     .result
                                                //     .length,
                                                //7,
                                                // _nurseappointmentdetailController
                                                //     .nurseappointmentdetail!
                                                //     .result
                                                //     .length,
                                                // _nurseappointmentdetailController
                                                //     .nurseappointmentdetail?.,
                                                ///
                                                //_nurseappointmentdetailController.nurseappointmentdetail.,
                                                //_nurseappointmentdetailController
                                                // ..length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    size.width *
                                                                        0.03,
                                                                vertical:
                                                                    size.height *
                                                                        0.0005),
                                                        child: Container(
                                                          height: size.height *
                                                              0.25,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      30 / 5),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                                offset: Offset(
                                                                    -0, -0),
                                                                spreadRadius: 0,
                                                                blurRadius: 0,
                                                                color: Colors
                                                                    .red
                                                                    .shade300,

                                                                // color: darkShadow1,
                                                              ),
                                                              BoxShadow(
                                                                offset: Offset(
                                                                    4, 4),
                                                                spreadRadius: 0,
                                                                blurRadius: 0,
                                                                color: Colors
                                                                    .red
                                                                    .shade300,
                                                              ),
                                                            ],
                                                            // image: DecorationImage(
                                                            //     image: NetworkImage(
                                                            //         'https://images.unsplash.com/photo-1626624340240-aadc087844fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Ymx1ciUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                                            //     fit: BoxFit.cover)
                                                          ),
                                                          child: Stack(
                                                            //clipBehavior: Clip.none,
                                                            children: [
                                                              Positioned(
                                                                top: -60,
                                                                left: -125,
                                                                child: Material(
                                                                  shadowColor:
                                                                      Colors
                                                                          .transparent,
                                                                  color: Colors
                                                                      .transparent,
                                                                  // color: Colors.tra
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              900),
                                                                  //shape: BoxShape.circle,
                                                                  elevation: 10,

                                                                  //borderRadius

                                                                  //shape: BoxShape.circle,
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.39,
                                                                    width: size
                                                                            .width *
                                                                        0.77,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      //borderRadius: BorderRadius.circular(100),
                                                                      //color: Colors.blueGrey,
                                                                      gradient:
                                                                          MyTheme
                                                                              .gradient81,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
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
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Patient Mobile :',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Paid Amount:',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Patient Address:',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Duration:',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Working Shift :',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            color:
                                                                                MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
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
                                                                          'Mrs. Apk',
                                                                          // _nurseappointmentdetailController
                                                                          //     .nurseappointmentdetail!
                                                                          //     .result![index].patientName
                                                                          //     .toString()
                                                                          //.result![index].patientName
                                                                          //,

                                                                          style: GoogleFonts.raleway(
                                                                              color: Colors.grey.shade800,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
                                                                        ),
                                                                        Text(
                                                                          '7896888923',
                                                                          style: GoogleFonts.raleway(
                                                                              color: Colors.grey.shade800,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
                                                                        ),
                                                                        Text(
                                                                          '₹ 5000',
                                                                          style: GoogleFonts.raleway(
                                                                              color: Colors.grey.shade800,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
                                                                        ),
                                                                        Text(
                                                                          'Sector 12, Noida',
                                                                          style: GoogleFonts.raleway(
                                                                              color: Colors.grey.shade800,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
                                                                        ),
                                                                        Text(
                                                                          '20 dec 2023-28 jan 2023',
                                                                          style: GoogleFonts.raleway(
                                                                              color: Colors.grey.shade800,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
                                                                        ),
                                                                        Text(
                                                                          '24 hours',
                                                                          style: GoogleFonts.raleway(
                                                                              color: Colors.grey.shade800,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
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
