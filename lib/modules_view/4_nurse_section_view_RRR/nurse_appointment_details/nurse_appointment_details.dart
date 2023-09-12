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
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_appointment_detail_controller/nurse_appointment_nurse_detailsss.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../notificationservice/local_notification_service.dart';
import '../../../notificationservice/notification_fb_service.dart';
import '../../../utils/services/account_service.dart';
import '../../../widgets/circular_loader.dart';
import '../nurse_home/nurse_home_page.dart';

//import '../../../controllers/4_nurse_controller_RRR/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';

//import '../../../controllers/4_nurse_controller/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';

class NurseeAppointmentDetail extends StatefulWidget {
  final String id;

  NurseeAppointmentDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<NurseeAppointmentDetail> createState() =>
      _NurseeAppointmentDetailState();
}

class _NurseeAppointmentDetailState extends State<NurseeAppointmentDetail> {
  NurseAppointmentNurseDetailController _nurseappointmentnursedetailController =
      Get.put(NurseAppointmentNurseDetailController());

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
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => (_nurseappointmentnursedetailController.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.08,
                        right: -size.width * 0.12,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.22,
                            width: size.width * 0.58,
                            decoration: const BoxDecoration(
                                //color: Colors.,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/user_assets/appointment_nurse.png',
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.012),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    size: size.height * 0.026,
                                    color: MyTheme.blueww,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  'Appointment Details',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.029,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  //color: Colors.white,
                                  gradient: MyTheme.gradient7,
                                  //gradient10
                                ),
                                width: size.width * 0.72,
                                height: size.height * 0.06,
                                margin:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 10),
                                padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      splashColor: Colors.transparent),
                                  child: TextField(
                                    // controller: _nurseappointmentnursedetailController
                                    //     .appointmentController,
                                    // onTap: () {
                                    //   _nurseappointmentnursedetailController
                                    //       .chooseDate();
                                    // },
                                    onChanged: (value) =>
                                        _nurseappointmentnursedetailController
                                            .filterAppointNurse(value),

                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 15.0, color: MyTheme.blueww),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Search Name...',
                                      contentPadding: const EdgeInsets.only(
                                          left: 10.0, bottom: 12.0, top: 6.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.075,
                                width: size.width * 0.2,
                                decoration: BoxDecoration(
                                  //color: Colors.white30,
                                  //gradient: MyTheme.gradient10,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Lottie.asset(
                                  'lib/assets/image/70361-searching.zip',
                                  width: 400,
                                  height: 400,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.0,
                          ),
                          _nurseappointmentnursedetailController
                                  .foundAppointmentnurse.value.isEmpty
                              ? Center(child: Text('No List'))
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          _nurseappointmentnursedetailController
                                              .nurseappointmentdetail
                                              ?.result
                                              ?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final item =
                                            _nurseappointmentnursedetailController
                                                .nurseappointmentdetail?.result;
                                        return Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.03,
                                                  vertical:
                                                      size.height * 0.0005),
                                              child: Container(
                                                height: size.height * 0.25,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 30 / 6),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient:
                                                      const LinearGradient(
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                          colors: [
                                                        lightPrimary2,
                                                        darkPrimary2,
                                                      ]),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(-0, -0),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color:
                                                          Colors.red.shade300,
                                                    ),

                                                    ///todo:box........
                                                    BoxShadow(
                                                      offset: Offset(4, 4),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color:
                                                          Colors.red.shade300,
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  //clipBehavior: Clip.none,
                                                  children: [
                                                    Positioned(
                                                      top: -60,
                                                      left: -145,
                                                      child: Material(
                                                        shadowColor:
                                                            Colors.transparent,
                                                        color:
                                                            Colors.transparent,
                                                        // color: Colors.tra
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(900),
                                                        //shape: BoxShape.circle,
                                                        elevation: 10,

                                                        //borderRadius

                                                        //shape: BoxShape.circle,
                                                        child: Container(
                                                          height: size.height *
                                                              0.39,
                                                          width:
                                                              size.width * 0.77,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            //borderRadius: BorderRadius.circular(100),
                                                            //color: Colors.blueGrey,
                                                            gradient: MyTheme
                                                                .gradient81,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 155,
                                                      right: 4,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    size.width *
                                                                        0.01),
                                                        child: ElevatedButton(
                                                          onPressed: () async {
                                                            SharedPreferences
                                                                prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            prefs.setString(
                                                              "NurseesspartprodId",
                                                              "${item?[index]?.nurseId}"
                                                                  .toString(),
                                                              // "${_nurseHistoryController.foundNurse[index].id.toString()}"
                                                            );

                                                            print({
                                                              "myyyyynurse${item?[index]?.nurseId}"
                                                                  .toString(),
                                                            });

                                                            prefs.setString(
                                                              "NurseesspartId",
                                                              "${item?[index]?.id}"
                                                                  .toString(),
                                                              // "${_nurseHistoryController.foundNurse[index].id.toString()}"
                                                            );
                                                            print({
                                                              "myyyyynurse22${item?[index]?.id}"
                                                                  .toString(),
                                                            });

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
                                                                                        _nurseappointmentnursedetailController.nurseappointmentApi();
                                                                                        _nurseappointmentnursedetailController.update();

                                                                                        ///delete api of user section......
                                                                                        _nurseappointmentnursedetailController.deleteusernursaptApi();
                                                                                        //prefs.setString("doctorrjctDeviceid", "${_doctorHomepageController.founddoctoraptProducts?[index].deviceId}");
                                                                                        //  "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}");

                                                                                        // prefs.setString("doctorrejectlistid", "${_doctorHomepageController.founddoctoraptProducts?[index].id}");
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
                                                                                            'to': item![index].deviceId,
                                                                                            //"dTGRa4G1R52G3-jH5PlZ-k:APA91bGAv4zj_ESom1qgGInKfIvpbfjI-fWuuFys1kchlmNX1ZcimYsVqEsN93beY5VQ7awY0azT",
                                                                                            //"dTGRa4G1R52G3-jH5PlZ-k:APA91bGAv4zj_ESom1qgGInKfIvpbfjI-fWuuFys1kchlmNX1ZcimYsVqEsN93beY5VQ7awY0azT9CiHOOQz_qb2kHobs11ZxPp9dbfDlO9QQPN9Ncm51LzkV0GAkJaVpyp2fjXYs2J-",
                                                                                            //"eQ2dTRG2SbSHAWf85I8SCh:APA91bF44wEbOIn1-ny73ml8EDpfLxhKBS4_rFTvY4WNGVmPhvnGdiNpZB5FiEuHKkr0CW64KL3CklKGASahH_xVSc72QZKkJJj3slYwZE6Zap3TKp9-sT1e5ERI9H5KzGzziZU2GBfg",
                                                                                            //"f2pjDU69RnyUi6Ree-l4cJ:APA91bEkJZg12WVXoY8q6AjD3fNfdjXAbTZKD75aN_6SzetXuvu3A7RQ2YwtCWGuoPobIhN5iKSeH2KdLMcr_8WTohi3pDue4mh6fmDKq4OusjZvN856lgka80NN2MGsyMSjiioVdYky",
                                                                                            //"df_xO9RNRvicZkE9JxMPV7:APA91bFkZmPaBORZLPUSLNAxN3xDWVbZe60YHzqwAet8GvAh2AqhMRRci0Ia5bYYJHiaU9KGep8uhfnADGl4xDKDnzefJu4nZt5_w9JeMwsTqJnO80osctPN1uvlFAN9hVVpplLZs_Ay",
                                                                                            //"fMPtWMb5QUebGlV5QqHGnk:APA91bG8u4GG0JBUhazLdS3QiVMxJ1MEpg_b-1NyVcJaznD3TDJ3q1YChOZtzHL_L_InZrIvawkTRWJQQJE8mmIQSaFzbq-0rMVvRQFd_QV2zB4-tYLXtMroycPZvxTTvjnl9Q5PvsJc",
                                                                                            // "${_doctorHomepageController.founddoctoraptProducts?[index].deviceId}",

                                                                                            //"${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}",

                                                                                            //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                                                            //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                                                            //.toString(),

                                                                                            ///this is same device token....
                                                                                            //value
                                                                                            //.toString(),
                                                                                            'notification': {
                                                                                              'title': 'Ps_Wellness Nurse',
                                                                                              'body': 'Your Booking has been Canceled by Nurse you amount will refund in your wallet',
                                                                                              //"sound": "jetsons_doorbell.mp3"
                                                                                            },
                                                                                            'android': {
                                                                                              'notification': {
                                                                                                'notification_count': 23,
                                                                                              },
                                                                                            },
                                                                                            // 'data': {
                                                                                            //   'type': 'cancel_case_nurse',
                                                                                            //   'id': '1234568911'
                                                                                            // }
                                                                                          };
                                                                                          print("dataccept:${data}");
                                                                                          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'), body: jsonEncode(data), headers: {
                                                                                            'Content-Type': 'application/json; charset=UTF-8',
                                                                                            'Authorization':
                                                                                                //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                                                                'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                                                          }).then((value) {
                                                                                            if (kDebugMode) {
                                                                                              print("princenurse${value.body.toString()}");
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
                                                                                              () async {
                                                                                                await Get.offAll(NurseHomePage());
                                                                                                // Get.offAll(NurseHomePage());
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Patient Name:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Patient Mobile :',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Paid Amount:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Patient Address:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Duration:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Working Shift :',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            // height:
                                                            //     size.height *
                                                            //         0.03,
                                                            width: size.width *
                                                                0.45,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  //"${_nurseappointmentdetailController.nurseappointmentdetail!.result![index].contactNumber}.toString()"
                                                                  '${item?[index]?.patientName}'
                                                                      .toString(),

                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade800,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                                Text(
                                                                  '${item?[index].contactNumber}',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade800,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                                Text(
                                                                  '₹ ${'${item?[index].totalFee}'}'
                                                                      .toString(),
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade800,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                                Text(
                                                                  '${item?[index]}',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade800,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                                Text(
                                                                  '${item?[index].paymentDate}',
                                                                  // '20 dec 2023-28 jan 2023',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade800,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                                Text(
                                                                  '24 hours',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade800,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                          //),
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
