import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_payout_history_controller.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_controller/driver_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/device_token_controller/devicetoken_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/notiification_view_page/notification_page_message_firebase.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_appointment_history_view/driver_order_history.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_drawer_view/drawerpage.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/chemist_Addd_bank_details/bank_add_view.dart';
import 'package:ps_welness_new_ui/notificationservice/local_notification_service.dart';
import 'package:ps_welness_new_ui/widgets/support_page_comman/support_comman_page.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/supports/support_view.dart';
// import 'package:ps_welness/modules_view/3_driver_section_view/driver_appointment_details/driver_appointment_details.dart';
// import 'package:ps_welness/modules_view/3_driver_section_view/driver_appointment_history_view/driver_order_history.dart';
// import 'package:ps_welness/modules_view/3_driver_section_view/driver_drawer_view/drawerpage.dart';
// import 'package:ps_welness/modules_view/3_driver_section_view/driver_payment_history/driver_payment_history_controller.dart';
// import 'package:ps_welness/modules_view/3_driver_section_view/driver_profile_page_view/profile_view.dart';
// import 'package:ps_welness/modules_view/3_driver_section_view/driver_update_bank_details/bank_update_view.dart';

import '../../../controllers/1_user_view_controller/user_appointment_controller/user_appointment_controllers.dart';
import '../../../controllers/3_driver_view_controllers/driver_home_page_controller/driver_user_acpt_rejct_list/user_list_accept_reject_list.dart';
import '../../../notificationservice/notification_fb_service.dart';
import '../../../widgets/exit_popup_warning/exit_popup.dart';
import '../driver_drawer_view/driver_drower_pages/location_practice/location_practiceeee.dart';
import '../driver_payment_history/driver_payment_history.dart';
import '../driver_payout_history/driver_payout_histories.dart';

AppointmentUserController _appointmentUserController =
    Get.put(AppointmentUserController());
DriverProfileController _driverProfileController =
    Get.put(DriverProfileController());
UseracptrejectController _useracptrejectController =
    Get.put(UseracptrejectController());

DevicetokenController _devicetokenController = Get.put(DevicetokenController());

String PatientRegNo = ''.toString();
String userPassword = ''.toString();

String DriverId = ''.toString();
String driverpassword = ''.toString();

// AppointmentController _appointmentController =
//     Get.put(AppointmentController());
class DriverHomePage extends StatefulWidget {
  const DriverHomePage({Key? key}) : super(key: key);

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  NotificationServices notificationServices = NotificationServices();
  DriverPayoutHistoryController _driverPayoutHistoryController =
      Get.put(DriverPayoutHistoryController());

