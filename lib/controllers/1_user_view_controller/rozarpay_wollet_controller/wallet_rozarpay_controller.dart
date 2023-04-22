import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

//import '../post_order_controller/post_order_controller.dart';

class RozarwalletController extends GetxController {
  //get isLoading => null;

  RxBool isLoading = false.obs;
  final GlobalKey<FormState> walletamountFormKey = GlobalKey();
  //final CartController controller = Get.put(CartController());
  Wallet_2_Controller _walletController = Get.put(Wallet_2_Controller());
  //Wallet_2_Controller _walletPostController = Get.put(WalletPostController());
  //GetProfileController _getProfileController = Get.put(GetProfileController());




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
     // 'key': 'rzp_live_sTN4TNvGmEs3C1',
      'key': 'rzp_test_aeRns0u8gPpOUK',
      'amount':
      //100*100,

      int.parse(_walletController.Money.text,
        // _walletPostController.Money.toString()
        // '${_walletPostController.walletamountFormKey.currentState}'
      )
          *
          100,

      // 'amount': int.parse(
      //     '${_walletPostController.walletPostApi.toString()}') *
      //     100,
      'name':
     // _walletController.getprofileModel?.result?.name.toString(),
      'Kumar Prince',
      'timeout': 60 * 5,
      'description': 'Do Payment',
      'prefill': {
        'contact':
        //_getProfileController.getprofileModel?.result?.mobileNo.toString(),
         '7019380053',
        'email':
        //_getProfileController.getprofileModel?.result?.emailId.toString(),
         'kumarprince269@gmail.com'
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


    _walletController.walletPostApi().then((statusCode) {
      // _postOrderController.postOrderApi().then((statusCode) {
      if (statusCode == 200) {
        ///This is the main thing to provide updated list history...
        // _getProfileController.OrderHistoryApi();
        _walletController.walletListssApi();
        //  Get.to(OrderConfirmationPage());
       // _getProfileController.update();
        // _walletController.getwalletlist!.result[index].walletAmount!.toDouble()
        // _walletController.getwalletlist!.result.first.walletAmount!.toDouble();

        _walletController.Money.text;


        //_walletPostController.walletPostApi();
        //_walletPostController.update();

        //_walletPostController.checkAmount();
        //Get.to(Wallet());
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
