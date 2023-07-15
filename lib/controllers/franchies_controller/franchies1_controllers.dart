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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class Franchies_1_Controller extends GetxController {
  final GlobalKey<FormState> franchies1formkey = GlobalKey<FormState>();

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

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
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
    http.Response r = await ApiProvider.FrenchiesSignUpApi(
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
        AadharOrPANImage.text,
        VendorName.text);
    if (r.statusCode == 200) {
    } else {}
  }

  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';

  @override
  void onInit() {
    super.onInit();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    CompanyName = TextEditingController(text: 'abcd');
    EmailId = TextEditingController(text: 'aaa@gmail.com');
    Password = TextEditingController(text: '12345');
    MobileNumber = TextEditingController(text: '999889912');
    Location = TextEditingController(text: 'noida');
    StateMaster_Id = TextEditingController(text: '6');
    City_Id = TextEditingController(text: '10');
    PinCode = TextEditingController(text: '20301');
    GSTNumber = TextEditingController(text: 'gtg');
    PanNumber = TextEditingController(text: '67656');
    AadharOrPANNumber = TextEditingController(text: '67675656465456');
    AadharOrPANImage = TextEditingController(text: 'ps.jpg');
    VendorName = TextEditingController(text: 'nnnnnnnn');
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

  void checkFranchies1() {
    final isValid = franchies1formkey.currentState!.validate();
    frenchiesSignUpApi();
    if (!isValid) {
      return;
    }
    franchies1formkey.currentState!.save();
  }
}
