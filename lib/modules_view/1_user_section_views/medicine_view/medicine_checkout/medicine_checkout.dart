import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/drawer_contoller/medicine_history_controller/medicine_history_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_checkout/medicine_chkout_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/post_medicine_order_controller/post_medicine_order_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
//import 'package:ps_welness_new_ui/controllers/1_user_view_controller/post_medicine_order_controller/post_medicine_order_controller.dart';
import 'package:ps_welness_new_ui/controllers/rozar_pay_controller/rozar_pay_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/drawer_pages_user/walet_user/wallet_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/my_theme.dart';
//import '../../../../controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
//import '../../user_drawer/drawer_pages_user/walet_user/wallet_user.dart';
//import '../../../../controllers/1_user_view_controller/medicine_controllers/medicine_checkout_controller/medicine_checkout_controller.dart';

class CheckOutMedicine extends StatelessWidget {
  CheckOutMedicine({Key? key}) : super(key: key);
  CheckoutMedicineController _medicinecheckoutController =
      Get.put(CheckoutMedicineController());
  Wallet_2_Controller _walletPostController = Get.put(Wallet_2_Controller());

  MedicineHistoryController _medicineHistoryController =
      Get.put(MedicineHistoryController());
  PostOrderChemistController _postmedicineordercontroller =
      Get.put(PostOrderChemistController());

