import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:ps_welness/model/1_user_model/city_model/city_modelss.dart';
//import 'package:ps_welness/model/1_user_model/states_model/state_modells.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

import '../../model/1_user_model/city_model/city_modelss.dart';
import '../../model/1_user_model/states_model/state_modells.dart';
import '../../modules_view/circular_loader/circular_loaders.dart';
import '../../servicess_api/api_services_all_api.dart';

class User_1_Controller extends GetxController {
  final GlobalKey<FormState> user1formkey = GlobalKey<FormState>();
  LoginpasswordController _loginpasswordControllerr =
      Get.put(LoginpasswordController());

  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  ///date.....
  var selectedDate = DateTime.now().obs;

  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;

  ///.....
  List<StateModel> states = <StateModel>[];

  final selectedgender = "".obs;

  onChangeGender(String servicee) {
    selectedgender.value = servicee;
  }

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
    http.Response r = await ApiProvider.UserSignUpApinew(
      nameController?.text,
      emailController?.text,
      mobileController?.text,
      passwordController?.text,
      confitrmpasswordController?.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      addressController?.text,
      pinController?.text,
      appointmentController.text,
      selectedgender.value,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      Get.snackbar(
        'message', "${r.body}",
        // r.body,
        duration: const Duration(seconds: 1),
      );

      // CallLoader.hideLoader();

      ///....went to sign up list.....
      _loginpasswordControllerr.onInit();
      //CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 500));
      //CallLoader.hideLoader();
      await SharedPreferences.getInstance()
          .then((value) => Get.offAll(() => SignInScreen()));

      //Get.back();
      //await Get.offAll(() => SignInScreen());

      /// we can navigate to user page.....................................
      //Get.to(SignInScreen());
    } else {
      Get.snackbar(
        'message', "${r.body}",
        // r.body,
        duration: const Duration(seconds: 1),
      );
    }
  }

  late TextEditingController nameController,
      emailController,
      // confirmpasswordController,
      mobileController,
      passwordController,
      confitrmpasswordController,
      StateController,
      CityController,
      addressController,
      pinController,
      appointmentController;

  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = ' ';
  var mobile = '';
  var state = '';
  var city = '';
  var address = '';
  var pin = '';
  var date = '';

  @override
  void onInit() {
    //states.refresh();
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    confitrmpasswordController = TextEditingController();
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
    appointmentController = TextEditingController();
    appointmentController.text = "YYY-MM-DD";

    // Get.delete<User_1_Controller>();
    // _loginpasswordControllerr = Get.find(User_1_Controller());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController?.dispose();
    emailController?.dispose();
    mobileController?.dispose();
    passwordController?.dispose();
    StateController?.dispose();
    CityController?.dispose();
    addressController?.dispose();
    pinController?.dispose();
  }

  @override
  void dispose() {
    Get.delete<User_1_Controller>();
    super.dispose();
  }

  chooseDate() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      appointmentController
        ..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: appointmentController.text.length,
            affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
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
    if (user1formkey.currentState!.validate()) {
      usersignupApi();
    }
    user1formkey.currentState!.save();
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
