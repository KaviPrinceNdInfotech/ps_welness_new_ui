import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/ambulance/coming_driver/coming_driver.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/ambulance/driver_accept_list_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/doctor_sections/doctors_appointment1.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/lab_controller/choose_lab_controller/lab_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import 'package:ps_welness_new_ui/google_map/new_map/new_g_map.dart';
import 'package:ps_welness_new_ui/google_map/new_map/new_g_map3.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/lab/choose_lab/choose_lab.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/notiification_view_page/notification_message2.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/slider_user/slider_userss.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/reports_section/report_section_list.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/user_drawer.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/notificationservice/local_notification_service.dart';
import 'package:ps_welness_new_ui/widgets/exit_popup_warning/exit_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/constants/constants.dart';
import '../../../constants/my_theme.dart';
import '../../../controllers/1_user_view_controller/ambulance/get_ambulancetype_controller.dart';
import '../../../controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
import '../../../controllers/1_user_view_controller/user_appointment_controller/user_appointment_controllers.dart';
import '../../../controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
import '../../../notificationservice/notification_fb_service.dart';
import '../../../servicess_api/api_services_all_api.dart';
import '../../../utils/services/account_service.dart';
import '../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../doctorss/doctor_address/doctor_address.dart';
import '../emergency_cases_booking/booked_ambulance/hospital_list.dart';
import '../medicine_view/search_section/search_medicine.dart';
import '../nursess/book_nurse_appointment1/nurse_booking_1.dart';

String PatientRegNo = ''.toString();
String userPassword = ''.toString();

String DriverId = ''.toString();
String driverpassword = ''.toString();

//import 'package:ps_welness/modules_view/1_user_section_views/user_drawer/user_drawHomePage({Key? key}) : super(key: key);

AppointmentUserController _appointmentUserController =
    Get.put(AppointmentUserController());
UserHomepagContreoller _userHomepagContreoller =
    Get.put(UserHomepagContreoller());
UserProfileControllers _userprofiledetail = Get.put(UserProfileControllers());
AmbulancegetController _ambulancegetController =
    Get.put(AmbulancegetController());
final MedicineListController _medicineListController =
    Get.put(MedicineListController());
DriverAcceptlistController _driverAcceptlistController =
    Get.put(DriverAcceptlistController());

Doctor_appointment_1_Controller _doctor_appointment_1_controller =
    Get.put(Doctor_appointment_1_Controller());

ChooseLabController _chooseLabController = Get.put(ChooseLabController());

RxBool isLoading = true.obs;

///

