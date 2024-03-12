import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/invoice_views/invoice_nurse/page_nurse/nrs_page_invoice.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
//import 'package:ps_welness_new_ui/modules_view/invoice_views/page/pdf_page_nurse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/drawer_contoller/nurse_history_controller/nurse_history_controllerss.dart';
import '../../../../../notificationservice/local_notification_service.dart';
import '../../../../../notificationservice/notification_fb_service.dart';
import '../../../../../utils/services/account_service.dart';
//import '../../../invoice_views/page/pdf_page_nurse.dart';

class NurseHistoryUser extends StatefulWidget {
  //final String id;

  NurseHistoryUser({Key? key}) : super(key: key);

  @override
  State<NurseHistoryUser> createState() => _NurseHistoryUserState();
}

class _NurseHistoryUserState extends State<NurseHistoryUser> {
  NurseHistoryController _nurseHistoryController =
      Get.put(NurseHistoryController());

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
        }
      },
    );
    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");

          ///you can call local notification....
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

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
                                                        'Start Date:',
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
                                                        'End Date:',
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
                                                        'Booking Date',
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
                                                            size.height * 0.026,
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
                                                                      0.027),
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
                                                          _nurseHistoryController
                                                              .nursehistoryApi();
                                                          _nurseHistoryController
                                                              .update();
                                                          _nurseHistoryController
                                                              .onInit();
                                                          SharedPreferences
                                                              prefs =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          prefs.setString(
                                                              "NurseInvoiceNo",
                                                              "${_nurseHistoryController.foundNurse[index].invoiceNumber.toString()}");
                                                          // CallLoader.loader();
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
                                                                                  () async {
                                                                                    _nurseHistoryController.nursehistoryApi();
                                                                                    //  .skillsListApi();
                                                                                    _nurseHistoryController.update();

                                                                                    ///calling delete api...
                                                                                    _nurseHistoryController.deletenurseehistoryApi();

                                                                                    ///todo: firebase messages......
                                                                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                                    prefs.setString("NrDeviceids", "${_nurseHistoryController.foundNurse?[index].deviceId}");
                                                                                    //  "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}");

                                                                                    prefs.setString("Nruseids", "${_nurseHistoryController.foundNurse?[index].id}");

                                                                                    notificationServices.getDeviceToken().then((value) async {
                                                                                      var data = {
                                                                                        ///not same controller
                                                                                        //this the particular device id.....
                                                                                        'to':
                                                                                            //"df_xO9RNRvicZkE9JxMPV7:APA91bFkZmPaBORZLPUSLNAxN3xDWVbZe60YHzqwAet8GvAh2AqhMRRci0Ia5bYYJHiaU9KGep8uhfnADGl4xDKDnzefJu4nZt5_w9JeMwsTqJnO80osctPN1uvlFAN9hVVpplLZs_Ay",
                                                                                            //"fMPtWMb5QUebGlV5QqHGnk:APA91bG8u4GG0JBUhazLdS3QiVMxJ1MEpg_b-1NyVcJaznD3TDJ3q1YChOZtzHL_L_InZrIvawkTRWJQQJE8mmIQSaFzbq-0rMVvRQFd_QV2zB4-tYLXtMroycPZvxTTvjnl9Q5PvsJc",
                                                                                            "${_nurseHistoryController.foundNurse?[index].deviceId}",

                                                                                        //"${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}",

                                                                                        //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                                                        //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                                                        //.toString(),

                                                                                        ///this is same device token....
                                                                                        //value
                                                                                        //.toString(),
                                                                                        'notification': {
                                                                                          'title': 'Ps_Wellness User',
                                                                                          'body': 'Your Booking has been Canceled by user.',
                                                                                          //"sound": "jetsons_doorbell.mp3"
                                                                                        },
                                                                                        'android': {
                                                                                          'notification': {
                                                                                            'notification_count': 23,
                                                                                          },
                                                                                        },
                                                                                        // 'data': {
                                                                                        //   'type': 'cancel_case_doctor',
                                                                                        //   'id': '12345689'
                                                                                        // }
                                                                                      };
                                                                                      // print("dataccept:${data}");

                                                                                      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'), body: jsonEncode(data), headers: {
                                                                                        'Content-Type': 'application/json; charset=UTF-8',
                                                                                        'Authorization':
                                                                                            //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                                                            'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                                                      }).then((value) {
                                                                                        if (kDebugMode) {
                                                                                          print("princedriver${value.body.toString()}");
                                                                                        }
                                                                                      }).onError((error, stackTrace) {
                                                                                        if (kDebugMode) {
                                                                                          print(error);
                                                                                        }
                                                                                      });
                                                                                      CallLoader.loader();
                                                                                      await Future.delayed(Duration(seconds: 1));
                                                                                      await accountService.getAccountData.then((accountData) {
                                                                                        Timer(
                                                                                          const Duration(seconds: 0),
                                                                                          () {
                                                                                            //Get.offAll(UserHomePage());
                                                                                            //Get.to((page))
                                                                                            ///
                                                                                          },
                                                                                        );
                                                                                      });
                                                                                    });

                                                                                    // Get.to(() => NurseHistoryUser(
                                                                                    //     // id: "1234568911",
                                                                                    //     ));
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

                                                        ///
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
