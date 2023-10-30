import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/lab/lab_booking_view/lab_booking_schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../constants/my_theme.dart';
import '../../../../controllers/1_user_view_controller/drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import '../../../../controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import '../../../../controllers/1_user_view_controller/lab_controller/post_lab_order_controller/post_lab_order_controller.dart';
import '../../../../controllers/1_user_view_controller/rozarpay_lab_controller/rozarpay_lab_controller.dart';
import '../../../../controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import '../../../../controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
import '../../home_page_user_view/user_home_page.dart';
import '../../user_drawer/drawer_pages_user/walet_user/wallet_user.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/rozar_pay_controller/rozar_pay_controller.dart';

class LabAppointmentCheckout extends StatelessWidget {
  LabAppointmentCheckout({Key? key}) : super(key: key);
  final RozarPayLabController _rozarPayLabController =
      Get.put(RozarPayLabController());
  //final RozarPayController _rozarPayController = Get.put(RozarPayController());
  LabListController _labListController = Get.put(LabListController());
  //LabListController _labListController = Get.put(LabListController());
  UserProfileControllers _userrsProfileControllers =
      Get.put(UserProfileControllers());
  PostOrderController _postOrderController = Get.put(PostOrderController());
  LabHistoryController _labHistoryController = Get.put(LabHistoryController());
  UserProfileControllers _userrsProfileController =
      Get.put(UserProfileControllers());
  Wallet_2_Controller _walletPostController = Get.put(Wallet_2_Controller());

