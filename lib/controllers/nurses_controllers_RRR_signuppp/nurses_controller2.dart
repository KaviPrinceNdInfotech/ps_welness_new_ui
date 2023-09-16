import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

///import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_appointment_models/nurse_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_type_model/nurse_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/1_user_model/nurse_location_model/nurse_location_models.dart';
import '../../modules_view/sign_in/sigin_screen.dart';
import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class Nurses_22_Controller extends GetxController {
  final GlobalKey<FormState> nurse2formkey = GlobalKey<FormState>();

  LoginpasswordController _loginpasswordControllerr =
      Get.put(LoginpasswordController());

  RxBool isLoading = true.obs;

  ///image.......
  var selectedPath = ''.obs;

  RxInt selectedimg1 = 0.obs;
  var selectedPath1 = ''.obs;

  RxInt selectedimg2 = 0.obs;
  var selectedPath2 = ''.obs;

  RxInt selectedimg3 = 0.obs;
  var selectedPath3 = ''.obs;

  RxInt selectedimg4 = 0.obs;
  var selectedPath4 = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  //2
  void getImage1(ImageSource imageSource1) async {
    final pickedFiles1 = await ImagePicker().pickImage(source: imageSource1);
    if (pickedFiles1 != null) {
      selectedPath1.value = pickedFiles1.path;
      print("File Path ${pickedFiles1.path}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  ///3
  void getImage2(ImageSource imageSource2) async {
    final pickedFiles2 = await ImagePicker().pickImage(source: imageSource2);
    if (pickedFiles2 != null) {
      selectedPath2.value = pickedFiles2.path;
      print("File Path ${pickedFiles2.path}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  ///4
  void getImage3(ImageSource imageSource3) async {
    final pickedFiles3 = await ImagePicker().pickImage(source: imageSource3);
    if (pickedFiles3 != null) {
      selectedPath3.value = pickedFiles3.path;
      print("File Path ${pickedFiles3.path}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  ///5
  void getImage4(ImageSource imageSource4) async {
    final pickedFiles4 = await ImagePicker().pickImage(source: imageSource4);
    if (pickedFiles4 != null) {
      selectedPath4.value = pickedFiles4.path;
      print("File Path ${pickedFiles4.path}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  ///TODO: image picker.................
  ////// drop down nurse type
  ///nurse location.......
  Rx<NurseModels?> selectedNurse = (null as NurseModels?).obs;
  List<NurseModels> nurse = <NurseModels>[].obs;

  NurseList? nurseListUser;

  void getNurseTypeApi() async {
    nurse = await ApiProvider.getnursetypeApi();
  }

  ///nurse location..
  ///nurse location api class.................
  void getNurseLocationregistrationApi() async {
    locations = await ApiProvider.getnurselocationtApi();
    print('Prince lab test  list');
    print(locations);
  }

  // var selectedImagepath = ''.obs;
  //
  // void getImage(ImageSource imageSource) async {
  //   final pickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagepath.value = pickedFile.path;
  //   } else {
  //     print('No image selected');
  //   }
  // }

  /////////do here......................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[];

  Rx<NurseLocationModel?> selectedNurseLocation =
      (null as NurseLocationModel?).obs;
  List<NurseLocationModel> locations = <NurseLocationModel>[].obs;

  void getStateApi() async {
    states = await ApiProvider.getSatesApi();
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void NursetypeListApi() async {
    isLoading(true);
    nurseListUser = await ApiProvider.NurseTypeApi();
    print('Prince lab list');
    print(nurseListUser);
    if (nurseListUser != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  ///nurse type api class.................
  void NurseTyperegistrationApi() async {
    nurse = await ApiProvider.getnursetypeApi();
    print('Prince lab test  list');
    print(nurse);
  }

  TextEditingController? panController,
      NurseType_IdController,
      CertificateNumberController,
      CityNameController,
      PinCodeController,
      NurseNameController,
      PhoneNumberController,
      LocationControllerdetail,
      MobileNumberController,
      EmailIdController,
      StateMaster_IdController,
      CityMaster_IdController,
      LocationController,
      FeeController,
      PasswordController,
      ConfirmPasswordController,
      PanImageFileController,
      LicenceImageController,
      CertificateBase64ImageController,
      CertificateImageNameController,
      VerificationDocController,
      CertificateImageController,
      experienceController;

  var pan = '';
  var Id = '';
  var Name = '';
  var EmailId = '';
  var Password = '';
  var ConfirmPassword = '';
  var MobileNumber = '';
  var Fee = '';
  var PhoneNumber = '';
  var StartTime = '';
  var SlotTiming = '';
  var Department_Id = '';
  var Specialist_Id = '';
  var LicenceNumber = '';
  var LicenceImage = '';
  var LicenceImageName = '';
  var PinCode = '';
  var ClinicName = '';
  var Location = '';
  var StateMaster_Id = '';
  var CityMaster_Id = '';
  var EndTime = '';
  var LicenceBase64 = '';
  var experience = '';

  void nurseSignupApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    print("imagebaseeee644111:${imageAsBase64}");
    final imageAsBase641 =
        base64Encode(await File(selectedPath1.value).readAsBytes());
    print("imagebaseeee644122:${imageAsBase641}");

    final imageAsBase642 =
        base64Encode(await File(selectedPath2.value).readAsBytes());
    print("imagebaseeee6442333:${imageAsBase642}");

    // final imageAsBase643 =
    //     base64Encode(await File(selectedPath3.value).readAsBytes());
    // print("imagebaseeee6443444:${imageAsBase643}");
    ///
    //
    // final imageAsBase644 =
    //     base64Encode(await File(selectedPath4.value).readAsBytes());
    // print("imagebaseeee6444555:${imageAsBase644}");
    http.Response r = await ApiProvider.NurseSignupApi(
      panController?.text,
      NurseNameController?.text,
      EmailIdController?.text,
      PasswordController?.text,
      ConfirmPasswordController?.text,
      MobileNumberController?.text,
      LocationControllerdetail?.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      //pan
      selectedPath.value.split('/').last,
      imageAsBase64,
      //nurse
      selectedPath1.value.split('/').last,
      imageAsBase641,
      //certificate
      selectedPath2.value.split('/').last,
      imageAsBase642,
      CertificateNumberController?.text,
      PinCodeController?.text,
      selectedNurse.value?.id.toString(),
      FeeController?.text,
      selectedNurseLocation.value?.id.toString(),
      experienceController?.text,
    );
    if (r.statusCode == 200) {
      // Get.snackbar(
      //   'Success',
      //   "${r.body}",
      //   duration: const Duration(seconds: 1),
      // );
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
      // Get.snackbar(
      //   'Error',
      //   "${r.body}",
      //   duration: const Duration(seconds: 1),
      // );
    }
  }

  ///todo:okook 26 july changessss...

  @override
  void onInit() {
    getNurseTypeApi();
    NursetypeListApi();
    getNurseLocationregistrationApi();
    NurseTyperegistrationApi();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    panController = TextEditingController();
    experienceController = TextEditingController();
    NurseType_IdController = TextEditingController();
    CertificateNumberController = TextEditingController();
    CityNameController = TextEditingController(text: 'noida');
    PinCodeController = TextEditingController();
    NurseNameController = TextEditingController();
    PhoneNumberController = TextEditingController();
    LocationControllerdetail = TextEditingController();
    MobileNumberController = TextEditingController();
    EmailIdController = TextEditingController();
    StateMaster_IdController = TextEditingController();
    CityMaster_IdController = TextEditingController();
    LocationController = TextEditingController();
    FeeController = TextEditingController();
    PasswordController = TextEditingController();
    ConfirmPasswordController = TextEditingController();
    PanImageFileController = TextEditingController();
    LicenceImageController = TextEditingController();
    CertificateBase64ImageController = TextEditingController();
    CertificateImageNameController = TextEditingController();
    VerificationDocController = TextEditingController(text: '6985');
    CertificateImageController = TextEditingController(text: 'dr1.jpg');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid value";
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
    ConfirmPassword = value;

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
    } else if (value != ConfirmPassword) {
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

  String? validPan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid pan number should be of 10 digits';
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

  String? validexperince(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    // if (value.length < 1) {
    //   return '              A valid pin should be of 6 digits';
    // }
    //return null;
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

  void checknurse2() {
    nurseSignupApi();
  }
}
