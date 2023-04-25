import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> profileformkey = GlobalKey<FormState>();

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  //this is for subject type.................................
  Rx<Complaint41Patient?> selectedSubject = (null as Complaint41Patient).obs;
  List<Complaint41Patient> subject = <Complaint41Patient>[].obs;


  ///todo: complain subject type.........................25april...2023..

  ///nurse type api class.................
  void getcomplainTypeApi() async {
    subject = await ApiProvider.getsubjecttypeApi();
    print('Prince lab test  list');
    print(subject);
  }



  late TextEditingController nameController,
      emailController,
      mobileController,
      locatoionController,
      feesController,
      pinController,
      accountnoController,
      ifscController,
      branchController;

  var name = '';
  var email = '';
  var mobile = '';
  var location = '';
  var fees = '';
  var pin = '';
  var account = '';
  var ifsc = '';
  var branch = '';

  @override
  void onInit() {
    //states.refresh();
    super.onInit();
    nameController = TextEditingController(text: 'Kavi Singh');
    emailController = TextEditingController();
    mobileController = TextEditingController(text: '8988776655');
    locatoionController = TextEditingController(text: 'New Ashok Nagar');
    feesController = TextEditingController(text: '2000');
    pinController = TextEditingController(text: '889999');
    accountnoController = TextEditingController(text: '9898666666');
    ifscController = TextEditingController(text: '999ONSBI');
    branchController = TextEditingController(text: 'SBI');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    locatoionController.dispose();
    feesController.dispose();
    pinController.dispose();
    accountnoController.dispose();
    ifscController.dispose();
    branchController.dispose();
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
    if (value.length != 10) {
      return '              A valid phone number should be of 10 digits';
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
      return "              Provide valid Fees";
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
    final isValid = profileformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    profileformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
