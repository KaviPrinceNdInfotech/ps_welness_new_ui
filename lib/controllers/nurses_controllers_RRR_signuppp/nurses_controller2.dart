import 'package:flutter/material.dart';
import 'package:get/get.dart';

///import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_type_model/nurse_type_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';

import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class Nurses_2_Controller extends GetxController {
  final GlobalKey<FormState> nurse2formkey = GlobalKey<FormState>();

  ///TODO: image picker.................
  ////// drop down nurse type
  Rx<NurseModels?> selectedNurse = (null as NurseModels?).obs;
  List<NurseModels> nurse = <NurseModels>[].obs;
  void getNurseTypeApi() async {
    nurse = await ApiProvider.getnursetypeApi();
  }

  var selectedImagepath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  /////////do here......................
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
  // ///this is for State....................................
  // Rx<String?> selectedCity = (null as String?).obs;
  // RxList<String> cities = <String>[].obs;
  //
  // //this is for City.................................
  // Rx<String?> selectedState = (null as String?).obs;
  // RxList<String> states = <String>[].obs;

  // late TextEditingController pinController,
  //     certificateController,
  //     addressController;
  //
  // var pin = '';
  // var address = '';
  // var certificateno = '';

  //get stateCitymap => null;
  TextEditingController? NurseType_IdController,
      CertificateNumberController,
      CityNameController,
      PinCodeController,
      NurseNameController,
      PhoneNumberController,
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
      CertificateImageController;

  void nurseSignupApi() async {
    http.Response r = await ApiProvider.NurseSignupApi(
        NurseType_IdController?.text,
        CertificateNumberController?.text,
        CityNameController?.text,
        PinCodeController?.text,
        NurseNameController?.text,
        PhoneNumberController?.text,
        MobileNumberController?.text,
        EmailIdController?.text,
        StateMaster_IdController?.text,
        CityMaster_IdController?.text,
        LocationController?.text,
        FeeController?.text,
        PasswordController?.text,
        ConfirmPasswordController?.text,
        PanImageFileController?.text,
        LicenceImageController?.text,
        CertificateBase64ImageController?.text,
        CertificateImageNameController?.text,
        VerificationDocController?.text,
        CertificateImageController?.text);
    if (r.statusCode == 200) {
    } else {}
  }

  @override
  void onInit() {
    getNurseTypeApi();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    NurseType_IdController = TextEditingController(text: '1');
    CertificateNumberController = TextEditingController(text: '');
    CityNameController = TextEditingController(text: 'noida');
    PinCodeController = TextEditingController(text: '201301');
    NurseNameController = TextEditingController(text: 'a');
    PhoneNumberController = TextEditingController(text: '9867661112');
    MobileNumberController = TextEditingController(text: '9866690112');
    EmailIdController = TextEditingController(text: 'agb@gmail.com');
    StateMaster_IdController = TextEditingController(text: '2');
    CityMaster_IdController = TextEditingController(text: '4');
    LocationController = TextEditingController(text: 'noida');
    FeeController = TextEditingController(text: '1500');
    PasswordController = TextEditingController(text: '12345');
    ConfirmPasswordController = TextEditingController(text: '12345');
    PanImageFileController = TextEditingController(text: 'flowers.jpg');
    LicenceImageController = TextEditingController(text: 'flowers.jpg');
    CertificateBase64ImageController = TextEditingController();
    CertificateImageNameController = TextEditingController(text: 'dr1.jpg');
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

  void checknurse2() {
    nurseSignupApi();
  }
}
