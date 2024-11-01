import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_type_model/nurse_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_nurses_view/nurses_sighup2/nurses_signup2.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrNurses_1_controller extends GetxController {
  final GlobalKey<FormState> frnursesformkey = GlobalKey<FormState>();
  final GlobalKey<FormState> frnurses2formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxInt selectedIndex = 0.obs;

  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;
  //this is for nurse type.................................
  Rx<NurseModels?> selectedNurse = (null as NurseModels?).obs;
  List<NurseModels> nurse = <NurseModels>[].obs;

  var selectedServicee = ''.obs;
  var selectedplan = ''.obs;

  //radio.........

  onChangeServicee(String servicee) {
    selectedServicee.value = servicee;
  }

  var selectedService = ''.obs;

  onChangePlan(String plan) {
    selectedService.value = plan;
  }

  late TextEditingController panController,
      nameController,
      emailController,
      passwordController,
      confirmpasswordController,
      mobileController,
      pinController,
      certificateController,
      addressController,
      experienceController,
      feeController;

  var pan = '';
  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';
  var pin = '';
  var address = '';
  var certificateno = '';
  var day = '';
  var location = '';
  var experience = '';
  var selectedImagepath = ''.obs;

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

  void getNurseTypeApi() async {
    nurse = await ApiProvider.getnursetypeApi();
  }

  void frenchiesRegisterNurse() async {
    isLoading(true);
    final licenceimageAsBase64 =
        base64Encode(await File(selectedImagepath.value).readAsBytes());
    http.Response r = await ApiProvider.FrenchiesRegisterNurse(
      panController.text,
      nameController.text,
      emailController.text,
      passwordController.text,
      confirmpasswordController.text,
      mobileController.text,
      addressController.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      selectedImagepath.value.split('/').last,
      licenceimageAsBase64,
      certificateController.text,
      pinController.text,
      selectedNurse.value?.id.toString(),
      feeController.text,
      experienceController.text,
    );
    if (r.statusCode == 200) {
      Get.snackbar("Success", "${r.body}", duration: Duration(seconds: 3));
      isLoading(false);
    } else {
      Get.snackbar("Failed", "${r.body}", duration: Duration(seconds: 3));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getStateLabApi();
    getNurseTypeApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    });
    panController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    mobileController = TextEditingController();
    pinController = TextEditingController();
    addressController = TextEditingController();
    certificateController = TextEditingController();
    feeController = TextEditingController();
    experienceController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //nameController.dispose();
    //emailController.dispose();
    // passwordController.dispose();
    // confirmpasswordController.dispose();
    // mobileController.dispose();
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

  String? validcertificate(String value) {
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

  String? validDay(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validPan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid pan number should be of 10 digits';
    }
    return null;
  }

  Future<void> checkNurses1() async {
    final isValid = frnursesformkey.currentState!.validate();
    if (isValid) {
      refresh();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 1000));
      CallLoader.hideLoader();
      Get.to(FrNursesSignup2());
      return;
    } else {}
    frnursesformkey.currentState!.save();
  }

  Future<void> checkNurses2() async {
    final isValid = frnurses2formkey.currentState!.validate();
    if (isValid && selectedImagepath.value != '') {
      frenchiesRegisterNurse();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      Get.offAll(FranchiesHomePage());
      return;
    } else {
      Get.snackbar("title", "Please Select Image");
    }
    frnursesformkey.currentState!.save();
  }
}
