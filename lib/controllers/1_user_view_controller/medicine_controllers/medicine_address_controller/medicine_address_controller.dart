import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//import 'package:ps_welness/model/1_user_model/city_model/city_modelss.dart';
//import 'package:ps_welness/model/1_user_model/states_model/state_modells.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

import '../../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../../model/1_user_model/medicine_list_address_dwlivery_api/medicine_list_address_model.dart';
import '../../../../model/1_user_model/states_model/state_modells.dart';
import '../../../../modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class medicine_addresssList_Controller extends GetxController {
  RxBool isLoading = true.obs;

  final GlobalKey<FormState> addressmedicineformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;

  ///
  List<StateModel> states = <StateModel>[];

  ///

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
    print("Prince cities of $stateID");
    print(cities);
  }

  void usersignupApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.UserSignUpApi(
      nameController.text,
      emailController.text,
      mobileController.text,
      passwordController.text,
      selectedState.value!.id.toString(),
      selectedCity.value!.id.toString(),
      addressController.text,
      pinController.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(UserHomePage());
    }
  }

  late TextEditingController nameController,
      emailController,
      // confirmpasswordController,
      mobileController,
      passwordController,
      StateController,
      CityController,
      addressController,
      pinController;

  var name = '';
  var email = '';
  var password = '';
  var mobile = '';
  var state = '';
  var city = '';
  var address = '';
  var pin = '';

  MedicineAddressModel? medicineaddresslistmodel;

  ///list address medicine 28april 2023................
  void medicineaddressListApi() async {
    isLoading(true);
    medicineaddresslistmodel = await ApiProvider.MedicineaddresslistApi();
    print('Prince address list');
    print(medicineaddresslistmodel);
    if (medicineaddresslistmodel?.addAddressMediciness != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //foundProducts.value = medicinelistmodel!.data;
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    medicineaddressListApi();
    //states.refresh();
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    StateController = TextEditingController();
    CityController = TextEditingController();
    addressController = TextEditingController();
    pinController = TextEditingController();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    StateController.dispose();
    CityController.dispose();
    addressController.dispose();
    pinController.dispose();
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }

  String? validEmail(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (!value.contains('@')) {
      return "              A valid email should contain '@'";
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return "              Please enter a valid email";
    }
    return null;
  }

  String? validPassword(String value) {
    // confirmpassword = value;

    if (value.isEmpty) {
      return "              Please Enter New Password";
    } else if (value.length < 5) {
      return "              Password must be atleast 5 characters long";
    } else {
      return null;
    }
  }

  // String? validConfirmPassword(String value) {
  //   if (value.isEmpty) {
  //     return "              Please Re-Enter New Password";
  //   } else if (value.length < 8) {
  //     return "              Password must be atleast 8 characters long";
  //   } else if (value != confirmpassword) {
  //     return "              Password must be same as above";
  //   } else {
  //     return null;
  //   }
  // }

  String? validPhone(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid phone number should be of 10 digits';
    }
    return null;
  }

  String? validState(String value) {
    if (value.length < 2) {
      return "              Provide valid address";
    }
    return null;
  }

  String? validCity(String value) {
    if (value.length < 2) {
      return "              Provide valid address";
    }
    return null;
  }

  String? validAddress(String value) {
    if (value.length < 2) {
      return "              Provide valid address";
    }
    return null;
  }

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 6) {
      return '              A valid pin should be of 6 digits';
    }
    return null;
  }

  void checkUser1() {
    if (addressmedicineformkey.currentState!.validate()) {
      usersignupApi();
      medicineaddressListApi();
    }
    addressmedicineformkey.currentState!.save();
  }

// void checkUser1() {
//   final isValid = user1formkey.currentState!.validate();
//   if (!isValid) {
//     return;
//   }
//   user1formkey.currentState!.save();
//   //Get.to(() => HomePage());
// }
}
