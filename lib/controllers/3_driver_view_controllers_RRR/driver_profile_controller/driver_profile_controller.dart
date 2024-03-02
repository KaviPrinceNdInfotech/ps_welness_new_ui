import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_detail_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';

import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverProfileController extends GetxController {
  final GlobalKey<FormState> driverrprofileformkey = GlobalKey<FormState>();

  var selectedPath = ''.obs;
  // DriverProfileController _driverProfileController =
  // Get.put(DriverProfileController());
  //User_1_Controller _user_1_controller = Get.put(User_1_Controller());
  final DriverProfileDetailController _driverprofile =
      Get.put(DriverProfileDetailController());
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
      EmailId,
      PinCode,
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

  void clearSelectedState() {
    selectedState.value = null;
  }

  void getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
  }

  void driverUpdateProfileApi() async {
    // final imageAsBase64 =
    //     base64Encode(await File(selectedPath.value).readAsBytes());
    //print("imagebaseeee64467:${imageAsBase64}");
    http.Response r = await ApiProvider.DriverUpdateProfile(
      DriverNameEditText?.text,
      PhoneEditText?.text,
      //VehicleNameEditText?.text,
      selectedState.value?.id.toString() ??
          _driverprofile.getDriverProfileDetail?.stateMasterId.toString(),
      selectedCity.value?.id.toString() ??
          _driverprofile.getDriverProfileDetail?.cityMasterId.toString(),
      LocationEditText?.text,
      EmailId?.text,
      PinCode?.text,
      //selectedPath.value.split('/').last,
      //imageAsBase64,
    );
    if (r.statusCode == 200) {
      await Future.delayed(Duration(milliseconds: 1300));
      CallLoader.hideLoader();
      // states?.clear();
      Get.offAll(DriverHomePage());
      await Future.delayed(Duration(milliseconds: 900));
      await _driverprofile.driverProfileDetailApi();
      // Get.to(DriverHomePage());
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
    //_driverprofile
    DriverNameEditText = TextEditingController(
        text:
            "${_driverprofile.getDriverProfileDetail?.driverName.toString() ?? 0}");
    PhoneEditText = TextEditingController(
        text:
            "${_driverprofile.getDriverProfileDetail?.mobileNumber.toString() ?? 0}");
    VehicleNameEditText = TextEditingController(text: '');
    LocationEditText = TextEditingController(
        text:
            "${_driverprofile.getDriverProfileDetail?.location.toString() ?? 0}");
    EmailId = TextEditingController(
        text:
            "${_driverprofile.getDriverProfileDetail?.emailId.toString() ?? 0}");
    PinCode = TextEditingController(
        text:
            "${_driverprofile.getDriverProfileDetail?.pinCode.toString() ?? 0}");
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
    if (driverrprofileformkey.currentState!.validate()) {
      driverUpdateProfileApi();
    }
    driverrprofileformkey.currentState!.save();
  }

  // void checkDriverUpdateProfile() {
  //   final isValid = driverrprofileformkey.currentState!.validate();
  //   driverUpdateProfileApi();
  //   if (!isValid) {
  //     return;
  //   }
  //   driverrprofileformkey.currentState!.save();
  // }
}
