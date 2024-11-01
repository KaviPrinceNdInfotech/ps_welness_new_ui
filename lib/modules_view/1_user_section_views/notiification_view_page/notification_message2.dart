import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/ambulance/coming_driver/coming_driver.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/notificationservice/local_notification_service.dart';
import 'package:ps_welness_new_ui/notificationservice/notification_fb_service.dart';
import 'package:ps_welness_new_ui/widgets/widgets/constant_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/1_user_view_controller/ambulance/ambulance_payment_controller.dart';
import '../../../controllers/1_user_view_controller/ambulance/driver_accept_list_controller.dart';
import '../../../controllers/1_user_view_controller/ambulance/rozar_pay_ambulance_controller/rozarpayy_ambulance_controllers.dart';
import '../../../controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
import '../../../utils/services/account_service.dart';
import '../home_page_user_view/user_home_page.dart';
import '../user_drawer/drawer_pages_user/walet_user/wallet_user.dart';

class MessageScreen2 extends StatefulWidget {
  final String id;
  const MessageScreen2({Key? key, required this.id}) : super(key: key);

  @override
  State<MessageScreen2> createState() => _MessageScreen2State();
}

class _MessageScreen2State extends State<MessageScreen2> {
  NotificationServices notificationServices = NotificationServices();
  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  RozarPayAmbulanceController _rozarPayAmbulanceController =
      Get.put(RozarPayAmbulanceController());

  AmbulanceOrderpaymentController _ambulanceOrderpaymentController =
      Get.put(AmbulanceOrderpaymentController());

  UserProfileControllers _userrsProfileControllers =
      Get.put(UserProfileControllers());

  CommingDriverController _commingDriverController =
      Get.put(CommingDriverController());

  Wallet_2_Controller _walletPostController = Get.put(Wallet_2_Controller());

  ///implement firebase....27...jun..2023
  @override
  void initState() {
    super.initState();

    ///
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

    /// 1. This method call when app in terminated state and you get a notification
    /// when you click on notification app open from terminated state and you can get notification data in this method

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

  // get kButtonAnimationDuration => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///todo: maths logoc....

    ///

    var finalamtdriver = _driverAcceptlistController
            .getDriveracceptDetail?.payableAmount
            ?.toDouble() ??
        0.0;

    // String telephoneNumber2 = _commingDriverController
    //         .getDrivercomingDetail?.mobileNumber
    //         .toString() ??
    //     "Not available";

    print("drivertotalremaining:${finalamtdriver}");

    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Obx(
            () => (_driverAcceptlistController.isLoading.value)
                ? const Center(child: CircularProgressIndicator())
                : _driverAcceptlistController
                            .getDriveracceptDetail?.driverName ==
                        null
                    ? const Center(
                        child: Text('No Data'),
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
                                      'Your Ambulance is \n ready to come',
                                      style: GoogleFonts.alatsi(
                                          fontSize: size.height * 0.022,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff023382)),
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
                                  margin:
                                      EdgeInsets.symmetric(vertical: 30 / 5),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                        fit: BoxFit.fill),
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
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.verified,
                                                color: Color(0xff12BFC4),
                                              ),
                                              Text(
                                                "${_driverAcceptlistController.getDriveracceptDetail?.driverName.toString()}",

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
                                                  color: Colors.yellow.shade800,
                                                  shape: BoxShape.circle,
                                                ),

