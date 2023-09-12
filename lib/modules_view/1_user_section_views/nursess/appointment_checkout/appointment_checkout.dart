import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/nursess/nurse_appointment_section/nurse_detail_and_schedule/nurse_details_schedules.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../controllers/1_user_view_controller/drawer_contoller/nurse_history_controller/nurse_history_controllerss.dart';
import '../../../../controllers/1_user_view_controller/nurse_checkout_controller/nurse_checkout_controller.dart';
import '../../../../controllers/1_user_view_controller/post_nurse_order_controller/post_nurse_order_controller.dart';
import '../../../../controllers/1_user_view_controller/rozar_pay_nurse_controller/rozar_pay_nurse_controller.dart';
import '../../../../controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import '../../../../controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
import '../../home_page_user_view/user_home_page.dart';
import '../../user_drawer/drawer_pages_user/walet_user/wallet_user.dart';

class AppointmentCheckout extends StatelessWidget {
  AppointmentCheckout({Key? key}) : super(key: key);
  // final RozarPayLabController _rozarPayLabController =
  //     Get.put(RozarPayLabController());
  final RozarPayNurseController _rozarPayNurseController =
      Get.put(RozarPayNurseController());
  NurseHistoryController _nurseHistoryController =
      Get.put(NurseHistoryController());
  //final RozarPayController _rozarPayController = Get.put(RozarPayController());
  final NurseCheckoutController _nurseappointmentcheckout =
      Get.put(NurseCheckoutController());

  ///LabListController _labListController = Get.put(LabListController());
  //LabListController _labListController = Get.put(LabListController());
  UserProfileControllers _userrsProfileControllers =
      Get.put(UserProfileControllers());

  PostOrderNurseController _postOrderNurseController =
      Get.put(PostOrderNurseController());
  //PostOrderController _postOrderController = Get.put(PostOrderController());
  //LabHistoryController _labHistoryController = Get.put(LabHistoryController());
  UserProfileControllers _userrsProfileController =
      Get.put(UserProfileControllers());
  Wallet_2_Controller _walletPostController = Get.put(Wallet_2_Controller());

