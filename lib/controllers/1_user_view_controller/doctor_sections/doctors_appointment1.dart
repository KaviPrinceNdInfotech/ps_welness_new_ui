import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
//import 'package:ps_welness_new_ui/model/1_user_model/get_department_list_model/department_model.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

//import 'package:ps_welness/model/1_user_model/city_model/city_modelss.dart';
//import 'package:ps_welness/model/1_user_model/states_model/state_modells.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

import '../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../model/1_user_model/get_department_list_model/department_model.dart';
import '../../../model/1_user_model/states_model/state_modells.dart';
import '../../../modules_view/1_user_section_views/doctorss/appointment_section/doctorss_lists/doctor_list_appointment.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import 'get_doctor_list_controller.dart';

class Doctor_appointment_1_Controller extends GetxController {
  RxBool isLoading = true.obs;

  DoctorListController _doctorListController = Get.put(DoctorListController());

  final GlobalKey<FormState> doctorappointment1key = GlobalKey<FormState>();

  ///this is for state.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;

  List<StateModel> states = <StateModel>[].obs;

  ///this is for city....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  ///this is for department.................................
  Rx<DepartmentModel?> selectedDepartment = (null as DepartmentModel?).obs;
  List<DepartmentModel> department = <DepartmentModel>[].obs;

  ///this is for department.................................
  Rx<SpecialistModel?> selectedSpecialist = (null as SpecialistModel?).obs;
  List<SpecialistModel> specialist = <SpecialistModel>[].obs;

  // Rx<String?> selectedTest = (null as String?).obs;
  // RxList<String> cities2 = <String>[].obs;

  ///get state api.........

  Future<void> getStateLabApi() async {
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

  ///get department api.........

  Future<void> getdepartmentApi() async {
    department = await ApiProvider.getDortorDepartmentApi();
    print('Prince departmrntttss  list');
    print(department);
  }

  ///get specialist api...........
  void getspecialistByDeptID(String depId) async {
    specialist.clear();
    final localList = await ApiProvider.getSpeaclistbyIdApi(depId);
    specialist.addAll(localList);
    print("Prince cities of $depId");
    print(specialist);
  }

  void doctorbooking1Api() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.doctorbooking1postApi(
      selectedDepartment.value?.id.toString(),
      selectedSpecialist.value?.id.toString(),
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      _doctorListController.update();
      _doctorListController.doctorListApi();
      //Get.to(NurseListUser());
      /// we can navigate to user page.....................................
      // Get.to(LabCatagaryDetails());
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      await Get.offAll(DoctorListUser());

      // await Timer(Duration(seconds: 2),
      //     () => Get.delete<Doctor_appointment_1_Controller>());
      //
      // await Get.deleteAll();
    }
  }

  // late TextEditingController nameController,
  //     emailController,
  //     passwordController,
  //     confirmpasswordController,
  //     mobileController,
  //     addressController,
  //     pinController;

  // var name = '';
  // var email = '';
  // var password = '';
  // var confirmpassword = '';
  // var mobile = '';
  // var address = '';
  // var pin = '';

  @override
  void onInit() {
    //states.refresh();
    super.onInit();
    getStateLabApi();
    getdepartmentApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateIDLab("${p0.id}");
      }
    });
    selectedDepartment.listen((p0) {
      if (p0 != null) {
        getspecialistByDeptID("${p0.id}");
      }
    });
    //getDepartmentNameApi();
  }
  // nameController = TextEditingController();
  // emailController = TextEditingController();
  // passwordController = TextEditingController();
  // confirmpasswordController = TextEditingController();
  // mobileController = TextEditingController();
  // addressController = TextEditingController();
  // pinController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //StateModel != null;
    // nameController.dispose();
    // emailController.dispose();
    // passwordController.dispose();
    // confirmpasswordController.dispose();
    // mobileController.dispose();
    // addressController.dispose();
    // pinController.dispose();
  }

  ///
  // String? validName(String value) {
  //   if (value.length < 2) {
  //     return "              Provide valid name";
  //   }
  //   return null;
  // }
  //
  // String? validEmail(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   if (!value.contains('@')) {
  //     return "              A valid email should contain '@'";
  //   }
  //   if (!RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  //   ).hasMatch(value)) {
  //     return "              Please enter a valid email";
  //   }
  //   return null;
  // }
  //
  // String? validPassword(String value) {
  //   confirmpassword = value;
  //
  //   if (value.isEmpty) {
  //     return "              Please Enter New Password";
  //   } else if (value.length < 8) {
  //     return "              Password must be atleast 8 characters long";
  //   } else {
  //     return null;
  //   }
  // }
  //
  // String? validConfirmPassword(String value) {
  //   if (value.isEmpty) {
  //     return "              Please Re-Enter New Password";
  //   } else if (value.length < 8) {
  //     return "              Password must be atleast 8 characters long";
  //   } else if (value != confirmpassword) {
  //     return "              Password must be same as above";
  //   } else {
  //     return null;
  //   }
  // }
  //
  // String? validPhone(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   if (value.length != 10) {
  //     return '              A valid phone number should be of 10 digits';
  //   }
  //   return null;
  // }
  //
  // String? validAddress(String value) {
  //   if (value.length < 2) {
  //     return "              Provide valid address";
  //   }
  //   return null;
  // }
  //
  // String? validPin(String value) {
  //   if (value.isEmpty) {
  //     return '              This field is required';
  //   }
  //   if (value.length != 6) {
  //     return '              A valid pin should be of 6 digits';
  //   }
  //   return null;
  // }

  void doctorcheck1() {
    if (doctorappointment1key.currentState!.validate()) {
      doctorbooking1Api();
    }
    doctorappointment1key.currentState!.save();
  }
}
