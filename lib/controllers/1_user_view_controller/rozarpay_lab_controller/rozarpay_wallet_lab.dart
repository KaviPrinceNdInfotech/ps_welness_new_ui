import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../modules_view/1_user_section_views/user_drawer/drawer_pages_user/walet_user/wallet_user.dart';
import '../drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import '../lab_controller/lab_list_controller.dart';
import '../lab_controller/post_lab_order_controller/post_lab_order_controller.dart';
import '../user_profile_controller/user_profile_controllerss.dart';
import '../wallet_user_controller/wallet_controllers_user.dart';



class RozarwalletController extends GetxController {
  //get isLoading => null;

  RxBool isLoading = false.obs;
  final GlobalKey<FormState> walletamountFormKey = GlobalKey();
  //final CartController controller = Get.put(CartController());
  Wallet_2_Controller _wallet_2_controller = Get.put(Wallet_2_Controller());
  PostOrderController _postOrderController = Get.put(PostOrderController());
  LabHistoryController _labHistoryController = Get.put(LabHistoryController());
  LabListController _labListController = Get.put(LabListController());
  UserProfileControllers _userrsProfileControllers = Get.put(UserProfileControllers());

  //WalletController _walletController = Get.put(WalletController());
 /// WalletPostController _walletPostController = Get.put(WalletPostController());
  ///GetProfileController _getProfileController = Get.put(GetProfileController());
  ///CheckoutController _checkoutController = Get.put(CheckoutController());
  ///PostOrderController _postOrderController = Get.put(PostOrderController());



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

//int.parse(amount != null ? amount : '0');
  void openCheckout() async {
    var options = {
      //'key': 'rzp_live_sTN4TNvGmEs3C1',
      'key': 'rzp_test_aeRns0u8gPpOUK',
      'amount':
      //100*100,

      int.parse(_wallet_2_controller.walletAmount.text,
        // _walletPostController.Money.toString()
        // '${_walletPostController.walletamountFormKey.currentState}'
      )
          *
          100,

      // 'amount': int.parse(
      //     '${_walletPostController.walletPostApi.toString()}') *
      //     100,
      'name':
      _userrsProfileControllers.userProfile!.patientName.toString(),
      //'Kumar Prince',
      'timeout': 60 * 5,
      'description': 'Do Payment',
      'prefill': {
        'contact': _userrsProfileControllers.userProfile!.mobileNumber.toString(),
        // '7019380053',
        'email':  _userrsProfileControllers.userProfile!.emailId.toString(),
        // 'kumarprince261299@gmail.com'
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


    _wallet_2_controller.walletPostApi().then((statusCode) {
      // _postOrderController.postOrderApi().then((statusCode) {
      if (statusCode == 200) {
        ///This is the main thing to provide updated list history...
        // _getProfileController.OrderHistoryApi();
        _wallet_2_controller.walletListssApi();
        //  Get.to(OrderConfirmationPage());
        _userrsProfileControllers.update();
        // _walletController.getwalletlist!.result[index].walletAmount!.toDouble()
        // _walletController.getwalletlist!.result.first.walletAmount!.toDouble();

        _wallet_2_controller.walletAmount.text;


        //_walletPostController.walletPostApi();
        //_walletPostController.update();

        //_walletPostController.checkAmount();
        Get.to(WolletUser());
        // Get.to(OrderConfirmationPage());
        Get.back();
      } else {
        // SHow
      }
    }
    );
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
