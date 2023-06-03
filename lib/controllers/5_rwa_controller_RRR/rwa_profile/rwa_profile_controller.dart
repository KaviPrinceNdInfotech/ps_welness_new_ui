import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';

import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
import '../../../utils/services/account_service.dart';

class RwaProfileController extends GetxController {
  final GlobalKey<FormState> rwaprofileformkey = GlobalKey<FormState>();

  var selectedImagepath = ''.obs;
  var selectedPath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPath.value = pickedFile.path;
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  TextEditingController? nameController,
      LandlineNumber,
      locatoionController,
      CertificateImage;
  var name = '';
  //var email = '';
  var mobile = '';
  var location = '';
  var fees = '';
  var pin = '';
  // dropdown
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

  void rwaProfileApi() async {
    CallLoader.loader();

    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    http.Response r = await ApiProvider.RWAProfileApi(
        nameController?.text,
        LandlineNumber?.text.toString(),
        selectedState.value?.id.toString(),
        selectedCity.value?.id.toString(),
        locatoionController?.text,
        selectedPath.value.split('/').last,
        imageAsBase64);
    if (r.statusCode == 200) {
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 200),
          () {
            //  _viewdoctorreviewController.doctorreviewratingApi();
            //_viewdoctorreviewController.update();
            Get.snackbar(
                'Add review Successfully', "Review Submitted. Thank-you."
                // "${r.body}"
                );
            Get.to(() => RwaHomePage());
            // _doctorListController.doctordetailApi();
            // _doctorListController.update();
            // _viewdoctorreviewController.doctorreviewratingApi();
            // _viewdoctorreviewController.update();

            //Get.to((page))
            ///
          },
        );
      });
    } else {}
  }

  @override
  void onInit() {
    // states.refresh();
    super.onInit();
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    nameController = TextEditingController(text: '');
    LandlineNumber = TextEditingController(text: '');
    locatoionController = TextEditingController(text: '');
    CertificateImage = TextEditingController(text: '');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    Get.delete<RwaProfileController>(); // Dispose of the controller bindings
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

  String? validPhone(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid phone should be of 10 digits';
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

  void checkRWAProfilee() {
    final isValid = rwaprofileformkey.currentState!.validate();
    rwaProfileApi();
    if (!isValid) {
      return;
    }
    rwaprofileformkey.currentState!.save();
  }
}
