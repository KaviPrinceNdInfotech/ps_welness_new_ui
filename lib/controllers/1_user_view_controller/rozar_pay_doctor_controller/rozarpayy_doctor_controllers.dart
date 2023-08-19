import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/drawer_contoller/doctor_history_section/doctor_history_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import '../doctor_sections/doctor_checkout_controller.dart';
import '../doctor_sections/post_doctor_paybooking_order_controller.dart';
import '../drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import '../user_profile_controller/user_profile_controllerss.dart';

class RozarPayDoctorController extends GetxController {
  //get isLoading => null;

  RxBool isLoading = false.obs;

  ///
  final DoctorCheckoutController _doctorappointmentcheckout =
      Get.put(DoctorCheckoutController());

  UserProfileControllers _userrsProfileControllers =
      Get.put(UserProfileControllers());

  PostOrderDoctorController _postOrderDoctorController =
      Get.put(PostOrderDoctorController());
  LabHistoryController _labHistoryController = Get.put(LabHistoryController());
  DoctorHistoryController _doctorHistoryController =
      Get.put(DoctorHistoryController());

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
    var DoctorFee = preferences.getString("DoctorFee");
    print("Fee545454eeedrr: ${DoctorFee}");
    var options = {
      //'key': 'rzp_live_sTN4TNvGmEs3C1',
      'key': 'rzp_test_aeRns0u8gPpOUK',
      'amount': double.parse(
              // '100'

              '${DoctorFee
              //_doctorappointmentcheckout.doctorCheckoutModel?.fee?.toInt()
              }'
              '') *
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

    _postOrderDoctorController.postOrderdoctoronlineApi().then((statusCode) {
      if (statusCode == 200) {
        ///This is the main thing to provide updated list history...
        _doctorappointmentcheckout.doctoorcheckoutApi();

        ///nov 14....................................
        //Get.to(DoctorHistoryUser());
        Get.to(
          () => UserHomePage(), //next page class
          duration: Duration(
              milliseconds: 500), //duration of transitions, default 1 sec
          transition: Transition.zoom,
        );
        _doctorappointmentcheckout.update();
        _doctorHistoryController.update();
        _doctorHistoryController.doctorListHospitalApi();
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
