import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../model/1_user_model/test_name_model/test_name_modells.dart';
import '../../../model/9_doctors_model_RRR/doctor_homepage_model/dropdown_patient_list_model/dropdown_patient_list_model.dart';
import '../../../modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

class DoctorrUploadReportController extends GetxController {
  final GlobalKey<FormState> uploadlabformkey = GlobalKey<FormState>();

  RxBool isLoading = true.obs;
  //var selectedPath = ''.obs;
  RxInt selectedimg = 0.obs;
  RxInt selectedprice = 0.obs;

  Rx<PatientDropdownDoctorName?> selectedpatient =
      (null as PatientDropdownDoctorName?).obs;
  List<PatientDropdownDoctorName> patient = <PatientDropdownDoctorName>[].obs;

  Rx<TestModel?> selectedTest = (null as TestModel?).obs;
  List<TestModel> tests = <TestModel>[].obs;

  TextEditingController imagePath = TextEditingController();
  TextEditingController imagebase = TextEditingController();

  var selectedPath = ''.obs;

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

  ///patient dropdown api class.................
  Future<void> getdoctorrpatientApi2() async {
    //isLoading(true);
    patient = (await ApiProvider.getdoctorpatientApi())!;
    print('Prince Nurse list');
    print(patient);
    //isLoading(false);
  }

  ///todo:  upload report doctor post Api...........15 may 2023.....

  Future<void> postdoctorUploadreportApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    http.Response r = await ApiProvider.doctorruploadreportApi(
        //selectedpatient.value?.subid.toString(),
        selectedpatient.value?.id.toString(),
        selectedPath.value.split('/').last,
        imageAsBase64);

    if (r.statusCode == 200) {
      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(DoctorHomePage());
    } else {
      CallLoader.hideLoader();
    }
  }

  @override
  void onInit() {
    //states.refresh();
    //subject.refresh();
    super.onInit();
    getdoctorrpatientApi2();

    ///getdoctorrpatientApi();

    //getcomplainTypeeApi();
    //selectedpatientController = TextEditingController();
    //testcontroller = TextEditingController();
    // fileController = TextEditingController();
    //FileBase64Controller = TextEditingController();
  }
  //
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   selectedpatientController.dispose();
  //   testcontroller.dispose();
  //   fileController.dispose();
  //   FileBase64Controller.dispose();
  // }

  @override
  void dispose() {
    Get.delete<DoctorrUploadReportController>();
    super.dispose();
  }

  //image picker
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void checklabreport() {
    //if (uploadlabformkey.currentState?.validate()) {
    //postUploadreportApi();
    //}
    //uploadlabformkey.currentState!.save();
  }
}
