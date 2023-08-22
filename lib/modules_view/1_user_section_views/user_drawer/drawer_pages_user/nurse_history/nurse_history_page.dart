import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/invoice_views/page/pdf_page_nurse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/drawer_contoller/nurse_history_controller/nurse_history_controllerss.dart';
import '../../../../../utils/services/account_service.dart';

class NurseHistoryUser extends StatelessWidget {
  NurseHistoryUser({Key? key}) : super(key: key);

  NurseHistoryController _nurseHistoryController =
      Get.put(NurseHistoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Obx(
        () => (_nurseHistoryController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: size.width * 0.05,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.27,
                          ),
                          Text(
                            'Nurse History',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.02),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(30.0)),
                              color: Colors.white),
                          width: size.width * 0.88,
                          height: size.height * 0.06,
                          margin: new EdgeInsets.fromLTRB(20, 2, 20, 20),
                          padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child: TextField(
                              onChanged: (value) =>
                                  _nurseHistoryController.filterNurse(value),
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: MyTheme.blueww),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search Nurse..',
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
                        // Material(
                        //   borderRadius: BorderRadius.circular(10),
                        //   elevation: 4,
                        //   // surfaceTintColor: Colors.yellow,
                        //   color: Colors.cyanAccent,
                        //   shadowColor: Colors.white,
                        //   child: InkWell(
                        //     onTap: () async {
                        //       //CallLoader.loader();
                        //       //await Future.delayed(Duration(milliseconds: 700));
                        //       //CallLoader.hideLoader();
                        //       //Get.to(WebViewPswebsite());
                        //     },
                        //     child: Container(
                        //       height: size.height * 0.06,
                        //       width: size.width * 0.12,
                        //       decoration: BoxDecoration(
                        //           color: Colors.cyanAccent,
                        //           borderRadius: BorderRadius.circular(10),
                        //           border: Border.all(color: Colors.deepOrange),
                        //           image: DecorationImage(
                        //             image: NetworkImage(
                        //                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                        //             //fit: BoxFit.fitHeight,
                        //           ),
                        //           boxShadow: const [
                        //             BoxShadow(
                        //               color: Colors.deepOrange,
                        //               offset: Offset(3, 3),
                        //               blurRadius: 0,
                        //               spreadRadius: 0,
                        //             ),
                        //             BoxShadow(
                        //               color: Colors.red,
                        //               //offset: Offset(-1, -1),
                        //               blurRadius: 0,
                        //               spreadRadius: 0,
                        //             ),
                        //           ]),
                        //       child: Lottie.network(
                        //         'https://lottie.host/722ec229-c3eb-4698-8a89-6ae23fad93ea/svf4Yjk3eL.json',
                        //         // 'https://lottie.host/8661be5e-217a-454f-ad46-ee845feaaf46/0A32qb5TKz.json',
                        //         // 'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                        //         //Lottie.asset(
                        //         //'assets/anim/developer.json',
                        //         height: 200.0,
                        //         repeat: true,
                        //         reverse: true,
                        //         animate: true,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    _nurseHistoryController.foundNurse.value.isEmpty

