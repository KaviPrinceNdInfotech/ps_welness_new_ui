import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';
import 'package:ps_welness_new_ui/model/franchies_models/Dept_dropdown_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/specialistDW_model.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_dept_spec_page_view/list_dept_spec/list_dept_specialist.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class AdddepartmentController extends GetxController {
  RxBool isLoading = false.obs;
  final GlobalKey<FormState> adddepartmentformkey = GlobalKey<FormState>();

  var selectedImagepath = ''.obs;


  Rx<FranchiseDepartment?> selectedDep = (null as FranchiseDepartment?).obs;
  List<FranchiseDepartment> department = <FranchiseDepartment>[];
  Rx<FranchiseSpecialist?> selectedSpec = (null as FranchiseSpecialist?).obs;
  RxList<FranchiseSpecialist> specialist = <FranchiseSpecialist>[].obs;
  FranchiesSpecialistController _franchiesSpecialistController = Get.put(FranchiesSpecialistController());
  void getDeptApi() async {
    department = await ApiProvider.getDepartmentApi();
  }
  void getSpecialistByDeptID(String deptID) async {
    specialist.clear();
    final localList = await ApiProvider.getSpecialistApi(deptID);
    specialist.addAll(localList);
  }
  void AddDeptSpec()async{
    isLoading(true);
    http.Response r = await ApiProvider.addDeptSpecApi(
      selectedDep.value?.id.toString(),
      selectedSpec.value?.id.toString()
    );
    if(r.statusCode==200){
      Timer(const Duration(seconds: 3), () =>_franchiesSpecialistController.getDeptSpecList2Model);
      isLoading(false);

    }
  }
  @override
  void onInit() {
    super.onInit();
    getDeptApi();
    selectedDep.listen((p0) {
      if (p0 != null) {
        getSpecialistByDeptID("${p0.id ?? ''}");
      }
    });
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
  }
  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }

  String? validDept(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }

}
