import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FranchisesBankProfileController extends GetxController {
  final GlobalKey<FormState> franchisesbankprofileformkey =
      GlobalKey<FormState>();

  var selectedImagepath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  late TextEditingController nameController,
      accountController,
      //emailController,
      // mobileController,
      locatoionController,
      accountholdernameController,
      ifscController;
  //feesController,
  //pinController,
  //gstcontroller,
  //aadharpancontroller;
  //accountnoController,
  // ifscController,
  //branchController;

  //var email = '';
  var account = '';
  var name = '';
  var location = '';
  var accountholdername = '';
  var ifsc = '';
  //var fees = '';
  //var pin = '';
  //var gst = '';
  //var panaadhar = '';
  //var account = '';
  //var ifsc = '';
  //var branch = '';

  @override
  void onInit() {
    states.refresh();
    super.onInit();
    accountController = TextEditingController(text: "2345667754");
    nameController = TextEditingController(text: 'SBI');
    //emailController = TextEditingController();
    //mobileController = TextEditingController(text: 'Ram Kumar');
    locatoionController = TextEditingController(text: 'Noida Sector 63');
    accountholdernameController = TextEditingController(text: 'Ram Kumar');
    ifscController = TextEditingController(text: 'SBIN000RDS');
    //gstcontroller = TextEditingController(text: '7847867890');
    //aadharpancontroller = TextEditingController(text: '87778987776');
    // branchController = TextEditingController(text: 'SBI');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    //emailController.dispose();
    accountController.dispose();
    locatoionController.dispose();
    accountholdernameController.dispose();
    ifscController.dispose();
    //gstcontroller.dispose();
    //aadharpancontroller.dispose();

    //accountnoController.dispose();
    //ifscController.dispose();
    // branchController.dispose();
  }

  String? validaccountNumber(String value) {
    if (value.length < 8) {
      return "              Provide valid account no";
    }
    return null;
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }

  // String? validEmail(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   if (!value.contains('@')) {
  //     return "              A valid email should contain '@'";
  //   }
  //   if (!RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  //   ).hasMatch(value)) {
  //     return "              Please enter a valid email";
  //   }
  //   return null;
  // }

  // String? validPhone(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   // if (value.length != 10) {
  //   //   return '              A valid phone should be of 10 digits';
  //   // }
  //   return null;
  // }

  String? validLocation(String value) {
    if (value.length < 2) {
      return "              Provide valid location";
    }
    return null;
  }

  String? validHolderName(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Account Holder name.';
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

  // String? validgst(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   if (value.length < 2) {
  //     return '              Provide valid Gst number';
  //   }
  //   return null;
  // }
  //
  // String? validpanaadhar(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   if (value.length < 2) {
  //     return '              Provide valid Aadhaar/pan number';
  //   }
  //   return null;
  // }

  void checkBankProfilee() {
    final isValid = franchisesbankprofileformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    franchisesbankprofileformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
