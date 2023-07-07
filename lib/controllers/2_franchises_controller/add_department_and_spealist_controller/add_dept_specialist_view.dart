import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/franchies_models/Dept_dropdown_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/specialistDW_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class AdddepartmentController extends GetxController {
  final GlobalKey<FormState> adddepartmentformkey = GlobalKey<FormState>();

  var selectedImagepath = ''.obs;


  Rx<FranchiseDepartment?> selectedDep = (null as FranchiseDepartment?).obs;
  List<FranchiseDepartment> department = <FranchiseDepartment>[];
  Rx<FranchiseSpecialist?> selectedSpec = (null as FranchiseSpecialist?).obs;
  RxList<FranchiseSpecialist> specialist = <FranchiseSpecialist>[].obs;
  void getDeptApi() async {
    department = await ApiProvider.getDepartmentApi();
  }
  void getSpecialistByDeptID(String deptID) async {
    specialist.clear();
    final localList = await ApiProvider.getSpecialistApi(deptID);
    specialist.addAll(localList);
  }
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }
  void AddDeptSpec()async{
    http.Response r = await ApiProvider.addDeptSpecApi(
      selectedDep.value?.id.toString(),
      selectedSpec.value?.id.toString()
    );
  }
  late TextEditingController nameController,
      branchController;
  var name = '';
  var branch = '';

  @override
  void onInit() {
    super.onInit();
    getDeptApi();
    selectedDep.listen((p0) {
      if (p0 != null) {
        getSpecialistByDeptID("${p0.id}");
      }
    });
    nameController = TextEditingController(text: '');
    branchController = TextEditingController(text: '');
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

  void checkadddeptspeceee() {
    final isValid = adddepartmentformkey.currentState!.validate();
    AddDeptSpec();
    if (!isValid) {
      return;
    }
    adddepartmentformkey.currentState!.save();
  }
}
