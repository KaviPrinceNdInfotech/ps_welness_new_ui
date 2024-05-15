import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/ambulance/driver_accept_list_controller.dart';

import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class AmbulanceOrderpaymentController extends GetxController {
  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());
  RxBool isLoading = true.obs;
  GlobalKey<FormState> postorderambulanceforms =
      GlobalKey(debugLabel: "postorderambulanceforms");

  var Id = '';

  ///online ambulance.................................
  Future<int> postOrderAmbulanceonlineApi() async {
    //isLoading(true);
    CallLoader.loader();
    //print(ProductName.text);
    http.Response r = await ApiProvider.AmbulancepaynowOnlineApi(
        _driverAcceptlistController.getDriveracceptDetail?.driverId);
    if (r.statusCode == 200) {
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
      //Get.to(()=> LoginPage());
      CallLoader.hideLoader();
      isLoading(false);

      ///todo start notification....
      notificationServices.getDeviceToken().then((value) async {
        var data = {
          //this the particular device id.....
          'to':
              "${_driverAcceptlistController.getDriveracceptDetail?.deviceId.toString()}",

          //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
          //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
          //.toString(),

          ///this is same device token....
          // value
          // .toString(),
          'notification': {
            'title': 'Ps_Wellness',
            'body':
                "Your payment amount ₹${_driverAcceptlistController.getDriveracceptDetail?.payableAmount.toString()} done by ${_driverAcceptlistController.getDriveracceptDetail?.driverName.toString()}",
            //"sound": "jetsons_doorbell.mp3"
          },
          'android': {
            'notification': {
              'notification_count': 23,
            },
          },
          'data': {
            'type': 'reject_case',
            //reject_case
            //accept_case
            'id': '1234567'
          }
        };
        print("datareject:${data}");

        await http
            .post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                body: jsonEncode(data),
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization':
                      //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                      'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                })
            .then((value) {})
            .onError((error, stackTrace) {
              // if (kDebugMode) {
              //   print(error);
              // }
            });
      });

      ///todo end notification....
      // Get.to(() => NavBar());
      //_timeController.email = Email.text;
      //_timeController.phoneNumber = OrderNo.text;
    }
    return r.statusCode;
  }

  ///payment by user....wallet.....

  Future<int> postOrderAmbulancwalletApi() async {
    //isLoading(true);
    CallLoader.loader();
    http.Response r = await ApiProvider.AmbulancepaynowOnlinewalletApi(
        _driverAcceptlistController.getDriveracceptDetail?.driverId);
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      isLoading(false);

      ///todo start notification....
      notificationServices.getDeviceToken().then((value) async {
        var data = {
          //this the particular device id.....
          'to':
              "${_driverAcceptlistController.getDriveracceptDetail?.deviceId.toString()}",

          //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
          //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
          //.toString(),

          ///this is same device token....
          // value
          // .toString(),
          'notification': {
            'title': 'Ps_Wellness',
            'body':
                "Your payment amount ₹${_driverAcceptlistController.getDriveracceptDetail?.payableAmount.toString()} done by ${_driverAcceptlistController.getDriveracceptDetail?.driverName.toString()}",
            //"sound": "jetsons_doorbell.mp3"
          },
          'android': {
            'notification': {
              'notification_count': 23,
            },
          },
          'data': {
            'type': 'reject_case',
            //reject_case
            //accept_case
            'id': '1234567'
          }
        };
        print("datareject:${data}");

        await http
            .post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                body: jsonEncode(data),
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization':
                      //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                      'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                })
            .then((value) {})
            .onError((error, stackTrace) {
              // if (kDebugMode) {
              //   print(error);
              // }
            });
      });

      ///todo end notification....
    }
    return r.statusCode;
  }
  //ambulanceFeewallet

  ///offline doctor.....
  // Future<int> postOrderDoctorofflineApi() async {
  //   //isLoading(true);
  //   CallLoader.loader();
  //   //print(ProductName.text);
  //   http.Response r = await ApiProvider.DoctorpaynowOfflineApi();
  //   if (r.statusCode == 200) {
  //     //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
  //     //Get.to(()=> LoginPage());
  //     CallLoader.hideLoader();
  //     isLoading(false);
  //     // Get.to(() => NavBar());
  //     //_timeController.email = Email.text;
  //     //_timeController.phoneNumber = OrderNo.text;
  //   }
  //   return r.statusCode;
  // }
  ///

  //from here add member and add patient both ccontroller function ..............

  // TextEditingController ProductName = TextEditingController();
  // TextEditingController Total_Item = TextEditingController();
  // TextEditingController Price = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //ProductName.dispose();
    // Total_Item.dispose();
    //Price.dispose();
  }

  void checkPostnurseQuery() {
    if (postorderambulanceforms.currentState!.validate()) {
      postOrderAmbulanceonlineApi();
    }
    postorderambulanceforms.currentState!.save();
  }
}
