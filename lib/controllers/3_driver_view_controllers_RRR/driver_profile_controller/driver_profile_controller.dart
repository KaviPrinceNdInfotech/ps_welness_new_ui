import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';

import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverProfileController extends GetxController {
  final GlobalKey<FormState> driverrprofileformkey = GlobalKey<FormState>();

  var selectedPath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFiles = await ImagePicker().pickImage(source: imageSource);
    if (pickedFiles != null) {
      selectedPath.value = pickedFiles.path;
      print("File Path ${selectedPath.value}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  var selectedImagepath = ''.obs;
  TextEditingController? IdEditText,
      DriverNameEditText,
      PhoneEditText,
      VehicleNameEditText,
      StateMaster_IdEditText,
      CityMaster_IdEditText,
      LocationEditText,
      DlNumberEditText,
      DlImageEditText,
      DlImageNameEditText,
      DlBase64ImageEditText,
      adminLogin_idEditTxt,
      AccountNoEditTxt,
      IFSCCodeEditTxt,
      BranchName;

  // void getImage(ImageSource imageSource) async {
  //   final pickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagepath.value = pickedFile.path;
  //   } else {
  //     print('No image selected');
  //   }
  // }

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

  void driverUpdateProfileApi() async {
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    print("imagebaseeee64467:${imageAsBase64}");
    http.Response r = await ApiProvider.DriverUpdateProfile(
      DriverNameEditText?.text,
      PhoneEditText?.text,
      VehicleNameEditText?.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      LocationEditText?.text,
      DlNumberEditText?.text,
      selectedPath.value.split('/').last,
      imageAsBase64,
    );
    if (r.statusCode == 200) {
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    // IdEditText = TextEditingController(text: '88');
    DriverNameEditText = TextEditingController(text: '');
    PhoneEditText = TextEditingController(text: '');
    VehicleNameEditText = TextEditingController(text: '');
    LocationEditText = TextEditingController(text: '');
    DlNumberEditText = TextEditingController(text: '');
    DlImageEditText = TextEditingController(text: '');
    DlImageNameEditText = TextEditingController(text: '');
    adminLogin_idEditTxt = TextEditingController(text: '');
    AccountNoEditTxt = TextEditingController(text: '');
    IFSCCodeEditTxt = TextEditingController(text: '');
    BranchName = TextEditingController(text: '');
  }

  @override
  void onReady() {
    super.onReady();
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
    if (value.length < 2) {
      return '              provide valid name';
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
    // if (value.length != 6) {
    //   return '              A valid pin should be of 6 digits';
    // }
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

  void checkDriverUpdateProfile() {
    final isValid = driverrprofileformkey.currentState!.validate();
    driverUpdateProfileApi();
    if (!isValid) {
      return;
    }
    driverrprofileformkey.currentState!.save();
  }
}
