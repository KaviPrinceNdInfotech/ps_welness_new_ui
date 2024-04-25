// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Franchies_1_Controller extends GetxController {
//   final GlobalKey<FormState> franchies1formkey = GlobalKey<FormState>();
//
//   late TextEditingController nameController,
//       emailController,
//       passwordController,
//       confirmpasswordController,
//       mobileController;
//
//   var name = '';
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
//   }
//
//   String? validName(String value) {
//     if (value.length < 2) {
//       return "              Provide valid name";
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
//   void checkFranchies1() {
//     final isValid = franchies1formkey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     franchies1formkey.currentState!.save();
//     //Get.to(() => HomePage());
//   }
// }
///
import 'dart:convert';
import 'dart:io';

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
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class Franchies_1_Controller extends GetxController {
  final GlobalKey<FormState> franchies1formkey = GlobalKey<FormState>();
  LoginpasswordController _loginpasswordControllerr =
      Get.put(LoginpasswordController());

  late TextEditingController CompanyName,
      EmailId,
      Password,
      MobileNumber,
      Location,
      StateMaster_Id,
      City_Id,
      PinCode,
      GSTNumber,
      PanNumber,
      AadharOrPANNumber,
      AadharOrPANImage,
      VendorName;
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[];

  RxInt selectedimg = 0.obs;
  var selectedPath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void getclearImage() async {
    selectedimg.close();
    selectedPath.close();
  }

  // void getImage(ImageSource imageSource) async {
  //   final pickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagepath.value = pickedFile.path;
  //   } else {
  //     print('No image selected');
  //   }
  // }
  void frenchiesSignUpApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    print("imagebaseeee644113221:${imageAsBase64}");
    http.Response r = await ApiProvider.FrenchiesSignUpApi(
      VendorName.text,
      CompanyName.text,
      EmailId.text,
      Password.text,
      MobileNumber.text,
      Location.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      PinCode.text,
      GSTNumber.text,
      PanNumber.text,
      AadharOrPANNumber.text,
      selectedPath.value.split('/').last,
      imageAsBase64,
    );
    if (r.statusCode == 200) {
      Get.snackbar(
        'Success',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
      //Get.snackbar('message', "${r.body}");
      /// we can navigate to user page.....................................
      // Get.to(SignInScreen());
      _loginpasswordControllerr.onInit();
      //CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 500));
      //CallLoader.hideLoader();
      await SharedPreferences.getInstance()
          .then((value) => Get.offAll(() => SignInScreen()));
    } else {
      Get.snackbar(
        'Error',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
    }
  }

  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var address = '';
  var pin = '';
  var gst = '';
  var pan = '';
  var aadhaar = '';

  @override
  void onInit() {
    super.onInit();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    VendorName = TextEditingController();
    CompanyName = TextEditingController();
    EmailId = TextEditingController();
    Password = TextEditingController();
    MobileNumber = TextEditingController();
    Location = TextEditingController();
    StateMaster_Id = TextEditingController();
    City_Id = TextEditingController();
    PinCode = TextEditingController();
    GSTNumber = TextEditingController();
    PanNumber = TextEditingController();
    AadharOrPANNumber = TextEditingController();
    AadharOrPANImage = TextEditingController();
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

  String? validAddress(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }

    return null;
  }

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 6) {
      return '              A valid pin code should be of 6 digits';
    }
    return null;
  }

  String? validAadhar(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 12) {
      return '              A valid Aadhaar number should be of 12 digits';
    }
    return null;
  }

  String? validPan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid Pan number should be of 10 digits';
    }
    return null;
  }

  String? validGst(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 15) {
      return '              A valid Gst number should be of 15 digits';
    }
    return null;
  }

  void checkFranchies1() {
    final isValid = franchies1formkey.currentState!.validate();
    frenchiesSignUpApi();
    if (!isValid) {
      return;
    }
    franchies1formkey.currentState!.save();
  }
}
