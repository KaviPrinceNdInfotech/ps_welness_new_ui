import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_rwa_view/rwa_signup2/rwa_signup2.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrRwa_1_controller extends GetxController {
  final GlobalKey<FormState> frrwa1formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> frrwa2formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  TextEditingController? panController,
      nameController,
      emailController,
      passwordController,
      confirmpasswordController,
      mobileController,
      pinController,
      landlineController,
      addressController;

  var pan = '';
  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var pin = '';
  var address = '';
  var landlineno = '';
  var selectedServicee = ''.obs;
  var selectedplan = ''.obs;
  var selectedService = ''.obs;
  var selectedImagepath = ''.obs;

  ///this is for State....................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  var selectedDrowpdown = 'abc';
  List dropdownText = ['abc', 'def', 'ghi'];
  //radio.........
  onChangeServicee(String servicee) {
    selectedServicee.value = servicee;
  }

  onChangePlan(String plan) {
    selectedService.value = plan;
  }

  void getStateLabApi() async {
    states = await ApiProvider.getSatesApi();
  }

  ///get cities api...........
  void getCityByStateIDLab(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  void frenchiesRegisterRWA() async {
    isLoading(true);
    final licenceimageAsBase64 =
        base64Encode(await File(selectedImagepath.value).readAsBytes());
    http.Response r = await ApiProvider.FrenchiesRegisterRWA(
        panController?.text,
        nameController?.text,
        mobileController?.text,
        emailController?.text,
        passwordController?.text,
        confirmpasswordController?.text,
        selectedImagepath.value.split('/').last,
        licenceimageAsBase64,
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
        addressController?.text,
        landlineController?.text,
        pinController?.text);
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}", duration: Duration(seconds: 2));

      CallLoader.loader();
      await Future.delayed(Duration(seconds: 1));
      CallLoader.hideLoader();
      Get.offAll(FranchiesHomePage());
      isLoading(false);
    } else {
      Get.snackbar("Failed", "${r.body}", duration: Duration(seconds: 3));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getStateLabApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    });
    panController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    mobileController = TextEditingController();
    pinController = TextEditingController();
    addressController = TextEditingController();
    landlineController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // nameController?.dispose();
    // emailController?.dispose();
    // passwordController?.dispose();
    // confirmpasswordController?.dispose();
    // mobileController?.dispose();
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

  String? validPan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid pan number should be of 10 digits';
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
    if (value.length != 10) {
      return '              A valid  number should be of 10 digits';
    }
    return null;
  }

  Future<void> checkRwa1() async {
    final isValid = frrwa1formkey.currentState!.validate();
    if (isValid) {
      refresh();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 1000));
      CallLoader.hideLoader();
      await Get.to(FrRwaSignup2());
      await Get.snackbar("Success", "Successful registered",
          duration: Duration(seconds: 2));

      return;
    }
    frrwa1formkey.currentState!.save();
  }

  Future<void> checkRwa2() async {
    final isValid = frrwa2formkey.currentState!.validate();
    if (isValid && selectedImagepath.value != '') {
      frenchiesRegisterRWA();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      Get.offAll(FranchiesHomePage());
      isLoading(false);

      return;
    } else {
      Get.snackbar("title", "Please fill data and image");
    }
    frrwa1formkey.currentState!.save();
  }
}