  RxBool isLoading = false.obs;
  //CartController controller = Get.find();
  RozarPayController _rozarPayController = Get.put(RozarPayController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.themecolors,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Order Placed',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => (_medicinecheckoutController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(
                    height: 05,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.26,
                    width: size.width * 0.9,
                    child: ListView.builder(
                        itemCount: 1,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shipping Address :',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name:',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Mobile: ',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'State: ',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'City: ',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Area: ',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Pin Code: ',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.14,
                                  ),
                                  // Obx(
                                  //       () => (_checkoutController
                                  //       .isLoading.value)
                                  //       ? Center(
                                  //       child:
                                  //       CircularProgressIndicator())
                                  //       : _checkoutController
                                  //       .getaddressbyid!
                                  //       .result ==
                                  //       null
                                  //       ? Center(
                                  //     child: Text('No data'),
                                  //   )
                                  //       :
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${_medicinecheckoutController.medicinecheckoutModel?.data?.name.toString()}",
                                        //_checkoutController.
                                        //'ok',
                                        // _checkoutController
                                        //     .getaddressbyid!
                                        //     .result![index]
                                        //     .name
                                        //     .toString(),
                                        style: TextStyle(
                                          color: AppColors.primarySwatch,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${_medicinecheckoutController.medicinecheckoutModel?.data?.mobileNumber.toString()}",

                                        //  "mkkml",
                                        // _checkoutController
                                        //     .getaddressbyid!
                                        //     .result![index]
                                        //     .mobile
                                        //     .toString(),

                                        style: TextStyle(
                                          color: AppColors.primarySwatch,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${_medicinecheckoutController.medicinecheckoutModel?.data?.stateName.toString()}",
                                        // _checkoutController
                                        //     .getaddressbyid!
                                        //     .result![index]
                                        //     .state
                                        //     .toString(),
                                        style: TextStyle(
                                          color: AppColors.primarySwatch,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Text(
                                        "${_medicinecheckoutController.medicinecheckoutModel?.data?.cityName.toString()}",
                                        // _checkoutController
                                        //     .getaddressbyid!
                                        //     .result![index]
                                        //     .city
                                        //     .toString(),
                                        style: TextStyle(
                                          color: AppColors.primarySwatch,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Text(
                                        "${_medicinecheckoutController.medicinecheckoutModel?.data?.deliveryAddress.toString()}",
                                        // _checkoutController
                                        //     .getaddressbyid!
                                        //     .result![index]
                                        //     .area
                                        //     .toString(),
                                        style: TextStyle(
                                          color: AppColors.primarySwatch,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Text(
                                        "${_medicinecheckoutController.medicinecheckoutModel?.data?.pinCode.toString()}",
                                        // _checkoutController
                                        //     .getaddressbyid!
                                        //     .result![index]
                                        //     .pinCode
                                        //     .toString(),
                                        style: TextStyle(
                                          color: AppColors.primarySwatch,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                  //),
                                ],
                              ),
                            ],
                          );
                          // );
                        }),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                              height: size.height * 0.14,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price:',
                                    style: GoogleFonts.alegreyaSc(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Delivery Charge:',
                                    style: GoogleFonts.alegreyaSc(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Final Cost',
                                    style: TextStyle(
                                      color: MyTheme.containercolor7,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.4,
                              height: size.height * 0.14,
                              child:
                                  // Obx(
                                  //       () => (_checkoutController.isLoading.value)
                                  //       ? Center(child: CircularProgressIndicator())
                                  //       : _checkoutController.checkoutModel?.result == null
                                  //       ? Center(
                                  //     child: Text('No data'),
                                  //   )
                                  //       :
                                  Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '₹ '
                                    "${_medicinecheckoutController.medicinecheckoutModel?.data?.totalPrice}",
                                    // '${_checkoutController.checkoutModel?.result?.totalPrice.toString()}',
                                    style: GoogleFonts.alegreyaSc(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '₹ '
                                    "${_medicinecheckoutController.medicinecheckoutModel?.data?.deliverycharge}",

                                    //'${_checkoutController.checkoutModel?.result?.discount.toString()}',
                                    style: GoogleFonts.alegreyaSc(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '₹ '
                                    "${_medicinecheckoutController.medicinecheckoutModel?.data?.finalPrice}",
                                    //${_checkoutController.checkoutModel?.result?.totalCost.toString()}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
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
                                            /// todo start payment......feess,,,,,...

                                            // SharedPreferences prefs =
                                            //     await SharedPreferences
                                            //     .getInstance();
                                            //prefs.setString("MedicineFee",
                                            //"${_nurseappointmentcheckout.nurseCheckoutModel?.fee.toString()}");

                                            ///todo: end the fees.........
                                            _rozarPayController.openCheckout();
                                            // _addressListController.update();
                                          },
                                          child: Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Pay Now',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
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
                                            final medicineFee =
                                                _medicinecheckoutController
                                                        .medicinecheckoutModel
                                                        ?.data
                                                        ?.finalPrice
                                                        ?.toDouble() ??
                                                    0;

                                            // _labListController
                                            // .labCheckoutModel?.fee ??
                                            // 0;
                                            final walletAmount =
                                                _walletPostController
                                                        .getwalletlist
                                                        ?.result?[0]
                                                        .walletAmount ??
                                                    0;
                                            print("LABFEEhhhrrr $medicineFee");
                                            print(
                                                "WALLET AMOUNTnntt $walletAmount");
                                            if (medicineFee > walletAmount) {
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
                                                  medicineFee - 0;
                                              _walletPostController
                                                  .walletPostUpdateApi(
                                                      newWalletAmount)
                                                  .then((statusCode) {
                                                if (statusCode == 200) {
                                                  ///start post order controller.....
                                                  _postmedicineordercontroller
                                                      .postOrderApi()
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
                                                      _medicineHistoryController
                                                          .medicineorderhistoryApi();

                                                      _medicineHistoryController
                                                          .update();

                                                      ///nov 14....................................
                                                      //Get.to(OrderConfirmationPage());
                                                    } else {
                                                      Get.snackbar(
                                                          "Error123", "Errors");
                                                    }
                                                  });

                                                  ///end...
                                                  ///This is the main thing to provide updated list history...
                                                  _medicineHistoryController
                                                      .medicineorderhistoryApi();
                                                  _medicineHistoryController
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
                                                } else if (statusCode == 400) {
                                                  Get.to(
                                                    () =>
                                                        WolletUser(), //next page class
                                                    duration: Duration(
                                                        milliseconds:
                                                            500), //duration of transitions, default 1 sec
                                                    transition: Transition.zoom,
                                                  );
                                                } else {
                                                  Get.snackbar(
                                                      "Error12378", "errorrs");
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
                                        // new InkWell(
                                        //   onTap: () {
                                        //     // _postOrderController.postOrderApi().then((statusCode) {
                                        //     //   if (statusCode == 200) {
                                        //     //     ///This is the main thing to provide updated list history...
                                        //     //     _getProfileController.OrderHistoryApi();
                                        //     //     _getProfileController.update();
                                        //     //     ///nov 14....................................
                                        //     //     Get.to(OrderConfirmationPage());
                                        //     //   } else {
                                        //     //     Get.snackbar("Error123", "");
                                        //     //   }
                                        //     // });
                                        //   },
                                        //   child: new Container(
                                        //     height: 50.0,
                                        //     decoration: new BoxDecoration(
                                        //       color: Colors.black,
                                        //       border: new Border.all(
                                        //           color: Colors.white,
                                        //           width: 2.0),
                                        //       borderRadius:
                                        //           new BorderRadius.circular(
                                        //               10.0),
                                        //     ),
                                        //     child: new Center(
                                        //       child: new Text(
                                        //         'Cash on delivery',
                                        //         style: new TextStyle(
                                        //             fontSize: 18.0,
                                        //             color: Colors.white),
                                        //       ),
                                        //     ),
                                        //   ),
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
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
