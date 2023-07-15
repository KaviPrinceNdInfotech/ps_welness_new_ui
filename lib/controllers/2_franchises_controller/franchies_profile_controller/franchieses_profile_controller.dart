import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class FranchisesEditProfileController extends GetxController {
  final GlobalKey<FormState> franchisesprofileformkey = GlobalKey<FormState>();

  var selectedImagepath = ''.obs;
  late TextEditingController CompanyName,StateMaster_Id,Location,City_Id,GSTNumber,
      MobileNumber,AadharOrPANNumber,AadharOrPANImage;

  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[];

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
  }
  void getCityByStateID(String stateID) async {
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
  void frenchiesEditProfileApi() async {
    final Aadhar1imageAsBase64 = base64Encode(await File(selectedImagepath.value).readAsBytes());
    http.Response r = await ApiProvider.FrenchiesEditProfileApi(
        CompanyName.text,
        selectedState.value?.id.toString(),
        Location.text,
        selectedCity.value?.id.toString(),
        GSTNumber.text,
        MobileNumber.text,
        AadharOrPANNumber.text,
      selectedImagepath.value.split('/').last,
        Aadhar1imageAsBase64
    );
    if (r.statusCode == 200) {
    }else{
    }
  }

  var name = '';
  //var email = '';
  var mobile = '';
  var location = '';
  var fees = '';
  var pin = '';
  var gst = '';
  var panaadhar = '';

  @override
  void onInit() {
    super.onInit();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    CompanyName = TextEditingController();
    StateMaster_Id = TextEditingController();
    Location = TextEditingController();
    City_Id = TextEditingController();
    GSTNumber = TextEditingController();
    MobileNumber = TextEditingController();
    AadharOrPANNumber = TextEditingController();
    AadharOrPANImage = TextEditingController();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
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

  String? validPhone(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validLocation(String value) {
    if (value.length < 2) {
      return "              Provide valid location";
    }
    return null;
  }

  String? validFees(String value) {
    if (value.length < 2) {
      return "              Provide valid address";
    }
    return null;
  }

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validAccount(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 9) {
      return '              Provide valid account no.';
    }
    return null;
  }

  String? validIfsc(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 4) {
      return '              Provide valid IFSC code.';
    }
    return null;
  }

  String? validBranch(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Branch name.';
    }
    return null;
  }

  String? validgst(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Gst number';
    }
    return null;
  }

  String? validpanaadhar(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Aadhaar/pan number';
    }
    return null;
  }

  void checkProfilee() {
    final isValid = franchisesprofileformkey.currentState!.validate();
    if (isValid && selectedImagepath.value!='') {
      frenchiesEditProfileApi();
      return;
    }else{
      Get.snackbar("Failed", "Please fill all data");
    }
    franchisesprofileformkey.currentState!.save();

  }
}
