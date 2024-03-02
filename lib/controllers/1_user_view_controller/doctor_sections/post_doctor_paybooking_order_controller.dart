import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class PostOrderDoctorController extends GetxController {
  RxBool isLoading = true.obs;
  GlobalKey<FormState> postorderdoctorforms =
      GlobalKey(debugLabel: "postqueryforms");

  var Id = '';

  ///online doctor......
  Future<int> postOrderdoctoronlineApi() async {
    //isLoading(true);
    // CallLoader.loader();
    //print(ProductName.text);
    http.Response r = await ApiProvider.DoctorpaynowOnlineApi();
    if (r.statusCode == 200) {
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
      //Get.to(()=> LoginPage());
      //CallLoader.hideLoader();
      isLoading(false);
      // Get.to(() => NavBar());
      //_timeController.email = Email.text;
      //_timeController.phoneNumber = OrderNo.text;
    }
    return r.statusCode;
  }

  ///offline doctor.....
  Future<int> postOrderDoctorofflineApi() async {
    //isLoading(true);
    // CallLoader.loader();
    //print(ProductName.text);
    http.Response r = await ApiProvider.DoctorpaynowOfflineApi();
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

  //from here add member and add patient both ccontroller function ..............

  // TextEditingController ProductName = TextEditingController();
  // TextEditingController Total_Item = TextEditingController();
  // TextEditingController Price = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    //postOrderdoctoronlineApi();
    //ProductName;
    //Total_Item;
    //Price;
    //postOrderdoctoronlineApi();
    //postOrderDoctorofflineApi();

    //postqueryApi();
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

  // String? validatename(value) {
  //   if (value.length < 2) {
  //     return "Provide valid name";
  //   }
  //
  //   return null;
  // }
  //
  // String? validateEmail(String value) {
  //   if (!GetUtils.isEmail(value)) {
  //     return "Provide valid Email";
  //   }
  //   return null;
  // }
  //
  // String? validateOrderNo(String value) {
  //   if (value.length < 2) {
  //     return "Phone must be of 10 characters";
  //   }
  //   return null;
  // }
  //
  // String? validateMessage(String value) {
  //   if (value.length < 2) {
  //     return "password should be 5 character";
  //   }
  //   return null;
  // }

  void checkPostnurseQuery() {
    if (postorderdoctorforms.currentState!.validate()) {
      postOrderdoctoronlineApi();
      postOrderDoctorofflineApi();
    }
    postorderdoctorforms.currentState!.save();
  }
}
