import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../constants/my_theme.dart';
import '../../../../controllers/1_user_view_controller/doctor_sections/doctor_checkout_controller.dart';
import '../../../../controllers/1_user_view_controller/doctor_sections/post_doctor_paybooking_order_controller.dart';
import '../../../../controllers/1_user_view_controller/drawer_contoller/doctor_history_section/doctor_history_controller.dart';
import '../../../../controllers/1_user_view_controller/rozar_pay_doctor_controller/rozarpayy_doctor_controllers.dart';
import '../../../../controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
import '../../user_drawer/drawer_pages_user/doctor_history/doctor_history_user.dart';
import '../../user_drawer/drawer_pages_user/walet_user/wallet_user.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/rozar_pay_controller/rozar_pay_controller.dart';

class DoctorAppointmentCheckout extends StatelessWidget {
  DoctorAppointmentCheckout({Key? key}) : super(key: key);
  final RozarPayDoctorController _rozarPaydoctorController =
      Get.put(RozarPayDoctorController());
  final DoctorCheckoutController _doctorappointmentcheckout =
      Get.put(DoctorCheckoutController());
  DoctorHistoryController _doctorHistoryController =
      Get.put(DoctorHistoryController());
  PostOrderDoctorController _postOrderDoctorController =
      Get.put(PostOrderDoctorController());
  //PostOrderController _postOrderController = Get.put(PostOrderController());
  Wallet_2_Controller _walletPostController = Get.put(Wallet_2_Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
        body: Obx(
          () => (_doctorappointmentcheckout.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.12,
                        color: Color(0xff11f2ec),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            // SizedBox(
                            //   height: size.height * 0.05,
                            // ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.04),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios_outlined,
                                        color: MyTheme.blueww,
                                        size: size.height * 0.027,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.06,
                                    ),
                                    Text(
                                      'Book  Doctor\'s  Appoinmtment',
                                      style: GoogleFonts.lato(
                                        fontSize: size.width * 0.05,
                                        color: MyTheme.blueww,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: size.width * 0.27,
                                  height: size.height * 0.2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                        "${_doctorappointmentcheckout.doctorCheckoutModel?.fee}",
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
                                        height: size.height * 0.022,
                                      ),
                                      Text(
                                        "${_doctorappointmentcheckout.doctorCheckoutModel?.doctorName}",
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
                                        "${_doctorappointmentcheckout.doctorCheckoutModel?.specialistName}",
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
                                        'Since: '
                                        "${_doctorappointmentcheckout.doctorCheckoutModel?.experience}",
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
                            height: size.height * 0.10,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          'Selected Date:',
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
                                          'Selected Time:',
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
                                          //_labListController.labCheckoutModel!.testDate!.toIso8601String(),
                                          //'Jan 26, 2023',
                                          "${_doctorappointmentcheckout.doctorCheckoutModel?.appointmentDate}",

                                          //doctorcatagary[index],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: MyTheme.blueww,
                                            fontSize: size.height * 0.015,
                                          ),
                                        ),

                                        Text(
                                          // _labListController.labCheckoutModel!.slotTime.toString(),
                                          // '17:30',
                                          "${_doctorappointmentcheckout.doctorCheckoutModel?.slotTime}",

                                          //doctorcatagary[index],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: MyTheme.containercolor14,
                                            fontSize: size.height * 0.015,
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
                            height: size.height * 0.14,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          'Session Fees for full checkup.',
                                          //doctorcatagary[index],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade700,
                                            fontSize: size.height * 0.017,
                                          ),
                                        ),
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
                                          "${_doctorappointmentcheckout.doctorCheckoutModel?.fee}",
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
                                          '',
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
                                          "${_doctorappointmentcheckout.doctorCheckoutModel?.fee}",
                                          //doctorcatagary[index],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: MyTheme.containercolor14,
                                            fontSize: size.height * 0.021,
                                          ),
                                        ),
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
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                          onTap: () {
                                            _rozarPaydoctorController
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
                                          onTap: () {},
                                          child: InkWell(
                                            onTap: () {
                                              _postOrderDoctorController
                                                  .postOrderdoctoronlineApi()
                                                  .then((statusCode) {
                                                if (statusCode == 200) {
                                                  ///This is the main thing to provide updated list history...
                                                  _doctorHistoryController
                                                      .doctorListHospitalApi();

                                                  ///nov 14....................................
                                                  //Get.to(LabHistoryUser());
                                                  _doctorHistoryController
                                                      .update();

                                                  ///nov 14....................................
                                                  //Get.to(OrderConfirmationPage());
                                                } else {
                                                  Get.snackbar("Error123", "");
                                                }
                                              });
                                              final labFee =
                                                  _doctorappointmentcheckout
                                                          .doctorCheckoutModel
                                                          ?.fee ??
                                                      0;
                                              final walletAmount =
                                                  _walletPostController
                                                          .getwalletlist
                                                          ?.result?[0]
                                                          .walletAmount ??
                                                      0;
                                              print("LABFEE $labFee");
                                              print(
                                                  "WALLET AMOUNT $walletAmount");
                                              if (labFee > walletAmount) {
                                                /// Not possibble from wallet go to add page
                                              } else {
                                                final newWalletAmount =
                                                    walletAmount - labFee;
                                                _walletPostController
                                                    .walletPostUpdateApi(
                                                        newWalletAmount)
                                                    .then((statusCode) {
                                                  if (statusCode == 200) {
                                                    ///This is the main thing to provide updated list history...
                                                    _doctorHistoryController
                                                        .doctorListHospitalApi();

                                                    ///nov 14....................................
                                                    //Get.to(LabHistoryUser());
                                                    _doctorHistoryController
                                                        .update();
                                                    Get.offAll(
                                                      () =>
                                                          DoctorHistoryUser(), //next page class
                                                      duration: Duration(
                                                          milliseconds:
                                                              300), //duration of transitions, default 1 sec
                                                      transition:
                                                          Transition.zoom,
                                                    );

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
                                        ),

                                        ///Todo: COD method for order...........................................................cod...................
                                        // InkWell(
                                        //   onTap: () {
                                        //     _postOrderDoctorController
                                        //         .postOrderDoctorofflineApi()
                                        //         .then((statusCode) {
                                        //       if (statusCode == 200) {
                                        //         ///This is the main thing to provide updated list history...
                                        //         _doctorHistoryController
                                        //             .doctorListHospitalApi();
                                        //
                                        //         ///nov 14....................................
                                        //         //Get.to(LabHistoryUser());
                                        //         _doctorHistoryController
                                        //             .update();
                                        //
                                        //         ///nov 14....................................
                                        //         Get.to(DoctorHistoryUser());
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
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
