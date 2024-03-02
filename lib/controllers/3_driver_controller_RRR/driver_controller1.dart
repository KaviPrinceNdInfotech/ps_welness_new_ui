import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/model/3_driver_controllers_RRR/vehicle_type_dropdown.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Driver_1111_Controller extends GetxController {
  final GlobalKey<FormState> driver1111formkey = GlobalKey<FormState>();

  var selectedDate = DateTime.now().obs;
  LoginpasswordController _loginpasswordControllerr =
      Get.put(LoginpasswordController());

  //RxInt selectedimg = 0.obs;
  var selectedPath = ''.obs;

  RxInt selectedimg1 = 0.obs;
  var selectedPath1 = ''.obs;

  RxInt selectedimg2 = 0.obs;
  var selectedPath2 = ''.obs;

  RxInt selectedimg3 = 0.obs;
  var selectedPath3 = ''.obs;

  RxInt selectedimg4 = 0.obs;
  var selectedPath4 = ''.obs;
  //var selectedPath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFiles = await ImagePicker().pickImage(source: imageSource);
    if (pickedFiles != null) {
      selectedPath.value = pickedFiles.path;
      print("File Path ${pickedFiles.path}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
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

  ///this is for state.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;

  ///this is for city....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  // ///ambulancde catagary Id...........
  //
  // Rx<Vehicle?> selectedambCatagary = (null as Vehicle?).obs;
  // List<Vehicle> ambulancvecatagarys = <Vehicle>[].obs;
  //
  // ///vehicle by catagary Id...........
  // ///
  // Rx<VehicleDetaile?> selectedvhicleCatagary = (null as VehicleDetaile?).obs;
  // RxList<VehicleDetaile> vhicletypes = <VehicleDetaile>[].obs;

  ///ambulancde catagary Id...........
  ///ambulancde catagary Id...........

  Rx<VehicleTypeElement?> selectevehicletype =
      (null as VehicleTypeElement?).obs;
  List<VehicleTypeElement> vehicletype = <VehicleTypeElement>[].obs;

  void ambulancecatagaryyApi() async {
    vehicletype = (await ApiProvider.getvehicledriverApi())!;
    print('Prince ambulance type list');
    print("rfrfrfrfr${vehicletype}");
  }

  void getStateDriverApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
  }

  ///get cities api...........
  void getCityByStateIDDriver(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
    print("Prince cities of $stateID");
    print(cities);
  }

  late TextEditingController? panController,
      nameController,
      pincontroller,
      mobileController,
      emailController,
      statecontroller,
      citycontroller,
      locationcontroller,
      dlnumbercontroller,
      dlvaliditycontroller,
      passwordController,
      confirmpasswordController,
      driverimagecontroller,
      driverimagebase64controller,
      dlimagecontroller,
      dlimage1controller,
      dlimage1base64controller,
      dlimage2controller,
      dlimage2base64controller,
      aadharimagecontroller,
      aadharimagebase64controller,
      aadharimage2controller,
      aadharimage2base64controller,
      vehicletypecontroller,
      paidamountcontroller;

  var pan = '';
  var name = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var mobile = '';

  var DriverName = '';
  var PinCode = '';
  var MobileNumber = '';
  var EmailId = '';
  var StateMaster_Id = '';
  var CityMaster_Id = '';
  var Location = '';
  var DlNumber = '';
  var DlValidity = '';
  var Password = '';
  var ConfirmPassword = '';
  var DriverImage = '';
  var DriverImageBase64 = '';
  var DlImage = '';
  var DlImage1 = '';
  var DlImage1Base64 = '';
  var DlImage2 = '';
  var DlImage2Base64 = '';
  var AadharImage = '';
  var AadharImageBase64 = '';
  var AadharImage2 = '';
  var AadharImage2Base64 = '';
  var VehicleType_Id = '';
  var Paidamount = '';

  ///signup driver.............
  void driverSignupApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    print("imagebaseeee644:${imageAsBase64}");
    final imageAsBase641 =
        base64Encode(await File(selectedPath1.value).readAsBytes());
    print("imagebaseeee6441:${imageAsBase641}");

    final imageAsBase642 =
        base64Encode(await File(selectedPath2.value).readAsBytes());
    print("imagebaseeee6442:${imageAsBase642}");

    final imageAsBase643 =
        base64Encode(await File(selectedPath3.value).readAsBytes());
    print("imagebaseeee6443:${imageAsBase643}");

    final imageAsBase644 =
        base64Encode(await File(selectedPath4.value).readAsBytes());
    print("imagebaseeee6444:${imageAsBase644}");
    http.Response r = await ApiProvider.DriverSignupApi(
      panController?.text,
      nameController?.text,
      pincontroller?.text,
      mobileController?.text,
      emailController?.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      locationcontroller?.text,
      dlnumbercontroller?.text,
      dlvaliditycontroller?.text,
      passwordController?.text,
      confirmpasswordController?.text,
      selectedPath.value.split('/').last,
      imageAsBase64,
      selectedPath1.value.split('/').last,
      imageAsBase641,
      selectedPath2.value.split('/').last,
      imageAsBase642,
      selectedPath3.value.split('/').last,
      imageAsBase643,
      selectedPath3.value.split('/').last,
      imageAsBase644,

      ///selectevehicletype.value?.id.toString(),
      /// paidamountcontroller?.text,
      // selectedPath.value.split('/').last,
      //imageAsBase64,
    );

    if (r.statusCode == 200) {
      Get.snackbar(
        'Success',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
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
    // accountService.getAccountData.then((accountData) {
    //   Timer(
    //     const Duration(milliseconds: 200),
    //     () {
    //       //  _viewdoctorreviewController.doctorreviewratingApi();
    //       //_viewdoctorreviewController.update();
    //       Get.snackbar(
    //         'Success',
    //         "${r.body}",
    //         duration: const Duration(seconds: 1),
    //       );
    //       Get.to(SignInScreen());
    //
    //       // Get.to(() => DriverHomePage());
    //       // _doctorListController.doctordetailApi();
    //       // _doctorListController.update();
    //       // _viewdoctorreviewController.doctorreviewratingApi();
    //       // _viewdoctorreviewController.update();
    //
    //       //Get.to((page))
    //       ///
    //     },
    //   );
    // });
  }

  @override
  void onInit() {
    super.onInit();
    ambulancecatagaryyApi();

    /// ambulancecatagaryyApi();
    panController = TextEditingController();
    nameController = TextEditingController();
    pincontroller = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    statecontroller = TextEditingController();
    citycontroller = TextEditingController();
    locationcontroller = TextEditingController();
    dlnumbercontroller = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    driverimagecontroller = TextEditingController();
    driverimagebase64controller = TextEditingController();
    dlimagecontroller = TextEditingController();
    dlimage1controller = TextEditingController();
    dlimage1base64controller = TextEditingController();
    dlimage2controller = TextEditingController();
    dlimage2base64controller = TextEditingController();
    aadharimagecontroller = TextEditingController();
    aadharimagebase64controller = TextEditingController();
    aadharimage2controller = TextEditingController();
    aadharimage2base64controller = TextEditingController();
    vehicletypecontroller = TextEditingController();
    paidamountcontroller = TextEditingController();
    dlvaliditycontroller = TextEditingController();
    dlvaliditycontroller?.text = "DL Validity";

    getStateDriverApi();
    //getdepartmentApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDDriver("${p0.id}");
      }
    });
  }

  chooseDate() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2060),
      initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DL Validity',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Select date',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      dlvaliditycontroller
        ?..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dlvaliditycontroller!.text.length,
            affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    confirmpasswordController?.dispose();
    mobileController?.dispose();
    locationcontroller?.dispose();
    dlnumbercontroller?.dispose();
    dlvaliditycontroller?.dispose();
    passwordController?.dispose();
    confirmpasswordController?.dispose();
    paidamountcontroller?.dispose();
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

  String? validPan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid pan number should be of 10 digits';
    }
    return null;
  }

  String? validFees(String value) {
    if (value.isEmpty) {
      return '                Enter your charge per KM';
    }
    // if (value.length < 2) {
    //   return '              maximum fees in 3 digits';
    // }
    // return null;
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

  String? validlandline(String value) {
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

//DriverSignupApi
  void checkDriver1111() {
    // if (driver1111formkey.currentState!.validate()) {
    //   driverSignupApi();
    // }
    driverSignupApi();
    //driver1111formkey.currentState!.save();
  }
}
