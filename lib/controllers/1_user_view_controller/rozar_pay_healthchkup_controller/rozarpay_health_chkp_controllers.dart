import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../modules_view/1_user_section_views/user_drawer/drawer_pages_user/lab_appointment_history/lab_history.dart';
import '../drawer_contoller/doctor_history_section/doctor_history_controller.dart';
import '../drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import '../health_checkup_controllersss/health_checkup_listsss.dart';
import '../health_checkup_post_order_controller/health_chkp_post_order_controllers.dart';
import '../user_profile_controller/user_profile_controllerss.dart';

class RozarPayHealthchkpController extends GetxController {
  //get isLoading => null;

  RxBool isLoading = false.obs;

  HealthCheckupController _healthCheckupController =
      Get.put(HealthCheckupController());

  DoctorHistoryController _doctorHistoryController =
      Get.put(DoctorHistoryController());
  // LabListController _labListController = Get.put(LabListController());
  UserProfileControllers _userrsProfileControllers =
      Get.put(UserProfileControllers());

  PostOrderHealthchkpController _postOrderHealthchkpController =
      Get.put(PostOrderHealthchkpController());

  // PostOrderDoctorController _postOrderDoctorController =
  //     Get.put(PostOrderDoctorController());
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
    var options = {
      //'key': 'rzp_live_sTN4TNvGmEs3C1',
      'key': 'rzp_test_aeRns0u8gPpOUK',
      'amount': int.parse(
              // '100'

              '${_healthCheckupController.healthCheckupcheckout?.testAmount?.toInt()}') *
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

    _postOrderHealthchkpController
        .postOrderhealthchkponlineApi()
        .then((statusCode) {
      if (statusCode == 200) {
        ///This is the main thing to provide updated list history...
        _healthCheckupController.healthcheckoutApi();

        ///nov 14....................................
        Get.to(LabHistoryUser());
        _healthCheckupController.update();
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
