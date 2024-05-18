import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:maps_launcher/maps_launcher.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers/driver_complete_ride_controller/driver_complete_ride_controller.dart';
import 'package:ps_welness_new_ui/notificationservice/notification_fb_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/my_theme.dart';
import '../../../notificationservice/local_notification_service.dart';
import '../../../utils/services/account_service.dart';

String PatientRegNo = ''.toString();
String DriverId = ''.toString();

class OngoingRideTracking extends StatefulWidget {
  final String id;

  const OngoingRideTracking({Key? key, required this.id}) : super(key: key);

  @override
  State<OngoingRideTracking> createState() => _OngoingRideTrackingState();
}

class _OngoingRideTrackingState extends State<OngoingRideTracking> {
  //DriverPayoutController _driverPayoutController =
  // AmbulancegetController _ambulancegetController =
  //     Get.put(AmbulancegetController());

  String PatientRegNo = ''.toString();
  String userPassword = ''.toString();
  String AdminLogin_Id = ''.toString();
  NotificationServices notificationServices = NotificationServices();

  OngoingRideController _ongoingRideController =
      Get.put(OngoingRideController());

  ///NavController _navcontroller = Get.put(NavController(), permanent: true);

  /// AmbulanceOrderpaymentController _ambulanceOrderpaymentController =
  ///Get.put(AmbulanceOrderpaymentController());

  //Wallet_2_Controller _walletPostController = Get.put(Wallet_2_Controller());

