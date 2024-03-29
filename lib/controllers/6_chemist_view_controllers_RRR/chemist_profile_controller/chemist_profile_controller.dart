import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChemistProfileController extends GetxController {
  final GlobalKey<FormState> chemistprofileformkey = GlobalKey<FormState>();

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
      //emailController,
      mobileController,
      locatoionController,
      feesController,
      pinController;
  //accountnoController,
  // ifscController,
  //branchController;

  var name = '';
  //var email = '';
  var mobile = '';
  var location = '';
  var fees = '';
  var pin = '';

  @override
  void onInit() {
    states.refresh();
    super.onInit();
    nameController = TextEditingController(text: 'JK Medical');
    mobileController = TextEditingController(text: 'JK Agarwal');
    locatoionController = TextEditingController(text: 'New Ashok Nagar');
    feesController = TextEditingController(text: 'Gst: 23456767778');
    pinController = TextEditingController(text: ' Licence:2f556678');
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    locatoionController.dispose();
    feesController.dispose();
    pinController.dispose();
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

  void checkProfilee() {
    final isValid = chemistprofileformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    chemistprofileformkey.currentState!.save();
  }
}