  ///implement firebase....27...jun..2023
  @override
  void initState() {
    super.initState();
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
    GlobalKey<ScaffoldState> _keydriver = GlobalKey();

    final List<String> productname = [
      'Booking Request',
      'Update Bank Details',
      'Booking History',
      'Payment History',
      'Payout history',
      'Contact Us',
    ];

    final List<String> underprocess = [
      '',
      '',
      '',
      '',
      '',
      '',
    ];

    List<Color> colors = [
      Color(0xff11eae0),
      Color(0xffe68cf7),
      Colors.yellow,
      Colors.lightGreenAccent,
      Colors.lightGreen
    ];

    final List<String> productimage = [
      'lib/assets/icons/notificationsdriver.png',
      // 'lib/assets/icons/driving.png',
      'lib/assets/icons/drbank.png',
      'lib/assets/icons/drbookinghis.png',
      'lib/assets/icons/drhistory.png',
      'lib/assets/icons/drpayout.png',
      'lib/assets/icons/contact22.png',
    ];
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              lightPrimary,
              darkPrimary,
            ])),
        child: Scaffold(
          key: _keydriver,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: [
                Container(
                    height: size.height * 0.045,
                    //width: size.width * 0.11,
                    child: Image.asset(
                      'lib/assets/icons/drdriver.png',
                      fit: BoxFit.fill,
                    )),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'PS Wellness',
                        style: GoogleFonts.poppins(
                          fontSize: size.height * 0.019,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          //color: Color(0xff023382)
                        ),
                      ),
                      TextSpan(
                        text: 'DRIVER',
                        style: GoogleFonts.alatsi(
                          fontSize: size.height * 0.022,
                          fontWeight: FontWeight.w600,
                          color: MyTheme.containercolor5,
                          //color: Color(0xff023382)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.dehaze_rounded,
                size: 23,
                color: Colors.white,
              ),
              onPressed: () {
                _keydriver.currentState!.openDrawer();
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(9.0),
                child: Material(
                  elevation: 20,
                  shadowColor: Colors.white,
                  //surfaceTintColor: Colors.red,

                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  //Theme.of(context).bottomAppBarColor,
                  child: InkWell(
                    splashColor: Colors.blueGrey,
                    onTap: () async {
                      ///todo: this is driver token.............
                      /// _devicetokenController.DrivertokenApi();

                      ///from here start notification and send your token to the server...

                      print('princee notification');
                      notificationServices.getDeviceToken().then((value) async {
                        var data = {
                          //this the particular device id.....
                          'to':
                              //this is dummy token...
                              "ugug6t878",

                          ///todo device token......
                          // widget
                          //     .driverlist
                          //     ?.message?[
                          //         index]
                          //     .id
                          //     .toString(),
                          ///
                          //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                          //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                          //.toString(),

                          ///this is same device token....
                          //value.toString(),
                          'notification': {
                            'title': 'Ps_Wellness',
                            'body': 'You have request for ambulance',
                            //"sound": "jetsons_doorbell.mp3"
                          },
                          'android': {
                            'notification': {
                              'notification_count': 23,
                            },
                          },
                          'data': {'type': 'msj', 'id': '123456'}
                        };

                        await http.post(
                            Uri.parse('https://fcm.googleapis.com/fcm/send'),
                            body: jsonEncode(data),
                            headers: {
                              'Content-Type': 'application/json; charset=UTF-8',
                              'Authorization':
                                  //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                  'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                            }).then((value) {
                          if (kDebugMode) {
                            print(value.body.toString());
                          }
                        }).onError((error, stackTrace) {
                          if (kDebugMode) {
                            print(error);
                          }
                        });

                        ///todo: from here custom from backend start...
                        var prefs = GetStorage();
                        DriverId = prefs.read("DriverId").toString();
                        print(
                            '&&&&&&&&&&&&&&&&&&&&&&driverrcredentials:${DriverId}');
                        var body = {
                          "UserId": "${DriverId}",
                          "DeviceId": value.toString(),
                        };
                        print("userrrtokenupdateeeddbeforetttt${body}");
                        http.Response r = await http.post(
                          Uri.parse(
                              'http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
                          body: body,
                        );

                        print(r.body);
                        if (r.statusCode == 200) {
                          print("userrrtokenupdatdricvfe3333${body}");
                          return r;
                        } else if (r.statusCode == 401) {
                          Get.snackbar('message', r.body);
                        } else {
                          Get.snackbar('Error', r.body);
                          return r;
                        }

                        ///todo end post api from backend...
                      });

                      ///end....
                      ///
                      Get.to(MyLocation());
                    },
                    child: Container(
                      height: size.height * 0.02,
                      width: size.width * 0.20,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          //color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(4, 4),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(-4, -4),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            """Update\nLocation""",
                            // '\u{20B9}',
                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                            style: GoogleFonts.actor(
                              fontSize: size.width * 0.023,
                              fontWeight: FontWeight.w900,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.00,
                          ),
                          Icon(
                            Icons.place_rounded,
                            color: Colors.red,
                          ),
                          // Text(
                          //   'Location',
                          //   //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                          //   style: GoogleFonts.roboto(
                          //     fontSize: size.width * 0.028,
                          //     fontWeight: FontWeight.w700,
                          //     color: Colors.red.shade900,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: DriverMainDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.28,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Mycrusial(),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.001,
                      horizontal: size.width * 0.01),
                  child: Container(
                    height: size.height * 0.585,
                    decoration: BoxDecoration(),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: size.height * 0.25,
                          mainAxisExtent: size.height * 0.188,
                          childAspectRatio: 4 / 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: productname.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            height: size.height * 0.08,
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.00131,
                                horizontal: size.width * 0.01),
                            decoration: BoxDecoration(
                                color: Color(0xff11eae0),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(-0, -0),
                                    spreadRadius: 0,
                                    blurRadius: 0,
                                    color: Colors.grey.shade100,
                                  ),
                                  BoxShadow(
                                    offset: Offset(3, 3),
                                    spreadRadius: 0,
                                    blurRadius: 0,
                                    color: Colors.grey.shade300,
                                  ),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.000,
                                  horizontal: size.width * 0.000),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      underprocess[index],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.abhayaLibre(
                                        fontSize: size.height * 0.016,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        _useracptrejectController
                                            .driveracceptrejctlistApi();
                                        _useracptrejectController.update();
                                        // _driverProfileController.update();
                                        Get.to(
                                            () => MessageScreen(id: "123456"));
                                      } else if (index == 1) {
                                        Get.to(() => AddBankDetail());
                                        //UpdateDriverBankDetail());
                                      } else if (index == 2) {
                                        Get.to(() => DriverOrderHistory());
                                      } else if (index == 3) {
                                        Get.to(() => DriverPaymentHistory());
                                      } else if (index == 4) {
                                        _driverPayoutHistoryController
                                            .driverPayoutHistoryApi();
                                        _driverPayoutHistoryController.update();
                                        Get.to(() => DriverPayoutHistory());
                                      } else if (index == 5) {
                                        Get.to(() => SupportViewPsComman()
                                            //DriverAppointmentDetails()
                                            );
                                      }
                                    },
                                    child: Container(
                                      height: size.height * 0.11,
                                      width: size.width * 0.23,
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              //color: Color(0xFFBEBEBE),
                                              offset: Offset(03, 03),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                            const BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(-02, -02),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                          ]),
                                      child: Image.asset(
                                        productimage[index],
                                        // "lib/assets/image/icons8-hospital-64.png",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Container(
                                    height: size.height * 0.033,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff)
                                            .withOpacity(0.999),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        )),
                                    child: Center(
                                      child: Text(
                                        productname[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.abhayaLibre(
                                          fontSize: size.height * 0.018,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // child: child,
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Mycrusial extends StatelessWidget {
  final _sliderKey = GlobalKey();
  Mycrusial({Key? key}) : super(key: key);

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  ///
  final List<String> images = [
    'https://images.unsplash.com/photo-1600959907703-125ba1374a12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
        'https://images.unsplash.com/photo-1602021727931-f85e48d5ebaf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1580216818061-70d2f9021cd7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1612574935301-af13ccce9258?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1631181231565-0dd0a45682cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1630964046403-c6eda735e7c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
  ];

  final bool _isPlaying = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: size.height * 0.28,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Material(
              color: MyTheme.ThemeColors,
              borderRadius: BorderRadius.circular(10),
              elevation: 0,
              child: CarouselSlider.builder(
                key: _sliderKey,
                unlimitedMode: true,
                autoSliderTransitionTime: Duration(seconds: 1),
                slideBuilder: (index) {
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Material(
                      elevation: 12,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: size.height * 38,
                        width: size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 3),
                          image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  );
                },
                slideTransform: DefaultTransform(),
                slideIndicator: CircularSlideIndicator(
                  indicatorBorderWidth: 2,
                  indicatorRadius: 4,
                  itemSpacing: 15,
                  currentIndicatorColor: Colors.white,
                  padding: EdgeInsets.only(bottom: 0),
                ),
                itemCount: images.length,
                enableAutoSlider: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///...........
///
///
