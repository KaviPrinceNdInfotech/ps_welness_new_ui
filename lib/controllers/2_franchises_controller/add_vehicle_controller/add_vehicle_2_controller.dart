// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:ps_welness_new_ui/model/franchies_models/frenchiesAddVehicleList_model.dart';
// import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleCategoryDD_model.dart';
// import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleTypeDD_model.dart';
//
// import '../../../modules_view/circular_loader/circular_loaders.dart';
// import '../../../servicess_api/api_services_all_api.dart';
// //import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
//
// class AddNewVehicleController extends GetxController {
//   final GlobalKey<FormState> addnewvehicleformkey = GlobalKey<FormState>();
//   RxBool isLoading = false.obs;
//   var selectedImagepath = ''.obs;
//
//   var vehicletype = '';
//   var vehiclecatagary = '';
//
//   late TextEditingController vehicletypeController,
//       vehiclecatagaryvehicleController;
//
//   ///todo: nurse booking..............27 april 2023..
//   void nurseBooking1Api() async {
//     http.Response r = await ApiProvider.AddnewVehicleApi(
//       vehicletypeController.text,
//       vehiclecatagaryvehicleController.text,
//
//     );
//
//     if (r.statusCode == 200) {
//       CallLoader.hideLoader();
//       _nurseUserListController.update();
//       _nurseUserListController.nurselistsuserApi();
//       CallLoader.loader();
//       await Future.delayed(Duration(milliseconds: 900));
//       CallLoader.hideLoader();
//       Get.offAll(NurseListUser());
//       //Get.to(NurseDetailsSchedulePage());
//
//       /// we can navigate to user page.....................................
//       //Get.to(NurseAppointmentHistory());
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     vehicletypeController = TextEditingController(text: '');
//     vehiclecatagaryvehicleController = TextEditingController(text: '');
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     //AddVehicleController
//     //nameController.dispose();
//   }
//   @override
//   void dispose() {
//     Get.delete<AddNewVehicleController>();
//     super.dispose();
//   }
// }