  ///implement firebase....27...jun..2023
  @override
  void initState() {
    super.initState();

    ///
    //  _driverAcceptlistController.driveracceptuserDetailApi();
    // _driverAcceptlistController.update();

    ///
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    // notificationServices.requestNotificationPermission();
    // notificationServices.isTokenRefresh();
    // notificationServices.firebaseInit();

    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
      // print('device token');
      // print(value);
    });

    /// 1. This method call when app in terminated state and you get a notification
    /// when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
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

          ///you can call local notification........
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

  // get kButtonAnimationDuration => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //var base = 'http://test.pswellness.in/Images/';

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    Widget titleBox(String title) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(title,
              style: TextStyle(color: colorScheme.onInverseSurface)),
        ),
      );
    }

    ///todo:user start lat
    final usersatartlat =
        (_ongoingRideController.ongoingRide?.startLat?.toDouble() ?? 00.00);

    ///todo:user start lang
    final usersatartlang =
        (_ongoingRideController.ongoingRide?.startLong?.toDouble() ?? 00.00);

    ///todo:user end lat...
    final userendlat =
        (_ongoingRideController.ongoingRide?.endLat?.toDouble() ?? 00.00);

    ///todo:user end lang....

    final userendlang =
        (_ongoingRideController.ongoingRide?.endLong?.toDouble() ?? 00.00);

    ///todo:user end lang....

    final userstartlocation =
        (_ongoingRideController.ongoingRide?.pickupLocation.toString() ?? 0);

    final userendlocation =
        (_ongoingRideController.ongoingRide?.dropLocation.toString() ?? 0);

    print("startlat${usersatartlat}");
    print("endlat${usersatartlang}");

    print("endlang${userendlang}");
    print("endlat${userendlat}");

    print("userstartlocation${userstartlocation}");
    print("userendlocation${userendlocation}");

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        color: MyTheme.ThemeColors,
        height: size.height,
        width: size.width,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   backgroundColor: MyTheme.ambapp5,
          //   elevation: 0,
          // ),
          body: SafeArea(
            child: Obx(
              () => (_ongoingRideController.isLoading.value)
                  ? const Center(child: CircularProgressIndicator())
                  : _ongoingRideController.ongoingRide?.patientName == null
                      ? const Center(
                          child: Text(
                            'No Data',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.02),
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
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    'Your are ready to go.',
                                    style: GoogleFonts.alatsi(
                                        fontSize: size.height * 0.027,
                                        fontWeight: FontWeight.w600,
                                        color: MyTheme.blueww),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.1,
                            ),
                            //Spacer(),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.0005),
                              child: Container(
                                height: size.height * 0.5,
                                margin: EdgeInsets.symmetric(vertical: 30 / 5),
                                decoration: BoxDecoration(
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                  //     fit: BoxFit.fill),
                                  //color: MyTheme.containercolor8,
                                  borderRadius: BorderRadius.circular(20),
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
                                      vertical: size.width * 0.0 / 05),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xffF0F3F8),
                                            Color(0xffF0F3F8)
                                            //darkPrimary,
                                          ]),
                                      borderRadius: BorderRadius.circular(12),
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
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Ps Wellness will pay you ₹ 500 in every accidental case.",
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: size.height * 0.020,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.verified,
                                              color: MyTheme.containercolor17,
                                            ),
                                            Text(
                                              "${_ongoingRideController.ongoingRide?.patientName.toString()}",

                                              /// "Kumar Prince",
                                              // 'Kumar Prince',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: size.width * 0.06,
                                                fontWeight: FontWeight.w700,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            Spacer(),

                                            ///images...
                                            Container(
                                              height: size.height * 0.12,
                                              width: size.width * 0.2,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                // image: DecorationImage(
                                                //   fit: BoxFit.fill,
                                                //   image: NetworkImage(
                                                //     "$base${_driverAcceptlistController.getDriveracceptDetail?.driverImage.toString()}",
                                                //     // 'https://wallpaperaccess.com/full/2440003.jpg'
                                                //   ),
                                                // )

                                                ///

                                                //Image.network(
                                                //                      base +
                                                //                                         '${_labreportviewController.labreportimage?.labViewReportFile?[index].file.toString()}',
                                              ),

                                              ///
                                              child: InkWell(
                                                onTap: () async {
                                                  Get.defaultDialog(
                                                      barrierDismissible: true,
                                                      title:
                                                          "Welcome to PS Wellness",
                                                      confirm: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(6.0),
                                                        child: PhysicalModel(
                                                          color: MyTheme.white,
                                                          shadowColor:
                                                              Colors.blueGrey,
                                                          elevation: 0,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                String
                                                                    telephoneNumber =
                                                                    '${_ongoingRideController.ongoingRide?.mobileNumber.toString()}';
                                                                String
                                                                    telephoneUrl =
                                                                    "tel:$telephoneNumber";
                                                                if (await canLaunch(
                                                                    telephoneUrl)) {
                                                                  await launch(
                                                                      telephoneUrl);
                                                                } else {
                                                                  throw "Error occured trying to call that number.";
                                                                }
                                                                Get.back();
                                                                // launch('tel:+9111126194230');
                                                              },
                                                              child: Container(
                                                                  height:
                                                                      size.height *
                                                                          0.04,

                                                                  /// width: size.width * 0.26,
                                                                  color: MyTheme
                                                                      .ThemeColors,
                                                                  child: Center(
                                                                      child:
                                                                          Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .phone,
                                                                        color: Colors
                                                                            .white,
                                                                        size: size.width *
                                                                            0.05,
                                                                      ),
                                                                      SizedBox(
                                                                        width: size.width *
                                                                            0.03,
                                                                      ),
                                                                      Text(
                                                                        'Call User',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              MyTheme.white,
                                                                          fontSize:
                                                                              size.width * 0.03,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ))),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // cancel: Padding(
                                                      //   padding:
                                                      //       const EdgeInsets.all(8.0),
                                                      //   child:
                                                      //       PhysicalModel(
                                                      //     color: MyTheme.blueww,
                                                      //     shadowColor: Colors.blueGrey,
                                                      //     elevation: 0,
                                                      //     child: Padding(
                                                      //       padding: const EdgeInsets.all(3.0),
                                                      //       child: InkWell(
                                                      //         onTap: () {
                                                      //           Get.back();
                                                      //           // _launchWhatsapp();
                                                      //         },
                                                      //         child: Container(
                                                      //             height: size.height * 0.04,
                                                      //             width: size.width * 0.26,
                                                      //             color: MyTheme.ThemeColors,
                                                      //             child: Center(
                                                      //                 child: Row(
                                                      //               mainAxisAlignment: MainAxisAlignment.center,
                                                      //               children: [
                                                      //                 Icon(
                                                      //                   Icons.cancel,
                                                      //                   color: Colors.white,
                                                      //                   size: size.height * 0.03,
                                                      //                 ),
                                                      //                 SizedBox(
                                                      //                   width: size.width * 0.03,
                                                      //                 ),
                                                      //                 Text(
                                                      //                   'NO',
                                                      //                   style: TextStyle(color: MyTheme.white, fontWeight: FontWeight.bold, fontSize: size.width * 0.03),
                                                      //                 ),
                                                      //               ],
                                                      //             ))),
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      middleText:
                                                          "Call User ?.",
                                                      backgroundColor:
                                                          MyTheme.blueww,
                                                      titleStyle:
                                                          GoogleFonts.alatsi(
                                                              color:
                                                                  MyTheme.white,
                                                              fontSize:
                                                                  size.height *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                      middleTextStyle:
                                                          TextStyle(
                                                              color: MyTheme
                                                                  .text1),
                                                      radius: 10);

                                                  ///todo:.........................................uuuuuu.....google map application open.......
                                                },
                                                child: Container(
                                                  height: size.height * 0.12,
                                                  width: size.width * 0.18,
                                                  decoration: BoxDecoration(
                                                    // border: Border.all(
                                                    //     color: Colors.black
                                                    // ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipRect(
                                                    child: Image.asset(
                                                      'lib/assets/icons/phone_cll_1.png',
                                                      height:
                                                          size.height * 0.04,
                                                      //color:
                                                      // Colors.green.shade700,
                                                    ),

                                                    ///todo: user Imag
                                                    // CachedNetworkImage(
                                                    //   imageUrl:
                                                    //       'https://images.unsplash.com/photo-1586293403445-ffa224197984?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                                                    //   // 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                                                    //   ,
                                                    //
                                                    //   ///base + '',
                                                    //   //'https://pbs.twimg.com/profile_images/945853318273761280/0U40alJG_400x400.jpg',
                                                    //   imageBuilder: (context,
                                                    //           imageProvider) =>
                                                    //       Container(
                                                    //     width: 90.0,
                                                    //     height: 90.0,
                                                    //     decoration:
                                                    //         BoxDecoration(
                                                    //       shape:
                                                    //           BoxShape.circle,
                                                    //       image: DecorationImage(
                                                    //           image:
                                                    //               imageProvider,
                                                    //           fit:
                                                    //               BoxFit.cover),
                                                    //     ),
                                                    //   ),
                                                    //   placeholder: (context,
                                                    //           url) =>
                                                    //       CircularProgressIndicator(),
                                                    //   errorWidget: (context,
                                                    //           url, error) =>
                                                    //       Icon(Icons.error),
                                                    // ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Mobile:',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      MyTheme.containercolor18
                                                  //Color(0xff12BFC4),
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
                                              width: size.width * 0.006,
                                            ),
                                            Center(
                                              child: Text(
                                                "${_ongoingRideController.ongoingRide?.mobileNumber.toString()}",

                                                //"934422221",
                                                //'2020 Honda Clive',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.014,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Total Distance:',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      MyTheme.containercolor18),
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
                                              width: size.width * 0.01,
                                            ),
                                            Text(
                                              "${_ongoingRideController.ongoingRide?.totalDistance ?? 0} Km",

                                              // "10 km.",
                                              //'2020 Honda Clive',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: size.width * 0.04,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey.shade900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.015,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Paid Amount :',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      MyTheme.containercolor18),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.01,
                                            ),
                                            Text(
                                              "\u{20B9}${_ongoingRideController.ongoingRide?.totalPrice ?? 0.0}",

                                              //"100",
                                              // '121234333377',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.roboto(
                                                fontSize: size.width * 0.04,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey.shade900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.012,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.063,
                                              width: size.width * 0.28,
                                              child: Text(
                                                'User Location :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme
                                                        .containercolor18),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.09,
                                              width: size.width * 0.4,
                                              child: Center(
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "${_ongoingRideController.ongoingRide?.pickupLocation.toString() ?? 00}",

                                                    //"100",
                                                    // '121234333377',
                                                    //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                    style: GoogleFonts.roboto(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.grey.shade900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            ///start location.......
                                            SizedBox(
                                              height: size.height * 0.065,
                                              width: size.width * 0.14,
                                              child: ElevatedButton(
                                                child: Center(
                                                  child: SizedBox(
                                                    height: size.height * 0.065,
                                                    width: size.width * 0.14,
                                                    child: Icon(
                                                      Icons.navigation,
                                                      color: Colors.white,
                                                      size: 19,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return SizedBox(
                                                        height:
                                                            size.height * 0.1,
                                                        width:
                                                            size.width * 0.21,
                                                        child: AlertDialog(
                                                          title:
                                                              Text("Meet User"),
                                                          content: Text(
                                                              "Reach Your Pickup Location"),
                                                          actions: [
                                                            ElevatedButton(
                                                              child: SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.21,
                                                                child: Text(
                                                                  "   Cancel   ",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .red,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      textStyle: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            //Spacer(),
                                                            ElevatedButton(
                                                              child: Text(
                                                                "Track User",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .green,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      textStyle: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                              onPressed:
                                                                  () async {
                                                                ///todo: start...notification....
                                                                SharedPreferences
                                                                    prefs =
                                                                    await SharedPreferences
                                                                        .getInstance();
                                                                // await prefs.setString(
                                                                //     "driverId",
                                                                //     "${_ongoingRideController.ongoingRide?.id}");
                                                                // await prefs.setString(
                                                                //     "startLat5",
                                                                //     "${_ongoingRideController.ongoingRide?.startLat}");
                                                                // await prefs.setString(
                                                                //     "startLong5",
                                                                //     "${_ongoingRideController.ongoingRide?.startLong}");
                                                                // await prefs.setString(
                                                                //     "endLat5",
                                                                //     "${_ongoingRideController.ongoingRide?.endLat}");
                                                                // await prefs.setString(
                                                                //     "endLong5",
                                                                //     "${_ongoingRideController.ongoingRide?.endLong}");

                                                                // await Future.delayed(
                                                                //     Duration(
                                                                //         milliseconds:
                                                                //             400));

                                                                ///
                                                                await prefs.setString(
                                                                    "driverlistssId",
                                                                    "${_ongoingRideController.ongoingRide?.id}");

                                                                prefs.setString(
                                                                    "drivertotalamount",
                                                                    "${_ongoingRideController.ongoingRide?.totalPrice}");
                                                                prefs.setString(
                                                                    "driverlistbookingId",
                                                                    "${_ongoingRideController.ongoingRide?.patientId}");

                                                                prefs.setString(
                                                                    "lng1",
                                                                    "${_ongoingRideController.ongoingRide?.startLat}");
                                                                prefs.setString(
                                                                    "lat1",
                                                                    "${_ongoingRideController.ongoingRide?.startLong}");

                                                                prefs.setString(
                                                                    "lng2",
                                                                    "${_ongoingRideController.ongoingRide?.endLong}");
                                                                prefs.setString(
                                                                    "lat2",
                                                                    "${_ongoingRideController.ongoingRide?.endLat}");

                                                                print(
                                                                  "${_ongoingRideController.ongoingRide?.deviceId}"
                                                                      .toString(),
                                                                );
                                                                print(
                                                                    "okokotokenwwsacsac:${"${_ongoingRideController.ongoingRide?.deviceId}".toString()}");

                                                                ///.......
                                                                print(
                                                                    'princee notificationplplp');
                                                                try {
                                                                  notificationServices
                                                                      .getDeviceToken()
                                                                      .then(
                                                                          (value) async {
                                                                    var data = {
                                                                      //this the particular device id.....
                                                                      ///todo device token......
                                                                      'to': "${_ongoingRideController.ongoingRide?.deviceId}"
                                                                          .toString(),

                                                                      ///this is same device token....
                                                                      //value
                                                                      //.toString(),
                                                                      'notification':
                                                                          {
                                                                        'title':
                                                                            'Ps_Wellness',
                                                                        'body':
                                                                            'Your Driver is coming , Ride started',
                                                                        //"sound": "jetsons_doorbell.mp3"
                                                                      },
                                                                      'android':
                                                                          {
                                                                        'notification':
                                                                            {
                                                                          'notification_count':
                                                                              23,
                                                                        },
                                                                      },
                                                                      'data': {
                                                                        'type':
                                                                            'accident_amblnce_case',
                                                                        'id':
                                                                            '5555'
                                                                      }
                                                                    };

                                                                    print(
                                                                        "data3342323${data}");

                                                                    await http.post(
                                                                        Uri.parse(
                                                                            'https://fcm.googleapis.com/fcm/send'),
                                                                        body: jsonEncode(
                                                                            data),
                                                                        headers: {
                                                                          'Content-Type':
                                                                              'application/json; charset=UTF-8',
                                                                          'Authorization':
                                                                              'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                                          //'key=AAAAbao_0RU:APA91bFNp9i75TwjvU16WgWfPltmSZS4RLdHKCXmk93D5RBLXBSmI2ArbPbd4mcSvNaN8w_A-JuERFWLHf00NkRannNN4dJBR_ok3SkDM_erMRYUUUZChujPJXJK8-MFmxtN23Vodtyv'

                                                                          //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                                          //'key=AAAAp6CyXz4:APA91bEKZ_ArxpUWyMYnP8Do3oYrgXFVdNm2jQk-i1DjKcR8duPeccS64TohP-OAqxL57-840qWe0oeYDBAOO68-aOO2z9EWIcBbUIsXc-3kA5usYMviDYc_wK6qMsQecvAdM54xfZsO'
                                                                          //'AAAAbao_0RU:APA91bFNp9i75TwjvU16WgWfPltmSZS4RLdHKCXmk93D5RBLXBSmI2ArbPbd4mcSvNaN8w_A-JuERFWLHf00NkRannNN4dJBR_ok3SkDM_erMRYUUUZChujPJXJK8-MFmxtN23Vodtyv'
                                                                        }).then(
                                                                        (value) {
                                                                      if (kDebugMode) {
                                                                        print(
                                                                            "bookdriver${value.body.toString()}");
                                                                      }
                                                                    }).onError(
                                                                        (error,
                                                                            stackTrace) {
                                                                      if (kDebugMode) {
                                                                        print(
                                                                            error);
                                                                      }
                                                                    });

                                                                    ///todo: google map launcher......

                                                                    MapsLauncher.launchCoordinates(
                                                                        usersatartlat,
                                                                        usersatartlang,
                                                                        "${userstartlocation}");
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();

                                                                    ///todo: from here custom from backend start...
                                                                    var prefs =
                                                                        GetStorage();

                                                                    ///todo: from here custom from backend start...
                                                                    // PatientRegNo =
                                                                    // prefs.read("PatientRegNo").toString();

                                                                    AdminLogin_Id = prefs
                                                                        .read(
                                                                            "AdminLogin_Id")
                                                                        .toString();
                                                                    PatientRegNo = prefs
                                                                        .read(
                                                                            "PatientRegNo")
                                                                        .toString();
                                                                    print(
                                                                        '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
                                                                    var body = {
                                                                      "UserId":
                                                                          "${PatientRegNo}",
                                                                      "DeviceId":
                                                                          value
                                                                              .toString(),
                                                                    };
                                                                    print(
                                                                        "uqdtt${body}");
                                                                    http.Response
                                                                        r =
                                                                        await http
                                                                            .post(
                                                                      Uri.parse(
                                                                          'https://pswellness.in/api/DriverApi/UpadateDiviceId'),
                                                                      body:
                                                                          body,
                                                                    );

                                                                    print(
                                                                        r.body);
                                                                    if (r.statusCode ==
                                                                        200) {
                                                                      ///todo: bottom nav bar......start..
                                                                      ///
                                                                      // _navcontroller
                                                                      //     .tabindex(
                                                                      //         0);
                                                                      ///

                                                                      // Get.to(
                                                                      //     BottomNavBar());

                                                                      ///todo: bottom nav bar......end...
                                                                      print(
                                                                          "usesxssxedd99999${body}");
                                                                      return r;
                                                                    } else if (r
                                                                            .statusCode ==
                                                                        401) {
                                                                      Get.snackbar(
                                                                          'message',
                                                                          r.body);
                                                                    } else {
                                                                      Get.snackbar(
                                                                          'Error',
                                                                          r.body);
                                                                      return r;
                                                                    }

                                                                    ///todo end post api from backend..
                                                                    ///
                                                                    ///call message 2 screen....from book driver....21 july..

                                                                    accountService
                                                                        .getAccountData
                                                                        .then(
                                                                            (accountData) {});
                                                                  });
                                                                } catch (e, s) {
                                                                  print(s);

                                                                  ///todo: open google map and reache to ride.........start....maplaunch
                                                                  ///todo: changed from 9 jan 2024...kumar prince...

                                                                  // MapUtils.openMap(
                                                                  //     usersatartlat,
                                                                  //     usersatartlang);

                                                                  ///end
                                                                  ///
                                                                  /// useing packkage map launcher

                                                                }

                                                                ///todo;;
                                                                ///todo: end........................................
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.green,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  // textStyle: TextStyle(
                                                  //     fontSize: 15,
                                                  //     fontWeight:
                                                  //         FontWeight.bold)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        //Spacer(),
                                        SizedBox(
                                          height: size.height * 0.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.069,
                                              width: size.width * 0.28,
                                              child: Text(
                                                'Drop Location :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme
                                                        .containercolor18),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.09,
                                              width: size.width * 0.4,
                                              child: Center(
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "${_ongoingRideController.ongoingRide?.dropLocation.toString() ?? 00}",
                                                    //"100",
                                                    // '121234333377',
                                                    //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                    style: GoogleFonts.roboto(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.grey.shade900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            ///drop: navigation.
                                            SizedBox(
                                              height: size.height * 0.065,
                                              width: size.width * 0.14,
                                              child: ElevatedButton(
                                                child: Center(
                                                  child: SizedBox(
                                                    height: size.height * 0.065,
                                                    width: size.width * 0.14,
                                                    child: Icon(
                                                      Icons.navigation,
                                                      color: Colors.white,
                                                      size: 19,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return SizedBox(
                                                        height:
                                                            size.height * 0.1,
                                                        width:
                                                            size.width * 0.21,
                                                        child: AlertDialog(
                                                          title: Text(
                                                              "Start Your Ride"),
                                                          content: Text(
                                                              "Start your Ride  "),
                                                          actions: [
                                                            ElevatedButton(
                                                              child: SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.21,
                                                                child: Text(
                                                                  "   Cancel   ",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .red,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      textStyle: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            // Spacer(),
                                                            ElevatedButton(
                                                              child: Text(
                                                                "Start Ride! ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .green,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      textStyle: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                              onPressed: () {
                                                                // await _ongoingRideController
                                                                //     .ongoingRideApi();
                                                                // _ongoingRideController
                                                                //     .onInit();
                                                                // _ongoingRideController
                                                                //     .update();

                                                                ///todo: open google map and reache to ride.........start..
                                                                ///cmmenting custom code through url launcher...

                                                                // MapUtils.openMap(
                                                                //     userendlat,
                                                                //     userendlang);

                                                                ///todo: we are using urlmap launcher package 9 jan 2024...kumar prince

                                                                MapsLauncher.launchCoordinates(
                                                                    userendlat,
                                                                    userendlang,
                                                                    "${userendlocation}");

                                                                ///    print("userstartlocation${userstartlocation}");
                                                                //     print("userendlocation${userendlocation}");
                                                                // Navigator.of(
                                                                //         context)
                                                                //     .pop();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  ///todo: ongpoing api commented....10 jan 2024...kumar prince...........
                                                  //  _ongoingRideController
                                                  //.ongoingRideApi();
                                                  // _ongoingRideController
                                                  //.onInit();
                                                  // _ongoingRideController
                                                  //.update();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.red,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  // textStyle: TextStyle(
                                                  //     fontSize: 15,
                                                  //     fontWeight:
                                                  //         FontWeight.bold)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.0,
                            ),
                            //Spacer(),

                            //)
                          ],
                        ),
            ),
          ),
        ),
      ),
    );
  }
}

///

///todo:here google map function.......
class MapUtils {
  MapUtils._();
  static Future<void> openMap(
    double latitude,
    double longitude,
  ) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(googleMapUrl) != null) {
      await launch(googleMapUrl);
      // if (await canLaunch(googleMapUrl)) {
      //   await launch(googleMapUrl);
    } else {
      throw 'Could not open the map';
    }
  }
}
