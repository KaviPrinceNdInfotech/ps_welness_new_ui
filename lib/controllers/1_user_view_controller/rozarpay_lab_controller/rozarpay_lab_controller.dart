import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import '../lab_controller/post_lab_order_controller/post_lab_order_controller.dart';
import '../user_profile_controller/user_profile_controllerss.dart';

class RozarPayLabController extends GetxController {
  //get isLoading => null;

  RxBool isLoading = false.obs;
  LabListController _labListController = Get.put(LabListController());
  UserProfileControllers _userrsProfileControllers =
      Get.put(UserProfileControllers());

  //final CartController controller = Get.put(CartController());
  //GetProfileController _getProfileController = Get.put(GetProfileController());
  //CheckoutController _checkoutController = Get.put(CheckoutController());
  PostOrderController _postOrderController = Get.put(PostOrderController());
  LabHistoryController _labHistoryController = Get.put(LabHistoryController());
  //LabListController _labListController = Get.put(LabListController());

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

  Future<void> openCheckout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var LabFee1 = preferences.getString("LabFee1");
    print("Fee5454543434: ${LabFee1}");
    var options = {
      //'key': 'rzp_live_sTN4TNvGmEs3C1',
      'key': 'rzp_test_s1VIQAlF8CZRCE',
      //'rzp_test_aeRns0u8gPpOUK',
      'amount': double.parse(
              // '100'

              '${LabFee1}'
              //'${_labListController.labCheckoutModel?.fee!.toInt()}'
              ) *
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

    _postOrderController.postOrderApi().then((statusCode) {
      if (statusCode == 200) {
        ///This is the main thing to provide updated list history...
        _labHistoryController.labHistorybyUserId();

        ///...1
        ///todo: this is api call delete list of api.....
        print('princee notification');
        notificationServices.getDeviceToken().then((value) async {
          var data = {
            ///not same controller
            //this the particular device id.....
            'to':
                //"${
                _labListController.labCheckoutModel?.deviceId ??
                    value.toString(),

            /// _doctorappointmentcheckout.doctorCheckoutModel?.id,
            //_doctorHomepageController.founddoctoraptProducts?[index].deviceId
            // }",

            ///this is same device token....
            //  value.toString(),
            'notification': {
              'title': 'Ps_Wellness Patient',
              'body':
                  'Your payment done by "${_userrsProfileControllers.userProfile!.patientName.toString()}" and request generated',
              //"sound": "jetsons_doorbell.mp3"
            },
            'android': {
              'notification': {
                'notification_count': 23,
              },
            },
            // 'data': {
            //   'type': 'cancel_case_doctor',
            //   'id': '12345689'
            // }
          };
          // print("dataccept:${data}");

          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              body: jsonEncode(data),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization':
                    //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                    'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
              }).then((value) {
            if (kDebugMode) {
              print("princedriver${value.body.toString()}");
            }
          }).onError((error, stackTrace) {
            if (kDebugMode) {
              print(error);
            }
          });
          // CallLoader.loader();
          // await Future.delayed(Duration(seconds: 1));
          // await accountService.getAccountData.then((accountData) {
          //   Timer(
          //     const Duration(seconds: 0),
          //         () {
          //       Get.offAll(UserHomePage());
          //       //Get.to((page))
          //       ///
          //     },
          //   );
          // });
        });

        ///..1..

        ///nov 14....................................
        //Get.to(LabHistoryUser());
        ///todo:home page.....
        Get.to(
          () => UserHomePage(), //next page class
          duration: Duration(
              milliseconds: 500), //duration of transitions, default 1 sec
          transition: Transition.zoom,
        );

        _labHistoryController.update();
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
