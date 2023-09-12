// import 'dart:math' as math;
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:neopop/utils/constants.dart';
// import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
//
// import '../../utils/video_utilszegocloud.dart';
//
// //import 'home_page.dart';
//
// final String localUserId = math.Random().nextInt(10000).toString();
//
// class UserVideoAudio extends StatefulWidget {
//   const UserVideoAudio({Key? key}) : super(key: key);
//
//   @override
//   State<UserVideoAudio> createState() => _UserVideoAudioState();
// }
//
// class _UserVideoAudioState extends State<UserVideoAudio> {
//   final callingId = TextEditingController();
//   bool _validate = false;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//             child: Container(
//               height: size.height,
//               width: size.width,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(
//                           'lib/assets/image/video_doctorcalling.png'),
//                       fit: BoxFit.cover)),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: SingleChildScrollView(
//                   physics: NeverScrollableScrollPhysics(),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: size.height * 0.47,
//                       ),
//                       // Spacer(),
//
//                       //Spacer(),
//                       SizedBox(
//                         height: 70,
//                       ),
//
//                       ///
//                       // Container(
//                       //   height: size.height * 0.05,
//                       //   width: size.width * 0.3,
//                       //   child: NeoPopButton(
//                       //     color: Colors.cyan.shade600,
//                       //     bottomShadowColor: Colors.red.shade300,
//                       //     // ColorUtils.getVerticalShadow(
//                       //     //     Colors.red.shade300)
//                       //     //     .toColor(),
//                       //     rightShadowColor: Colors.red.shade300,
//                       //     // ColorUtils.getHorizontalShadow(
//                       //     //     Colors.red.shade300)
//                       //     //     .toColor(),
//                       //     //animationDuration: kButtonAnimationDuration,
//                       //     depth: kButtonDepth,
//                       //     onTapUp: () async {
//                       //       Get.to(CallPagee(
//                       //         callingId: callingId.text.toString(),
//                       //       ));
//                       //       // widget.driverlist?.message?.forEach((element) {
//                       //       //   ///.......
//                       //       //   _ambulancegetController
//                       //       //       .postAmbulancerequestApi2();
//                       //       //   print('princee notification');
//                       //       //   notificationServices
//                       //       //       .getDeviceToken()
//                       //       //       .then((value) async {
//                       //       //     var data = {
//                       //       //       //this the particular device id.....
//                       //       //       'to':
//                       //       //       // 'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
//                       //       //       //'caK4UmMZQ2qfntD6ojs3n-:APA91bE6hmA3i8mG2H0x4v4Sd3cyG6DyEcyL34NHj-y4L6tWzbgWqC0JvOd8H3rsGaHb7pL547UjZEQAKXG4OD1imPaUTHVFvW0zZUFG3sxYVFkrbqnJDGOF7_Zog49MpbgFdX71ukHQ',
//                       //       //       //'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
//                       //       //
//                       //       //       ///todo device token......
//                       //       //       // "${widget.driverlist?.message?[0].deviceId}"
//                       //       //       "${element.deviceId}".toString(),
//                       //       //
//                       //       //       ///
//                       //       //       //
//                       //       //       //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
//                       //       //       //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
//                       //       //       //.toString(),
//                       //       //
//                       //       //       ///this is same device token....
//                       //       //       //value
//                       //       //       //.toString(),
//                       //       //       'notification': {
//                       //       //         'title': 'Ps_Wellness',
//                       //       //         'body': 'You have request for ambulance',
//                       //       //         //"sound": "jetsons_doorbell.mp3"
//                       //       //       },
//                       //       //       'android': {
//                       //       //         'notification': {
//                       //       //           'notification_count': 23,
//                       //       //         },
//                       //       //       },
//                       //       //       'data': {
//                       //       //         'type': 'msj',
//                       //       //         'id': '123456',
//                       //       //       }
//                       //       //     };
//                       //       //     print("data1${data}");
//                       //       //
//                       //       //     await http.post(
//                       //       //         Uri.parse(
//                       //       //             'https://fcm.googleapis.com/fcm/send'),
//                       //       //         body: jsonEncode(data),
//                       //       //         headers: {
//                       //       //           'Content-Type':
//                       //       //           'application/json; charset=UTF-8',
//                       //       //           'Authorization':
//                       //       //           //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
//                       //       //           'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
//                       //       //         }).then((value) {
//                       //       //       if (kDebugMode) {
//                       //       //         print(
//                       //       //             "bookdriver${value.body.toString()}");
//                       //       //       }
//                       //       //     }).onError((error, stackTrace) {
//                       //       //       if (kDebugMode) {
//                       //       //         print(error);
//                       //       //       }
//                       //       //     });
//                       //       //
//                       //       //     ///todo: from here custom from backend start...
//                       //       //     var prefs = GetStorage();
//                       //       //     PatientRegNo =
//                       //       //         prefs.read("PatientRegNo").toString();
//                       //       //     print(
//                       //       //         '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
//                       //       //     var body = {
//                       //       //       "UserId": "${PatientRegNo}",
//                       //       //       "DeviceId": value.toString(),
//                       //       //     };
//                       //       //     print(
//                       //       //         "userrrtokenupdateeeddbeforetttt${body}");
//                       //       //     http.Response r = await http.post(
//                       //       //       Uri.parse(
//                       //       //           'http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
//                       //       //       body: body,
//                       //       //     );
//                       //       //
//                       //       //     print(r.body);
//                       //       //     if (r.statusCode == 200) {
//                       //       //       print("userrrtokenupdateeedd111${body}");
//                       //       //       return r;
//                       //       //     } else if (r.statusCode == 401) {
//                       //       //       Get.snackbar('message', r.body);
//                       //       //     } else {
//                       //       //       Get.snackbar('Error', r.body);
//                       //       //       return r;
//                       //       //     }
//                       //       //
//                       //       //     ///todo end post api from backend...
//                       //       //   });
//                       //       // });
//                       //     },
//                       //     border: Border.all(
//                       //       color: Colors.black,
//                       //       width: 3,
//                       //     ),
//                       //     child: Padding(
//                       //       padding: EdgeInsets.symmetric(
//                       //           horizontal: 0, vertical: 0),
//                       //       child: Row(
//                       //         mainAxisAlignment: MainAxisAlignment.center,
//                       //         children: [
//                       //           Row(
//                       //             children: [
//                       //               Icon(
//                       //                 Icons.call_rounded,
//                       //                 color: Colors.white,
//                       //               ),
//                       //               Padding(
//                       //                 padding: EdgeInsets.all(6.0),
//                       //                 child: Text("Direct Call",
//                       //                     style: TextStyle(
//                       //                       color: Colors.white,
//                       //                       fontSize: size.width * 0.034,
//                       //                       fontWeight: FontWeight.bold,
//                       //                     )),
//                       //               ),
//                       //             ],
//                       //           ),
//                       //         ],
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       ///
//                       // ElevatedButton(
//                       //     onPressed: () {
//                       //       Get.to(CallPagee(
//                       //         callingId: callingId.text.toString(),
//                       //       ));
//                       //     },
//                       //     child: Text("Join Direct Call"))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: size.height * 0.051,
//             left: size.width * 0.02,
//             right: size.width * 0.8,
//             //bottom: size.height * 0.89,
//             child: Container(
//                 height: size.height * 0.05,
//                 width: size.width * 0.06,
//                 decoration: BoxDecoration(
//                   color: Colors.cyan.shade500,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   splashColor: Colors.transparent,
//                   icon: Icon(
//                     Icons.arrow_left,
//                     size: size.height * 0.03,
//                   ),
//                   onPressed: () {
//                     Get.back();
//                   },
//                 )),
//           ),
//           Positioned(
//             bottom: size.height * 0.14,
//             left: size.width * 0.05,
//             right: size.width * 0.05,
//             child: TextFormField(
//               controller: callingId,
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.red),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.green),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 labelText: 'Enter call Id',
//                 hintText: "Enter call Id",
//                 prefixIcon: Align(
//                   widthFactor: 1.0,
//                   heightFactor: 1.0,
//                   child: Icon(
//                     Icons.call,
//                     color: Colors.cyan.shade800,
//                   ),
//                 ),
//                 errorText: _validate ? 'Value Can not be Empty' : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                   borderSide: BorderSide(
//                     width: 1,
//                     style: BorderStyle.none,
//                     color: Colors.black38,
//                   ),
//                 ),
//                 filled: true,
//                 contentPadding: EdgeInsets.all(6),
//                 fillColor: Colors.black12,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: size.height * 0.023,
//             left: size.width * 0.3,
//             right: size.width * 0.3,
//             child: Container(
//               height: size.height * 0.05,
//               width: size.width * 0.3,
//               child: NeoPopButton(
//                 color: Colors.cyan.shade600,
//                 bottomShadowColor: Colors.red.shade300,
//                 // ColorUtils.getVerticalShadow(
//                 //     Colors.red.shade300)
//                 //     .toColor(),
//                 rightShadowColor: Colors.red.shade300,
//                 // ColorUtils.getHorizontalShadow(
//                 //     Colors.red.shade300)
//                 //     .toColor(),
//                 //animationDuration: kButtonAnimationDuration,
//                 depth: kButtonDepth,
//                 onTapUp: () async {
//                   setState(() {
//                     callingId.text.isEmpty
//                         ? _validate = true
//                         : _validate = false;
//                   });
//                   if (callingId.text.isEmpty) {
//                     Get.snackbar("Error", "Please Enter Your call Id",
//                         colorText: Colors.red);
//                     // await Get.to(CallPagee(
//                     //   callingId: callingId.text.toString(),
//                     // ));
//                   }
//                   if (callingId.text.isNotEmpty) {
//                     await Get.to(CallPagee(
//                       callingId: callingId.text.toString(),
//                     ));
//                   }
//
//                   // widget.driverlist?.message?.forEach((element) {
//                   //   ///.......
//                   //   _ambulancegetController
//                   //       .postAmbulancerequestApi2();
//                   //   print('princee notification');
//                   //   notificationServices
//                   //       .getDeviceToken()
//                   //       .then((value) async {
//                   //     var data = {
//                   //       //this the particular device id.....
//                   //       'to':
//                   //       // 'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
//                   //       //'caK4UmMZQ2qfntD6ojs3n-:APA91bE6hmA3i8mG2H0x4v4Sd3cyG6DyEcyL34NHj-y4L6tWzbgWqC0JvOd8H3rsGaHb7pL547UjZEQAKXG4OD1imPaUTHVFvW0zZUFG3sxYVFkrbqnJDGOF7_Zog49MpbgFdX71ukHQ',
//                   //       //'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
//                   //
//                   //       ///todo device token......
//                   //       // "${widget.driverlist?.message?[0].deviceId}"
//                   //       "${element.deviceId}".toString(),
//                   //
//                   //       ///
//                   //       //
//                   //       //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
//                   //       //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
//                   //       //.toString(),
//                   //
//                   //       ///this is same device token....
//                   //       //value
//                   //       //.toString(),
//                   //       'notification': {
//                   //         'title': 'Ps_Wellness',
//                   //         'body': 'You have request for ambulance',
//                   //         //"sound": "jetsons_doorbell.mp3"
//                   //       },
//                   //       'android': {
//                   //         'notification': {
//                   //           'notification_count': 23,
//                   //         },
//                   //       },
//                   //       'data': {
//                   //         'type': 'msj',
//                   //         'id': '123456',
//                   //       }
//                   //     };
//                   //     print("data1${data}");
//                   //
//                   //     await http.post(
//                   //         Uri.parse(
//                   //             'https://fcm.googleapis.com/fcm/send'),
//                   //         body: jsonEncode(data),
//                   //         headers: {
//                   //           'Content-Type':
//                   //           'application/json; charset=UTF-8',
//                   //           'Authorization':
//                   //           //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
//                   //           'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
//                   //         }).then((value) {
//                   //       if (kDebugMode) {
//                   //         print(
//                   //             "bookdriver${value.body.toString()}");
//                   //       }
//                   //     }).onError((error, stackTrace) {
//                   //       if (kDebugMode) {
//                   //         print(error);
//                   //       }
//                   //     });
//                   //
//                   //     ///todo: from here custom from backend start...
//                   //     var prefs = GetStorage();
//                   //     PatientRegNo =
//                   //         prefs.read("PatientRegNo").toString();
//                   //     print(
//                   //         '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
//                   //     var body = {
//                   //       "UserId": "${PatientRegNo}",
//                   //       "DeviceId": value.toString(),
//                   //     };
//                   //     print(
//                   //         "userrrtokenupdateeeddbeforetttt${body}");
//                   //     http.Response r = await http.post(
//                   //       Uri.parse(
//                   //           'http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
//                   //       body: body,
//                   //     );
//                   //
//                   //     print(r.body);
//                   //     if (r.statusCode == 200) {
//                   //       print("userrrtokenupdateeedd111${body}");
//                   //       return r;
//                   //     } else if (r.statusCode == 401) {
//                   //       Get.snackbar('message', r.body);
//                   //     } else {
//                   //       Get.snackbar('Error', r.body);
//                   //       return r;
//                   //     }
//                   //
//                   //     ///todo end post api from backend...
//                   //   });
//                   // });
//                 },
//                 border: Border.all(
//                   color: Colors.black,
//                   width: 3,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.video_camera_front,
//                         color: Colors.white,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(6.0),
//                         child: Text("Direct Call",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: size.width * 0.034,
//                               fontWeight: FontWeight.bold,
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CallPagee extends StatelessWidget {
//   final String callingId;
//   const CallPagee({Key? key, required this.callingId}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: ZegoUIKitPrebuiltCall(
//             appID: UtilsVideo.appId,
//             appSign: UtilsVideo.appsigning,
//             callID: callingId,
//             userID: localUserId,
//             userName: 'user_$localUserId',
//             config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
//               ..onOnlySelfInRoom = (context) {
//                 Navigator.pop(context);
//               }));
//   }
// }
