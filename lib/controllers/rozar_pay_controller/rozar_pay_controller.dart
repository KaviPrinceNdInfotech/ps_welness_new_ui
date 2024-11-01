import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_checkout/medicine_chkout_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/post_medicine_order_controller/post_medicine_order_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../1_user_view_controller/drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import '../1_user_view_controller/drawer_contoller/medicine_history_controller/medicine_history_controller.dart';
//import '../1_user_view_controller/lab_controller/post_lab_order_controller/post_lab_order_controller.dart';
import '../1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';

class RozarPayController extends GetxController {
  //get isLoading => null;

  RxBool isLoading = false.obs;
  //LabListController _labListController = Get.put(LabListController());
  UserProfileControllers _userrsProfileControllers =
      Get.put(UserProfileControllers());
  MedicineHistoryController _medicineHistoryController =
      Get.put(MedicineHistoryController());
  PostOrderChemistController _postmedicineordercontroller =
      Get.put(PostOrderChemistController());
  CheckoutMedicineController _medicinecheckoutController =
      Get.put(CheckoutMedicineController());

  //final CartController controller = Get.put(CartController());
  //GetProfileController _getProfileController = Get.put(GetProfileController());
  //CheckoutController _checkoutController = Get.put(CheckoutController());
  //PostOrderController _postOrderController = Get.put(PostOrderController());
  LabHistoryController _labHistoryController = Get.put(LabHistoryController());

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  late Razorpay _razorpay;

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openCheckout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var MedicineFee = preferences.getString("MedicineFee");
    print("medicine4eeedrr: ${MedicineFee}");
    var options = {
      //'key': 'rzp_live_sTN4TNvGmEs3C1',
      'key': 'rzp_test_s1VIQAlF8CZRCE',

      //'key': 'rzp_test_aeRns0u8gPpOUK',
      //'amount': int.parse(
      // '100'

      // '${_doctorappointmentcheckout.doctorCheckoutModel?.fee?.toInt()}') *
      // 100,
      'amount': double.parse('${MedicineFee
                  //_doctorappointmentcheckout.doctorCheckoutModel?.fee?.toInt()
                  }'
                  // '100'
                  // '${_medicinecheckoutController.medicinecheckoutModel?.data?.finalPrice?.toInt()}'
                  )
              .toInt() *
          100,
      'name':
          //'Kavi Singh',
          _userrsProfileControllers.userProfile!.patientName.toString(),
      'timeout': 60 * 5,
      'description': 'Do Payment',
      'prefill': {
        'contact':
            _userrsProfileControllers.userProfile!.mobileNumber.toString(),

        //'7877663456',
        //_getProfileController.getprofileModel!.result!.mobileNo.toString(),
        //'7019380053',
        'email': _userrsProfileControllers.userProfile!.emailId.toString(),

        //'kp@gmail.com',
        // _getProfileController.getprofileModel!.result!.emailId.toString(),
        //'kumarprince261299@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  // void handlerPaymentSuccess() {
  //   Get.to(Itemsbuy());
  // }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar("SUCCESS", "ID: ${response.paymentId}");
    print('payment sucess');

    _postmedicineordercontroller.postOrderApi().then((statusCode) {
      if (statusCode == 200) {
        ///This is the main thing to provide updated list history...
        _medicineHistoryController.medicineorderhistoryApi();

        ///nov 14....................................
        // Get.to(LabHistoryUser());
        Get.to(UserHomePage());
        _medicineHistoryController.update();
      } else {
        // SHow
      }
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar(
        "ERROR", "CODE: ${response.code}  MESSAGE:${response.message}");

    print('payment fail');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("EXTERNAL WALLET", "WALLET NAME: ${response.walletName}");
  }
}
