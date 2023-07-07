import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../model/10_lab_module/lab_upload_dropdown_patient/lab_patient_dropdown_api.dart';
import '../../../model/1_user_model/test_name_model/test_name_modells.dart';
import '../../../modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

class LabUploadReportController extends GetxController {
  final GlobalKey<FormState> uploadlabformkey = GlobalKey<FormState>();

  RxBool isLoading = true.obs;
  //var selectedPath = ''.obs;
  RxInt selectedimg = 0.obs;
  RxInt selectedprice = 0.obs;

  Rx<PatientdropdownName?> selectedpatient = (null as PatientdropdownName?).obs;
  List<PatientdropdownName> patient = <PatientdropdownName>[].obs;

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
  void getlabpatientApi() async {
    patient = (await ApiProvider.getlabpatientApi())!;
    print('Prince Nurse list');
    print(patient);
  }

  ///lab test api class.................
  void getTestNameApi() async {
    tests = await ApiProvider.getTestNameApi();
    print('Prince lab test  list');
    print(tests);
  }

  ///todo:  upload report lab post Api...........15 may 2023.....

  void postUploadreportApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    http.Response r = await ApiProvider.labuploadreportApi(
        //selectedpatient.value?.subid.toString(),
        selectedpatient.value?.id.toString(),
        selectedTest.value?.id.toString(),
        selectedPath.value.split('/').last,
        imageAsBase64);

    if (r.statusCode == 200) {
      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(LabHomePage());
    } else {
      CallLoader.hideLoader();
    }
  }

  @override
  void onInit() {
    //states.refresh();
    //subject.refresh();
    super.onInit();
    getlabpatientApi();
    getTestNameApi();
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
    Get.delete<LabUploadReportController>();
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