  @override
  Widget build(BuildContext context) {
    ///todo: maths logoc....
    final nurseFee = double.parse(
        "${_nurseappointmentcheckout.nurseCheckoutModel?.fee?.toDouble()}");
    //print("${element.price * element.step} c");
    final nurseFeeGst = double.parse(
        "${(_nurseappointmentcheckout.nurseCheckoutModel?.fee?.toDouble())! * ((_nurseappointmentcheckout.nurseCheckoutModel?.gst?.toDouble())! / 100).toDouble()}");
    final finalnurseAmounts = "${nurseFee.toDouble() + nurseFeeGst.toDouble()}";
    var finalamtnurse =
        double.parse("${nurseFee.toDouble() + nurseFeeGst.toDouble()}");
    print("nurssseee233:${nurseFee}");
    print("nurssseeegst:${nurseFeeGst}");
    print("Nursetotal:${finalnurseAmounts}");

    ///todo: end maths logic....

    //Size size = MediaQuery.of(context).size;
    //NurseDetailsSchedulePage
    bool shouldPop = true;
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Get.to(NurseDetailsSchedulePage());
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
            title: Text(
              'Book  Nurse\'s  Appoinmtment',
              style: GoogleFonts.nunitoSans(
                fontSize: size.width * 0.045,
                color: MyTheme.blueww,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: InkWell(
              onTap: () {
                Get.to(NurseDetailsSchedulePage());

                // Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: MyTheme.blueww,
                size: size.height * 0.027,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Obx(
                () => (_nurseappointmentcheckout.isLoading.value)
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          // Container(
                          //   height: size.height * 0.12,
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
                          //                   Get.to(NurseDetailsSchedulePage());
                          //                   // Get.back();
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
                          //                 'Book  Nurse\'s  Appoinmtment',
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
                                            "${_nurseappointmentcheckout.nurseCheckoutModel?.fee}",
                                            //doctorcatagary[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.blueww,
                                              fontSize: size.width * 0.036,
                                            ),
                                          ),
                                          SizedBox(
                                              //height: size.height * 0.01,
                                              ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.022,
                                          ),
                                          Text(
                                            "${_nurseappointmentcheckout.nurseCheckoutModel?.nurseName}",

                                            // "${_labListController.labCheckoutModel?.labName}",
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
                                            "${_nurseappointmentcheckout.nurseCheckoutModel?.nurseTypeName}",
                                            // "${_labListController.labCheckoutModel?.labTypeName}",
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
                                            'Experience: '
                                            "${_nurseappointmentcheckout.nurseCheckoutModel?.experience} yr",
                                            //"${_labListController.labCheckoutModel?.year}",
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
                                            height: size.height * 0.000,
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
                                height: size.height * 0.05,
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
                                        width: size.width * 0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            Spacer(),
                                            // Text(
                                            //   'Selected Time:',
                                            //   //doctorcatagary[index],
                                            //   maxLines: 1,
                                            //   overflow: TextOverflow.ellipsis,
                                            //   style: GoogleFonts.poppins(
                                            //     fontWeight: FontWeight.w600,
                                            //     color: MyTheme.containercolor14,
                                            //     fontSize: size.height * 0.017,
                                            //   ),
                                            // ),
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
                                        width: size.width * 0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.22,
                                              child: Text(
                                                //_labListController.labCheckoutModel!.testDate!.toIso8601String(),
                                                //'Jan 26, 2023',
                                                "${_nurseappointmentcheckout.nurseCheckoutModel?.serviceDate}",

                                                //"${_labListController.labCheckoutModel?.testDate}",

                                                //doctorcatagary[index],
                                                maxLines: 1,
                                                // overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  color: MyTheme.blueww,
                                                  fontSize: size.height * 0.016,
                                                ),
                                              ),
                                            ),

                                            ///

                                            // SizedBox(
                                            //   width: size.width * 0.37,
                                            //   child: Text(
                                            //     // _labListController.labCheckoutModel!.slotTime.toString(),
                                            //     // '17:30',
                                            //     "${_nurseappointmentcheckout.nurseCheckoutModel?.slotTime}",
                                            //
                                            //     //doctorcatagary[index],
                                            //     maxLines: 1,
                                            //     //overflow: TextOverflow.ellipsis,
                                            //     style: GoogleFonts.poppins(
                                            //       fontWeight: FontWeight.w600,
                                            //       color:
                                            //           MyTheme.containercolor14,
                                            //       fontSize: size.height * 0.015,
                                            //     ),
                                            //   ),
                                            // ),
                                            ///
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
                                              'Session Fees for Nurse.',
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade700,
                                                fontSize: size.height * 0.013,
                                              ),
                                            ),
                                            Text(
                                              // _labListController.labCheckoutModel!.fee.toString(),
                                              'Gst Cost',
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                fontSize: size.height * 0.020,
                                              ),
                                            ),
                                            //finalnurseAmounts
                                            Spacer(),
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
                                              "${_nurseappointmentcheckout.nurseCheckoutModel?.fee}",
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                                fontSize: size.height * 0.022,
                                              ),
                                            ),

                                            ///todo:
                                            Text(
                                              "₹ ${nurseFeeGst.toDouble()}",
                                              //doctorcatagary[index],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: size.height * 0.017,
                                              ),
                                            ),

                                            ///todo: final cost...and you have to pay this much ammount....
                                            Text(
                                              '₹ '
                                              "$finalnurseAmounts",
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
                            height: size.height / 3.24,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
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
                                p.setString(
                                    "rrrrrrrrrr4567", finalnurseAmounts);
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
                                            ///todo: this is for api checkout fees.....6 june 2023...fees
                                            onTap: () async {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString("NurseFee",
                                                  "${finalnurseAmounts}"
                                                  //"${_nurseappointmentcheckout.nurseCheckoutModel?.fee.toString()}"
                                                  );

                                              ///todo: end the fees.........

                                              _rozarPayNurseController
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
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString("NurseFee",
                                                  "${finalnurseAmounts}"
                                                  //"${_nurseappointmentcheckout.nurseCheckoutModel?.fee.toString()}"
                                                  );
                                              // _postOrderNurseController
                                              //     .postOrdernurseonlineApi()
                                              //     .then((statusCode) {
                                              //   if (statusCode == 200) {
                                              //     ///This is the main thing to provide updated list history...
                                              //     _nurseHistoryController
                                              //         .nursehistoryApi();
                                              //
                                              //     ///nov 14....................................
                                              //     //Get.to(LabHistoryUser());
                                              //     _nurseHistoryController
                                              //         .update();
                                              //
                                              //     ///nov 14....................................
                                              //     //Get.to(OrderConfirmationPage());
                                              //   } else {
                                              //     Get.snackbar("Error123", "");
                                              //   }
                                              // });
                                              final labFee =
                                                  "${finalamtnurse.toDouble() ?? 0}";

                                              ///
                                              //     _nurseappointmentcheckout
                                              //             .nurseCheckoutModel
                                              //             ?.fee
                                              //             ?.toDouble() ??
                                              //        0;

                                              // _labListController
                                              // .labCheckoutModel?.fee ??
                                              // 0;
                                              final walletAmount =
                                                  _walletPostController
                                                          .getwalletlist
                                                          ?.result?[0]
                                                          .walletAmount ??
                                                      0;
                                              print(
                                                  "LABFEEhhh $finalnurseAmounts");
                                              print(
                                                  "WALLET AMOUNTnn $walletAmount");
                                              if (finalamtnurse >
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
                                                // final newWalletAmount =
                                                //     walletAmount - labFee;

                                                final newWalletAmount =
                                                    finalamtnurse - 0;
                                                _walletPostController
                                                    .walletPostUpdateApi(
                                                        newWalletAmount)
                                                    .then((statusCode) {
                                                  if (statusCode == 200) {
                                                    ///start post order controller.....
                                                    _postOrderNurseController
                                                        .postOrdernurseonlineApi()
                                                        .then((statusCode) {
                                                      if (statusCode == 200) {
                                                        Get.snackbar(
                                                            "Payment Success",
                                                            "Your booking confirmed");

                                                        ///todo:home page.....
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
                                                        _nurseHistoryController
                                                            .nursehistoryApi();

                                                        ///nov 14....................................
                                                        //Get.to(LabHistoryUser());
                                                        _nurseHistoryController
                                                            .update();

                                                        ///nov 14....................................
                                                        //Get.to(OrderConfirmationPage());
                                                      } else {
                                                        Get.snackbar("Error123",
                                                            "Errors");
                                                      }
                                                    });

                                                    ///end...
                                                    ///This is the main thing to provide updated list history...
                                                    _nurseHistoryController
                                                        .nursehistoryApi();

                                                    _nurseHistoryController
                                                        .update();

                                                    ///old....
                                                    // Get.offAll(
                                                    //   () =>
                                                    //       NurseHistoryUser(), //next page class
                                                    //   duration: Duration(
                                                    //       milliseconds:
                                                    //           300), //duration of transitions, default 1 sec
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
                                                    Get.snackbar(
                                                        "Error12378", "error");
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
                                          //     _postOrderNurseController
                                          //         .postOrdernurseofflineApi()
                                          //         .then((statusCode) {
                                          //       if (statusCode == 200) {
                                          //         ///This is the main thing to provide updated list history...
                                          //         _nurseHistoryController
                                          //             .nursehistoryApi();
                                          //
                                          //         _nurseHistoryController
                                          //             .update();
                                          //
                                          //         ///nov 14....................................
                                          //         Get.to(NurseHistoryUser());
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
                                          ///........
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
                            height: size.height * 0.06,
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
