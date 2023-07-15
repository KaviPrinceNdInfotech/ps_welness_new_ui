import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/franchise_chemist_view/franchise_chemist_signup2/franchies_chemist_signup2.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class Fr_Chemist_1_Controller extends GetxController {
  final GlobalKey<FormState> frchemist1formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> frchemist2formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

   TextEditingController? nameController,
      emailController,
      passwordController,
      shopController,
      confirmpasswordController,
      mobileController,
      pinController,
      addressController,
      franchiesController,
      gstController,
      licencenumberController,
      panController,
      licencevalidityController,
      aadharController,
      regicertiController;

  var name = '';
  var shopname = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var pin = '';
  var address = '';
  var franchiesid = '';
  var gstno = '';
  var licenceno = '';
  var licencevalidity = '';
  var pan = '';
  var aadhar = '';
  var registercertificate = '';
  var selectedImagepath = ''.obs;
  ///this is for State....................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
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
void frenchiesRegisterChemist()async{
    isLoading(true);
    final licenceimageAsBase64 = base64Encode(await File(selectedImagepath.value).readAsBytes());
    http.Response r = await ApiProvider.FrenchiesRegisterChemist(
        nameController?.text,
        shopController?.text,
        emailController?.text,
        passwordController?.text,
        confirmpasswordController?.text,
        mobileController?.text,
        addressController?.text.toString(),
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
      selectedImagepath.value.split('/').last,
      licenceimageAsBase64,
      licencenumberController?.text,
      licencevalidityController?.text,
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
    emailController  = TextEditingController();
    passwordController  = TextEditingController();
    shopController  = TextEditingController();
    confirmpasswordController  = TextEditingController();
    mobileController  = TextEditingController();
    pinController  = TextEditingController();
    addressController  = TextEditingController();
    franchiesController  = TextEditingController();
    gstController  = TextEditingController();
    licencenumberController  = TextEditingController();
    panController  = TextEditingController();
    licencevalidityController  = TextEditingController();
    aadharController  = TextEditingController();
    regicertiController = TextEditingController();
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
    shopController?.dispose();
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }
  String? validShopname(String value) {
    if (value.length < 2) {
      return "              Provide valid Shop name";
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
  String? validCertificate(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  String? validFranchiesid(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  String? validGstno(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  String? validLicenceno(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  String? validLicencevalidity(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  String? validaadhar(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  String? validpan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  String? validregistercerti(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }
  void checkChemist1() {
    final isValid = frchemist1formkey.currentState!.validate();
    if (isValid) {
      Get.to(FranchiseChemistSignup2());
      return;
    }else{}
    frchemist1formkey.currentState!.save();
  }
  void checkChemist2() {
    final isValid = frchemist2formkey.currentState!.validate();
    if (isValid && selectedImagepath.value != '') {
      frenchiesRegisterChemist();
      return;
    }else{
      Get.snackbar("Failed", "Please select image");
    }
    frchemist1formkey.currentState!.save();
  }
}
