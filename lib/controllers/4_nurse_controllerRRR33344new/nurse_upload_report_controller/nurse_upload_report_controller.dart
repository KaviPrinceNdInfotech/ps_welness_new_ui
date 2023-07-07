import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/dropdown_list_patient_nurse.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';

import '../../../model/1_user_model/test_name_model/test_name_modells.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

class NurseUploadReportController extends GetxController {
  final GlobalKey<FormState> uploadlabformkey = GlobalKey<FormState>();

  RxBool isLoading = true.obs;
  //var selectedPath = ''.obs;
  RxInt selectedimg = 0.obs;
  RxInt selectedprice = 0.obs;

  Rx<PatientNameNurse?> selectedpatients = (null as PatientNameNurse?).obs;
  List<PatientNameNurse> patientss = <PatientNameNurse>[].obs;

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
  void getnursepatientssApi() async {
    patientss = (await ApiProvider.getnursepatientApi())!;
    print('Prince patient list');
    print(patientss);
  }

  ///todo:  upload report lab post Api...........15 may 2023.....

  void postnurseUploadreportApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    http.Response r = await ApiProvider.nurseuploadreportApi(
        //selectedpatient.value?.subid.toString(),
        selectedpatients.value?.id.toString(),
        selectedPath.value.split('/').last,
        imageAsBase64);

    if (r.statusCode == 200) {
      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      Get.to(NurseHomePage());
    } else {
      CallLoader.hideLoader();
    }
  }

  @override
  void onInit() {
    //states.refresh();
    //subject.refresh();
    super.onInit();
    getnursepatientssApi();
  }

  @override
  void dispose() {
    Get.delete<NurseUploadReportController>();
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
