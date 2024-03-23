import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class AmbulanceOrderpaymentController extends GetxController {
  RxBool isLoading = true.obs;
  GlobalKey<FormState> postorderambulanceforms =
      GlobalKey(debugLabel: "postorderambulanceforms");

  var Id = '';

  ///online ambulance......
  Future<int> postOrderAmbulanceonlineApi() async {
    //isLoading(true);
    CallLoader.loader();
    //print(ProductName.text);
    http.Response r = await ApiProvider.AmbulancepaynowOnlineApi();
    if (r.statusCode == 200) {
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
      //Get.to(()=> LoginPage());
      CallLoader.hideLoader();
      isLoading(false);
      // Get.to(() => NavBar());
      //_timeController.email = Email.text;
      //_timeController.phoneNumber = OrderNo.text;
    }
    return r.statusCode;
  }

  Future<int> postOrderAmbulancwalletApi() async {
    //isLoading(true);
    CallLoader.loader();
    http.Response r = await ApiProvider.AmbulancepaynowOnlinewalletApi();
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      isLoading(false);
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