  @override
  Widget build(BuildContext context) {
    ///todo: maths logoc....
    final labFees =
        double.parse("${_labListController.labCheckoutModel?.fee?.toDouble()}");
    //print("${element.price * element.step} c");
    final labFeeGst = double.parse(
        "${(_labListController.labCheckoutModel?.fee?.toDouble())! * ((_labListController.labCheckoutModel?.gst?.toDouble())! / 100).toDouble()}");
    // final finalDrAmounts = "${drFee.toDouble() + drFeeGst.toDouble()}";
    var finalamtlab =
        double.parse("${labFees.toDouble() + labFeeGst.toDouble()}");
    print("labFees:${labFees}");
    print("labFeeGst:${labFeeGst}");
    // print("Drtotal:${finalDrAmounts}");
    print("finalamtlab:${finalamtlab}");

    ///todo: end maths logic......
    bool shouldPop = true;
    //LabSchedule1Page
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(LabSchedule1Page());
        return shouldPop;
      },
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
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.cyanAccent,
            //backgroundColor: MyTheme.ThemeColors,
            title: Text(
              'Book  Lab\'s  Appoinmtment',
              style: GoogleFonts.lato(
                fontSize: size.width * 0.05,
                color: MyTheme.blueww,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: InkWell(
              onTap: () {
                Get.offAll(LabSchedule1Page());

                // Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: MyTheme.blueww,
                size: size.height * 0.027,
              ),
            ),
          ),
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: MyTheme.ThemeColors,
          //   title: Text(
          //     'APPOINTMENT',
          //     style: GoogleFonts.nunitoSans(
          //       fontSize: size.width * 0.06,
          //       color: MyTheme.blueww,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   leading: InkWell(
          //     onTap: () {
          //       Get.back();
          //     },
          //     child: Icon(
          //       Icons.arrow_back,
          //       color: MyTheme.blueww,
          //       size: size.height * 0.027,
          //     ),
          //   ),
          // ),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Obx(
              () => (_labListController.isLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
                      child: Column(
                        children: [
                          // Container(
                          //   height: size.height * 0.07,
                          //   color: Color(0xff11f2ec),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       SizedBox(
                          //         height: size.height * 0.04,
                          //       ),
                          //       // SizedBox(
                          //       //   height: size.height * 0.05,
                          //       // ),
                          //       Align(
                          //         alignment: Alignment.centerLeft,
                          //         child: Padding(
                          //           padding: EdgeInsets.symmetric(
                          //               horizontal: size.width * 0.04),
                          //           child: Row(
                          //             children: [
                          //               InkWell(
                          //                 onTap: () {
                          //                   //Get.off(LabSchedule1Page());
                          //                   Get.back();
                          //                 },
                          //                 child: Icon(
                          //                   Icons.arrow_back_ios_outlined,
                          //                   color: MyTheme.blueww,
                          //                   size: size.height * 0.027,
                          //                 ),
                          //               ),
                          //               SizedBox(
                          //                 width: size.width * 0.06,
                          //               ),
                          //               Text(
                          //                 'Book  Lab\'s  Appoinmtment',
                          //                 style: GoogleFonts.lato(
                          //                   fontSize: size.width * 0.05,
                          //                   color: MyTheme.blueww,
                          //                   fontWeight: FontWeight.bold,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          InkWell(
                            onTap: () {
                              //Get.to(() => DoctorListUser());
                            },
                            child: Padding(
                              padding: EdgeInsets.all(size.height * 0.007),
                              child: Container(
                                height: size.height * 0.19,
                                width: size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.006),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          lightPrimary2,
                                          darkPrimary2,
                                        ]),
                                    // color: Color(0xff11f2ec),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                      const BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.27,
                                      height: size.height * 0.2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            //catimage[index], height: size.height * 0.08,
                                            //productimage[index],
                                            "lib/assets/background_stack_png/lab1.png",
                                            height: size.height * 0.143,
                                          ),
                                          //Spacer(),
                                          Text(
                                            'Fees: ₹ '
                                            // '300'
                                            "${_labListController.labCheckoutModel?.fee}",
                                            //doctorcatagary[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.blueww,
                                              fontSize: size.width * 0.04,
                                            ),
                                          ),
                                          SizedBox(
                                              //height: size.height * 0.01,
                                              ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.06,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.05,
                                          ),
                                          Text(
                                            "${_labListController.labCheckoutModel?.labName}",
                                            //doctorcatagary[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: MyTheme.blueww,
                                              fontSize: size.height * 0.022,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Since: '
                                            "${_labListController.labCheckoutModel?.year ?? 2000}",
                                            //doctorcatagary[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: MyTheme.containercolor14,
                                              fontSize: size.height * 0.017,
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.06,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.002,
                          ),
                          InkWell(
                            onTap: () {
                              //Get.to(() => DoctorListUser());
                            },
                            child: Padding(
                              padding: EdgeInsets.all(size.height * 0.007),
                              child: Container(
                                height: size.height * 0.065,
                                width: size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.006),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          lightPrimary2,
                                          darkPrimary2,
                                        ]),
                                    // color: Color(0xff11f2ec),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                      const BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        //  width: size.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Selected Date:',
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                                fontSize: size.height * 0.017,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            //_labListController.labCheckoutModel!.testDate!.toIso8601String(),
                                            //'Jan 26, 2023',
                                            "${_labListController.labCheckoutModel?.testDate}",

                                            //doctorcatagary[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: MyTheme.blueww,
                                              fontSize: size.height * 0.015,
                                            ),
                                          ),

                                          ///

                                          // Text(
                                          //   // _labListController.labCheckoutModel!.slotTime.toString(),
                                          //   // '17:30',
                                          //   "${_labListController.labCheckoutModel?.slotTime}",
                                          //
                                          //   //doctorcatagary[index],
                                          //   maxLines: 1,
                                          //   overflow: TextOverflow.ellipsis,
                                          //   style: GoogleFonts.poppins(
                                          //     fontWeight: FontWeight.w600,
                                          //     color: MyTheme.containercolor14,
                                          //     fontSize: size.height * 0.012,
                                          //   ),
                                          // ),
                                          ///
                                          // SizedBox(
                                          //   height: size.height * 0.000,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: size.width * 0.06,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: size.height * 0.002,
                          // ),
                          InkWell(
                            onTap: () {
                              //Get.to(() => DoctorListUser());
                            },
                            child: Padding(
                              padding: EdgeInsets.all(size.height * 0.007),
                              child: Container(
                                height: size.height * 0.16,
                                width: size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.006),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          lightPrimary2,
                                          darkPrimary2,
                                        ]),
                                    // color: Color(0xff11f2ec),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                      const BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: size.width * 0.55,
                                        //height: size.height * 0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              // _labListController.labCheckoutModel!.fee.toString(),
                                              'Total Cost',
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                                fontSize: size.height * 0.022,
                                              ),
                                            ),
                                            Text(
                                              'Session Fees for full checkup.',
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade700,
                                                fontSize: size.height * 0.014,
                                              ),
                                            ),
                                            Text(
                                              // _labListController.labCheckoutModel!.fee.toString(),
                                              'Gst Cost:',
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                fontSize: size.height * 0.020,
                                              ),
                                            ),
                                            Spacer(),
                                            // SizedBox(
                                            //   height: size.height / 60,
                                            // ),
                                            Text(
                                              'To pay:',
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.containercolor14,
                                                fontSize: size.height * 0.021,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.000,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: size.width * 0.30,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '₹ '
                                              "${_labListController.labCheckoutModel?.fee}",
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                                fontSize: size.height * 0.022,
                                              ),
                                            ),
                                            Text(
                                              "₹ ${labFeeGst.toDouble()}",
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade700,
                                                fontSize: size.height * 0.017,
                                              ),
                                            ),
                                            Text(
                                              '₹ '
                                              "${finalamtlab.toDouble()}",

                                              // "${_labListController.labCheckoutModel?.fee}",
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.containercolor14,
                                                fontSize: size.height * 0.021,
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: size.height * 0.000,
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: size.width * 0.06,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //Spacer(),
                          SizedBox(
                            height: size.height / 3.3,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: NeoPopButton(
                                topShadowColor: Colors.green,
                                leftShadowColor: Colors.green,
                                color: Colors.black,
                                bottomShadowColor:
                                    ColorUtils.getVerticalShadow(Colors.green)
                                        .toColor(),
                                rightShadowColor:
                                    ColorUtils.getHorizontalShadow(Colors.green)
                                        .toColor(),
                                animationDuration:
                                    const Duration(milliseconds: 200),
                                depth: kButtonDepth,
                                onTapUp: () async {
                                  SharedPreferences p =
                                      await SharedPreferences.getInstance();
                                  // p.setString(
                                  //   //"rrrrrrrrrr4567",
                                  //    // "${_checkoutController.checkoutModel?.result?.totalCost.toString()
                                  //   // }"
                                  // );
                                  var v = p.getString("rrrrrrrrrr4567");
                                  print("object3####################:${v}");
                                  Get.bottomSheet(
                                    Container(
                                      //  height: 180,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          //  crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                /// todo start payment......feess,,,,,...

                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                prefs.setString(
                                                  "LabFee1",
                                                  "${finalamtlab.toDouble()}",
                                                );
                                                //"${_labListController.labCheckoutModel?.fee.toString()}");

                                                ///todo: end the fees.........
                                                _rozarPayLabController
                                                    .openCheckout();
                                                // _addressListController.update();
                                              },
                                              child: Container(
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  border: new Border.all(
                                                      color: Colors.white,
                                                      width: 2.0),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Pay Now',
                                                    style: new TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                /// todo start payment......feess,,,,,...

                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                prefs.setString(
                                                  "LabFee1",
                                                  "${finalamtlab.toDouble()}",
                                                );
                                                //"${_labListController.labCheckoutModel?.fee.toString()}");

                                                ///todo: end the fees.........
                                                // _postOrderController
                                                //     .postOrderApi()
                                                //     .then((statusCode) {
                                                //   if (statusCode == 200) {
                                                //     ///This is the main thing to provide updated list history...
                                                //     _labHistoryController
                                                //         .labHistorybyUserId();
                                                //
                                                //     ///nov 14....................................
                                                //     //Get.to(LabHistoryUser());
                                                //     _labHistoryController
                                                //         .update();
                                                //
                                                //     ///nov 14....................................
                                                //     //Get.to(OrderConfirmationPage());
                                                //   } else {
                                                //     Get.snackbar("Error123", "");
                                                //   }
                                                // });

                                                final labFee =
                                                    "${finalamtlab.toDouble() ?? 0}";

                                                final walletAmount =
                                                    _walletPostController
                                                            .getwalletlist
                                                            ?.result?[0]
                                                            .walletAmount ??
                                                        0;
                                                print("LABFEE $finalamtlab");
                                                print(
                                                    "WALLET AMOUNT $walletAmount");
                                                if (finalamtlab >
                                                    walletAmount) {
                                                  Get.snackbar("Low Amount",
                                                      "Please Add Money");
                                                  Get.to(
                                                    () =>
                                                        WolletUser(), //next page class
                                                    duration: Duration(
                                                        milliseconds:
                                                            500), //duration of transitions, default 1 sec
                                                    transition: Transition.zoom,
                                                  );

                                                  /// Not possibble from wallet go to add page
                                                } else {
                                                  SharedPreferences prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  final labFee =
                                                      "${finalamtlab.toDouble() ?? 0}";
                                                  // final newWalletAmount =
                                                  //     walletAmount - labFee;
                                                  final newWalletAmount =
                                                      finalamtlab - 0;
                                                  _walletPostController
                                                      .walletPostUpdateApi(
                                                          newWalletAmount)
                                                      .then((statusCode) {
                                                    if (statusCode == 200) {
                                                      ///todo: post order api calling....
                                                      _postOrderController
                                                          .postOrderApi()
                                                          .then((statusCode) {
                                                        if (statusCode == 200) {
                                                          Get.snackbar(
                                                              "Payment Success",
                                                              "Your booking confirmed");

                                                          ///home page......user....

                                                          Get.to(
                                                            () =>
                                                                UserHomePage(), //next page class
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500), //duration of transitions, default 1 sec
                                                            transition:
                                                                Transition.zoom,
                                                          );

                                                          ///This is the main thing to provide updated list history...
                                                          _labHistoryController
                                                              .labHistorybyUserId();

                                                          ///nov 14....................................
                                                          //Get.to(LabHistoryUser());
                                                          _labHistoryController
                                                              .update();

                                                          ///nov 14....................................
                                                          //Get.to(OrderConfirmationPage());
                                                        } else {
                                                          Get.snackbar(
                                                              "Error123",
                                                              "errors");
                                                        }
                                                      });

                                                      ///todo: post order api.........
                                                      ///This is the main thing to provide updated list history...
                                                      _labHistoryController
                                                          .labHistorybyUserId();
                                                      _labHistoryController
                                                          .update();

                                                      ///old....history
                                                      // Get.to(
                                                      //   () =>
                                                      //       LabHistoryUser(), //next page class
                                                      //   duration: Duration(
                                                      //       milliseconds:
                                                      //           400), //duration of transitions, default 1 sec
                                                      //   transition:
                                                      //       Transition.zoom,
                                                      // );

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
                                                      Get.snackbar("Error12378",
                                                          "error");
                                                    }
                                                  });
                                                }
                                              },
                                              child: Container(
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 2.0),
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: new Center(
                                                  child: new Text(
                                                    'Pay via Wallet',
                                                    style: new TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            ///Todo: COD method for order...........................................................cod...................
                                            // InkWell(
                                            //   onTap: () {
                                            //     _postOrderController
                                            //         .postOrderApi()
                                            //         .then((statusCode) {
                                            //       if (statusCode == 200) {
                                            //         ///This is the main thing to provide updated list history...
                                            //         _labHistoryController
                                            //             .labHistorybyUserId();
                                            //         _labHistoryController.update();
                                            //
                                            //         ///nov 14....................................
                                            //         Get.to(LabHistoryUser());
                                            //       } else {
                                            //         Get.snackbar("Error123", "");
                                            //       }
                                            //     });
                                            //   },
                                            //   child: Container(
                                            //     height: 50.0,
                                            //     decoration: BoxDecoration(
                                            //       color: Colors.black,
                                            //       border: new Border.all(
                                            //           color: Colors.white,
                                            //           width: 2.0),
                                            //       borderRadius:
                                            //           new BorderRadius.circular(
                                            //               10.0),
                                            //     ),
                                            //     child: Center(
                                            //       child: Text(
                                            //         'Cash on delivery',
                                            //         style: new TextStyle(
                                            //             fontSize: 18.0,
                                            //             color: Colors.white),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            ///
                                            // InkWell(
                                            //   onTap: (){
                                            //     _postOrderController.postOrderApi().then((statusCode) {
                                            //       if (statusCode == 200) {
                                            //         ///This is the main thing to provide updated list history...
                                            //         _getProfileController.OrderHistoryApi();
                                            //         _getProfileController.update();
                                            //
                                            //         ///nov 14....................................
                                            //         Get.to(OrderConfirmationPage());
                                            //       } else {
                                            //         Get.snackbar("Error", "");
                                            //       }
                                            //     });
                                            //
                                            //   },
                                            //     child: Text("COD")
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35),side: BorderSide(width: 5,color: Colors.black),),
                                    //   enableDrag: false
                                  );
                                },
                                border: Border.all(
                                  color: Colors.green,
                                  width: 1,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("PLACE ORDER",
                                          style: GoogleFonts.poppins(
                                            color: MyTheme.ThemeColors,
                                            fontSize: 13,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // PhysicalModel(
                          //   color: Colors.transparent,
                          //   elevation: 3,
                          //   borderRadius: BorderRadius.circular(20),
                          //   child: InkWell(
                          //     onTap: () {
                          //       _rozarPayController.openCheckout();
                          //       print('okokokopayment');
                          //       //Get.to(() => AppointmentCheckout());
                          //     },
                          //     child: Container(
                          //       height: size.height * 0.055,
                          //       width: size.width * 0.9,
                          //       decoration: BoxDecoration(
                          //         color: MyTheme.containercolor4,
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           'PAY  NOW',
                          //           //doctorcatagary[index],
                          //           maxLines: 1,
                          //           overflow: TextOverflow.ellipsis,
                          //           style: GoogleFonts.poppins(
                          //             fontWeight: FontWeight.w600,
                          //             color: MyTheme.blueww,
                          //             fontSize: size.height * 0.022,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: size.height * 0.03,
                          // ),
                          // PhysicalModel(
                          //   color: Colors.transparent,
                          //   elevation: 3,
                          //   borderRadius: BorderRadius.circular(20),
                          //   child: InkWell(
                          //     onTap: () {
                          //       //_rozarPayController.openCheckout();
                          //       print('okokokopayment');
                          //       //Get.to(() => AppointmentCheckout());
                          //     },
                          //     child: Container(
                          //       height: size.height * 0.055,
                          //       width: size.width * 0.9,
                          //       decoration: BoxDecoration(
                          //         color: MyTheme.containercolor1,
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           'PAY  LATER',
                          //           //doctorcatagary[index],
                          //           maxLines: 1,
                          //           overflow: TextOverflow.ellipsis,
                          //           style: GoogleFonts.poppins(
                          //             fontWeight: FontWeight.w600,
                          //             color: MyTheme.blueww,
                          //             fontSize: size.height * 0.022,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
