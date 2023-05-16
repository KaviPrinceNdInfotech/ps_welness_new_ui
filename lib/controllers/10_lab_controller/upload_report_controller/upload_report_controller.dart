// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../model/10_lab_module/lab_model_byId.dart';
// import '../../../model/10_lab_module/lab_upload_dropdown_patient/lab_patient_dropdown_api.dart';
// import '../../../modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
// import '../../../modules_view/circular_loader/circular_loaders.dart';
// import '../../../servicess_api/api_services_all_api.dart';
//
// class UploadreportLabController extends GetxController {
//   final GlobalKey<FormState> uploadlabformkey = GlobalKey<FormState>();
//   RxBool isLoading = true.obs;
//
//   ///this is for State....................................
//
//   //this is for subject type.................................
//   // Rx<PatientdropdownName?> selectedpatient = (null as PatientdropdownName?).obs;
//   // List<PatientdropdownName> patient = <PatientdropdownName>[].obs;
//   //
//   // ///todo: complain subject type.........................25april...2023..
//   //
//   // ///patient dropdown api class.................
//   // void getlabpatientApi() async {
//   //   patient = await ApiProvider.getlabpatientApi();
//   //   print('Prince Nurse list');
//   //   print(patient);
//   // }
//   //
//   // ///todo:  upload report lab post Api...........15 may 2023.....
//   //
//   // void postUploadreportApi() async {
//   //   CallLoader.loader();
//   //   http.Response r = await ApiProvider.labuploadreportApi(
//   //     //selectedpatient.value?.subid.toString(),
//   //     selectedpatient.value?.id.toString(),
//   //     otherController.text,
//   //     complainController.text,
//   //     loginidController.text,
//   //   );
//   //
//   //   if (r.statusCode == 200) {
//   //     var data = jsonDecode(r.body);
//   //
//   //     CallLoader.hideLoader();
//   //
//   //     /// we can navigate to user page.....................................
//   //     Get.to(LabHomePage());
//   //   }
//   // }
//   //
//   // late TextEditingController patsubidController,
//   //     otherController,
//   //     complainController,
//   //     loginidController;
//   //
//   // var postsubid = '';
//   // var Others = '';
//   // var Complaints = '';
//   // var Login_Id = '';
//   //
//   // ///todo:user complain...........
//   //
//   // // void usercomplaintApi() async {
//   // //   CallLoader.loader();
//   // //   http.Response r = await ApiProvider.UserComplainApi(
//   // //     loginidController.text,
//   // //     subjectController.text,
//   // //     complaintController.text,
//   // //     isdeletedController.text,
//   // //     isresolveController.text,
//   // //     otherController.text,
//   // //     doctorController.text,
//   // //   );
//   // //
//   // //   if (r.statusCode == 200) {
//   // //     var data = jsonDecode(r.body);
//   // //
//   // //     CallLoader.hideLoader();
//   // //
//   // //     /// we can navigate to user page.....................................
//   // //     Get.to(UserHomePage());
//   // //   }
//   // // }
//   // //
//   // // late TextEditingController loginidController,
//   // //     subjectController,
//   // //     complaintController,
//   // //     isdeletedController,
//   // //     isresolveController,
//   // //     otherController,
//   // //     doctorController;
//   // //
//   // // var Login_Id = '';
//   // // var Subjects = '';
//   // // var complaint = '';
//   // // var IsDeleted = '';
//   // // var IsResolved = '';
//   // // var Others = '';
//   // // var Doctor = '';
//   //
//   // @override
//   // void onInit() {
//   //   //states.refresh();
//   //   //subject.refresh();
//   //   super.onInit();
//   //   //getcomplainTypeeApi();
//   //   patsubidController = TextEditingController();
//   //   otherController = TextEditingController();
//   //   complainController = TextEditingController();
//   //   loginidController = TextEditingController();
//   // }
//   //
//   // @override
//   // void onReady() {
//   //   super.onReady();
//   // }
//   //
//   // @override
//   // void onClose() {
//   //   patsubidController.dispose();
//   //   otherController.dispose();
//   //   complainController.dispose();
//   //   loginidController.dispose();
//   // }
//   //
//   // String? validothers(String value) {
//   //   if (value.length < 2) {
//   //     return "This is required field.";
//   //   }
//   //   return null;
//   // }
//   //
//   // String? validAddress(String value) {
//   //   if (value.length < 2) {
//   //     return "This is required field.";
//   //   }
//   //   return null;
//   // }
//   //
//   // void checklabreport() {
//   //   if (uploadlabformkey.currentState!.validate()) {
//   //     postUploadreportApi();
//   //   }
//   //   uploadlabformkey.currentState!.save();
//   // }
// }
