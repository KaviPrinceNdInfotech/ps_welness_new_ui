import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_single_department/add_single_dept_components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/view_dept_specialist_view/view_dept_special_list.dart';

import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class AddSingleDepartmentController extends GetxController {
  RxBool isLoading= false.obs;
  final GlobalKey<FormState> addsingledepartmentformkey = GlobalKey<FormState>();
  late TextEditingController nameController, branchController;
  FranchiesSpecialistController _franchiesSpecialistController = Get.put(FranchiesSpecialistController());
  var name = '';
  var branch = '';
  void frenchiesAddDepartmentApi()async{
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesAddDepartment(
      nameController.text
    );
    if(r.statusCode == 200){
      isLoading(false);
    }
  }
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: '');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "Provide valid Type";
    }
    return null;
  }
  String? validDept(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }
  void checkadddeptspeceee() {
    frenchiesAddDepartmentApi();
    Timer(const Duration(seconds: 1), () => _franchiesSpecialistController.franchiesDeptAndSpecListsApi());
    addsingledepartmentformkey.currentState!.save();
  }
}