// AppointmentController _appointmentController =
//     Get.put(AppointmentController());
class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String? _currentAddress;
  Position? _currentPosition;

  ///todo:...

  NotificationServices notificationServices = NotificationServices();
  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  CommingDriverController _commingDriverController =
      Get.put(CommingDriverController());

  late StreamSubscription periodicSub;

  ///implement firebase....27...jun..2023
  @override

  // void initState() {
  //   super.initState();
  //
  //   ///todo: it is periodic function periodic
  //   ///
  //   periodicSub = Stream.periodic(const Duration(seconds: 5))
  //       .listen((_) => _getCurrentPosition());
  //
  //   // periodicSub = Stream.periodic(const Duration(seconds: 10))
  //   //     //.take(6)
  //   //     .listen((_) => _getCurrentPosition());
  //
  //   ///todo: it is periodic function STREAM periodic.....
  //
  //   periodicSub = Stream.periodic(const Duration(seconds: 9))
  //       //.take(6)
  //       .listen((_) => postssDriverUpdateApi2());
  //
  //   ///todo: get current location.......
  //   //_userprofiledetail.userprofileApi();
  //   //_userprofiledetail.update();
  //   _driverAcceptlistController.driveracceptuserDetailApi();
  //   notificationServices.requestNotificationPermission();
  //   notificationServices.forgroundMessage();
  //   notificationServices.firebaseInit(context);
  //   notificationServices.setupInteractMessage(context);
  //   notificationServices.isTokenRefresh();
  //   // notificationServices.requestNotificationPermission();
  //   // notificationServices.isTokenRefresh();
  //   // notificationServices.firebaseInit();
  //   notificationServices.getDeviceToken().then((value) {
  //     if (kDebugMode) {
  //       print('device token');
  //       print(value);
  //     }
  //     // print('device token');
  //     // print(value);
  //   });
  //
  //   /// 1. This method call when app in terminated state and you get a notification
  //   /// when you click on notification app open from terminated state and you can get notification data in this method
  //
  //   FirebaseMessaging.instance.getInitialMessage().then(
  //     (message) {
  //       print("FirebaseMessaging.instance.getInitialMessage");
  //       if (message != null) {
  //         print("New Notification");
  //         // if (message.data['_id'] != null) {
  //         //   Navigator.of(context).push(
  //         //     MaterialPageRoute(
  //         //       builder: (context) => DemoScreen(
  //         //         id: message.data['_id'],
  //         //       ),
  //         //     ),
  //         //   );
  //         // }
  //       }
  //     },
  //   );
  //   // 2. This method only call when App in forground it mean app must be opened
  //
  //   FirebaseMessaging.onMessage.listen(
  //     (message) {
  //       print("FirebaseMessaging.onMessage.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data11 ${message.data}");
  //
  //         ///you can call local notification.............................
  //
  //         LocalNotificationService.createanddisplaynotification(message);
  //
  //         ///you can call local notification....................................
  //
  //       }
  //     },
  //   );
  //   // 3. This method only call when App in background and not terminated(not closed)
  //   FirebaseMessaging.onMessageOpenedApp.listen(
  //     (message) {
  //       print("FirebaseMessaging.onMessageOpenedApp.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data22 ${message.data['_id']}");
  //       }
  //     },
  //   );
  // }
  void initState() {
    super.initState();
    _getCurrentPosition();

    _setupNotifications();

    postssDriverUpdateApi2();

    ///_setupPeriodicTasks();
  }

  ///todo: setup notification...15 may 2024...
  void _setupNotifications() {
    _driverAcceptlistController.driveracceptuserDetailApi();
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

          ///you can call local notification.............................

          LocalNotificationService.createanddisplaynotification(message);

          ///you can call local notification....................................
        }
      },
    );

    ///
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

  ///todo: setup periodic function....
  // void _setupPeriodicTasks() {
  //   // Stream.periodic(const Duration(seconds: 2))
  //   //     .listen((_) => _getCurrentPosition());
  //   // Stream.periodic(const Duration(seconds: 9))
  //   //     .listen((_) => postssDriverUpdateApi2());
  // }

  @override
  void dispose() {
    periodicSub.cancel();
    super.dispose();
  }

  ///StreamSubscription? periodicSub;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _getGeoLocationPosition();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }

    return true;
  }

  ///todo:......

  ///todo: get location.......current.........
  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await _handleLocationPermission();
  //
  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     // print('okokokerere');
  //     setState(() => _currentPosition = position);
  //     _getAddressFromLatLng(_currentPosition!);
  //     //print('okokokererewqdwq');
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }
  ///todo:.............todo.................todo...................
  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) {
      // Handle the case when the user denies location permission
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Check if the widget is mounted before calling setState
      if (mounted) {
        setState(() {
          _currentPosition = position;
        });
      }

      _getAddressFromLatLng(_currentPosition!);
    } catch (e) {
      // Handle errors gracefully
      debugPrint("Error getting current position: $e");
    }
  }

  ///todo: get access current address.........................

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  ///todo:apiiii....driver update location...
  Future<void> postssDriverUpdateApi2() async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude);
    http.Response r = await ApiProvider.GoogleupdateuserApi(
      _currentPosition?.latitude.toDouble(),
      _currentPosition?.longitude.toDouble(),
    );
    if (r.statusCode == 200) {
      //Get.snackbar('message', r.body);
      var data = jsonDecode(r.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _keyuser2 = GlobalKey();

    final List<String> productname = [
      'Book Nurse',
      'Book Doctor',
      'Book Ambulance',
      'Lab',
      'Your Report',
      //'Complete Health Checkup',
      'Buy Medicine',
      // 'Contact US',
      // 'Add Bank',

      //'Funeral Service',

      // 'service 7',
      // 'service 8',
    ];
    final List<String> underprocess = [
      '',
      '',
      '',
      '',
      '',
      '',
      // '',
      // '',
      //'     Coming Soon..',

      // 'service 7',
      // 'service 8',
    ];

    // List<Color> colors = [
    //   Color(0xff11eae0),
    //   Color(0xffe68cf7),
    //   Colors.yellow,
    //   Colors.lightGreenAccent,
    //   Colors.lightGreen
    // ];

    final List<String> productimage = [
      //'lib/assets/user_assets_svg/1nurse.svg',
      'lib/assets/user_assets/1nurse.png',
      'lib/assets/user_assets/4doctor.png',
      'lib/assets/user_assets/6ambulance.png',
      'lib/assets/user_assets/11lab.png',
      'lib/assets/user_assets/16checkup.png',
      'lib/assets/user_assets/18medicine.png',
      // 'lib/assets/icons/contact44.png',
      // 'lib/assets/icons/bank_update.png',
      //'lib/assets/user_assets/20funeral.png',
      // 'service 7',
      // 'service 8',
    ];
    // Future.delayed(Duration.zero, () {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: Text("How are you?"),
    //         );
    //       });
    // });
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              lightPrimary,
              darkPrimary,
            ])),
        child: Scaffold(
          //key: _keyuser2,
          drawer: UserMainDrawer(),

          key: _scaffoldKey,
          // key: _keyuser,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () async {
//                 print('princee notification');
//
//                 ///call api...
//
//                 /// _devicetokenController.UsertokenApi();
//
//                 notificationServices.getDeviceToken().then((value) async {
//                   var data = {
//                     //this the particular device id.....
//                     'to':
//                         //'mytokenfCZIyxFpQKacxnYBshsrJ_:APA91bFZWB_TNV_W7Jkpu6I3ukojLKIopGlSUU95mWj7-oPHR1WawZdN7SL-fmTwGDDmjMDmJvc4AulEIDKHWGQQffyDQjSH09b9z27JMLG1pB1K7xHdoTMeWHRCY7jsrXFzUX3zmQtj'
//                         //.toString(),
//
//                         ///this is same device token....
//                         value.toString(),
//                     'notification': {
//                       'title': 'Ps_Wellness',
//                       'body': 'You have request for ambulance',
//                       //"sound": "jetsons_doorbell.mp3"
//                     },
//                     'android': {
//                       'notification': {
//                         'notification_count': 23,
//                       },
//                     },
//                     'data': {'type': 'msj', 'id': '123456'}
//                   };
//
//                   //var url = '${baseUrl}api/DriverApi/UpadateDiviceId';
//                   var prefs = GetStorage();
//                   PatientRegNo = prefs.read("PatientRegNo").toString();
//                   print('&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
//                   // PatientRegNo = prefs.read("PatientRegNo").toString();
//                   //print('&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
// //user password........
//                   //userPassword = prefs.read("Password").toString();
//                   // print('&&&&&&&&&&&&&&&&&&&&&&usecredentialspassword:${userPassword}');
//
//                   var body = {
//                     "UserId": "${PatientRegNo}",
//                     "DeviceId": value.toString(),
//                   };
//                   print("userrrtokenupdateeeddbefore${body}");
//
//                   http.Response r = await http.post(
//                     Uri.parse(
//                         'http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
//                     body: body,
//                   );
//                   print(r.body);
//                   if (r.statusCode == 200) {
//                     print("userrrtokenupdateeedd777${body}");
//                     return r;
//                   } else if (r.statusCode == 401) {
//                     Get.snackbar('message', r.body);
//                   } else {
//                     Get.snackbar('Error', r.body);
//                     return r;
//                   }
//
//                   ///from here we have token post to the server........
//                   await http.post(
//                       Uri.parse('https://fcm.googleapis.com/fcm/send'),
//                       body: jsonEncode(data),
//                       headers: {
//                         'Content-Type': 'application/json; charset=UTF-8',
//                         'Authorization':
//                             //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
//                             'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
//                       }).then((value) {
//                     if (kDebugMode) {
//                       print(value.body.toString());
//                     }
//                   }).onError((error, stackTrace) {
//                     if (kDebugMode) {
//                       print(error);
//                     }
//                   });
//                   // await http.post(
//                   //     Uri.parse('https://fcm.googleapis.com/fcm/send'),
//                   //     body: jsonEncode(data),
//                   //     headers: {
//                   //       'Content-Type': 'application/json; charset=UTF-8',
//                   //       'Authorization':
//                   //           'AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc',
//                   //     });
//                 });
//               },
//               icon: Icon(Icons.notification_add),
//             ),
//           ]
            title: Row(
              children: [
                SizedBox(
                    height: size.height * 0.047,
                    width: size.width * 0.1,
                    child: Image.asset(
                        //'lib/assets/user_assets/12lab.png'
                        'lib/assets/background_stack_png/users_patient.png')),
                SizedBox(
                  width: size.width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'PS WELLNESS',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          //color: Color(0xff023382)
                        ),
                      ),
                      TextSpan(
                        text: ' USER',
                        style: GoogleFonts.alatsi(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: MyTheme.containercolor5,
                          //color: Color(0xff023382)
                        ),
                      ),
                    ],
                  ),
                ),
                // Text(
                //   'PS WELLNESS',
                //   style: GoogleFonts.alatsi(
                //     fontWeight: FontWeight.w500,
                //     fontSize: 22,
                //   ),
                // ),
              ],
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,

            //MyTheme.ThemeColors,
            leading: Builder(
              builder: (context) => // Ensure Scaffold is in context
                  IconButton(
                      icon: Icon(
                        Icons.dehaze_rounded,
                        size: 23,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        _userprofiledetail.userprofileApi();
                        _userprofiledetail.update();
                        Scaffold.of(context).openDrawer();
                      }),
            ),
            // onPressed: () {
            //   _keyuser.currentState?.openDrawer();
            // },
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: size.height * 0.02),
                  child: IconButton(
                    icon: _driverAcceptlistController
                                .getDriveracceptDetail?.driverName ==
                            null
                        ? SizedBox(
                            height: size.height * 0.057,
                            width: size.width * 0.1,
                            child: Image.asset(
                                //'lib/assets/user_assets/12lab.png'
                                'lib/assets/icons/ambulance_notification.png'))
                        : SizedBox(
                            height: size.height * 0.047,
                            width: size.width * 0.1,
                            child: Image.asset(
                              //'lib/assets/user_assets/12lab.png'
                              'lib/assets/icons/ambulance_notification.png',
                            )),
                    onPressed: () async {
                      // await accountService.getAccountData
                      //     .then((accountData) async {
                      //   await _driverAcceptlistController
                      //       .driveracceptuserDetailApi();
                      //   _driverAcceptlistController.update();
                      //   _driverAcceptlistController.refresh();
                      //   //_driverAcceptlistController.onInit();
                      // });

                      await accountService.getAccountData
                          .then((accountData) async {
                        await _driverAcceptlistController
                            .driveracceptuserDetailApi();
                        _driverAcceptlistController.update();
                        _driverAcceptlistController.refresh();

                        await _commingDriverController
                            .drivercominguserDetailApi();
                        _commingDriverController.update();
                        //_driverAcceptlistController.onInit();

                        // CallLoader.loader();
                        // nearlistdriverApi();
                        CallLoader.loader();
                        await Future.delayed(Duration(milliseconds: 700));
                        CallLoader.hideLoader();

                        Timer(
                          const Duration(milliseconds: 100),
                          () {
                            // nearlistdriverApi();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MessageScreen2(
                                          id: "12345678",
                                        )));
                            // Get.to(MessageScreen(
                            //   id: message.data['id'],
                            // ));
                            //Get.to((MapView));
                            //postAmbulancerequestApi(markers);

                            ///
                          },
                        );
                        CallLoader.hideLoader();
                      });
                    },
                  )
                  //         Icon( if (getDriveracceptDetail?.driverName == null) {
                  // isLoading(false);
                  // }
                  //            // Icons.notification_important_sharp
                  //         ),
                  ),
            ],
            // leading: Icon(Icons.read_more_outlined),
          ),
          //drawer: UserMainDrawer(),
          body:
              // Obx(
              //         () => (_userHomepagContreoller.isLoading.value)
              //             ? Center(
              //                 child: CircularProgressIndicator(),
              //               )
              //             :
              SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.265,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: MySlider(),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.001,
                      horizontal: size.width * 0.01),
                  child: SizedBox(
                    height: size.height * 0.63,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: size.height * 0.25,
                          mainAxisExtent: size.height * 0.196,
                          childAspectRatio: 4 / 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: productname.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            height: size.height * 0.08,
                            //width: double.,
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
                                    onTap: () async {
                                      if (index == 0) {
                                        // _nurseBooking1Controller
                                        // .getNurseTypeApi();
                                        //_doctor_1_controller.getdepartmentApi();
                                        // _doctor_1_controller.update();
                                        // _nurseBooking1Controller
                                        //.getNurseLocationApi();
                                        //RxStatus.loading();
                                        CallLoader.loader();
                                        await Future.delayed(
                                            Duration(seconds: 1));
                                        CallLoader.hideLoader();
                                        //await Get.to(DoctorSignup2());
                                        await Get.offAll(
                                            () => NurseBoooking1());
                                      } else if (index == 1) {
                                        // _doctor_appointment_1_controller.selectedCity.close();
                                        // _doctor_appointment_1_controller.cities
                                        //     .clear();
                                        // _doctor_appointment_1_controller.states
                                        //     .clear();
                                        // _doctor_appointment_1_controller
                                        //     .specialist
                                        //     .clear();
                                        // _doctor_appointment_1_controller
                                        //     .department
                                        //     .clear();

                                        // await _doctor_appointment_1_controller
                                        //     .getStateLabApi();
                                        // await _doctor_appointment_1_controller
                                        //     .getdepartmentApi();
                                        // _doctor_appointment_1_controller
                                        //     .onInit();
                                        // _doctor_appointment_1_controller
                                        //     .update();
                                        ///
                                        // _doctor_appointment_1_controller
                                        //     .refresh();
                                        CallLoader.loader();
                                        await Future.delayed(
                                            Duration(seconds: 1));
                                        CallLoader.hideLoader();
                                        await Get.to(() => DoctorAddress());
                                        //Get.to(() => CatagaryDetails());
                                      } else if (index == 2) {
                                        Get.defaultDialog(
                                            backgroundColor:
                                                MyTheme.ThemeColors,
                                            title: 'Select ambulance Type',
                                            actions: <Widget>[
                                              Container(
                                                height: size.height * 0.04,
                                                width: size.width * 0.35,
                                                // color: Colors.red,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: TextButton(
                                                  child: Text(
                                                    "CLOSE",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                              )
                                            ],
                                            content: Container(
                                              height: size.height * 0.34,
                                              width: size.width * 0.7,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: ListView(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left:
                                                              size.width * 0.02,
                                                          right: size.width *
                                                              0.02),
                                                      child:
                                                          NeumorphicTextFieldContainer(
                                                        child: Container(
                                                          // height:
                                                          //     size.height *
                                                          //         0.05,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                            child: ListTile(
                                                                //leading: const Icon(Icons.list),
                                                                trailing:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_circle_right_rounded,
                                                                    size: size
                                                                            .width *
                                                                        0.07,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    SharedPreferences
                                                                        prefs =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    prefs.setString(
                                                                        "AmbulancelistssId",
                                                                        "${_userHomepagContreoller.ambulancetype!.ambulanceT![index].id.toString()}");
                                                                    _ambulancegetController
                                                                        .update();

                                                                    accountService
                                                                        .getAccountData
                                                                        .then(
                                                                            (accountData) {
                                                                      CallLoader
                                                                          .loader();
                                                                      Timer(
                                                                        const Duration(
                                                                            seconds:
                                                                                3),
                                                                        () {
                                                                          Get.to(
                                                                              MapView(allowManualEntry: true));
                                                                          // CallLoader
                                                                          //     .hideLoader();
                                                                          //_ambulancegetController.selectedvhicleCatagary();
                                                                          //_ambulancegetController.ambulancecatagaryyApi();
                                                                          //Get.to((MapView));

                                                                          ///
                                                                        },
                                                                      );
                                                                      //CallLoader.hideLoader();
                                                                    });

                                                                    //Get.off(() => MapUser());

                                                                    // Get.offAll(() =>
                                                                    //     MapView());
                                                                  },
                                                                ),
                                                                // Text(
                                                                //   "GFG",
                                                                //   //style: TextStyle(color: Colors.green, fontSize:20,fontWeight: FontWeight.bold),
                                                                // ),
                                                                title: Text(
                                                                  'Regular',
                                                                  // _userHomepagContreoller
                                                                  //     .ambulancetype!
                                                                  //     .ambulanceT![index]
                                                                  //     .ambulanceType
                                                                  //     .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .indigo,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  // "List item $index"
                                                                )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left:
                                                              size.width * 0.02,
                                                          right: size.width *
                                                              0.02),
                                                      child:
                                                          NeumorphicTextFieldContainer(
                                                        child: Container(
                                                          // height:
                                                          //     size.height *
                                                          //         0.05,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                            child: ListTile(
                                                                //leading: const Icon(Icons.list),
                                                                trailing:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_circle_right_rounded,
                                                                    size: size
                                                                            .width *
                                                                        0.07,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    SharedPreferences
                                                                        prefs =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    prefs.setString(
                                                                        "AmbulancelistssId",
                                                                        "${_userHomepagContreoller.ambulancetype!.ambulanceT![index].id.toString()}");
                                                                    _ambulancegetController
                                                                        .update();
                                                                    accountService
                                                                        .getAccountData
                                                                        .then(
                                                                            (accountData) {
                                                                      // CallLoader
                                                                      //     .loader();
                                                                      Timer(
                                                                        const Duration(
                                                                            seconds:
                                                                                0),
                                                                        () {
                                                                          Get.to(
                                                                              HospitalListScreen());
                                                                          _getCurrentPosition();
                                                                          postssDriverUpdateApi2();

                                                                          ///15 may 2024...
                                                                          // Get.to(
                                                                          //     MapView2(allowManualEntry: true));
                                                                          ///
                                                                          //_ambulancegetController.selectedvhicleCatagary();
                                                                          //_ambulancegetController.ambulancecatagaryyApi();

                                                                          ///
                                                                        },
                                                                      );
                                                                      //CallLoader.hideLoader();
                                                                    });

                                                                    //Get.off(() => MapUser());

                                                                    // Get.offAll(() =>
                                                                    //     MapView());
                                                                  },
                                                                ),
                                                                // Text(
                                                                //   "GFG",
                                                                //   //style: TextStyle(color: Colors.green, fontSize:20,fontWeight: FontWeight.bold),
                                                                // ),
                                                                title: Text(
                                                                  'Road Accident',
                                                                  // _userHomepagContreoller
                                                                  //     .ambulancetype!
                                                                  //     .ambulanceT![index]
                                                                  //     .ambulanceType
                                                                  //     .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .indigo,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  // "List item $index"
                                                                )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left:
                                                              size.width * 0.02,
                                                          right: size.width *
                                                              0.02),
                                                      child:
                                                          NeumorphicTextFieldContainer(
                                                        child: Container(
                                                          // height:
                                                          //     size.height *
                                                          //         0.05,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                            child: ListTile(
                                                                //leading: const Icon(Icons.list),
                                                                trailing:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_circle_right_rounded,
                                                                    size: size
                                                                            .width *
                                                                        0.07,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    SharedPreferences
                                                                        prefs =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    prefs.setString(
                                                                        "AmbulancelistssId",
                                                                        "${_userHomepagContreoller.ambulancetype!.ambulanceT![index].id.toString()}");
                                                                    _ambulancegetController
                                                                        .update();

                                                                    accountService
                                                                        .getAccountData
                                                                        .then(
                                                                            (accountData) {
                                                                      CallLoader
                                                                          .loader();
                                                                      Timer(
                                                                        const Duration(
                                                                            seconds:
                                                                                3),
                                                                        () {
                                                                          Get.to(
                                                                              MapView3(allowManualEntry: true));
                                                                          //_ambulancegetController.selectedvhicleCatagary();
                                                                          //_ambulancegetController.ambulancecatagaryyApi();
                                                                          //Get.to((MapView));

                                                                          ///
                                                                        },
                                                                      );
                                                                      //CallLoader.hideLoader();
                                                                    });

                                                                    //Get.off(() => MapUser());

                                                                    // Get.offAll(() =>
                                                                    //     MapView());
                                                                  },
                                                                ),
                                                                // Text(
                                                                //   "GFG",
                                                                //   //style: TextStyle(color: Colors.green, fontSize:20,fontWeight: FontWeight.bold),
                                                                // ),
                                                                title: Text(
                                                                  'Funeral/MortuaryService',
                                                                  // _userHomepagContreoller
                                                                  //     .ambulancetype!
                                                                  //     .ambulanceT![index]
                                                                  //     .ambulanceType
                                                                  //     .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .indigo,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  // "List item $index"
                                                                )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            // SingleChildScrollView(
                                            //   child:
                                            //   Column(
                                            //     //mainAxisSize: MainAxisSize.min,
                                            //     children: [
                                            //       InkWell(
                                            //         onTap: () {
                                            //           Get.to(() => MapView());
                                            //           //OrderTrackingPage());
                                            // MapUser());
                                            //         },
                                            //         child:
                                            //         NeumorphicTextFieldContainer(
                                            //           child: Container(
                                            //               height:
                                            //               size.height * 0.05,
                                            //               width: size.width,
                                            //               decoration:
                                            //               BoxDecoration(
                                            //                 color: Colors.white70,
                                            //                 borderRadius:
                                            //                 BorderRadius
                                            //                     .circular(10),
                                            //               ),
                                            //               child: Center(
                                            //                 child: Text(
                                            //                   'Regular',
                                            //                   style: TextStyle(
                                            //                     fontWeight:
                                            //                     FontWeight
                                            //                         .w500,
                                            //                     fontSize:
                                            //                     size.height *
                                            //                         0.02,
                                            //                   ),
                                            //                 ),
                                            //               )
                                            //             // ElevatedButton(
                                            //             //   onPressed: () {},
                                            //             //   child: Text(
                                            //             //     'Select Date',
                                            //             //     style: TextStyle(
                                            //             //       color: Colors.black,
                                            //             //     ),
                                            //             //   ),
                                            //             //   style: ButtonStyle(
                                            //             //     backgroundColor:
                                            //             //         MaterialStateProperty
                                            //             //             .all(Colors
                                            //             //                 .white70),
                                            //             //     padding:
                                            //             //         MaterialStateProperty
                                            //             //             .all(EdgeInsets
                                            //             //                 .all(50)),
                                            //             //     textStyle:
                                            //             //         MaterialStateProperty
                                            //             //             .all(TextStyle(
                                            //             //                 fontSize:
                                            //             //                     30,
                                            //             //                 color: Colors
                                            //             //                     .black)),
                                            //             //   ),
                                            //             // ),
                                            //             // TextFormField(
                                            //             //   controller:
                                            //             //       _appointmentUserController
                                            //             //           .appointmentController,
                                            //             //   onTap: () {
                                            //             //     _appointmentUserController
                                            //             //         .chooseDate();
                                            //             //   },
                                            //             //
                                            //             //   cursorColor: Colors.black,
                                            //             //   obscureText: false,
                                            //             //   decoration: InputDecoration(
                                            //             //     hintText: 'Select date',
                                            //             //     helperStyle: TextStyle(
                                            //             //       color: black
                                            //             //           .withOpacity(0.7),
                                            //             //       fontSize: 18,
                                            //             //     ),
                                            //             //     prefixIcon: Icon(
                                            //             //       Icons
                                            //             //           .calendar_today_outlined,
                                            //             //       color: black
                                            //             //           .withOpacity(0.7),
                                            //             //       size: 20,
                                            //             //     ),
                                            //             //     border: InputBorder.none,
                                            //             //   ),
                                            //             //   keyboardType:
                                            //             //       TextInputType.multiline,
                                            //             //   maxLines: 1,
                                            //             //   autofocus: true,
                                            //             //   //obscureText: true,
                                            //             //   //controller: _loginpasswordController.mobileController,
                                            //             // ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //
                                            //       InkWell(
                                            //         onTap: () {
                                            //           Get.to(() => MapUsers());
                                            //         },
                                            //         child:
                                            //         NeumorphicTextFieldContainer(
                                            //           child: Container(
                                            //               height:
                                            //               size.height * 0.05,
                                            //               width: size.width,
                                            //               decoration:
                                            //               BoxDecoration(
                                            //                 color: Colors.white70,
                                            //                 borderRadius:
                                            //                 BorderRadius
                                            //                     .circular(10),
                                            //               ),
                                            //               child: Center(
                                            //                 child: Text(
                                            //                   'Road Accident',
                                            //                   style: TextStyle(
                                            //                     fontWeight:
                                            //                     FontWeight
                                            //                         .w500,
                                            //                     fontSize:
                                            //                     size.height *
                                            //                         0.02,
                                            //                   ),
                                            //                 ),
                                            //               )
                                            //             // ElevatedButton(
                                            //             //   onPressed: () {},
                                            //             //   child: Text(
                                            //             //     'Select Date',
                                            //             //     style: TextStyle(
                                            //             //       color: Colors.black,
                                            //             //     ),
                                            //             //   ),
                                            //             //   style: ButtonStyle(
                                            //             //     backgroundColor:
                                            //             //         MaterialStateProperty
                                            //             //             .all(Colors
                                            //             //                 .white70),
                                            //             //     padding:
                                            //             //         MaterialStateProperty
                                            //             //             .all(EdgeInsets
                                            //             //                 .all(50)),
                                            //             //     textStyle:
                                            //             //         MaterialStateProperty
                                            //             //             .all(TextStyle(
                                            //             //                 fontSize:
                                            //             //                     30,
                                            //             //                 color: Colors
                                            //             //                     .black)),
                                            //             //   ),
                                            //             // ),
                                            //             // TextFormField(
                                            //             //   controller:
                                            //             //       _appointmentUserController
                                            //             //           .appointmentController,
                                            //             //   onTap: () {
                                            //             //     _appointmentUserController
                                            //             //         .chooseDate();
                                            //             //   },
                                            //             //
                                            //             //   cursorColor: Colors.black,
                                            //             //   obscureText: false,
                                            //             //   decoration: InputDecoration(
                                            //             //     hintText: 'Select date',
                                            //             //     helperStyle: TextStyle(
                                            //             //       color: black
                                            //             //           .withOpacity(0.7),
                                            //             //       fontSize: 18,
                                            //             //     ),
                                            //             //     prefixIcon: Icon(
                                            //             //       Icons
                                            //             //           .calendar_today_outlined,
                                            //             //       color: black
                                            //             //           .withOpacity(0.7),
                                            //             //       size: 20,
                                            //             //     ),
                                            //             //     border: InputBorder.none,
                                            //             //   ),
                                            //             //   keyboardType:
                                            //             //       TextInputType.multiline,
                                            //             //   maxLines: 1,
                                            //             //   autofocus: true,
                                            //             //   //obscureText: true,
                                            //             //   //controller: _loginpasswordController.mobileController,
                                            //             // ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       // InkWell(
                                            //       //   onTap: () {
                                            //       //     Get.to(() => MapUser());
                                            //       //   },
                                            //       //   child:
                                            //       //   NeumorphicTextFieldContainer(
                                            //       //     child: Container(
                                            //       //         height:
                                            //       //         size.height * 0.05,
                                            //       //         width: size.width,
                                            //       //         decoration:
                                            //       //         BoxDecoration(
                                            //       //           color: Colors.white70,
                                            //       //           borderRadius:
                                            //       //           BorderRadius
                                            //       //               .circular(10),
                                            //       //         ),
                                            //       //         child: Center(
                                            //       //           child: Text(
                                            //       //             'Air Ambulance',
                                            //       //             style: TextStyle(
                                            //       //               fontWeight:
                                            //       //               FontWeight
                                            //       //                   .w500,
                                            //       //               fontSize:
                                            //       //               size.height *
                                            //       //                   0.02,
                                            //       //             ),
                                            //       //           ),
                                            //       //         )
                                            //       //       // ElevatedButton(
                                            //       //       //   onPressed: () {},
                                            //       //       //   child: Text(
                                            //       //       //     'Select Date',
                                            //       //       //     style: TextStyle(
                                            //       //       //       color: Colors.black,
                                            //       //       //     ),
                                            //       //       //   ),
                                            //       //       //   style: ButtonStyle(
                                            //       //       //     backgroundColor:
                                            //       //       //         MaterialStateProperty
                                            //       //       //             .all(Colors
                                            //       //       //                 .white70),
                                            //       //       //     padding:
                                            //       //       //         MaterialStateProperty
                                            //       //       //             .all(EdgeInsets
                                            //       //       //                 .all(50)),
                                            //       //       //     textStyle:
                                            //       //       //         MaterialStateProperty
                                            //       //       //             .all(TextStyle(
                                            //       //       //                 fontSize:
                                            //       //       //                     30,
                                            //       //       //                 color: Colors
                                            //       //       //                     .black)),
                                            //       //       //   ),
                                            //       //       // ),
                                            //       //       // TextFormField(
                                            //       //       //   controller:
                                            //       //       //       _appointmentUserController
                                            //       //       //           .appointmentController,
                                            //       //       //   onTap: () {
                                            //       //       //     _appointmentUserController
                                            //       //       //         .chooseDate();
                                            //       //       //   },
                                            //       //       //
                                            //       //       //   cursorColor: Colors.black,
                                            //       //       //   obscureText: false,
                                            //       //       //   decoration: InputDecoration(
                                            //       //       //     hintText: 'Select date',
                                            //       //       //     helperStyle: TextStyle(
                                            //       //       //       color: black
                                            //       //       //           .withOpacity(0.7),
                                            //       //       //       fontSize: 18,
                                            //       //       //     ),
                                            //       //       //     prefixIcon: Icon(
                                            //       //       //       Icons
                                            //       //       //           .calendar_today_outlined,
                                            //       //       //       color: black
                                            //       //       //           .withOpacity(0.7),
                                            //       //       //       size: 20,
                                            //       //       //     ),
                                            //       //       //     border: InputBorder.none,
                                            //       //       //   ),
                                            //       //       //   keyboardType:
                                            //       //       //       TextInputType.multiline,
                                            //       //       //   maxLines: 1,
                                            //       //       //   autofocus: true,
                                            //       //       //   //obscureText: true,
                                            //       //       //   //controller: _loginpasswordController.mobileController,
                                            //       //       // ),
                                            //       //     ),
                                            //       //   ),
                                            //       // ),
                                            //       InkWell(
                                            //         onTap: () {
                                            //           Get.to(() => MapUser());
                                            //         },
                                            //         child:
                                            //         NeumorphicTextFieldContainer(
                                            //           child: Container(
                                            //               height:
                                            //               size.height * 0.05,
                                            //               width: size.width,
                                            //               decoration:
                                            //               BoxDecoration(
                                            //                 color: Colors.white70,
                                            //                 borderRadius:
                                            //                 BorderRadius
                                            //                     .circular(10),
                                            //               ),
                                            //               child: Center(
                                            //                 child: Text(
                                            //                   'Funeral/Mortuary Service',
                                            //                   style: TextStyle(
                                            //                     fontWeight:
                                            //                     FontWeight
                                            //                         .w500,
                                            //                     fontSize:
                                            //                     size.height *
                                            //                         0.02,
                                            //                   ),
                                            //                 ),
                                            //               )
                                            //             // ElevatedButton(
                                            //             //   onPressed: () {},
                                            //             //   child: Text(
                                            //             //     'Select Date',
                                            //             //     style: TextStyle(
                                            //             //       color: Colors.black,
                                            //             //     ),
                                            //             //   ),
                                            //             //   style: ButtonStyle(
                                            //             //     backgroundColor:
                                            //             //         MaterialStateProperty
                                            //             //             .all(Colors
                                            //             //                 .white70),
                                            //             //     padding:
                                            //             //         MaterialStateProperty
                                            //             //             .all(EdgeInsets
                                            //             //                 .all(50)),
                                            //             //     textStyle:
                                            //             //         MaterialStateProperty
                                            //             //             .all(TextStyle(
                                            //             //                 fontSize:
                                            //             //                     30,
                                            //             //                 color: Colors
                                            //             //                     .black)),
                                            //             //   ),
                                            //             // ),
                                            //             // TextFormField(
                                            //             //   controller:
                                            //             //       _appointmentUserController
                                            //             //           .appointmentController,
                                            //             //   onTap: () {
                                            //             //     _appointmentUserController
                                            //             //         .chooseDate();
                                            //             //   },
                                            //             //
                                            //             //   cursorColor: Colors.black,
                                            //             //   obscureText: false,
                                            //             //   decoration: InputDecoration(
                                            //             //     hintText: 'Select date',
                                            //             //     helperStyle: TextStyle(
                                            //             //       color: black
                                            //             //           .withOpacity(0.7),
                                            //             //       fontSize: 18,
                                            //             //     ),
                                            //             //     prefixIcon: Icon(
                                            //             //       Icons
                                            //             //           .calendar_today_outlined,
                                            //             //       color: black
                                            //             //           .withOpacity(0.7),
                                            //             //       size: 20,
                                            //             //     ),
                                            //             //     border: InputBorder.none,
                                            //             //   ),
                                            //             //   keyboardType:
                                            //             //       TextInputType.multiline,
                                            //             //   maxLines: 1,
                                            //             //   autofocus: true,
                                            //             //   //obscureText: true,
                                            //             //   //controller: _loginpasswordController.mobileController,
                                            //             // ),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //
                                            //       // SizedBox(
                                            //       //     height: size.height * 0.05,
                                            //       //     child: TestPickerWidget()),
                                            //       ///..................
                                            //       // Obx(
                                            //       //   () => Text(
                                            //       //     DateFormat("dd-MM-yyyy")
                                            //       //         .format(_appointmentController
                                            //       //             .selectedDate.value)
                                            //       //         .toString(),
                                            //       //     style: TextStyle(fontSize: 25),
                                            //       //   ),
                                            //       // ),
                                            //
                                            //       // SizedBox(
                                            //       //   height: 30.0,
                                            //       // ),
                                            //       // ElevatedButton(
                                            //       //   style:
                                            //       //       ElevatedButton.styleFrom(
                                            //       //     foregroundColor:
                                            //       //         Colors.yellow,
                                            //       //     backgroundColor: Colors
                                            //       //         .red, // foreground
                                            //       //   ),
                                            //       //   onPressed: () {
                                            //       //     Get.back();
                                            //       //     // Get.to(() =>
                                            //       //     //     AppointmentHistory()
                                            //       //     // );
                                            //       //     // todoController.todos.add(
                                            //       //     //   Todo(
                                            //       //     //     text: textEditingController.text,
                                            //       //     //   ),
                                            //       //     // );
                                            //       //     //Get.back();
                                            //       //   },
                                            //       //   child: Text(
                                            //       //     'Appointment History',
                                            //       //     style: TextStyle(
                                            //       //         color: Colors.white,
                                            //       //         fontSize: 16.0),
                                            //       //   ),
                                            //       //   //color: Colors.redAccent,
                                            //       // )
                                            //     ],
                                            //   ),
                                            // ),

                                            radius: 10.0);
                                        //whatsAppOpen();
                                        // _launchWhatsapp();
                                        // Get.to(() => ComplainList());
                                        //Get.to(() => Profoile());
                                      } else if (index == 3) {
                                        _chooseLabController.getTestNameApi();
                                        _chooseLabController.getStateLabApi();
                                        _chooseLabController.update();
                                        _chooseLabController
                                            .selectedState.value = null;
                                        _chooseLabController
                                            .selectedCity.value = null;
                                        _chooseLabController
                                            .selectedTest.value = null;
                                        CallLoader.loader();
                                        await Future.delayed(
                                            Duration(seconds: 2));
                                        CallLoader.hideLoader();

                                        await Get.to(() => ChooseLab());
                                        //Get.to(() => ReportList());

                                        ///
                                        //Get.to(() => TheJwelleryStore());
                                        //Get.to(() => CarouselDReportList());
                                        //HealthCheckup1());
                                        //Get.defaultDialog(
                                        //barrierDismissible: true,
                                      } else if (index == 4) {
                                        // _medicineListController
                                        //     .medicineListApi();
                                        // _medicineListController.update();
                                        CallLoader.loader();
                                        await Future.delayed(
                                            Duration(seconds: 1));
                                        CallLoader.hideLoader();
                                        Get.to(() => ReportList());
                                        // Get.defaultDialog(
                                        //     barrierDismissible: true,
                                        //     backgroundColor: MyTheme.t1containercolor,
                                        //     title: '',
                                        //     content: Column(
                                        //       mainAxisSize: MainAxisSize.min,
                                        //       children: [
                                        //         Directionality(
                                        //           textDirection: TextDirection.ltr,
                                        //           child: Center(
                                        //             child: Padding(
                                        //               padding:
                                        //                   const EdgeInsets.all(0.0),
                                        //               child: TextFormField(
                                        //                 decoration: InputDecoration(
                                        //                   filled: true,
                                        //
                                        //                   fillColor: MyTheme
                                        //                       .t1bacgroundcolors1,
                                        //                   hintText:
                                        //                       'Enter Service Name',
                                        //                   contentPadding:
                                        //                       const EdgeInsets.only(
                                        //                           left: 14.0,
                                        //                           bottom: 4.0,
                                        //                           top: 16.0),
                                        //                   focusedBorder:
                                        //                       OutlineInputBorder(
                                        //                     borderSide: new BorderSide(
                                        //                         color: Colors.green),
                                        //                     borderRadius:
                                        //                         new BorderRadius
                                        //                             .circular(10),
                                        //                   ),
                                        //                   enabledBorder:
                                        //                       UnderlineInputBorder(
                                        //                     borderSide: new BorderSide(
                                        //                         color:
                                        //                             Colors.transparent),
                                        //                     borderRadius:
                                        //                         new BorderRadius
                                        //                             .circular(10.0),
                                        //                   ),
                                        //                   //focusedBorder: InputBorder.none,
                                        //                   //enabledBorder: InputBorder.none,
                                        //                   // errorBorder: InputBorder.none,
                                        //                   // border: InputBorder.none,
                                        //
                                        //                   border: OutlineInputBorder(
                                        //                     borderSide: BorderSide(
                                        //                         color: Colors.red,
                                        //                         width: 2.0),
                                        //                     borderRadius:
                                        //                         BorderRadius.circular(
                                        //                             10),
                                        //                   ),
                                        //                   // labelText: "Password",
                                        //                   prefixIcon: Padding(
                                        //                     padding:
                                        //                         EdgeInsets.symmetric(
                                        //                             vertical:
                                        //                                 size.height *
                                        //                                     0.012,
                                        //                             horizontal:
                                        //                                 size.width *
                                        //                                     0.02),
                                        //                     child: Image.asset(
                                        //                       'lib/assets/images/profile.png',
                                        //                       color:
                                        //                           MyTheme.t1Iconcolor,
                                        //                       height: 10,
                                        //                       width: 10,
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 keyboardType: TextInputType
                                        //                     .visiblePassword,
                                        //                 //obscureText: true,
                                        //                 // controller:
                                        //                 // _registerComplainController.nameController,
                                        //                 // onSaved: (value) {
                                        //                 //   _registerComplainController.name = value!;
                                        //                 // },
                                        //                 // validator: (value) {
                                        //                 //   return _registerComplainController
                                        //                 //       .validateName(value!);
                                        //                 // },
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         // TextField(
                                        //         //   //controller: settingsScreenController.categoryNameController,
                                        //         //   keyboardType: TextInputType.text,
                                        //         //   maxLines: 1,
                                        //         //   decoration: InputDecoration(
                                        //         //       labelText: 'Service name',
                                        //         //       hintMaxLines: 1,
                                        //         //       border: OutlineInputBorder(
                                        //         //           borderSide: BorderSide(
                                        //         //               color: Colors.green,
                                        //         //               width: 4.0))),
                                        //         // ),
                                        //         SizedBox(
                                        //           height: 30.0,
                                        //         ),
                                        //         PhysicalModel(
                                        //           color: Colors.white,
                                        //           shadowColor: Colors.grey,
                                        //           elevation: 4,
                                        //           borderRadius:
                                        //               BorderRadius.circular(10),
                                        //           child: Padding(
                                        //             padding: const EdgeInsets.all(3.0),
                                        //             child: Container(
                                        //               height: size.height * 0.04,
                                        //               width: size.width * 0.4,
                                        //               decoration: BoxDecoration(
                                        //                 color: MyTheme.t1Iconcolor,
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(10),
                                        //               ),
                                        //               child: Center(
                                        //                 child: Text(
                                        //                   'ADD SERVICE',
                                        //                   style: TextStyle(
                                        //                       color: Colors.white,
                                        //                       fontSize: 14.0,
                                        //                       fontWeight:
                                        //                           FontWeight.w600),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     radius: 10.0);
                                        ///
                                        //Get.to(() => ServicesPage());
                                      } else if (index == 5) {
                                        _medicineListController
                                            .medicineListApi();
                                        _medicineListController.update();
                                        CallLoader.loader();
                                        await Future.delayed(
                                            Duration(seconds: 1));
                                        CallLoader.hideLoader();
                                        Get.to(() => SearchMedicine());

                                        // Get.defaultDialog(
                                        //     barrierDismissible: true,
                                        //     backgroundColor: MyTheme.t1containercolor,
                                        //     title: '',
                                        //     content: Column(
                                        //       mainAxisSize: MainAxisSize.min,
                                        //       children: [
                                        //         Directionality(
                                        //           textDirection: TextDirection.ltr,
                                        //           child: Center(
                                        //             child: Padding(
                                        //               padding:
                                        //                   const EdgeInsets.all(0.0),
                                        //               child: TextFormField(
                                        //                 decoration: InputDecoration(
                                        //                   filled: true,
                                        //
                                        //                   fillColor: MyTheme
                                        //                       .t1bacgroundcolors1,
                                        //                   hintText:
                                        //                       'Enter Service Name',
                                        //                   contentPadding:
                                        //                       const EdgeInsets.only(
                                        //                           left: 14.0,
                                        //                           bottom: 4.0,
                                        //                           top: 16.0),
                                        //                   focusedBorder:
                                        //                       OutlineInputBorder(
                                        //                     borderSide: new BorderSide(
                                        //                         color: Colors.green),
                                        //                     borderRadius:
                                        //                         new BorderRadius
                                        //                             .circular(10),
                                        //                   ),
                                        //                   enabledBorder:
                                        //                       UnderlineInputBorder(
                                        //                     borderSide: new BorderSide(
                                        //                         color:
                                        //                             Colors.transparent),
                                        //                     borderRadius:
                                        //                         new BorderRadius
                                        //                             .circular(10.0),
                                        //                   ),
                                        //                   //focusedBorder: InputBorder.none,
                                        //                   //enabledBorder: InputBorder.none,
                                        //                   // errorBorder: InputBorder.none,
                                        //                   // border: InputBorder.none,
                                        //
                                        //                   border: OutlineInputBorder(
                                        //                     borderSide: BorderSide(
                                        //                         color: Colors.red,
                                        //                         width: 2.0),
                                        //                     borderRadius:
                                        //                         BorderRadius.circular(
                                        //                             10),
                                        //                   ),
                                        //                   // labelText: "Password",
                                        //                   prefixIcon: Padding(
                                        //                     padding:
                                        //                         EdgeInsets.symmetric(
                                        //                             vertical:
                                        //                                 size.height *
                                        //                                     0.012,
                                        //                             horizontal:
                                        //                                 size.width *
                                        //                                     0.02),
                                        //                     child: Image.asset(
                                        //                       'lib/assets/images/profile.png',
                                        //                       color:
                                        //                           MyTheme.t1Iconcolor,
                                        //                       height: 10,
                                        //                       width: 10,
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 keyboardType: TextInputType
                                        //                     .visiblePassword,
                                        //                 //obscureText: true,
                                        //                 // controller:
                                        //                 // _registerComplainController.nameController,
                                        //                 // onSaved: (value) {
                                        //                 //   _registerComplainController.name = value!;
                                        //                 // },
                                        //                 // validator: (value) {
                                        //                 //   return _registerComplainController
                                        //                 //       .validateName(value!);
                                        //                 // },
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         // TextField(
                                        //         //   //controller: settingsScreenController.categoryNameController,
                                        //         //   keyboardType: TextInputType.text,
                                        //         //   maxLines: 1,
                                        //         //   decoration: InputDecoration(
                                        //         //       labelText: 'Service name',
                                        //         //       hintMaxLines: 1,
                                        //         //       border: OutlineInputBorder(
                                        //         //           borderSide: BorderSide(
                                        //         //               color: Colors.green,
                                        //         //               width: 4.0))),
                                        //         // ),
                                        //         SizedBox(
                                        //           height: 30.0,
                                        //         ),
                                        //         PhysicalModel(
                                        //           color: Colors.white,
                                        //           shadowColor: Colors.grey,
                                        //           elevation: 4,
                                        //           borderRadius:
                                        //               BorderRadius.circular(10),
                                        //           child: Padding(
                                        //             padding: const EdgeInsets.all(3.0),
                                        //             child: Container(
                                        //               height: size.height * 0.04,
                                        //               width: size.width * 0.4,
                                        //               decoration: BoxDecoration(
                                        //                 color: MyTheme.t1Iconcolor,
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(10),
                                        //               ),
                                        //               child: Center(
                                        //                 child: Text(
                                        //                   'ADD SERVICE',
                                        //                   style: TextStyle(
                                        //                       color: Colors.white,
                                        //                       fontSize: 14.0,
                                        //                       fontWeight:
                                        //                           FontWeight.w600),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     radius: 10.0);
                                        ///
                                        //Get.to(() => ServicesPage());
                                      }
                                      // else if (index == 6) {
                                      //   Get.to(() => SupportView());
                                      // }
                                      ///
                                      // else if (index == 7) {
                                      //   Get.to(() => AddBankDetail());
                                      //
                                      //   //Get.to(() => TermsMemberPage());
                                      // }
                                    },
                                    child: Container(
                                      height: size.height * 0.11,
                                      width: size.width * 0.23,
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
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
                                        //  SvgPicture.asset(
                                        // 'lib/assets/user_assets_svg/1nurse.svg'
                                        productimage[index],
                                        // color: Colors.amber,
                                        // semanticsLabel: 'My SVG Image',
                                        height: 100,
                                        width: 70,
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
                                        color:
                                            Color(0xffffffff).withOpacity(0.9),
                                        //Colors.pink.shade100,
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
                          //   Container(
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //       color: Colors.amber,
                          //       borderRadius: BorderRadius.circular(15)),
                          //   child: Text(productname[index]),
                          // );
                        }),
                  ),
                )
              ],
            ),
          ),
          //  ),
        ),
      ),
    );
  }
}