                                                ///
                                                child: Container(
                                                  height: size.height * 0.12,
                                                  width: size.width * 0.18,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black38),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipRect(
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          '$IMAGE_BASE_URL${_driverAcceptlistController.getDriveracceptDetail?.driverImage}',
                                                      //'https://pbs.twimg.com/profile_images/945853318273761280/0U40alJG_400x400.jpg',
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // SizedBox(
                                          //   height: size.height * 0.0,
                                          // ),
                                          // Row(
                                          //   children: [
                                          //     Text(
                                          //       'Mobile No:',
                                          //       //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                          //       style: GoogleFonts.actor(
                                          //         fontSize: size.width * 0.04,
                                          //         fontWeight: FontWeight.w700,
                                          //         color: Color(0xff12BFC4),
                                          //       ),
                                          //     ),
                                          //     SizedBox(
                                          //       width: size.width * 0.005,
                                          //     ),
                                          //     Text(
                                          //       "${telephoneNumber2}",
                                          //       // "${_commingDriverController.getDrivercomingDetail?.mobileNumber.toString() ?? 0}",
                                          //       //"${_driverAcceptlistController.getDriveracceptDetail?.mobileNumber.toString()}",
                                          //       style: GoogleFonts.aBeeZee(
                                          //         fontSize: size.width * 0.04,
                                          //         fontWeight: FontWeight.w700,
                                          //         color: Colors.grey.shade900,
                                          //       ),
                                          //     ),
                                          //
                                          //     ///todo: calll user...
                                          //
                                          //     // Text(
                                          //     //   '${_commingDriverController.getDrivercomingDetail?.mobileNumber.toString() ?? 0}',
                                          //     //   style: GoogleFonts.raleway(
                                          //     //       color: Colors.white,
                                          //     //       fontWeight:
                                          //     //           FontWeight.w700,
                                          //     //       fontSize:
                                          //     //           size.width * 0.035),
                                          //     // ),
                                          //     Padding(
                                          //       padding: EdgeInsets.symmetric(
                                          //           horizontal:
                                          //               size.width * 0.02),
                                          //       child: InkWell(
                                          //         onTap: () {
                                          //           Get.defaultDialog(
                                          //               barrierDismissible:
                                          //                   true,
                                          //               title:
                                          //                   "Welcome to PS Wellness",
                                          //               confirm: Padding(
                                          //                 padding:
                                          //                     const EdgeInsets
                                          //                         .all(6.0),
                                          //                 child: PhysicalModel(
                                          //                   color:
                                          //                       MyTheme.white,
                                          //                   shadowColor:
                                          //                       Colors.blueGrey,
                                          //                   elevation: 0,
                                          //                   child: Padding(
                                          //                     padding:
                                          //                         const EdgeInsets
                                          //                             .all(3.0),
                                          //                     child: InkWell(
                                          //                       onTap:
                                          //                           () async {
                                          //                         String
                                          //                             telephoneNumber =
                                          //                             '${_commingDriverController.getDrivercomingDetail?.mobileNumber.toString() ?? "Not avalable"}';
                                          //                         print(
                                          //                             "ojoojjooj${telephoneNumber}");
                                          //
                                          //                         // String
                                          //                         // telephoneNumber =
                                          //                         // '${_commingDriverController.getDrivercomingDetail?.mobileNumber.toString() ?? 0}';
                                          //                         String
                                          //                             telephoneUrl =
                                          //                             "tel:$telephoneNumber";
                                          //                         if (await canLaunch(
                                          //                             telephoneUrl)) {
                                          //                           await launch(
                                          //                               telephoneUrl);
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
                                          //                             mainAxisAlignment:
                                          //                                 MainAxisAlignment
                                          //                                     .center,
                                          //                             children: [
                                          //                               Icon(
                                          //                                 Icons
                                          //                                     .phone,
                                          //                                 color:
                                          //                                     Colors.white,
                                          //                                 size: size.width *
                                          //                                     0.05,
                                          //                               ),
                                          //                               SizedBox(
                                          //                                 width:
                                          //                                     size.width * 0.03,
                                          //                               ),
                                          //                               Text(
                                          //                                 'Call Driver',
                                          //                                 style:
                                          //                                     TextStyle(
                                          //                                   color:
                                          //                                       MyTheme.white,
                                          //                                   fontSize:
                                          //                                       size.width * 0.03,
                                          //                                   fontWeight:
                                          //                                       FontWeight.bold,
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
                                          //               middleText:
                                          //                   "Call Driver ?.",
                                          //               backgroundColor:
                                          //                   MyTheme.ThemeColors,
                                          //               titleStyle:
                                          //                   GoogleFonts.alatsi(
                                          //                       color: MyTheme
                                          //                           .white,
                                          //                       fontSize:
                                          //                           size.height *
                                          //                               0.03,
                                          //                       fontWeight:
                                          //                           FontWeight
                                          //                               .bold),
                                          //               middleTextStyle:
                                          //                   TextStyle(
                                          //                       color: MyTheme
                                          //                           .text1),
                                          //               radius: 10);
                                          //         },
                                          //         child: Container(
                                          //           height: size.height * 0.04,
                                          //           width: size.width * 0.08,
                                          //           decoration: BoxDecoration(
                                          //             color: Colors.white30,
                                          //             shape: BoxShape.circle,
                                          //           ),
                                          //           child: Icon(
                                          //             Icons.call,
                                          //             color: Colors.red,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //
                                          //     ///todo: calll user...
                                          //   ],
                                          // ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Total Distance:',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_driverAcceptlistController.getDriveracceptDetail?.toatlDistance?.toDouble() ?? 0} Km",
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
                                                'Estimated Price :',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "\u{20B9}${_driverAcceptlistController.getDriveracceptDetail?.totalPrice?.toDouble()}",

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
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Payable Price :',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "\u{20B9}$finalamtdriver"
                                                    .toString(),
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          //finaldriverAmounts
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'DL Number :',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_driverAcceptlistController.getDriveracceptDetail?.dlNumber}",
                                                style: GoogleFonts.roboto(
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
                                                'Vehicle  Number :',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_driverAcceptlistController.getDriveracceptDetail?.vehicleNumber.toString()}",
                                                style: GoogleFonts.roboto(
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
                                                'Vehicle Info :',
                                                style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff12BFC4),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.05,
                                                width: size.width * 0.6,
                                                child: Text(
                                                  "${_driverAcceptlistController.getDriveracceptDetail?.vehicleTypeName.toString()}",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          //wallet
                                          Row(
                                            children: [
                                              ///payamoutnt.......wallet....
                                              /////finalamtdriver
                                              SizedBox(
                                                height: size.height * 0.05,
                                                width: size.width * 0.35,
                                                child: NeoPopButton(
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                  bottomShadowColor: ColorUtils
                                                          .getVerticalShadow(
                                                              Colors.orange
                                                                  .shade300)
                                                      .toColor(),
                                                  rightShadowColor: ColorUtils
                                                          .getHorizontalShadow(
                                                              Colors.orange
                                                                  .shade300)
                                                      .toColor(),
                                                  //animationDuration: kButtonAnimationDuration,
                                                  depth: kButtonDepth,
                                                  onTapUp: () async {
                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();

                                                    prefs.setString(
                                                        "ambulanceFeewallet",
                                                        "$finalamtdriver");
                                                    print(
                                                        "ambulancefeessonlinew: ${finalamtdriver}");

                                                    ///

                                                    ///

                                                    final walletAmount =
                                                        _walletPostController
                                                                .getwalletlist
                                                                ?.result?[0]
                                                                .walletAmount ??
                                                            0;
                                                    print(
                                                        "AmbulanceFEE $finalamtdriver");

                                                    print(
                                                        "WALLET AMOUNT $walletAmount");
                                                    if (finalamtdriver >
                                                        walletAmount) {
                                                      Get.snackbar("Low Amount",
                                                          "Please Add Money");

                                                      Get.to(
                                                        () =>
                                                            WolletUser(), //next page class
                                                        duration: Duration(
                                                            milliseconds:
                                                                300), //duration of transitions, default 1 sec
                                                        transition:
                                                            Transition.zoom,
                                                      );

                                                      /// Not possibble from wallet go to add page
                                                    } else {
                                                      // final newWalletAmount =
                                                      //     walletAmount -
                                                      //         Ambulancefees;
                                                      ///
                                                      final newWalletAmount =
                                                          finalamtdriver - 0;
                                                      _walletPostController
                                                          .walletPostUpdateApi(
                                                              newWalletAmount
                                                                  .toDouble())
                                                          //abbulance fees will go with this.....
                                                          .then((statusCode) {
                                                        if (statusCode == 200) {
                                                          ///post order api....wallet.......
                                                          _ambulanceOrderpaymentController
                                                              .postOrderAmbulancwalletApi()
                                                              .then(
                                                                  (statusCode) async {
                                                            if (statusCode ==
                                                                200) {
                                                              // Get.snackbar(
                                                              //     "Payment Success",
                                                              //     "Your booking confirmed");
                                                              Get.snackbar(
                                                                  'Payment Successful by Wallet',
                                                                  "Your Payment done",
                                                                  duration:
                                                                      const Duration(
                                                                          seconds:
                                                                              4));

                                                              ///
                                                              await Future.delayed(
                                                                  Duration(
                                                                      milliseconds:
                                                                          700));

                                                              ///
                                                              await _driverAcceptlistController
                                                                  .driveracceptuserDetailApi();
                                                              _driverAcceptlistController
                                                                  .update();
                                                              _driverAcceptlistController
                                                                  .onInit();
                                                              _driverAcceptlistController
                                                                  .refresh();
                                                              accountService
                                                                  .getAccountData
                                                                  .then(
                                                                      (accountData) {
                                                                // CallLoader.loader();
                                                                // nearlistdriverApi();
                                                                Timer(
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                                  () async {
                                                                    // nearlistdriverApi();
                                                                    await Get.to(
                                                                        UserHomePage());

                                                                    ///
                                                                  },
                                                                );
                                                                CallLoader
                                                                    .hideLoader();
                                                              });

                                                              ///nov 14....................................
                                                              //Get.to(OrderConfirmationPage());
                                                            } else {
                                                              Get.snackbar(
                                                                  "Error123",
                                                                  "error");
                                                            }
                                                          });

                                                          ///todo:end post order apis....
                                                          print(
                                                              "WALLET AMOUNTeee $finalamtdriver");

                                                          ///nov 14....................................
                                                          //Get.to(OrderConfirmationPage());
                                                        } else if (statusCode ==
                                                            400) {
                                                          Get.to(
                                                            () =>
                                                                WolletUser(), //next page class
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500), //duration of transitions, default 1 sec
                                                            transition:
                                                                Transition.zoom,
                                                          );
                                                        } else {
                                                          Get.snackbar(
                                                              "Error12378", "");
                                                        }
                                                      });
                                                    }
                                                  },
                                                  border: Border.all(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    width: 3,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0,
                                                        vertical: 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text("Pay Wallet",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),

                                              ///payment....via rozar pay...
                                              SizedBox(
                                                height: size.height * 0.05,
                                                width: size.width * 0.35,
                                                child: NeoPopButton(
                                                  color: Colors.indigoAccent,
                                                  bottomShadowColor: ColorUtils
                                                          .getVerticalShadow(
                                                              Colors
                                                                  .indigoAccent
                                                                  .shade200)
                                                      .toColor(),
                                                  rightShadowColor: ColorUtils
                                                          .getHorizontalShadow(
                                                              Colors.indigo
                                                                  .shade100)
                                                      .toColor(),
                                                  //animationDuration: kButtonAnimationDuration,
                                                  depth: kButtonDepth,
                                                  onTapUp: () async {
                                                    SharedPreferences p =
                                                        await SharedPreferences
                                                            .getInstance();

                                                    var v = p.getString(
                                                        "rrrrrrrrrr4567");
                                                    print(
                                                        "object3####################:${v}");

                                                    ///.......online....rozarpay...
                                                    //_rozarPayAmbulanceController
                                                    //_driverAcceptlistController

                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.setString(
                                                        "ambulanceFee",
                                                        "$finalamtdriver");

                                                    prefs.setString(
                                                        "ambulanceFeewallet",
                                                        "$finalamtdriver");

                                                    print(
                                                        "ambulancefeessonline: ${finalamtdriver}");

                                                    print(
                                                        "ambulancefeessonlinew: ${finalamtdriver}");

                                                    //print("iikyihyih${ambulanceFee}");

                                                    // print("okook: ${fee}");
                                                    await _userrsProfileControllers
                                                        .userprofileApi();

                                                    ///todo: end the fees.........
                                                    await _rozarPayAmbulanceController
                                                        .openCheckout();

                                                    ///
                                                    _driverAcceptlistController
                                                        .driveracceptuserDetailApi();
                                                    _driverAcceptlistController
                                                        .update();
                                                    _driverAcceptlistController
                                                        .refresh();
                                                    // await Future.delayed(
                                                    //     Duration(
                                                    //         milliseconds: 400));

                                                    ///

                                                    ///.......
                                                    // print('princee notification');
                                                    // notificationServices
                                                    //     .getDeviceToken()
                                                    //     .then((value) async {
                                                    //   var data = {
                                                    //     //this the particular device id.....
                                                    //     'to':
                                                    //         //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                    //         //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                    //         //.toString(),
                                                    //
                                                    //         ///this is same device token....
                                                    //         value.toString(),
                                                    //     'notification': {
                                                    //       'title': 'Ps_Wellness',
                                                    //       'body':
                                                    //           'Your request accepted by driver',
                                                    //       //"sound": "jetsons_doorbell.mp3"
                                                    //     },
                                                    //     'android': {
                                                    //       'notification': {
                                                    //         'notification_count':
                                                    //             23,
                                                    //       },
                                                    //     },
                                                    //     'data': {
                                                    //       'type': 'msj1',
                                                    //       'id': '1234567'
                                                    //     }
                                                    //   };
                                                    //   await http.post(
                                                    //       Uri.parse(
                                                    //           'https://fcm.googleapis.com/fcm/send'),
                                                    //       body: jsonEncode(data),
                                                    //       headers: {
                                                    //         'Content-Type':
                                                    //             'application/json; charset=UTF-8',
                                                    //         'Authorization':
                                                    //             //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                    //             'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                    //       }).then((value) {
                                                    //     if (kDebugMode) {
                                                    //       print(
                                                    //           "princedriver${value.body.toString()}");
                                                    //     }
                                                    //   }).onError(
                                                    //       (error, stackTrace) {
                                                    //     if (kDebugMode) {
                                                    //       print(error);
                                                    //     }
                                                    //   });
                                                    // });
                                                  },
                                                  border: Border.all(
                                                    color: Colors.indigoAccent,
                                                    width: 3,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0,
                                                        vertical: 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text("Pay Online",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.2,
                              ),
                              //Spacer(),

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

///
