import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import '../../../servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_profile_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:ps_welness_new_ui/widgets/circular_loader.dart';

class NurseProfileUpdateController extends GetxController {
  final GlobalKey<FormState> nurseprofileformkey = GlobalKey<FormState>();

  NurseProfileControllersdetail _nurseprofileContrller =
      Get.put(NurseProfileControllersdetail());
  // NurseProfileControllersdetail _nurseprofileContrller =
  // Get.put(NurseProfileControllersdetail());

  ///todo nurse controller working here...........................
  ///this is for State....................................
  // Rx<String?> selectedCity = (null as String?).obs;
  // RxList<String> cities = <String>[].obs;
  ///
  // Rx<String?> selectedState = (null as String?).obs;
  // RxList<String> states = <String>[].obs;
  /////////do here......................
  Rx<City?> selectedCityy = (null as City?).obs;
  RxList<City> citiess = <City>[].obs;

  Rx<StateModel?> selectedStatee = (null as StateModel?).obs;
  List<StateModel> statess = <StateModel>[];

  void getStateApi() async {
    statess = await ApiProvider.getSatesApi();
  }

  void clearSelectedState() {
    selectedStatee.value = null;
    //states?.clear();
  }

  void getCityByStateID(String stateID) async {
    citiess.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    citiess.addAll(localList);
  }

  TextEditingController? idController,
      nameController,
      mobileController,
      locationController,
      pinController,
      clinicNameController,
      feeController,
      adminLoginIdController,
      accountnoController,
      ifscController,
      EmailIdController,
      branchNameController;

  void nurseEditProfileApi() async {
    http.Response r = await ApiProvider.NurseEditProfileApi(
      //idController?.text,
      nameController?.text,
      mobileController?.text,
      selectedStatee.value?.id.toString() ??
          _nurseprofileContrller.getNurseProfile?.stateMasterId.toString(),
      selectedCityy.value?.id.toString() ??
          _nurseprofileContrller.getNurseProfile?.cityMasterId.toString(),
      locationController?.text,
      pinController?.text,
      //clinicNameController?.text,
      EmailIdController?.text,
      // feeController?.text,
      //adminLoginIdController?.text,
      // accountnoController?.text,
      // ifscController?.text,
      // branchNameController?.text
    );
    if (r.statusCode == 200) {
      //CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 100));
      CallLoader.hideLoader();
      // Get.offAll(NurseHomePage());
      Get.offAll(() => NurseHomePage());
      await Future.delayed(Duration(milliseconds: 900));
      await _nurseprofileContrller.nurseprofileApi();
      clearSelectedState();
    } else {
      Get.snackbar('Error', "Please fill correctly");
    }
  }

  @override
  void onInit() {
    //statess.
    getStateApi();
    selectedStatee.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    idController = TextEditingController(
        text: "${_nurseprofileContrller.getNurseProfile?.id.toString() ?? 0}");
    EmailIdController = TextEditingController(
        text:
            "${_nurseprofileContrller.getNurseProfile?.emailId.toString() ?? 0}");
    //_nurseprofileContrller
    nameController = TextEditingController(
        text:
            "${_nurseprofileContrller.getNurseProfile?.nurseName.toString() ?? 0}");
    mobileController = TextEditingController(
        text:
            "${_nurseprofileContrller.getNurseProfile?.mobileNumber.toString() ?? 0}");
    locationController = TextEditingController(
        text:
            "${_nurseprofileContrller.getNurseProfile?.location.toString() ?? 0}");
    pinController = TextEditingController(
        text:
            "${_nurseprofileContrller.getNurseProfile?.pinCode.toString() ?? 0}");
    clinicNameController = TextEditingController();
    feeController = TextEditingController();
    adminLoginIdController = TextEditingController();
    accountnoController = TextEditingController();
    ifscController = TextEditingController();
    branchNameController = TextEditingController();

    super.onInit();
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
    if (nurseprofileformkey.currentState!.validate()) {
      nurseEditProfileApi();
    }
    nurseprofileformkey.currentState!.save();
  }
  // void checkProfilee() {
  //   nurseEditProfileApi();
  //   // final isValid = nurseprofileformkey.currentState!.validate();
  //   // if (!isValid) {
  //   //   return;
  //   // }
  //   // nurseprofileformkey.currentState!.save();
  //   //Get.to(() => HomePage());
  // }
}
