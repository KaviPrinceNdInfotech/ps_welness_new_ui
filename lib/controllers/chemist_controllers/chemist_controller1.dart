// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Chemist_1_Controller extends GetxController {
//   final GlobalKey<FormState> chemist1formkey = GlobalKey<FormState>();
//
//   late TextEditingController nameController,
//       emailController,
//       passwordController,
//       shopController,
//       confirmpasswordController,
//       mobileController;
//
//   var name = '';
//   var shopname = '';
//   var email = '';
//   var password = '';
//   var confirmpassword = '';
//   var mobile = '';
//
//   @override
//   void onInit() {
//     super.onInit();
//     nameController = TextEditingController();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     confirmpasswordController = TextEditingController();
//     mobileController = TextEditingController();
//     shopController = TextEditingController();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmpasswordController.dispose();
//     mobileController.dispose();
//     shopController.dispose();
//   }
//
//   String? validName(String value) {
//     if (value.length < 2) {
//       return "              Provide valid name";
//     }
//     return null;
//   }
//
//   String? validShopname(String value) {
//     if (value.length < 2) {
//       return "              Provide valid Shop name";
//     }
//     return null;
//   }
//
//   String? validEmail(String value) {
//     if (value.isEmpty) {
//       return '              This field is required';
//     }
//     if (!value.contains('@')) {
//       return "              A valid email should contain '@'";
//     }
//     if (!RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
//     ).hasMatch(value)) {
//       return "              Please enter a valid email";
//     }
//     return null;
//   }
//
//   String? validPassword(String value) {
//     confirmpassword = value;
//
//     if (value.isEmpty) {
//       return "              Please Enter New Password";
//     } else if (value.length < 8) {
//       return "              Password must be atleast 8 characters long";
//     } else {
//       return null;
//     }
//   }
//
//   String? validConfirmPassword(String value) {
//     if (value.isEmpty) {
//       return "              Please Re-Enter New Password";
//     } else if (value.length < 8) {
//       return "              Password must be atleast 8 characters long";
//     } else if (value != confirmpassword) {
//       return "              Password must be same as above";
//     } else {
//       return null;
//     }
//   }
//
//   String? validPhone(String value) {
//     if (value.isEmpty) {
//       return '              This field is required';
//     }
//     if (value.length != 10) {
//       return '              A valid phone number should be of 10 digits';
//     }
//     return null;
//   }
//
//   void checkDoctor1() {
//     final isValid = chemist1formkey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     chemist1formkey.currentState!.save();
//     //Get.to(() => HomePage());
//   }
// }
///
///
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

import '../../modules_view/circular_loader/circular_loaders.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart'

class Chemist_1_Controller extends GetxController {
  final GlobalKey<FormState> chemist1formkey = GlobalKey<FormState>();
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

  TextEditingController? ChemistName,
      ShopName,
      EmailId,
      Password,
      ConfirmPassword,
      MobileNumber,
      Location,
      StateMaster_Id,
      CityMaster_Id,
      GSTNumber,
      AdminLogin_Id,
      Certificateimg,
      LicenceNumber,
      LicenseValidity,
      PinCode;

  /////////do here......................
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

  void chemistSignupApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    print("imagebaseeee644:${imageAsBase64}");
    http.Response r = await ApiProvider.ChemistSignupApi(
        ChemistName?.text,
        ShopName?.text,
        EmailId?.text,
        Password?.text,
        ConfirmPassword?.text,
        MobileNumber?.text,
        Location?.text,
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
        selectedPath.value.split('/').last,
        imageAsBase64,
        LicenceNumber?.text,
        LicenseValidity?.text,
        PinCode?.text);
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
    }
  }

  // "ChemistName": ChemistName,
  // "ShopName": ShopName,
  // "EmailId": EmailId,
  // "Password": Password,
  // "ConfirmPassword": ConfirmPassword,
  // "MobileNumber": MobileNumber,
  // "Location": Location,
  // "StateMaster_Id": StateMaster_Id,
  // "CityMaster_Id": CityMaster_Id,
  // "Certificateimg": '$Certificateimg',
  // "Certificateimgbase64": '$Certificateimgbase64',
  // "LicenceNumber": LicenceNumber,
  // "LicenseValidity": LicenseValidity,
  // "PinCode": PinCode,
  ///
  ///
  ///
  // var name = '';
  // var shopname = '';
  // var email = '';
  // var password = '';
  // var confirmpassword = '';
  // var mobile = '';

  @override
  void onInit() {
    super.onInit();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    ChemistName = TextEditingController(text: 'madhu');
    ShopName = TextEditingController(text: 'abc');
    EmailId = TextEditingController(text: 'm1@gmail.com');
    Password = TextEditingController(text: '12345');
    ConfirmPassword = TextEditingController(text: '12345');
    MobileNumber = TextEditingController(text: '845923459023');
    Location = TextEditingController(text: 'noida');
    GSTNumber = TextEditingController(text: '4356789657');
    AdminLogin_Id = TextEditingController(text: '1024');
    Certificateimg = TextEditingController(text: 'stampn.png');
    LicenceNumber = TextEditingController(text: '12345678');
    LicenseValidity = TextEditingController(text: '17/05/2023');
    PinCode = TextEditingController(text: '20301');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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
    //  confirmpassword = value;

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
    }
    // else if (value != confirmpassword) {
    //   return "              Password must be same as above";
    // }
    else {
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

  void checkChemistSignup() {
    final isValid = chemist1formkey.currentState!.validate();
    chemistSignupApi();
    if (!isValid) {
      return;
    }
    chemist1formkey.currentState!.save();
  }
}
