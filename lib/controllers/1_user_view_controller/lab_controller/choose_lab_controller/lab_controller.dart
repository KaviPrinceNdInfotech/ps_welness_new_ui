import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../../model/1_user_model/states_model/state_modells.dart';
import '../../../../model/1_user_model/test_name_model/test_name_modells.dart';
import '../../../../modules_view/1_user_section_views/lab/lab_lists/lab_listpage.dart';
import '../../../../modules_view/circular_loader/circular_loaders.dart';

class ChooseLabController extends GetxController {
  final GlobalKey<FormState> ChooseLabformkey = GlobalKey<FormState>();

  ///TODO: image picker.................
  ///
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
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;
  List<StateModel> states = <StateModel>[].obs;

  //this is for City.................................
  Rx<TestModel?> selectedTest = (null as TestModel?).obs;
  List<TestModel> tests = <TestModel>[].obs;

  // Rx<String?> selectedTest = (null as String?).obs;
  // RxList<String> cities2 = <String>[].obs;

  ///lab test api class.................
  void getTestNameApi() async {
    tests = await ApiProvider.getTestNameApi();
    print('Prince lab test  list');
    print(tests);
  }

  ///get state api.........

  void getStateLabApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
  }

  ///get cities api...........
  void getCityByStateIDLab(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
    print("Prince cities of $stateID");
    print(cities);
  }

  void labbooking1Api() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.labbookingpostApi(
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      selectedTest.value?.id.toString(),
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      // Get.to(LabCatagaryDetails());
      Get.to(LabListPage());
    }
  }

  // late TextEditingController pinController,
  //     clinicnameController,
  //     passwordController,
  //     confirmpasswordController,

  //get stateCitymap => null;

  @override
  void onInit() {
    // stateCitymap((key, value) {
    //   states.add(key);
    // }
    //);
    //states.refresh();

    // clinicnameController = TextEditingController();
    // mobileController = TextEditingController();
    super.onInit();

    getStateLabApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    });
    getTestNameApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // clinicnameController.dispose();
    // mobileController.dispose();
  }

  String? validClinicname(String value) {
    if (value.isEmpty) {
      return '              This field is required';
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

  void checklab1() {
    if (ChooseLabformkey.currentState!.validate()) {
      labbooking1Api();
    }
    ChooseLabformkey.currentState!.save();
  }
}
