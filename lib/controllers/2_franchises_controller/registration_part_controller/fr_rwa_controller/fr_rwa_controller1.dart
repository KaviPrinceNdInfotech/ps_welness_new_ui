import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class FrRwa_1_controller extends GetxController {
  final GlobalKey<FormState> frrwa1formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
   TextEditingController? nameController,
      emailController,
      passwordController,
      confirmpasswordController,
      mobileController,
       pinController,
       landlineController,
       addressController;
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
  void frenchiesRegisterRWA()async{
    isLoading(true);
    final licenceimageAsBase64 = base64Encode(await File(selectedImagepath.value).readAsBytes());
    http.Response r = await ApiProvider.FrenchiesRegisterRWA(
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
    if(r.statusCode == 200){
      isLoading(false);
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
    }
    );
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
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    confirmpasswordController?.dispose();
    mobileController?.dispose();
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
    } else if (value.length < 8) {
      return "              Password must be atleast 8 characters long";
    } else {
      return null;
    }
  }
  String? validConfirmPassword(String value) {
    if (value.isEmpty) {
      return "              Please Re-Enter New Password";
    } else if (value.length < 8) {
      return "              Password must be atleast 8 characters long";
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

  void checkRwa1() {
    final isValid = frrwa1formkey.currentState!.validate();
    frenchiesRegisterRWA();
    if (!isValid) {
      return;
    }
    frrwa1formkey.currentState!.save();
  }
}
