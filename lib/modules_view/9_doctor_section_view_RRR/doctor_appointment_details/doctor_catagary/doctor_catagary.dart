import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/notificationservice/local_notification_service.dart';
import 'package:ps_welness_new_ui/notificationservice/notification_fb_service.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../controllers/9_doctor_controllers_RRR/doctor_home_controller/doctor_home_controllers.dart';

class AppointmentDetails extends StatefulWidget {
  final String id;
  AppointmentDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  DoctorHomepageController _doctorHomepageController =
      Get.put(DoctorHomepageController());

  // UseracptrejectController _useracptrejectController =
  // Get.put(UseracptrejectController());

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
    return Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              lightPrimary,
              darkPrimary,
            ])),
        child: Scaffold(
            backgroundColor: Colors.grey.shade100,
            resizeToAvoidBottomInset: false,
            body: Obx(
              () => _doctorHomepageController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            elevation: 1,
                            child: Container(
                              height: size.height * 0.18,
                              decoration: BoxDecoration(
                                color: MyTheme.ThemeColors,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.015),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                              height: size.height * 0.035,
                                              width: size.width * 0.08,
                                              decoration: const BoxDecoration(
                                                color: Colors.white70,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.arrow_back_ios_outlined,
                                                size: size.height * 0.025,
                                              )),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Text(
                                          'See Your upcoming Appointment',
                                          style: TextStyle(
                                            color: MyTheme.blueww,
                                            fontSize: size.width * 0.045,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: size.height * 0.06,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        color: Colors.white),
                                    width: size.width,
                                    // height: size.height * 0.06,
                                    margin: const EdgeInsets.fromLTRB(
                                        20, 20, 15, 10),
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 6, 8, 8),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          splashColor: Colors.transparent),
                                      child: TextField(
                                        autofocus: false,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: MyTheme.blueww),
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.search),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Search name',
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0,
                                              bottom: 1.0,
                                              top: 0.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(25.7),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(25.7),
                                          ),
                                        ),
                                        onChanged: (value) =>
                                            _doctorHomepageController
                                                .filterdrApointmentProducts(
                                                    value),
                                        // onChanged: (value) =>
                                        //     doctorHomepageController
                                        //         .filterProducts(value),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _doctorHomepageController
                                  .founddoctoraptProducts.value.isEmpty
                              ? const Center(child: Text("No Result Found"))
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _doctorHomepageController
                                          .founddoctoraptProducts.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.005,
                                              horizontal: size.width * 0.01),
                                          child: Material(
                                            elevation: 5,
                                            child: Container(
                                              height: size.height * 0.13,
                                              decoration: BoxDecoration(
                                                color: MyTheme.white,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                size.width *
                                                                    0.02),
                                                    child: Material(
                                                      elevation: 9,
                                                      child: Container(
                                                        width:
                                                            size.width * 0.25,
                                                        height:
                                                            size.height * 0.11,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .cyanAccent,
                                                                    width: 1.3),
                                                                image:
                                                                    const DecorationImage(
                                                                  image: NetworkImage(
                                                                      'https://images.unsplash.com/photo-1599493758267-c6c884c7071f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.37,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "${_doctorHomepageController.founddoctoraptProducts?[index].patientName}",
                                                          style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.02,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                MyTheme.blueww,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${_doctorHomepageController.founddoctoraptProducts?[index].slotTime}",
                                                          style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.016,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors
                                                                .red.shade300,
                                                          ),
                                                        ),
                                                        //Spacer(),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.3,
                                                          child: Text(
                                                            "${_doctorHomepageController.founddoctoraptProducts?[index].appointmentdate}",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize:
                                                                  size.height *
                                                                      0.015,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.05,
                                                        width: size.width * 0.3,
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.place,
                                                                color: Colors
                                                                    .green,
                                                                size:
                                                                    size.height *
                                                                        0.022,
                                                              ),
                                                              Text(
                                                                "${_doctorHomepageController.founddoctoraptProducts?[index].location}",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      size.height *
                                                                          0.014,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade600,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    size.width *
                                                                        0.01),
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Get.dialog(
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            40),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              20),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(20.0),
                                                                        child:
                                                                            Material(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              const SizedBox(height: 10),
                                                                              Text(
                                                                                "Cancel Appointment ?",
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  color: Colors.cyan.shade700,
                                                                                  fontWeight: FontWeight.w800,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(height: 15),
                                                                              const Text(
                                                                                "If you will cancel this appointment you have to pay penalty of 10% cost of total booking amount.",
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                              const SizedBox(height: 20),
                                                                              //Buttons
                                                                              Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ElevatedButton(
                                                                                      style: ElevatedButton.styleFrom(
                                                                                        minimumSize: const Size(0, 45),
                                                                                        primary: Colors.red,
                                                                                        onPrimary: const Color(0xFFFFFFFF),
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                      ),
                                                                                      onPressed: () {
                                                                                        Get.back();
                                                                                      },
                                                                                      child: const Text(
                                                                                        'NO',
                                                                                        style: TextStyle(
                                                                                          fontSize: 20,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(width: 10),
                                                                                  Expanded(
                                                                                    child: ElevatedButton(
                                                                                      child: const Text(
                                                                                        'Yes',
                                                                                        style: TextStyle(
                                                                                          fontSize: 20,
                                                                                        ),
                                                                                      ),
                                                                                      style: ElevatedButton.styleFrom(
                                                                                        minimumSize: const Size(0, 45),
                                                                                        primary: Colors.green.shade800,
                                                                                        onPrimary: const Color(0xFFFFFFFF),
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                                        prefs.setString("doctorrjctDeviceid", "${_doctorHomepageController.founddoctoraptProducts?[index].deviceId}");
                                                                                        //  "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}");

                                                                                        prefs.setString("doctorrejectlistid", "${_doctorHomepageController.founddoctoraptProducts?[index].id}");
                                                                                        // SharedPreferences
                                                                                        // prefs =
                                                                                        // await SharedPreferences
                                                                                        //     .getInstance();
                                                                                        // prefs.setString(
                                                                                        //     "driverlistssId",
                                                                                        //     "${widget.driverlist?.message?[index].driverId.toString()}");
                                                                                        // prefs.setString(
                                                                                        //     "lng1",
                                                                                        //     "${widget.driverlist?.startLong.toString()}");
                                                                                        // prefs.setString(
                                                                                        //     "lat1",
                                                                                        //     "${widget.driverlist?.startLat.toString()}");
                                                                                        //
                                                                                        // prefs.setString(
                                                                                        //     "lng2",
                                                                                        //     "${widget.driverlist?.endLong.toString()}");
                                                                                        // prefs.setString(
                                                                                        //     "lat2",
                                                                                        //     "${widget.driverlist?.endLat.toString()}");
                                                                                        // prefs.setString(
                                                                                        //     "ambulance1",
                                                                                        //     "${widget.driverlist?.ambulanceTypeId.toString()}");
                                                                                        // prefs.setString(
                                                                                        //     "vehicle1",
                                                                                        //     "${widget.driverlist?.vehicleTypeId.toString()}");

                                                                                        // _ambulancegetController
                                                                                        // .postAmbulancerequestApi2();

                                                                                        ///.......
                                                                                        ///todo: delete liost.....call accept booking api...not true for doctor..for post
                                                                                        /// _useracptrejectController.acceptbookingdriverApi();
                                                                                        ///todo: this is api call delete list of api.....
                                                                                        print('princee notification');
                                                                                        notificationServices.getDeviceToken().then((value) async {
                                                                                          var data = {
                                                                                            ///not same controller
                                                                                            //this the particular device id.....
                                                                                            'to':
                                                                                                //"df_xO9RNRvicZkE9JxMPV7:APA91bFkZmPaBORZLPUSLNAxN3xDWVbZe60YHzqwAet8GvAh2AqhMRRci0Ia5bYYJHiaU9KGep8uhfnADGl4xDKDnzefJu4nZt5_w9JeMwsTqJnO80osctPN1uvlFAN9hVVpplLZs_Ay",
                                                                                                //"fMPtWMb5QUebGlV5QqHGnk:APA91bG8u4GG0JBUhazLdS3QiVMxJ1MEpg_b-1NyVcJaznD3TDJ3q1YChOZtzHL_L_InZrIvawkTRWJQQJE8mmIQSaFzbq-0rMVvRQFd_QV2zB4-tYLXtMroycPZvxTTvjnl9Q5PvsJc",
                                                                                                "${_doctorHomepageController.founddoctoraptProducts?[index].deviceId}",

                                                                                            //"${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}",

                                                                                            //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                                                            //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                                                            //.toString(),

                                                                                            ///this is same device token....
                                                                                            //value
                                                                                            //.toString(),
                                                                                            'notification': {
                                                                                              'title': 'Ps_Wellness Doctor',
                                                                                              'body': 'Your request has been Canceled by doctor you amount will refund through your wallet',
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
                                                                                                Get.offAll(DoctorHomePage());
                                                                                                //Get.to((page))
                                                                                                ///
                                                                                              },
                                                                                            );
                                                                                          });
                                                                                        });
                                                                                      },
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
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .red),

                                                            shadowColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .red),

                                                            elevation:
                                                                MaterialStateProperty
                                                                    .all(12),

                                                            minimumSize:
                                                                MaterialStateProperty
                                                                    .all(const Size(
                                                                        50,
                                                                        30)),

                                                            // fixedSize:
                                                            //     MaterialStateProperty
                                                            //         .all(
                                                            //             const Size(
                                                            //                 70,
                                                            //                 20)),
                                                            shape:
                                                                MaterialStateProperty
                                                                    .all(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // const Icon(
                                                      //     Icons.calendar_today),

                                                      //Spacer(),
                                                      // Text(
                                                      //   '12 am',
                                                      //   style: TextStyle(
                                                      //     fontSize:
                                                      //         size.height *
                                                      //             0.017,
                                                      //     fontWeight:
                                                      //         FontWeight.w600,
                                                      //     color: Colors.green,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                        ],
                      ),
                    ),
            )));
  }
}
//#00caf7
