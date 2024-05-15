import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_firebase_notifications/message_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/drawer_contoller/doctor_history_section/doctor_history_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/notiification_view_page/notification_message2.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/notiification_view_page/notification_page_message_firebase.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';

import '../controllers/1_user_view_controller/ambulance/driver_accept_list_controller.dart';
import '../controllers/1_user_view_controller/drawer_contoller/nurse_history_controller/nurse_history_controllerss.dart';
import '../controllers/3_driver_view_controllers/driver_home_page_controller/driver_user_acpt_rejct_list/user_list_accept_reject_list.dart';
import '../controllers/4_nurse_controllerRRR33344new/nurse_appointment_detail_controller/nurse_appointment_nurse_detailsss.dart';
import '../controllers/9_doctor_controllers_RRR/doctor_home_controller/doctor_home_controllers.dart';
import '../utils/services/account_service.dart';

class NotificationServices {
  //initialising firebase message plugin
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //initialising firebase message plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  UseracptrejectController _useracptrejectController =
      Get.put(UseracptrejectController());
  DoctorHistoryController _doctorHistoryController =
      Get.put(DoctorHistoryController());

  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  NurseAppointmentNurseDetailController _nurseappointmentnursedetailController =
      Get.put(NurseAppointmentNurseDetailController());

  DoctorHomepageController _doctorHomepageController =
      Get.put(DoctorHomepageController());

  NurseHistoryController _nurseHistoryController =
      Get.put(NurseHistoryController());

  //function to initialise flutter local notification plugin to show notifications for android when app is active
  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      // handle interaction when app is active for android
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (kDebugMode) {
        print("notifications title:${notification!.title}");
        print("notifications body:${notification.body}");
        print('count:${android!.count}');
        print('data:${message.data.toString()}');
      }

      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      //appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  // function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        //Random.secure().nextInt(100000).toString();
        message.notification!.android!.channelId.toString(),
        message.notification!.android!.channelId.toString(),
        importance: Importance.max,
        showBadge: true,
        playSound: true,
        sound: const RawResourceAndroidNotificationSound('jetsons_doorbell'));

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'my channel description',
            importance: Importance.high,
            priority: Priority.high,
            playSound: true,
            ticker: 'ticker',
            sound: channel.sound
            //     sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
            //  icon: largeIconPath
            );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  //function to get device token on which we will send the notifications
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('refreshtoken');
      }
    });
  }

  //handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    // when app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) async {
    if (message.data['type'] == 'msj') {
      await Future.delayed(Duration(milliseconds: 200));
      _useracptrejectController.driveracceptrejctlistApi();
      _useracptrejectController.update();
      accountService.getAccountData.then((accountData) {
        //CallLoader.loader();
        // nearlistdriverApi();
        Timer(
          const Duration(milliseconds: 200),
          () {
            print("dataa1${message.data['id']}");
            // nearlistdriverApi();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessageScreen(
                          id: message.data['id'],
                        )));
            // Get.to(MessageScreen(
            //   id: message.data['id'],
            // ));
            //Get.to((MapView));
            //postAmbulancerequestApi(markers);

            ///
          },
        );
        //CallLoader.hideLoader();
      });

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MessageScreen(
      //               id: message.data['id'],
      //             )));
    } else if (message.data['type'] == 'accept_case') {
      print("dataaaccept${message.data['id']}");
      //_useracptrejectController.driveracceptrejctlistApi();
      //_useracptrejectController.update();

      await Future.delayed(Duration(milliseconds: 200));
      _driverAcceptlistController.driveracceptuserDetailApi();
      _driverAcceptlistController.update();

      ///todo new....29....aug 2023...

      _driverAcceptlistController.refresh();
      _driverAcceptlistController.onInit();

      ///todo end new....29....aug 2023...

      accountService.getAccountData.then((accountData) {
        // CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(milliseconds: 600),
          () {
            // nearlistdriverApi();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessageScreen2(
                          id: message.data['id'],
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

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MessageScreen(
      //               id: message.data['id'],
      //             )));
    } else if (message.data['type'] == 'reject_case') {
      print("reject${message.data['id']}");
    } else if (message.data['type'] == 'cancel_case_doctor') {
      print("dataaacceptewew${message.data['id']}");
      //_useracptrejectController.driveracceptrejctlistApi();
      //_useracptrejectController.update();

      await Future.delayed(Duration(milliseconds: 200));
      // _doctorHomepageController.doctorAppoinmentDetail();
      //_doctorHomepageController.update();
      _doctorHistoryController.doctorListHospitalApi();
      _doctorHistoryController.onInit();
      _doctorHistoryController.update();
      accountService.getAccountData.then((accountData) {
        // CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(milliseconds: 600),
          () {
            // nearlistdriverApi();
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DoctorHistoryUser(
            //               id: message.data['id'],
            //             )));

            ///
          },
        );
        CallLoader.hideLoader();
      });
    } else if (message.data['type'] == 'cancel_case_nurse') {
      print("dataaacceptewew${message.data['id']}");
      //_useracptrejectController.driveracceptrejctlistApi();
      //_useracptrejectController.update();

      await Future.delayed(Duration(milliseconds: 200));
      // _nurseappointmentnursedetailController.nurseappointmentApi();
      // _nurseappointmentnursedetailController.update();
      //_nurseappointmentnursedetailController.onInit();
      ///
      _nurseHistoryController.nursehistoryApi();
      _nurseHistoryController.update();
      //                                                                                     //  .skillsListApi();
      //                                                                                     _nurseHistoryController.update();
      // CallLoader.loader();
      // await Future.delayed(
      //     Duration(milliseconds: 900));
      // CallLoader.hideLoader();
      accountService.getAccountData.then((accountData) {
        // CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(milliseconds: 600),
          () {
            // nearlistdriverApi();
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => NurseHistoryUser(
            //               id: message.data['id'],
            //             )));

            ///
          },
        );
        CallLoader.hideLoader();
      });
    } else if (message.data['type'] == 'accept_case') {
      print("dataaaccept${message.data['id']}");
      //_useracptrejectController.driveracceptrejctlistApi();
      //_useracptrejectController.update();

      await Future.delayed(Duration(milliseconds: 200));
      _driverAcceptlistController.driveracceptuserDetailApi();
      _driverAcceptlistController.update();
      accountService.getAccountData.then((accountData) {
        // CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(milliseconds: 600),
          () {
            // nearlistdriverApi();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessageScreen2(
                          id: message.data['id'],
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

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MessageScreen(
      //               id: message.data['id'],
      //             )));
    }
  }

  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