                        // Row(
                        //   children: [
                        //     Container(
                        //       decoration: new BoxDecoration(
                        //           borderRadius:
                        //               new BorderRadius.all(new Radius.circular(30.0)),
                        //           color: Colors.white),
                        //       width: size.width * 0.72,
                        //       height: size.height * 0.06,
                        //       margin: new EdgeInsets.fromLTRB(15, 20, 10, 20),
                        //       padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                        //       child: Theme(
                        //         data: Theme.of(context)
                        //             .copyWith(splashColor: Colors.transparent),
                        //         child: Obx(
                        //           () => (_nurseHistoryController.isLoading.value)
                        //               ? Center(child: CircularProgressIndicator())
                        //               : TextField(
                        //                   controller: _nurseHistoryController
                        //                       .appointmentController1,
                        //                   onTap: () {
                        //                     _nurseHistoryController.chooseDate();
                        //                   },
                        //                   autofocus: false,
                        //                   style: TextStyle(
                        //                       fontSize: 15.0, color: MyTheme.blueww),
                        //                   decoration: InputDecoration(
                        //                     prefixIcon: Icon(Icons.search),
                        //                     filled: true,
                        //                     fillColor: Colors.white,
                        //                     hintText: 'dd-mm-yyyy',
                        //                     contentPadding: const EdgeInsets.only(
                        //                         left: 10.0, bottom: 12.0, top: 0.0),
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
                        // Obx(
                        //   () => (_nurseHistoryController.isLoading.value)
                        //       ? Center(child: CircularProgressIndicator())
                        //       : _nurseHistoryController
                        //                   .nurseappointmentdetail?.nurseAppointments ==
                        //               null
                        ? Center(
                            child: Text('No List'),
                          )
                        : Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    _nurseHistoryController.foundNurse?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.0005),
                                    child: Container(
                                      /// height: size.height * 0.37,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 30 / 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
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
                                        //         'https://images.unsplash.com/photo-1605214178469-178b98bb29fb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG51cnNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                        //         //'https://images.unsplash.com/photo-1590105577767-e21a1067899f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1828&q=80'
                                        //         // 'https://images.unsplash.com/photo-1577285930803-df9418bede68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTIwfHxsYWJvcmF0b3J5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                        //         // 'https://images.unsplash.com/photo-1576086213369-97a306d36557?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjF8fGxhYm9yYXRvcnl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'
                                        //         // 'https://images.unsplash.com/photo-1613843596852-9a6317dae0b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80'
                                        //         // 'https://images.unsplash.com/photo-1587854680352-936b22b91030?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fG1lZGljaW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                        //         // 'https://images.unsplash.com/photo-1628595351029-c2bf17511435?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG1lZGljaW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                        //         ),
                                        //     fit: BoxFit.cover)
                                      ),
                                      child: Column(
                                        children: [
                                          // SizedBox(
                                          //   height: size.height * 0.11,
                                          //   child: Container(
                                          //     height: size.height * 0.3,
                                          //     width: size.width * 0.3,
                                          //     decoration: BoxDecoration(
                                          //       color: Colors.yellow.shade200,
                                          //       shape: BoxShape.circle,
                                          //       image: DecorationImage(
                                          //         image: NetworkImage(
                                          //             'https://images.unsplash.com/photo-1527613426441-4da17471b66d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG51cnNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                          //             //'https://images.unsplash.com/photo-1590105577767-e21a1067899f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1828&q=80'
                                          //             //'https://images.unsplash.com/photo-1579154204601-01588f351e67?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
                                          //             //'https://images.unsplash.com/photo-1630094556251-2a1e50b60e7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjEyfHxtZWRpY2luZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'
                                          //             ),
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
                                                  height: size.height * 0.22,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Nurse Name:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Location:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Request Date:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Accepting Date:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Payment Date',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Paid Fees:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                      Text(
                                                        'No of day:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme
                                                              .containercolor01,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.039,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.22,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${_nurseHistoryController.foundNurse![index].nurseName.toString()}"
                                                        // 'okokokokok',
                                                        ,
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.45,
                                                        height:
                                                            size.height * 0.025,
                                                        child: Text(
                                                          _nurseHistoryController
                                                              .foundNurse[index]
                                                              .location
                                                              .toString(),
                                                          // 'okokokokok',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.039),
                                                        ),
                                                      ),
                                                      Text(
                                                        _nurseHistoryController
                                                            .foundNurse[index]
                                                            .startDate
                                                            .toString(),
                                                        //'Nov 16,22',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      Text(
                                                        _nurseHistoryController
                                                            .foundNurse[index]
                                                            .endDate
                                                            .toString(),

                                                        // 'Nov 17,22',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      Text(
                                                        _nurseHistoryController
                                                            .foundNurse[index]
                                                            .paymentDate
                                                            .toString(),
                                                        // 'okokokokok',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      Text(
                                                        _nurseHistoryController
                                                            .foundNurse[index]
                                                            .totalFee
                                                            .toString(),

                                                        //'Rs.1200',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                      Text(
                                                        _nurseHistoryController
                                                            .foundNurse[index]
                                                            .totalNumberofdays
                                                            .toString(),
                                                        //'12',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.039),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height: size.height * 0.1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Material(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      elevation: 4,
                                                      // surfaceTintColor: Colors.yellow,
                                                      color: Colors.cyanAccent,
                                                      shadowColor: Colors.white,
                                                      child: InkWell(
                                                        onTap: () async {
                                                          CallLoader.loader();
                                                          await Future.delayed(
                                                              Duration(
                                                                  milliseconds:
                                                                      700));
                                                          CallLoader
                                                              .hideLoader();
                                                          //Get.to(PdfPageLab(),
                                                          Get.to(
                                                              () =>
                                                                  PdfPageNurse(), //next page class
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
                                                          height: size.height *
                                                              0.06,
                                                          width:
                                                              size.width * 0.12,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .cyanAccent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .red),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: NetworkImage(
                                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                                                                    //fit: BoxFit.fitHeight,
                                                                  ),
                                                                  boxShadow: const [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .red,
                                                                  offset:
                                                                      Offset(
                                                                          3, 3),
                                                                  blurRadius: 0,
                                                                  spreadRadius:
                                                                      0,
                                                                ),
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .red,
                                                                  //offset: Offset(-1, -1),
                                                                  blurRadius: 0,
                                                                  spreadRadius:
                                                                      0,
                                                                ),
                                                              ]),
                                                          child: Lottie.network(
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
                                                          size.height * 0.04,
                                                      width: size.width * 0.15,
                                                      child: Material(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        elevation: 2,
                                                        // surfaceTintColor: Colors.yellow,
                                                        color: Colors.white38,
                                                        shadowColor:
                                                            Colors.white,
                                                        child: InkWell(
                                                          onTap: () async {
                                                            SharedPreferences
                                                                prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            prefs.setString(
                                                                "NurseessId",
                                                                "${_nurseHistoryController.foundNurse[index].id.toString()}");
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
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      TextButton(
                                                                        child:
                                                                            const Text(
                                                                          "Close",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.green,
                                                                          ),
                                                                        ),
                                                                        onPressed:
                                                                            () =>
                                                                                Get.back(),
                                                                      ),
                                                                      TextButton(
                                                                          child:
                                                                              const Text(
                                                                            "Confirm",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.red,
                                                                            ),
                                                                          ),
                                                                          onPressed: () =>
                                                                              accountService.getAccountData.then((accountData) {
                                                                                Timer(
                                                                                  const Duration(milliseconds: 200),
                                                                                  () {
                                                                                    _nurseHistoryController.nursehistoryApi();
                                                                                    //  .skillsListApi();
                                                                                    _nurseHistoryController.update();

                                                                                    ///calling delete api...
                                                                                    _nurseHistoryController.deletenurseehistoryApi();
                                                                                    Get.to(() => NurseHistoryUser());
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
                                                            child: Container(
                                                              height:
                                                                  size.height *
                                                                      0.04,
                                                              width:
                                                                  size.width *
                                                                      0.15,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white38,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .red),
                                                                  // image: DecorationImage(
                                                                  //   image: NetworkImage(
                                                                  //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5UX-5262FvS9AkNpnPst9lZon1ZET11ncXw&usqp=CAU'),
                                                                  //   //fit: BoxFit.fitHeight,
                                                                  // ),
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .red,
                                                                      offset:
                                                                          Offset(
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
                  ],
                ),
              ),
      ),
    );
  }
}
