import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/invoice_views/page/pdf_page_doctor.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/drawer_contoller/doctor_history_section/doctor_history_controller.dart';

class DoctorHistoryUser extends StatelessWidget {
  //final String id;

  DoctorHistoryUser({Key? key}) : super(key: key);

  DoctorHistoryController _doctorHistoryController =
      Get.put(DoctorHistoryController());

  //get index => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: MyTheme.ThemeColors,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyTheme.ThemeColors,

          title: Text(
            'Doctor History USER',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: size.height * 0.02),
          ),
          elevation: 2,
          // backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ).onTap(() {
            Get.back();
          }),
          bottom: PreferredSize(
            preferredSize: Size(20, 30),
            child: Column(
              children: [
                // 0.h.heightBox,
                TabBar(
                  indicatorWeight: 3,
                  unselectedLabelColor: Colors.grey.shade700,

                  labelColor: Colors.red,
                  indicatorPadding: const EdgeInsets.all(0),
                  // indicator: BoxDecoration(
                  //   border: Border.all(color: Colors.red),
                  //   borderRadius: BorderRadius.circular(0),
                  //   //color:  selectbutton,
                  // ),
                  indicatorColor: Colors.deepOrange,
                  //labelColor: Colors.yellow,
                  labelStyle: TextStyle(fontSize: 0),
                  labelPadding: EdgeInsets.symmetric(vertical: 0),
                  indicatorSize: TabBarIndicatorSize.label,
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  tabs: [
                    Tab(
                      child: Text(
                        'Normal Booking',
                        style: TextStyle(
                          fontSize: size.width * 0.039,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Call Booking',
                        style: TextStyle(
                            fontSize: size.width * 0.039,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //Tab(child: Text('FAQs',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.bold),),),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Obx(
              () => (_doctorHistoryController.isLoading.isFalse)
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0,
                          ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: size.width * 0.05,
                          //       vertical: size.height * 0.0),
                          //   child: Row(
                          //     children: [
                          //       InkWell(
                          //         onTap: () {
                          //           Get.back();
                          //         },
                          //         child: Icon(
                          //           Icons.arrow_back_ios_outlined,
                          //           size: size.width * 0.05,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: size.width * 0.03,
                          //       ),
                          //       Text(
                          //         'Doctor History USER',
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: size.height * 0.02),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Row(
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(30.0)),
                                    color: Colors.white),
                                width: size.width * 0.94,
                                height: size.height * 0.055,
                                margin: new EdgeInsets.fromLTRB(10, 10, 10, 10),
                                padding: new EdgeInsets.fromLTRB(6, 6, 6, 6),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      splashColor: Colors.transparent),
                                  child: TextField(
                                    onChanged: (value) =>
                                        _doctorHistoryController
                                            .filterDoctor(value),
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 15.0, color: MyTheme.blueww),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Search Doctor..',
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
                              //
                              // InkWell(
                              //   onTap: () async {
                              //     CallLoader.loader();
                              //     await Future.delayed(Duration(milliseconds: 700));
                              //     CallLoader.hideLoader();
                              //     Get.to(WebViewPswebsite());
                              //   },
                              //   child: NeumorphicbuttonContainer(
                              //     color: Colors.white,
                              //     child: Container(
                              //       width: size.width * 0.13,
                              //       height: size.height * 0.06,
                              //       decoration: BoxDecoration(
                              //         color: Colors.white,
                              //         shape: BoxShape.circle,
                              //         image: DecorationImage(
                              //           image: NetworkImage(
                              //               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                              //           fit: BoxFit.fill,
                              //         ),
                              //       ),
                              //       //CachedNetworkImage(
                              //       //         imageUrl: "http://via.placeholder.com/350x150",
                              //       //         placeholder: (context, url) => CircularProgressIndicator(),
                              //       //         errorWidget: (context, url, error) => Icon(Icons.error),
                              //       //      ),
                              //       child: Lottie.network(
                              //         'https://lottie.host/722ec229-c3eb-4698-8a89-6ae23fad93ea/svf4Yjk3eL.json',
                              //         //fit: BoxFit.fill,
                              //         // 'https://lottie.host/8661be5e-217a-454f-ad46-ee845feaaf46/0A32qb5TKz.json',
                              //         // 'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                              //         //Lottie.asset(
                              //         //'assets/anim/developer.json',
                              //         width: size.width * 0.13,
                              //         height: size.height * 0.06,
                              //         repeat: true,
                              //         reverse: true,
                              //         animate: true,
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              ///
                              // Material(
                              //   borderRadius: BorderRadius.circular(10),
                              //   elevation: 4,
                              //   // surfaceTintColor: Colors.yellow,
                              //   color: Colors.cyanAccent,
                              //   shadowColor: Colors.white,
                              //   child: Container(
                              //     height: size.height * 0.065,
                              //     width: size.width * 0.12,
                              //     decoration: BoxDecoration(
                              //         color: Colors.cyanAccent,
                              //         borderRadius: BorderRadius.circular(10),
                              //         border: Border.all(color: Colors.white),
                              //         boxShadow: const [
                              //           BoxShadow(
                              //             color: Colors.white,
                              //             offset: Offset(3, 3),
                              //             blurRadius: 0,
                              //             spreadRadius: 0,
                              //           ),
                              //           BoxShadow(
                              //             color: Colors.red,
                              //             //offset: Offset(-1, -1),
                              //             blurRadius: 0,
                              //             spreadRadius: 0,
                              //           ),
                              //         ]),
                              //     child: Lottie.network(
                              //       'https://lottie.host/722ec229-c3eb-4698-8a89-6ae23fad93ea/svf4Yjk3eL.json',
                              //       // 'https://lottie.host/8661be5e-217a-454f-ad46-ee845feaaf46/0A32qb5TKz.json',
                              //       // 'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                              //       //Lottie.asset(
                              //       //'assets/anim/developer.json',
                              //       height: 200.0,
                              //       repeat: true,
                              //       reverse: true,
                              //       animate: true,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          _doctorHistoryController.foundDoctor.value.isEmpty
                              // Row(
                              //   children: [
                              //     Container(
                              //       decoration: new BoxDecoration(
                              //           borderRadius:
                              //               new BorderRadius.all(new Radius.circular(30.0)),
                              //           color: Colors.white),
                              //       width: size.width * 0.72,
                              //       height: size.height * 0.06,
                              //       margin: new EdgeInsets.fromLTRB(16, 20, 10, 20),
                              //       padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                              //       child: Theme(
                              //         data: Theme.of(context)
                              //             .copyWith(splashColor: Colors.transparent),
                              //         child: Obx(
                              //           () => (_doctorHistoryController.isLoading.value)
                              //               ? Center(child: CircularProgressIndicator())
                              //               : TextField(
                              //                   controller: _doctorHistoryController
                              //                      .appointmentController1,
                              //                   onTap: () {
                              //                     _doctorHistoryController.chooseDate();
                              //                   },
                              //                   autofocus: false,
                              //                   style: TextStyle(
                              //                       fontSize: 15.0, color: MyTheme.blueww,fontWeight: FontWeight.w800),
                              //                   decoration: InputDecoration(
                              //                     prefixIcon: Icon(Icons.search),
                              //                     filled: true,
                              //                     fillColor: Colors.white,
                              //                     hintText: 'dd-mm-yyyy',
                              //                     contentPadding: const EdgeInsets.only(
                              //                         left: 10.0, bottom: 12.0, top: 6.0),
                              //                     focusedBorder: OutlineInputBorder(
                              //                       borderSide: BorderSide(color: Colors.white),
                              //                       borderRadius: BorderRadius.circular(25.7),
                              //                     ),
                              //                     enabledBorder: UnderlineInputBorder(
                              //                       borderSide: BorderSide(color: Colors.white),
                              //                       borderRadius: BorderRadius.circular(25.7),
                              //                     ),
                              //                   ),
                              //                 ),
                              //         ),
                              //       ),
                              //     ),
                              //     Container(
                              //       height: size.height * 0.06,
                              //       width: size.width * 0.2,
                              //       decoration: BoxDecoration(
                              //         color: MyTheme.blueww,
                              //         borderRadius: BorderRadius.circular(30),
                              //       ),
                              //       child: Center(
                              //           child: Text(
                              //         'Search',
                              //         style: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: size.width * 0.035,
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //       )),
                              //     ),
                              //   ],
                              // ),
                              //Obx(
                              //     () => (_doctorHistoryController.isLoading.isFalse)
                              //     // ? Center(child: CircularProgressIndicator()
                              //     // )
                              // ?
                              // //     : _doctorHistoryController.getdoctorhospitalmodele ==
                              // //     null
                              // //     ? Center(
                              // //   child: Text('No List'),
                              // // )
                              // //
                              //     :
                              ? Center(
                                  child: Text('No List'),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _doctorHistoryController
                                          .foundDoctor.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03,
                                              vertical: size.height * 0.0005),
                                          child: Container(
                                            height: size.height * 0.33,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 30 / 7),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    lightPrimary,
                                                    darkPrimary,
                                                  ]),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(-2, -2),
                                                  spreadRadius: 1,
                                                  blurRadius: 4,
                                                  color: darkShadow,
                                                ),
                                                BoxShadow(
                                                  offset: Offset(2, 2),
                                                  spreadRadius: 1,
                                                  blurRadius: 4,
                                                  color: lightShadow,
                                                ),
                                              ],
                                              // image: DecorationImage(
                                              //     image: NetworkImage(
                                              //         'https://images.unsplash.com/photo-1621619856624-42fd193a0661?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                                              //     fit: BoxFit.cover)
                                            ),
                                            child: Column(
                                              children: [
                                                // SizedBox(
                                                //   height: size.height * 0.08,
                                                //   child: Container(
                                                //     height: size.height * 0.1,
                                                //     width: size.width * 0.16,
                                                //     decoration: BoxDecoration(
                                                //       color: Colors.yellow.shade200,
                                                //       shape: BoxShape.circle,
                                                //       image: DecorationImage(
                                                //         image: AssetImage(
                                                //             'lib/assets/background_stack_png/doctor20.png'),
                                                //         fit: BoxFit.cover,
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.22,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Doctor Name:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Specialist:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Service Date:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Time Slot:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Payment Date:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Paid Fees:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Location:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.22,
                                                        width:
                                                            size.width * 0.45,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              _doctorHistoryController
                                                                  .foundDoctor[
                                                                      index]
                                                                  .doctorName
                                                                  .toString()
                                                              // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].doctorName.toString()
                                                              //'Dr.Vineet Mishra',
                                                              ,
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.039),
                                                            ),
                                                            Text(
                                                              _doctorHistoryController
                                                                  .getdoctorhospitalmodele!
                                                                  .appointment![
                                                                      index]
                                                                  .specialistName
                                                                  .toString(),
                                                              //'22:37',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.039),
                                                            ),
                                                            SizedBox(
                                                              //height:
                                                              //size.height * 0.014,
                                                              width:
                                                                  size.width *
                                                                      0.24,
                                                              child: Center(
                                                                child: Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  _doctorHistoryController
                                                                      .foundDoctor[
                                                                          index]
                                                                      .appointmentDate
                                                                      .toString(),
                                                                  // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].appointmentDate.toString(),
                                                                  maxLines: 1,
                                                                  textScaleFactor:
                                                                      1.0,

                                                                  // 'Nov 16,22 - Nov 20,22',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.039),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.02,
                                                              width:
                                                                  size.width *
                                                                      0.41,
                                                              child: Center(
                                                                child: Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  _doctorHistoryController
                                                                      .foundDoctor[
                                                                          index]
                                                                      .slotTime
                                                                      .toString(),
                                                                  // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].appointmentDate.toString(),
                                                                  maxLines: 1,
                                                                  textScaleFactor:
                                                                      1.0,

                                                                  // 'Nov 16,22 - Nov 20,22',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.039),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.015,
                                                              width:
                                                                  size.width *
                                                                      0.24,
                                                              child: Center(
                                                                child: Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  _doctorHistoryController
                                                                      .foundDoctor[
                                                                          index]
                                                                      .paymentDate
                                                                      .toString(),
                                                                  // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].appointmentDate.toString(),
                                                                  maxLines: 1,
                                                                  textScaleFactor:
                                                                      1.0,

                                                                  // 'Nov 16,22 - Nov 20,22',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.039),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "₹ ${_doctorHistoryController.getdoctorhospitalmodele!.appointment![index].totalFee.toString()},",
                                                              //'Rs.500',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.039),
                                                            ),
                                                            Text(
                                                              _doctorHistoryController
                                                                  .getdoctorhospitalmodele!
                                                                  .appointment![
                                                                      index]
                                                                  .location
                                                                  .toString(),
                                                              // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].clinicAddress.toString(),
                                                              // 'B6 new ashok nagar delhi 110096',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.039),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: size.height * 0.07,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Material(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            elevation: 4,
                                                            // surfaceTintColor: Colors.yellow,
                                                            color: Colors
                                                                .cyanAccent,
                                                            shadowColor:
                                                                Colors.white,
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Future.delayed(
                                                                    Duration(
                                                                        milliseconds:
                                                                            200));

                                                                //Get.to(PdfPageLab(),
                                                                Get.to(
                                                                    () =>
                                                                        PdfPageDoctor(), //next page class

                                                                    /// Get.to(() => PdfPage(), //next page class
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            300), //duration of transitions, default 1 sec
                                                                    transition:
                                                                        // Transition.leftToRight //transition effect
                                                                        // Transition.fadeIn
                                                                        //Transition.size
                                                                        Transition
                                                                            .zoom);
                                                                // Get.to(WebViewPswebsite());
                                                              },
                                                              child: Container(
                                                                height:
                                                                    size.height *
                                                                        0.06,
                                                                width:
                                                                    size.width *
                                                                        0.12,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: Colors
                                                                            .cyanAccent,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .red),
                                                                        image:
                                                                            DecorationImage(
                                                                          image:
                                                                              NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                                                                          //fit: BoxFit.fitHeight,
                                                                        ),
                                                                        boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .red,
                                                                        offset: Offset(
                                                                            3,
                                                                            3),
                                                                        blurRadius:
                                                                            0,
                                                                        spreadRadius:
                                                                            0,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .red,
                                                                        //offset: Offset(-1, -1),
                                                                        blurRadius:
                                                                            0,
                                                                        spreadRadius:
                                                                            0,
                                                                      ),
                                                                    ]),
                                                                child: Lottie
                                                                    .network(
                                                                  'https://lottie.host/722ec229-c3eb-4698-8a89-6ae23fad93ea/svf4Yjk3eL.json',
                                                                  // 'https://lottie.host/8661be5e-217a-454f-ad46-ee845feaaf46/0A32qb5TKz.json',
                                                                  // 'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                                                                  //Lottie.asset(
                                                                  //'assets/anim/developer.json',
                                                                  height: 200.0,
                                                                  repeat: true,
                                                                  reverse: true,
                                                                  animate: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height:
                                                                size.height *
                                                                    0.04,
                                                            width: size.width *
                                                                0.15,
                                                            child: Material(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              elevation: 2,
                                                              // surfaceTintColor: Colors.yellow,
                                                              color: Colors
                                                                  .white38,
                                                              shadowColor:
                                                                  Colors.white,
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  SharedPreferences
                                                                      prefs =
                                                                      await SharedPreferences
                                                                          .getInstance();
                                                                  prefs.setString(
                                                                      "DoctorssId",
                                                                      "${_doctorHistoryController.getdoctorhospitalmodele!.appointment![index].id.toString()}");
                                                                  Get.dialog(
                                                                    AlertDialog(
                                                                      title: const Text(
                                                                          'Cancel Appointment ?'),
                                                                      content: const Text(
                                                                          'You Sure Want To Cancel your Appointment?\n'
                                                                          'If you delete this appointment then your amount will be refunded to your wallet.'),
                                                                      actions: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            TextButton(
                                                                              child: const Text(
                                                                                "Close",
                                                                                style: TextStyle(
                                                                                  color: Colors.green,
                                                                                ),
                                                                              ),
                                                                              onPressed: () => Get.back(),
                                                                            ),
                                                                            TextButton(
                                                                                child: const Text(
                                                                                  "Confirm",
                                                                                  style: TextStyle(
                                                                                    color: Colors.red,
                                                                                  ),
                                                                                ),
                                                                                onPressed: () => accountService.getAccountData.then((accountData) async {
                                                                                      CallLoader.loader();
                                                                                      await Timer(
                                                                                        const Duration(milliseconds: 1000),
                                                                                        () {
                                                                                          _doctorHistoryController.doctorListHospitalApi();
                                                                                          //  .skillsListApi();
                                                                                          _doctorHistoryController.update();

                                                                                          ///calling delete api...
                                                                                          _doctorHistoryController.deletedoctorhistoryApi();
                                                                                          Get.to(() => DoctorHistoryUser(
                                                                                              //id: "12345689"
                                                                                              ));
                                                                                          //Get.back();

                                                                                          //Get.to((page))
                                                                                          ///
                                                                                        },
                                                                                      );
                                                                                      CallLoader.hideLoader();
                                                                                    })
                                                                                //Get.back(),
                                                                                ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                                // onTap: () async {
                                                                //   //CallLoader.loader();
                                                                //   // await Future.delayed(Duration(milliseconds: 700));
                                                                //   //CallLoader.hideLoader();
                                                                //   //Get.to(PdfPageLab(),
                                                                //   //Get.to(() => PdfPageLab(), //next page class
                                                                //
                                                                //   /// Get.to(() => PdfPage(), //next page class
                                                                //   // duration: Duration(
                                                                //   //     milliseconds:
                                                                //   //     300), //duration of transitions, default 1 sec
                                                                //   // transition:
                                                                //   // // Transition.leftToRight //transition effect
                                                                //   // // Transition.fadeIn
                                                                //   // //Transition.size
                                                                //   // Transition.zoom);
                                                                //   // Get.to(WebViewPswebsite());
                                                                // },
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.04,
                                                                    width: size
                                                                            .width *
                                                                        0.15,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white38,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.red),
                                                                        // image: DecorationImage(
                                                                        //   image: NetworkImage(
                                                                        //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                                                                        //   //fit: BoxFit.fitHeight,
                                                                        // ),
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.red,
                                                                            offset:
                                                                                Offset(3, 3),
                                                                            blurRadius:
                                                                                0,
                                                                            spreadRadius:
                                                                                0,
                                                                          ),
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.red,
                                                                            //offset: Offset(-1, -1),
                                                                            blurRadius:
                                                                                0,
                                                                            spreadRadius:
                                                                                0,
                                                                          ),
                                                                        ]),
                                                                    child: const Center(
                                                                        child: Text(
                                                                            'Cancel')),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                    // Container(
                                                    //   height: size.height * 0.3,
                                                    //   width: size.width * 0.3,
                                                    //   decoration: BoxDecoration(
                                                    //     color: Colors.yellow.shade200,
                                                    //     shape: BoxShape.circle,
                                                    //     image: DecorationImage(
                                                    //       image: NetworkImage(
                                                    //           'https://images.unsplash.com/photo-1579154204601-01588f351e67?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
                                                    //           //'https://images.unsplash.com/photo-1630094556251-2a1e50b60e7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjEyfHxtZWRpY2luZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'
                                                    //           ),
                                                    //       fit: BoxFit.cover,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                          // ),
                        ],
                      ),
                    ),
              //  ),
            ),
            Obx(
              () => (_doctorHistoryController.isLoading.isFalse)
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
                      child: Column(
                        children: [
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: size.width * 0.05,
                          //       vertical: size.height * 0.0),
                          //   child: Row(
                          //     children: [
                          //       InkWell(
                          //         onTap: () {
                          //           Get.back();
                          //         },
                          //         child: Icon(
                          //           Icons.arrow_back_ios_outlined,
                          //           size: size.width * 0.05,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: size.width * 0.03,
                          //       ),
                          //       Text(
                          //         'Doctor History USER',
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: size.height * 0.02),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Row(
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(30.0)),
                                    color: Colors.white),
                                width: size.width * 0.94,
                                height: size.height * 0.055,
                                margin: new EdgeInsets.fromLTRB(10, 10, 10, 10),
                                padding: new EdgeInsets.fromLTRB(6, 6, 6, 6),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      splashColor: Colors.transparent),
                                  child: TextField(
                                    onChanged: (value) =>
                                        _doctorHistoryController
                                            .filterDoctor(value),
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 15.0, color: MyTheme.blueww),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Search Doctor..',
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
                              //
                              // InkWell(
                              //   onTap: () async {
                              //     CallLoader.loader();
                              //     await Future.delayed(Duration(milliseconds: 700));
                              //     CallLoader.hideLoader();
                              //     Get.to(WebViewPswebsite());
                              //   },
                              //   child: NeumorphicbuttonContainer(
                              //     color: Colors.white,
                              //     child: Container(
                              //       width: size.width * 0.13,
                              //       height: size.height * 0.06,
                              //       decoration: BoxDecoration(
                              //         color: Colors.white,
                              //         shape: BoxShape.circle,
                              //         image: DecorationImage(
                              //           image: NetworkImage(
                              //               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                              //           fit: BoxFit.fill,
                              //         ),
                              //       ),
                              //       //CachedNetworkImage(
                              //       //         imageUrl: "http://via.placeholder.com/350x150",
                              //       //         placeholder: (context, url) => CircularProgressIndicator(),
                              //       //         errorWidget: (context, url, error) => Icon(Icons.error),
                              //       //      ),
                              //       child: Lottie.network(
                              //         'https://lottie.host/722ec229-c3eb-4698-8a89-6ae23fad93ea/svf4Yjk3eL.json',
                              //         //fit: BoxFit.fill,
                              //         // 'https://lottie.host/8661be5e-217a-454f-ad46-ee845feaaf46/0A32qb5TKz.json',
                              //         // 'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                              //         //Lottie.asset(
                              //         //'assets/anim/developer.json',
                              //         width: size.width * 0.13,
                              //         height: size.height * 0.06,
                              //         repeat: true,
                              //         reverse: true,
                              //         animate: true,
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              ///
                              // Material(
                              //   borderRadius: BorderRadius.circular(10),
                              //   elevation: 4,
                              //   // surfaceTintColor: Colors.yellow,
                              //   color: Colors.cyanAccent,
                              //   shadowColor: Colors.white,
                              //   child: Container(
                              //     height: size.height * 0.065,
                              //     width: size.width * 0.12,
                              //     decoration: BoxDecoration(
                              //         color: Colors.cyanAccent,
                              //         borderRadius: BorderRadius.circular(10),
                              //         border: Border.all(color: Colors.white),
                              //         boxShadow: const [
                              //           BoxShadow(
                              //             color: Colors.white,
                              //             offset: Offset(3, 3),
                              //             blurRadius: 0,
                              //             spreadRadius: 0,
                              //           ),
                              //           BoxShadow(
                              //             color: Colors.red,
                              //             //offset: Offset(-1, -1),
                              //             blurRadius: 0,
                              //             spreadRadius: 0,
                              //           ),
                              //         ]),
                              //     child: Lottie.network(
                              //       'https://lottie.host/722ec229-c3eb-4698-8a89-6ae23fad93ea/svf4Yjk3eL.json',
                              //       // 'https://lottie.host/8661be5e-217a-454f-ad46-ee845feaaf46/0A32qb5TKz.json',
                              //       // 'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                              //       //Lottie.asset(
                              //       //'assets/anim/developer.json',
                              //       height: 200.0,
                              //       repeat: true,
                              //       reverse: true,
                              //       animate: true,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          _doctorHistoryController.foundDoctor.value.isEmpty
                              // Row(
                              //   children: [
                              //     Container(
                              //       decoration: new BoxDecoration(
                              //           borderRadius:
                              //               new BorderRadius.all(new Radius.circular(30.0)),
                              //           color: Colors.white),
                              //       width: size.width * 0.72,
                              //       height: size.height * 0.06,
                              //       margin: new EdgeInsets.fromLTRB(16, 20, 10, 20),
                              //       padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                              //       child: Theme(
                              //         data: Theme.of(context)
                              //             .copyWith(splashColor: Colors.transparent),
                              //         child: Obx(
                              //           () => (_doctorHistoryController.isLoading.value)
                              //               ? Center(child: CircularProgressIndicator())
                              //               : TextField(
                              //                   controller: _doctorHistoryController
                              //                      .appointmentController1,
                              //                   onTap: () {
                              //                     _doctorHistoryController.chooseDate();
                              //                   },
                              //                   autofocus: false,
                              //                   style: TextStyle(
                              //                       fontSize: 15.0, color: MyTheme.blueww,fontWeight: FontWeight.w800),
                              //                   decoration: InputDecoration(
                              //                     prefixIcon: Icon(Icons.search),
                              //                     filled: true,
                              //                     fillColor: Colors.white,
                              //                     hintText: 'dd-mm-yyyy',
                              //                     contentPadding: const EdgeInsets.only(
                              //                         left: 10.0, bottom: 12.0, top: 6.0),
                              //                     focusedBorder: OutlineInputBorder(
                              //                       borderSide: BorderSide(color: Colors.white),
                              //                       borderRadius: BorderRadius.circular(25.7),
                              //                     ),
                              //                     enabledBorder: UnderlineInputBorder(
                              //                       borderSide: BorderSide(color: Colors.white),
                              //                       borderRadius: BorderRadius.circular(25.7),
                              //                     ),
                              //                   ),
                              //                 ),
                              //         ),
                              //       ),
                              //     ),
                              //     Container(
                              //       height: size.height * 0.06,
                              //       width: size.width * 0.2,
                              //       decoration: BoxDecoration(
                              //         color: MyTheme.blueww,
                              //         borderRadius: BorderRadius.circular(30),
                              //       ),
                              //       child: Center(
                              //           child: Text(
                              //         'Search',
                              //         style: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: size.width * 0.035,
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //       )),
                              //     ),
                              //   ],
                              // ),
                              //Obx(
                              //     () => (_doctorHistoryController.isLoading.isFalse)
                              //     // ? Center(child: CircularProgressIndicator()
                              //     // )
                              // ?
                              // //     : _doctorHistoryController.getdoctorhospitalmodele ==
                              // //     null
                              // //     ? Center(
                              // //   child: Text('No List'),
                              // // )
                              // //
                              //     :
                              ? Center(
                                  child: Text('No List'),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _doctorHistoryController
                                          .foundDoctor.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var itemnumber =
                                            _doctorHistoryController
                                                .foundDoctor[index]
                                                .mobileNumber;
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03,
                                              vertical: size.height * 0.0005),
                                          child: Container(
                                            height: size.height * 0.33,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 30 / 7),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    lightPrimary,
                                                    darkPrimary,
                                                  ]),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(-2, -2),
                                                  spreadRadius: 1,
                                                  blurRadius: 4,
                                                  color: darkShadow,
                                                ),
                                                BoxShadow(
                                                  offset: Offset(2, 2),
                                                  spreadRadius: 1,
                                                  blurRadius: 4,
                                                  color: lightShadow,
                                                ),
                                              ],
                                              // image: DecorationImage(
                                              //     image: NetworkImage(
                                              //         'https://images.unsplash.com/photo-1621619856624-42fd193a0661?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                                              //     fit: BoxFit.cover)
                                            ),
                                            child: Column(
                                              children: [
                                                // SizedBox(
                                                //   height: size.height * 0.08,
                                                //   child: Container(
                                                //     height: size.height * 0.1,
                                                //     width: size.width * 0.16,
                                                //     decoration: BoxDecoration(
                                                //       color: Colors.yellow.shade200,
                                                //       shape: BoxShape.circle,
                                                //       image: DecorationImage(
                                                //         image: AssetImage(
                                                //             'lib/assets/background_stack_png/doctor20.png'),
                                                //         fit: BoxFit.cover,
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.22,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Doctor Name:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Specialist:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Service Date:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Time Slot:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Payment Date:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Paid Fees:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Location:',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: MyTheme
                                                                    .containercolor01,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.22,
                                                        width:
                                                            size.width * 0.45,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              _doctorHistoryController
                                                                  .foundDoctor[
                                                                      index]
                                                                  .doctorName
                                                                  .toString()
                                                              // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].doctorName.toString()
                                                              //'Dr.Vineet Mishra',
                                                              ,
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.039),
                                                            ),
                                                            Text(
                                                              _doctorHistoryController
                                                                  .getdoctorhospitalmodele!
                                                                  .appointment![
                                                                      index]
                                                                  .specialistName
                                                                  .toString(),
                                                              //'22:37',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.039),
                                                            ),
                                                            SizedBox(
                                                              //height:
                                                              //size.height * 0.014,
                                                              width:
                                                                  size.width *
                                                                      0.24,
                                                              child: Center(
                                                                child: Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  _doctorHistoryController
                                                                      .foundDoctor[
                                                                          index]
                                                                      .appointmentDate
                                                                      .toString(),
                                                                  // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].appointmentDate.toString(),
                                                                  maxLines: 1,
                                                                  textScaleFactor:
                                                                      1.0,

                                                                  // 'Nov 16,22 - Nov 20,22',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.039),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.02,
                                                              width:
                                                                  size.width *
                                                                      0.41,
                                                              child: Center(
                                                                child: Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  _doctorHistoryController
                                                                      .foundDoctor[
                                                                          index]
                                                                      .slotTime
                                                                      .toString(),
                                                                  // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].appointmentDate.toString(),
                                                                  maxLines: 1,
                                                                  textScaleFactor:
                                                                      1.0,

                                                                  // 'Nov 16,22 - Nov 20,22',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.039),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.015,
                                                              width:
                                                                  size.width *
                                                                      0.24,
                                                              child: Center(
                                                                child: Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  _doctorHistoryController
                                                                      .foundDoctor[
                                                                          index]
                                                                      .paymentDate
                                                                      .toString(),
                                                                  // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].appointmentDate.toString(),
                                                                  maxLines: 1,
                                                                  textScaleFactor:
                                                                      1.0,

                                                                  // 'Nov 16,22 - Nov 20,22',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.039),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "₹ ${_doctorHistoryController.getdoctorhospitalmodele!.appointment![index].totalFee.toString()},",
                                                              //'Rs.500',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.039),
                                                            ),
                                                            Text(
                                                              _doctorHistoryController
                                                                  .getdoctorhospitalmodele!
                                                                  .appointment![
                                                                      index]
                                                                  .location
                                                                  .toString(),
                                                              // _doctorHistoryController.getdoctorhospitalmodele!.appointment[index].clinicAddress.toString(),
                                                              // 'B6 new ashok nagar delhi 110096',
                                                              style: GoogleFonts.raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.039),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: size.height * 0.07,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Material(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            elevation: 4,
                                                            // surfaceTintColor: Colors.yellow,
                                                            color: Colors
                                                                .cyanAccent,
                                                            shadowColor:
                                                                Colors.white,
                                                            child: InkWell(
                                                              onTap: () async {
                                                                CallLoader
                                                                    .loader();
                                                                await Future.delayed(
                                                                    Duration(
                                                                        milliseconds:
                                                                            700));
                                                                CallLoader
                                                                    .hideLoader();
                                                                //Get.to(PdfPageLab(),
                                                                Get.to(
                                                                    () =>
                                                                        PdfPageDoctor(), //next page class

                                                                    /// Get.to(() => PdfPage(), //next page class
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            300), //duration of transitions, default 1 sec
                                                                    transition:
                                                                        // Transition.leftToRight //transition effect
                                                                        // Transition.fadeIn
                                                                        //Transition.size
                                                                        Transition
                                                                            .zoom);
                                                                // Get.to(WebViewPswebsite());
                                                              },
                                                              child: Container(
                                                                height:
                                                                    size.height *
                                                                        0.06,
                                                                width:
                                                                    size.width *
                                                                        0.12,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: Colors
                                                                            .cyanAccent,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .red),
                                                                        image:
                                                                            DecorationImage(
                                                                          image:
                                                                              NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                                                                          //fit: BoxFit.fitHeight,
                                                                        ),
                                                                        boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .red,
                                                                        offset: Offset(
                                                                            3,
                                                                            3),
                                                                        blurRadius:
                                                                            0,
                                                                        spreadRadius:
                                                                            0,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .red,
                                                                        //offset: Offset(-1, -1),
                                                                        blurRadius:
                                                                            0,
                                                                        spreadRadius:
                                                                            0,
                                                                      ),
                                                                    ]),
                                                                child: Lottie
                                                                    .network(
                                                                  'https://lottie.host/722ec229-c3eb-4698-8a89-6ae23fad93ea/svf4Yjk3eL.json',
                                                                  // 'https://lottie.host/8661be5e-217a-454f-ad46-ee845feaaf46/0A32qb5TKz.json',
                                                                  // 'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                                                                  //Lottie.asset(
                                                                  //'assets/anim/developer.json',
                                                                  height: 200.0,
                                                                  repeat: true,
                                                                  reverse: true,
                                                                  animate: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height:
                                                                size.height *
                                                                    0.04,
                                                            width: size.width *
                                                                0.15,
                                                            child: Material(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              elevation: 2,
                                                              // surfaceTintColor: Colors.yellow,
                                                              color: Colors
                                                                  .white38,
                                                              shadowColor:
                                                                  Colors.white,
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  SharedPreferences
                                                                      prefs =
                                                                      await SharedPreferences
                                                                          .getInstance();
                                                                  prefs.setString(
                                                                      "DoctorssId",
                                                                      "${_doctorHistoryController.getdoctorhospitalmodele!.appointment![index].id}");
                                                                  Get.dialog(
                                                                    AlertDialog(
                                                                      title: const Text(
                                                                          'Cancel Appointment ?'),
                                                                      content: const Text(
                                                                          'You Sure Want To Cancel your Appointment?\n'
                                                                          'If you delete this appointment then your amount will be refunded to your wallet.'),
                                                                      actions: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            TextButton(
                                                                              child: const Text(
                                                                                "Close",
                                                                                style: TextStyle(
                                                                                  color: Colors.green,
                                                                                ),
                                                                              ),
                                                                              onPressed: () => Get.back(),
                                                                            ),
                                                                            TextButton(
                                                                                child: const Text(
                                                                                  "Confirm",
                                                                                  style: TextStyle(
                                                                                    color: Colors.red,
                                                                                  ),
                                                                                ),
                                                                                onPressed: () => accountService.getAccountData.then((accountData) {
                                                                                      Timer(
                                                                                        const Duration(milliseconds: 200),
                                                                                        () {
                                                                                          _doctorHistoryController.doctorListHospitalApi();
                                                                                          //  .skillsListApi();
                                                                                          _doctorHistoryController.update();

                                                                                          ///calling delete api...
                                                                                          _doctorHistoryController.deletedoctorhistoryApi();
                                                                                          Get.to(() => DoctorHistoryUser(
                                                                                              //  id: "12345689"
                                                                                              ));
                                                                                          Get.back();

                                                                                          //Get.to((page))
                                                                                          ///
                                                                                        },
                                                                                      );
                                                                                    })
                                                                                //Get.back(),
                                                                                ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                                // onTap: () async {
                                                                //   //CallLoader.loader();
                                                                //   // await Future.delayed(Duration(milliseconds: 700));
                                                                //   //CallLoader.hideLoader();
                                                                //   //Get.to(PdfPageLab(),
                                                                //   //Get.to(() => PdfPageLab(), //next page class
                                                                //
                                                                //   /// Get.to(() => PdfPage(), //next page class
                                                                //   // duration: Duration(
                                                                //   //     milliseconds:
                                                                //   //     300), //duration of transitions, default 1 sec
                                                                //   // transition:
                                                                //   // // Transition.leftToRight //transition effect
                                                                //   // // Transition.fadeIn
                                                                //   // //Transition.size
                                                                //   // Transition.zoom);
                                                                //   // Get.to(WebViewPswebsite());
                                                                // },
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.04,
                                                                    width: size
                                                                            .width *
                                                                        0.15,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white38,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.red),
                                                                        // image: DecorationImage(
                                                                        //   image: NetworkImage(
                                                                        //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                                                                        //   //fit: BoxFit.fitHeight,
                                                                        // ),
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.red,
                                                                            offset:
                                                                                Offset(3, 3),
                                                                            blurRadius:
                                                                                0,
                                                                            spreadRadius:
                                                                                0,
                                                                          ),
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.red,
                                                                            //offset: Offset(-1, -1),
                                                                            blurRadius:
                                                                                0,
                                                                            spreadRadius:
                                                                                0,
                                                                          ),
                                                                        ]),
                                                                    child: const Center(
                                                                        child: Text(
                                                                            'Cancel')),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          ///todo: call button....
                                                          ElevatedButton.icon(
                                                              onPressed: () {
                                                                _callNumber(_doctorHistoryController
                                                                    .getdoctorhospitalmodele!
                                                                    .appointment![
                                                                        index]
                                                                    .mobileNumber
                                                                    .toString());
                                                              },
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(Colors
                                                                          .green
                                                                          .shade500),
                                                                  padding: MaterialStateProperty.all(
                                                                      EdgeInsets
                                                                          .all(
                                                                              6)),
                                                                  textStyle: MaterialStateProperty.all(
                                                                      TextStyle(
                                                                          fontSize:
                                                                              16))),
                                                              icon: Icon(Icons
                                                                  .call_rounded),
                                                              label:
                                                                  Text('Call')),
                                                        ],
                                                      ),
                                                    )
                                                    // Container(
                                                    //   height: size.height * 0.3,
                                                    //   width: size.width * 0.3,
                                                    //   decoration: BoxDecoration(
                                                    //     color: Colors.yellow.shade200,
                                                    //     shape: BoxShape.circle,
                                                    //     image: DecorationImage(
                                                    //       image: NetworkImage(
                                                    //           'https://images.unsplash.com/photo-1579154204601-01588f351e67?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
                                                    //           //'https://images.unsplash.com/photo-1630094556251-2a1e50b60e7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjEyfHxtZWRpY2luZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'
                                                    //           ),
                                                    //       fit: BoxFit.cover,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                          // ),
                        ],
                      ),
                    ),
              //  ),
            ),
          ],
        ),
      ),
    );
  }

  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    //String number = "34342222";

    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
