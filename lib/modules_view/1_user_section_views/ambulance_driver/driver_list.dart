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
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/driver_list_model.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import 'package:ps_welness_new_ui/notificationservice/local_notification_service.dart';
import 'package:ps_welness_new_ui/notificationservice/notification_fb_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/1_user_view_controller/ambulance/driver_accept_list_controller.dart';
import '../../../controllers/1_user_view_controller/ambulance/get_ambulancetype_controller.dart';
import '../../../utils/services/account_service.dart';
import '../../../widgets/circular_loader.dart';
import '../notiification_view_page/notification_message2.dart';

String PatientRegNo = ''.toString();
String userPassword = ''.toString();

String DriverId = ''.toString();
String driverpassword = ''.toString();
var alldevicetoken = '';

class Driver_List_LocationId extends StatefulWidget {
  Driver_List_LocationId({Key? key, this.driverlist}) : super(key: key);
  DriverListApi? driverlist;

  @override
  State<Driver_List_LocationId> createState() => _Driver_List_LocationIdState();
}

class _Driver_List_LocationIdState extends State<Driver_List_LocationId> {
  //NotificationServices notificationServices = NotificationServices();

  //DriverPayoutController _driverPayoutController =
  AmbulancegetController _ambulancegetController =
      Get.put(AmbulancegetController());
  NotificationServices notificationServices = NotificationServices();
  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  ///implement firebase....27...jun..2023
  @override
  void initState() {
    super.initState();
    // print("okoko33334${alldevicetoken}");
    //DriverListApi? driverlist;
    List<DriverListApi> driverlists = [];

    ///for each loop......przactice

    List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
    driverlists?.forEach((sd) {
      print("trtrtrtrt888888${sd}");
    });
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

  // get kButtonAnimationDuration => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///for each loop......przactice....

    List<String> driverlist = ['weqweqeqeqqddqdq', 'dsdwdwd'];

    driverlist.forEach((driverlist) {
      print(driverlist);
    });

    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Obx(
            () => _ambulancegetController.isLoading.isFalse
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: size.height * 0.007,
                        //bottom: size.height * 0.64,
                        //left: -30,
                        left: -size.width * 0.024,
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
                      Positioned(
                        top: size.height * 0.09,
                        //bottom: size.height * 0.64,
                        //left: -30,
                        right: size.width * 0.024,
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.3,
                          child: NeoPopButton(
                            color: Colors.red.shade800,
                            bottomShadowColor: ColorUtils.getVerticalShadow(
                                    Colors.red.shade300)
                                .toColor(),
                            rightShadowColor: ColorUtils.getHorizontalShadow(
                                    Colors.red.shade300)
                                .toColor(),
                            //animationDuration: kButtonAnimationDuration,
                            depth: kButtonDepth,
                            onTapUp: () async {
                              widget.driverlist?.message?.forEach((element) {
                                ///.......
                                _ambulancegetController
                                    .postAmbulancerequestApi2();
                                print('princee notification');
                                notificationServices
                                    .getDeviceToken()
                                    .then((value) async {
                                  var data = {
                                    //this the particular device id.....
                                    'to':
                                        // 'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                                        //'caK4UmMZQ2qfntD6ojs3n-:APA91bE6hmA3i8mG2H0x4v4Sd3cyG6DyEcyL34NHj-y4L6tWzbgWqC0JvOd8H3rsGaHb7pL547UjZEQAKXG4OD1imPaUTHVFvW0zZUFG3sxYVFkrbqnJDGOF7_Zog49MpbgFdX71ukHQ',
                                        //'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',

                                        ///todo device token......
                                        // "${widget.driverlist?.message?[0].deviceId}"
                                        "${element.deviceId}".toString(),

                                    ///
                                    //
                                    //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                    //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                    //.toString(),

                                    ///this is same device token....
                                    //value
                                    //.toString(),
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
                                    'data': {
                                      'type': 'msj',
                                      'id': '123456',
                                    }
                                  };
                                  print("data1${data}");

                                  await http.post(
                                      Uri.parse(
                                          'https://fcm.googleapis.com/fcm/send'),
                                      body: jsonEncode(data),
                                      headers: {
                                        'Content-Type':
                                            'application/json; charset=UTF-8',
                                        'Authorization':
                                            //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                            'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                      }).then((value) {
                                    if (kDebugMode) {
                                      print(
                                          "bookdriver${value.body.toString()}");
                                    }
                                  }).onError((error, stackTrace) {
                                    if (kDebugMode) {
                                      print(error);
                                    }
                                  });

                                  ///todo: from here custom from backend start...
                                  var prefs = GetStorage();
                                  PatientRegNo =
                                      prefs.read("PatientRegNo").toString();
                                  print(
                                      '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
                                  var body = {
                                    "UserId": "${PatientRegNo}",
                                    "DeviceId": value.toString(),
                                  };
                                  print(
                                      "userrrtokenupdateeeddbeforetttt${body}");
                                  http.Response r = await http.post(
                                    Uri.parse(
                                        'http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
                                    body: body,
                                  );

                                  print(r.body);
                                  if (r.statusCode == 200) {
                                    print("userrrtokenupdateeedd111${body}");
                                    return r;
                                  } else if (r.statusCode == 401) {
                                    Get.snackbar('message', r.body);
                                  } else {
                                    Get.snackbar('Error', r.body);
                                    return r;
                                  }

                                  ///todo end post api from backend...
                                });
                              });
                            },
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Request All",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///request all driver bhaiya.....suggession...
                      // Positioned(
                      //   top: size.height * 0.066,
                      //   //bottom: size.height * 0.64,
                      //   //left: -30,
                      //   left: size.width * 0.3,
                      //
                      //   ///todo: all booking driver...
                      //   child: Padding(
                      //     padding: EdgeInsets.all(2.0),
                      //     child: InkWell(
                      //         onTap: () async {
                      //           widget.driverlist?.message?.forEach((element) {
                      //             ///.......
                      //             print('princee notification');
                      //             notificationServices
                      //                 .getDeviceToken()
                      //                 .then((value) async {
                      //               var data = {
                      //                 //this the particular device id.....
                      //                 'to':
                      //                     // 'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                      //                     //'caK4UmMZQ2qfntD6ojs3n-:APA91bE6hmA3i8mG2H0x4v4Sd3cyG6DyEcyL34NHj-y4L6tWzbgWqC0JvOd8H3rsGaHb7pL547UjZEQAKXG4OD1imPaUTHVFvW0zZUFG3sxYVFkrbqnJDGOF7_Zog49MpbgFdX71ukHQ',
                      //                     //'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                      //
                      //                     ///todo device token......
                      //                     // "${widget.driverlist?.message?[0].deviceId}"
                      //                     "${element.deviceId}".toString(),
                      //
                      //                 ///
                      //                 //
                      //                 //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                      //                 //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                      //                 //.toString(),
                      //
                      //                 ///this is same device token....
                      //                 //value
                      //                 //.toString(),
                      //                 'notification': {
                      //                   'title': 'Ps_Wellness',
                      //                   'body':
                      //                       'You have request for ambulance',
                      //                   //"sound": "jetsons_doorbell.mp3"
                      //                 },
                      //                 'android': {
                      //                   'notification': {
                      //                     'notification_count': 23,
                      //                   },
                      //                 },
                      //                 'data': {
                      //                   'type': 'msj',
                      //                   'id': '123456',
                      //                 }
                      //               };
                      //
                      //               await http.post(
                      //                   Uri.parse(
                      //                       'https://fcm.googleapis.com/fcm/send'),
                      //                   body: jsonEncode(data),
                      //                   headers: {
                      //                     'Content-Type':
                      //                         'application/json; charset=UTF-8',
                      //                     'Authorization':
                      //                         //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                      //                         'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                      //                   }).then((value) {
                      //                 if (kDebugMode) {
                      //                   print(value.body.toString());
                      //                 }
                      //               }).onError((error, stackTrace) {
                      //                 if (kDebugMode) {
                      //                   print(error);
                      //                 }
                      //               });
                      //
                      //               ///todo: from here custom from backend start...
                      //               var prefs = GetStorage();
                      //               PatientRegNo =
                      //                   prefs.read("PatientRegNo").toString();
                      //               print(
                      //                   '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
                      //               var body = {
                      //                 "UserId": "${PatientRegNo}",
                      //                 "DeviceId": value.toString(),
                      //               };
                      //               print(
                      //                   "userrrtokenupdateeeddbeforetttt${body}");
                      //               http.Response r = await http.post(
                      //                 Uri.parse(
                      //                     'http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
                      //                 body: body,
                      //               );
                      //
                      //               print(r.body);
                      //               if (r.statusCode == 200) {
                      //                 print("userrrtokenupdateeedd111${body}");
                      //                 return r;
                      //               } else if (r.statusCode == 401) {
                      //                 Get.snackbar('message', r.body);
                      //               } else {
                      //                 Get.snackbar('Error', r.body);
                      //                 return r;
                      //               }
                      //
                      //               ///todo end post api from backend...
                      //             });
                      //           });
                      //         },
                      //         child: Icon(Icons.select_all)),
                      //     // Container(
                      //     //   height: size.height * 0.20,
                      //     //   width: size.width * 0.5,
                      //     //   decoration: BoxDecoration(
                      //     //     //color: Colors.,
                      //     //       borderRadius: BorderRadius.only(
                      //     //         topRight: Radius.circular(20),
                      //     //       ),
                      //     //       image: DecorationImage(
                      //     //           image: AssetImage(
                      //     //             'lib/assets/image/psambulance.png',
                      //     //           ),
                      //     //           fit: BoxFit.cover)),
                      //     // ),
                      //   ),
                      // ),
                      ///end.....
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.01),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await CallLoader.hideLoader();

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
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  'Available Driver\'s',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.022,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                                SizedBox(
                                  width: size.width * 0.3,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 4, right: 0),
                                    child: InkWell(
                                      onTap: () async {
                                        _driverAcceptlistController
                                            .driveracceptuserDetailApi();
                                        _driverAcceptlistController.update();
                                        accountService.getAccountData
                                            .then((accountData) {
                                          // CallLoader.loader();
                                          // nearlistdriverApi();

                                          Timer(
                                            const Duration(microseconds: 300),
                                            () {
                                              // nearlistdriverApi();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MessageScreen2(
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
                                      child: Icon(
                                        Icons.notifications_active_rounded,
                                        size: size.height * 0.04,
                                        color: MyTheme.blueww,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.085,
                          ),

                          Expanded(
                            child: SizedBox(
                                //height: size.height * 0.76,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        widget.driverlist?.message?.length
                                    //.driverlist?.message?.length,
                                    ,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      alldevicetoken =
                                          "${widget.driverlist?.message?[index].deviceId}";
                                      // DateTime? now =
                                      //     _driverPayoutHistoryController
                                      //         .foundpayoutdriver?[index]
                                      //         .joiningDate;
                                      // String Date = DateFormat('dd-MM-yyyy')
                                      //     .format(now!);
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.03,
                                            vertical: size.height * 0.0005),
                                        child: Container(
                                          height: size.height * 0.2,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 30 / 5),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                                fit: BoxFit.fill),
                                            //color: MyTheme.containercolor8,
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                                vertical:
                                                    size.width * 0.0 / 05),
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      Color(0xffF0F3F8),
                                                      Color(0xffF0F3F8)
                                                      //darkPrimary,
                                                    ]),
                                                borderRadius:
                                                    BorderRadius.circular(12),
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
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: size.height * 0.08,
                                                    width: size.width * 0.17,
                                                    padding: EdgeInsets.all(8),
                                                    child: Image.asset(
                                                      'lib/assets/icons/user.png',
                                                      // "lib/assets/image/icons8-hospital-64.png",
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        boxShadow: [
                                                          const BoxShadow(
                                                            color: Color(
                                                                0xFFBEBEBE),
                                                            offset:
                                                                Offset(5, 5),
                                                            blurRadius: 10,
                                                            spreadRadius: 1,
                                                          ),
                                                          const BoxShadow(
                                                            color: Colors.white,
                                                            offset:
                                                                Offset(-5, -5),
                                                            blurRadius: 10,
                                                            spreadRadius: 1,
                                                          ),
                                                        ]),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.verified,
                                                            color: Color(
                                                                0xff12BFC4),
                                                          ),
                                                          Text(
                                                            "${widget.driverlist?.message?[index].name}",
                                                            // 'Kumar Prince',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .aBeeZee(
                                                              fontSize:
                                                                  size.width *
                                                                      0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: MyTheme
                                                                  .blueww,
                                                            ),
                                                          ),

                                                          ///rating....
                                                          // SizedBox(
                                                          //   width: size.width *
                                                          //       0.01,
                                                          // ),
                                                          // Material(
                                                          //   elevation: 3,
                                                          //   borderRadius:
                                                          //       BorderRadius
                                                          //           .circular(
                                                          //               20),
                                                          //   child: Container(
                                                          //     height:
                                                          //         size.height *
                                                          //             0.024,
                                                          //     width:
                                                          //         size.width *
                                                          //             0.11,
                                                          //     decoration:
                                                          //         BoxDecoration(
                                                          //       color: Color(
                                                          //           0xff12BFC4),
                                                          //       borderRadius:
                                                          //           BorderRadius
                                                          //               .circular(
                                                          //                   20),
                                                          //     ),
                                                          //     child: Padding(
                                                          //       padding:
                                                          //           EdgeInsets
                                                          //               .all(
                                                          //                   2.0),
                                                          //       child: Row(
                                                          //         mainAxisAlignment:
                                                          //             MainAxisAlignment
                                                          //                 .spaceAround,
                                                          //         crossAxisAlignment:
                                                          //             CrossAxisAlignment
                                                          //                 .center,
                                                          //         children: [
                                                          //           Text(
                                                          //             '4.5',
                                                          //             style:
                                                          //                 TextStyle(
                                                          //               color: Colors
                                                          //                   .white,
                                                          //               fontSize:
                                                          //                   size.width *
                                                          //                       0.029,
                                                          //               fontWeight:
                                                          //                   FontWeight.bold,
                                                          //             ),
                                                          //           ),
                                                          //           Icon(
                                                          //             Icons
                                                          //                 .star,
                                                          //             size: size
                                                          //                     .height *
                                                          //                 0.017,
                                                          //             color: Colors
                                                          //                 .yellow,
                                                          //           ),
                                                          //         ],
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Driver Distance :',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
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
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "${widget.driverlist?.message?[index].km} km",
                                                            //'2020 Honda Clive',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .aBeeZee(
                                                              fontSize:
                                                                  size.width *
                                                                      0.027,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.grey
                                                                  .shade600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Total Price :',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "\u{20B9} ${widget.driverlist?.message?[index].totalPrice?.toDouble()}",
                                                            // '121234333377',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.grey
                                                                  .shade900,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'DL NO :',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "${widget.driverlist?.message?[index].dl}",
                                                            //'ENP 2345',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.grey
                                                                  .shade900,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.015,
                                                      ),
                                                      Container(
                                                        height:
                                                            size.height * 0.035,
                                                        width:
                                                            size.width * 0.17,
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    2, 2),
                                                                blurRadius: 4,
                                                                spreadRadius: 0,
                                                              ),
                                                              BoxShadow(
                                                                color: Colors
                                                                    .white,
                                                                offset: Offset(
                                                                    -2, -2),
                                                                blurRadius: 4,
                                                                spreadRadius: 0,
                                                              ),
                                                            ]),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0.0),
                                                              child: Text(
                                                                '\u{20B9}',
                                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                                style:
                                                                    GoogleFonts
                                                                        .actor(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.034,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  color: Colors
                                                                      .indigo,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.002,
                                                            ),
                                                            Text(
                                                              "${widget.driverlist?.message?[index].charge}/Km",

                                                              // '10/km',
                                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize:
                                                                    size.width *
                                                                        0.028,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .red
                                                                    .shade900,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width * 0.2,
                                                        child: NeoPopButton(
                                                          color: Colors.black,
                                                          bottomShadowColor:
                                                              ColorUtils.getVerticalShadow(
                                                                      Colors
                                                                          .green
                                                                          .shade300)
                                                                  .toColor(),
                                                          rightShadowColor:
                                                              ColorUtils.getHorizontalShadow(
                                                                      Colors
                                                                          .green
                                                                          .shade300)
                                                                  .toColor(),
                                                          //animationDuration: kButtonAnimationDuration,
                                                          depth: kButtonDepth,
                                                          onTapUp: () async {
                                                            ///
                                                            _driverAcceptlistController
                                                                .driveracceptuserDetailApi();

                                                            ///accept______reject....
                                                            _driverAcceptlistController
                                                                .update();
                                                            accountService
                                                                .getAccountData
                                                                .then(
                                                                    (accountData) {
                                                              CallLoader
                                                                  .loader();
                                                              Timer(
                                                                const Duration(
                                                                    milliseconds:
                                                                        900),
                                                                () {
                                                                  // nearlistdriverApi();
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              UserHomePage()));
                                                                  // Get.to(MessageScreen(
                                                                  //   id: message.data['id'],
                                                                  // ));
                                                                  //Get.to((MapView));
                                                                  //postAmbulancerequestApi(markers);

                                                                  ///
                                                                },
                                                              );
                                                              CallLoader
                                                                  .hideLoader();
                                                            });

                                                            ///
                                                            SharedPreferences
                                                                prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            prefs.setString(
                                                                "driverlistssId",
                                                                "${widget.driverlist?.message?[index].driverId.toString()}");

                                                            prefs.setString(
                                                                "drivertotalamount",
                                                                "${widget.driverlist?.message?[index].totalPrice.toString()}");
                                                            prefs.setString(
                                                                "driverlistbookingId",
                                                                "${widget.driverlist?.message?[index].id.toString()}");
                                                            print(
                                                                "okolllllidd${widget.driverlist?.message?[index].id.toString()}");
                                                            prefs.setString(
                                                                "lng1",
                                                                "${widget.driverlist?.startLong.toString()}");
                                                            prefs.setString(
                                                                "lat1",
                                                                "${widget.driverlist?.startLat.toString()}");

                                                            prefs.setString(
                                                                "lng2",
                                                                "${widget.driverlist?.endLong.toString()}");
                                                            prefs.setString(
                                                                "lat2",
                                                                "${widget.driverlist?.endLat.toString()}");
                                                            prefs.setString(
                                                                "ambulance1",
                                                                "${widget.driverlist?.ambulanceTypeId.toString()}");
                                                            prefs.setString(
                                                                "vehicle1",
                                                                "${widget.driverlist?.vehicleTypeId.toString()}");

                                                            _ambulancegetController
                                                                .postAmbulancerequestApi2();
                                                            print(
                                                              "okokotokenww:${widget.driverlist?.message?[index].deviceId}"
                                                                  .toString(),
                                                            );

                                                            ///.......
                                                            print(
                                                                'princee notification');
                                                            try {
                                                              notificationServices
                                                                  .getDeviceToken()
                                                                  .then(
                                                                      (value) async {
                                                                var data = {
                                                                  //this the particular device id.....
                                                                  'to':
                                                                      // 'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                                                                      //'caK4UmMZQ2qfntD6ojs3n-:APA91bE6hmA3i8mG2H0x4v4Sd3cyG6DyEcyL34NHj-y4L6tWzbgWqC0JvOd8H3rsGaHb7pL547UjZEQAKXG4OD1imPaUTHVFvW0zZUFG3sxYVFkrbqnJDGOF7_Zog49MpbgFdX71ukHQ',
                                                                      //'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',

                                                                      ///todo device token......
                                                                      "${widget.driverlist?.message?[index].deviceId}"
                                                                          .toString(),

                                                                  ///
                                                                  //
                                                                  //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                                  //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                                  //.toString(),

                                                                  ///this is same device token....
                                                                  //value
                                                                  //.toString(),
                                                                  'notification':
                                                                      {
                                                                    'title':
                                                                        'Ps_Wellness',
                                                                    'body':
                                                                        'You have request for ambulance',
                                                                    //"sound": "jetsons_doorbell.mp3"
                                                                  },
                                                                  'android': {
                                                                    'notification':
                                                                        {
                                                                      'notification_count':
                                                                          23,
                                                                    },
                                                                  },
                                                                  'data': {
                                                                    'type':
                                                                        'msj',
                                                                    'id':
                                                                        '123456'
                                                                  }
                                                                };

                                                                await http.post(
                                                                    Uri.parse(
                                                                        'https://fcm.googleapis.com/fcm/send'),
                                                                    body: jsonEncode(
                                                                        data),
                                                                    headers: {
                                                                      'Content-Type':
                                                                          'application/json; charset=UTF-8',
                                                                      'Authorization':
                                                                          //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                                          'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                                    }).then(
                                                                    (value) {
                                                                  if (kDebugMode) {
                                                                    print(
                                                                        "bookdriver${value.body.toString()}");
                                                                  }
                                                                }).onError((error,
                                                                    stackTrace) {
                                                                  if (kDebugMode) {
                                                                    print(
                                                                        error);
                                                                  }
                                                                });

                                                                ///todo: from here custom from backend start...
                                                                var prefs =
                                                                    GetStorage();
                                                                PatientRegNo = prefs
                                                                    .read(
                                                                        "PatientRegNo")
                                                                    .toString();
                                                                print(
                                                                    '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
                                                                var body = {
                                                                  "UserId":
                                                                      "${PatientRegNo}",
                                                                  "DeviceId": value
                                                                      .toString(),
                                                                };
                                                                print(
                                                                    "userrrtokenupdateeeddbeforetttt${body}");
                                                                http.Response
                                                                    r =
                                                                    await http
                                                                        .post(
                                                                  Uri.parse(
                                                                      'http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
                                                                  body: body,
                                                                );

                                                                print(r.body);
                                                                if (r.statusCode ==
                                                                    200) {
                                                                  print(
                                                                      "userrrtokenupdateeedd99999${body}");
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
                                                                ///todo:api....accept reject.........22 sep.......kumar prince...............

                                                                // _driverAcceptlistController
                                                                //     .driveracceptuserDetailApi();
                                                                ///todo:api...end .accept reject.........22 sep.......kumar prince...............

                                                                _driverAcceptlistController
                                                                    .update();
                                                                accountService
                                                                    .getAccountData
                                                                    .then(
                                                                        (accountData) {
                                                                  // CallLoader.loader();
                                                                  // nearlistdriverApi();

                                                                  // Timer(
                                                                  //   const Duration(
                                                                  //       seconds:
                                                                  //           2),
                                                                  //   () {
                                                                  //     // nearlistdriverApi();
                                                                  //     Navigator.push(
                                                                  //         context,
                                                                  //         MaterialPageRoute(
                                                                  //             builder: (context) => MessageScreen2(
                                                                  //                   id: "12345678",
                                                                  //                 )));
                                                                  //     // Get.to(MessageScreen(
                                                                  //     //   id: message.data['id'],
                                                                  //     // ));
                                                                  //     //Get.to((MapView));
                                                                  //     //postAmbulancerequestApi(markers);
                                                                  //
                                                                  //     ///
                                                                  //   },
                                                                  // );
                                                                  // CallLoader
                                                                  //     .hideLoader();
                                                                });
                                                              });
                                                            } catch (e, s) {
                                                              print(s);
                                                            }
                                                          },
                                                          border: Border.all(
                                                            color:
                                                                Colors.black87,
                                                            width: 3,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        0,
                                                                    vertical:
                                                                        0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Text(
                                                                    "Book Driver",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      ///

                                                      ///
                                                      // Container(
                                                      //   height: size.height *
                                                      //       0.04,
                                                      //   width:
                                                      //       size.width * 0.22,
                                                      //   padding:
                                                      //       EdgeInsets.all(8),
                                                      //   decoration:
                                                      //       BoxDecoration(
                                                      //           // color: Colors
                                                      //           //     .orange
                                                      //           //     .shade500,
                                                      //           gradient: MyTheme
                                                      //               .gradient35,
                                                      //           borderRadius:
                                                      //               BorderRadius
                                                      //                   .circular(
                                                      //                       8),
                                                      //           boxShadow: const [
                                                      //         BoxShadow(
                                                      //           color: Color(
                                                      //               0xFFBEBEBE),
                                                      //           offset:
                                                      //               Offset(
                                                      //                   5, 5),
                                                      //           blurRadius:
                                                      //               10,
                                                      //           spreadRadius:
                                                      //               1,
                                                      //         ),
                                                      //         BoxShadow(
                                                      //           color: Colors
                                                      //               .white,
                                                      //           offset:
                                                      //               Offset(-5,
                                                      //                   -5),
                                                      //           blurRadius:
                                                      //               10,
                                                      //           spreadRadius:
                                                      //               1,
                                                      //         ),
                                                      //       ]),
                                                      //   child: Center(
                                                      //     child: Text(
                                                      //       'BOOK DRIVER',
                                                      //       //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                      //       style: GoogleFonts
                                                      //           .alatsi(
                                                      //         fontSize:
                                                      //             size.width *
                                                      //                 0.027,
                                                      //         fontWeight:
                                                      //             FontWeight
                                                      //                 .w700,
                                                      //         color: Colors
                                                      //             .black87,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                          ),
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
  //DriverListApi
  //alldevicetoken
  // void devicetoken() {
  //   List<String> alldevicetoken = ${widget?.driverlist?.message.toString();};
  //   alldevicetoken.forEach((number) {
  //     print(number);
  //   });
  // }
}
