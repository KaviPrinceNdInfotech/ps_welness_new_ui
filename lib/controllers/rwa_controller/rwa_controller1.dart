import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules_view/circular_loader/circular_loaders.dart';

class Rwa_11_controller extends GetxController {
  final GlobalKey<FormState> rwa1formkey = GlobalKey<FormState>();
  LoginpasswordController _loginpasswordControllerr =
      Get.put(LoginpasswordController());

  RxInt selectedimg = 0.obs;
  var selectedPath = ''.obs;
  //var selectedPath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFiles = await ImagePicker().pickImage(source: imageSource);
    if (pickedFiles != null) {
      selectedPath.value = pickedFiles.path;
      print("File Path ${pickedFiles.path}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  ///this is for state.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;

  ///this is for city....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  var selectedDrowpdown = 'abc';
  List dropdownText = ['abc', 'def', 'ghi'];

  var selectedServicee = ''.obs;
  var selectedplan = ''.obs;

  ///get state api.........

  void getStateRwaApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
  }

  ///get cities api...........
  void getCityByStateIDRwa(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
    print("Prince cities of $stateID");
    print(cities);
  }

  //radio.........

  onChangeServicee(String servicee) {
    selectedServicee.value = servicee;
  }

  var selectedService = ''.obs;

  onChangePlan(String plan) {
    selectedService.value = plan;
  }

  late TextEditingController nameController,
      phoneController,
      stateController,
      cityController,
      locationController,
      emailController,
      passwordController,
      confirmpasswordController,
      pinController,
      landlineController,
      certificateNoController;

  var name = '';
  var phone = '';
  var state = '';
  var city = '';
  var location = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var pin = '';
  var address = '';
  var certificate = '';

  var landlineno = '';

  ///signup rwa..........
  void signupRwaApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    print("imagebaseeee644:${imageAsBase64}");
    http.Response r = await ApiProvider.RwaSignupApi(
      nameController.text,
      phoneController.text,
      emailController.text,
      passwordController.text,
      confirmpasswordController.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      locationController.text,
      landlineController.text,
      pinController.text,
      certificateNoController.text,
      selectedPath.value.split('/').last,
      imageAsBase64,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      Get.snackbar(
        'message', "${r.body}",
        // r.body,
        duration: const Duration(seconds: 1),
      );
      //CallLoader.hideLoader();
      _loginpasswordControllerr.onInit();
      //CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 500));
      //CallLoader.hideLoader();
      await SharedPreferences.getInstance()
          .then((value) => Get.offAll(() => SignInScreen()));

      /// we can navigate to user page.....................................
      //Get.to(SignInScreen());
      // accountService.getAccountData.then((accountData) {
      //   Timer(
      //     const Duration(milliseconds: 200),
      //     () {
      //       //  _viewdoctorreviewController.doctorreviewratingApi();
      //       //_viewdoctorreviewController.update();
      //       Get.snackbar('Register Successfully', "${r.body}");
      //
      //       ///Get.to(() => DetailsSchedulePage());
      //       // _doctorListController.doctordetailApi();
      //       // _doctorListController.update();
      //       // _viewdoctorreviewController.doctorreviewratingApi();
      //       // _viewdoctorreviewController.update();
      //
      //       //Get.to((page))
      //       ///
      //     },
      //   );
      // });
      //CallLoader.hideLoader();
    } else {
      Get.snackbar(
        'message', "${r.body}",
        // r.body,
        duration: const Duration(seconds: 1),
      );
      //CallLoader.hideLoader();
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    locationController = TextEditingController();
    pinController = TextEditingController();
    certificateNoController = TextEditingController();
    landlineController = TextEditingController();

    getStateRwaApi();
    //getdepartmentApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDRwa("${p0.id}");
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
    passwordController.dispose();
    confirmpasswordController.dispose();
    phoneController.dispose();
    stateController.dispose();
    cityController.dispose();
    locationController.dispose();
    pinController.dispose();
    certificateNoController.dispose();
    landlineController.dispose();
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
    confirmpassword = value;

    if (value.isEmpty) {
      return "              Please Enter New Password";
    } else if (value.length < 5) {
      return "              Password must be atleast 5 characters long";
    } else {
      return null;
    }
  }

  String? validConfirmPassword(String value) {
    if (value.isEmpty) {
      return "              Please Re-Enter New Password";
    } else if (value.length < 5) {
      return "              Password must be atleast 5 characters long";
    } else if (value != confirmpassword) {
      return "              Password must be same as above";
    } else {
      return null;
    }
  }

  String? validPhone(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid phone number should be of 10 digits';
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

  String? validAddress(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validlandline(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validcertificate(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  // void checkRwa1() {
  //   final isValid = rwa1formkey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   rwa1formkey.currentState!.save();
  // }

  void checkRwa11() {
    if (rwa1formkey.currentState!.validate()) {
      signupRwaApi();
    }
    rwa1formkey.currentState!.save();
  }
}