// class Mycrusial extends StatelessWidget {
//   final _sliderKey = GlobalKey();
//   UserHomepagContreoller _userHomepagContreoller = Get.put(UserHomepagContreoller());
//   Future<List<String>> getData() async {
//     var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
//     var res = await http.get(Uri.parse(url));
//     if (res.statusCode == 200) {
//       var data = json.decode(res.body);
//       var rest = data["BannerImageList"];
//       //your json string
//       String jsonString = json.encode(rest);
//       //convert json string to list
//       List<String> newData = List<String>.from(json.decode(jsonString));
//       print("List Size&&&&&&&&&&&&&&&: ${newData}");
//       return newData;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   Mycrusial({Key? key}) : super(key: key);
//
//   final List<Color> colors = [
//     Colors.red,
//     Colors.orange,
//     Colors.yellow,
//     Colors.green,
//     Colors.blue,
//     Colors.indigo,
//     Colors.purple,
//   ];
//
//   final List<String> images = [
//     "https://plus.unsplash.com/premium_photo-1661776255948-7a76baa9d7b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80",
//     "https://images.unsplash.com/photo-1601841162542-956af38ba052?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
//     'https://images.unsplash.com/photo-1599493758267-c6c884c7071f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
//     'https://images.unsplash.com/photo-1576765608622-067973a79f53?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1756&q=80',
//     'https://images.unsplash.com/photo-1588543385566-413e13a51a24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
//     'https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1791&q=80',
//     'https://images.unsplash.com/photo-1624727828489-a1e03b79bba8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80',
//     //"https://images.unsplash.com/photo-1625047509248-ec889cbff17f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
//     // "https://images.unsplash.com/photo-1607400201515-c2c41c07d307?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
//     //"https://images.unsplash.com/photo-1621905251918-48416bd8575a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YWMlMjByZXBhaXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
//     //"https://images.unsplash.com/photo-1604754742629-3e5728249d73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
//     //"https://images.unsplash.com/photo-1513366884929-f0b3bedfb653?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
//     //"https://images.unsplash.com/photo-1577801622187-9a1076d049da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
//     // "https://images.unsplash.com/photo-1615870123253-f3de8aa89e24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXxjVlFHYWlJSTI3OHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
//   ];
//   final bool _isPlaying = true;
//
//   //get _sliderKey => null;
//   var base = 'https://api.gyros.farm/Images/';
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Obx(
//               () => (_userHomepagContreoller.isLoading.value)
//               ? Center(child: CircularProgressIndicator())
//           //: _homePageController.getsliderbaner!.bannerImageList != null
//                   : _userHomepagContreoller.getsliderbaner!.bannerImageList == null
//           //: _allProductController.allProductModel!.result!.isEmpty
//           //_bestSellerController.bestsellermodel!.result!.isEmpty
//               ? Center(
//             child: Text('No data'),
//           )
//
//           :Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Container(
//             height: size.height * 0.28,
//             width: size.width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Material(
//                 color: MyTheme.ThemeColors,
//                 borderRadius: BorderRadius.circular(10),
//                 elevation: 0,
//                 child: CarouselSlider.builder(
//                   //scrollPhysics: NeverScrollableScrollPhysics(),
//                   key: _sliderKey,
//                   unlimitedMode: true,
//                   autoSliderTransitionTime: Duration(seconds: 1),
//                   //autoSliderDelay: Duration(seconds: 5),
//                   slideBuilder: (index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(7.0),
//                       child: Material(
//                         elevation: 12,
//                         borderRadius: BorderRadius.circular(10),
//                         child: Container(
//                           height: size.height * 38,
//                           width: size.width,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.white, width: 3),
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                     images[index]
//                                 ),
//                                 fit: BoxFit.fill),
//                           ),
//                           //color: colors[index],
//                           // child: Text(
//                           //   letters[index],
//                           //   style: TextStyle(fontSize: 200, color: Colors.white),
//                           // ),
//                           child: Image.network(
//                             base +
//                                 '${_userHomepagContreoller.getsliderbaner!.bannerImageList![index].toString()}',
//                             fit: BoxFit.fitWidth,
//                             errorBuilder: (context, error, stackTrace) {
//                               //if image not comming in catagary then we have to purchase
//
//                               return Text(
//                                 'No Image',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: size.height*12,
//                                 ),
//                               );
//                             },
//                             //images[index]
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   slideTransform: DefaultTransform(),
//                   slideIndicator: CircularSlideIndicator(
//                     indicatorBorderWidth: 2,
//                     indicatorRadius: 4,
//                     itemSpacing: 15,
//                     currentIndicatorColor: Colors.white,
//                     padding: EdgeInsets.only(bottom: 0),
//                   ),
//                   itemCount: _userHomepagContreoller.banerlistmodel!.bannerImageList.length,
//                   //images.length,
//                   enableAutoSlider: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

///...........
///
///
Future<Position> _getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  await Future.delayed(Duration(seconds: 2));
  await Get.dialog(
    // bool barrierDismissible = true

    AlertDialog(
      title: const Text('Ps Wellness'),
      content: const Text(
          """When you grant permission for  location access in our application, we may collect and process certain information related to your geographical location. This includes GPS coordinates, Wi-Fi network information, cellular tower data, Background Location, and other relevant data sources to determine your device's location."""),
      actions: [
        TextButton(
          child: const Text("Reject"),
          onPressed: () => Get.back(),
        ),
        TextButton(
          child: const Text("Accept"),
          onPressed: () => Get.back(),
        ),
      ],
    ),
    barrierDismissible: false,
  );

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // return Future.value('');
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    await Geolocator.openLocationSettings();

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
