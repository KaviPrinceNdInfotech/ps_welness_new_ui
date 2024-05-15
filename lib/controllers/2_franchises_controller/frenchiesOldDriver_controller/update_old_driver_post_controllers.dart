import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/franchies_models/update_old_driver_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/update_old_driver_model_vehicle_number.dart';
import 'package:ps_welness_new_ui/model/franchies_models/vehicle_number_list_old_driver_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class UpdateolddriverrrController extends GetxController {
  final GlobalKey<FormState> updateolddriverformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  var selectedImagepath = ''.obs;

  ///todo: vehicle type....
  Rx<VehicleNumberListdrop?> selectedVehicleCat =
      (null as VehicleNumberListdrop?).obs;
  List<VehicleNumberListdrop> vehiclesCat = <VehicleNumberListdrop>[].obs;

  Rx<VehicleNumberdetail?> selectedVehicleType =
      (null as VehicleNumberdetail?).obs;
  List<VehicleNumberdetail> vehicleType = <VehicleNumberdetail>[].obs;

  ///todo: driver updated list....
  Rx<Driver?> selecteddriver = (null as Driver?).obs;
  List<Driver> driverss = <Driver>[].obs;

  var vehicletype = '';
  var vehiclecatagary = '';

  late TextEditingController vehicletypeController,
      vehiclecatagaryvehicleController;

  // FrenchiesAddVehicleListModel? getfrenchiesAddVehicleList;

  Future<void> getdriverVehicleoldTypeApi() async {
    isLoading(false);

    vehiclesCat = await ApiProvider.getolddriverVehicletypeApi();
    if (vehiclesCat != null) {
      isLoading(false);
    }
  }

  ///todo: vehle number dropdown.........

  Future<void> getoldvehiclenumberID(String vechletypeID) async {
    isLoading(false);

    vehicleType.clear();
    final localList2 = await ApiProvider.getVehicforolddriverApi(vechletypeID);
    vehicleType.addAll(localList2);

    if (vehicleType != null) {
      isLoading(false);
    }
  }

  ///old driver......

  Future<void> getdriverssApi() async {
    isLoading(false);
    driverss = await ApiProvider.getUpdatedolddriverListApi();
    if (driverss != null) {
      isLoading(false);
    }
  }

  Future<void> updateolddriverfrrType() async {
    http.Response r = await ApiProvider.UpdateoldDriverApi(
        selecteddriver.value?.id.toString());
    //selectedVehicleType.value?.id.toString());
    if (r.statusCode == 200) {}
  }

  ///add new vehicle........
  // Future<void> updatenewdriverApi() async {
  //   http.Response r = await ApiProvider.AddnewVehicleApi(
  //     vehicletypeController.text,
  //     vehiclecatagaryvehicleController.text,
  //   );
  //
  //   if (r.statusCode == 200) {
  //     CallLoader.loader();
  //     await Future.delayed(Duration(seconds: 1));
  //     CallLoader.hideLoader();
  //
  //     await Get.to(FranchiesHomePage());
  //     // await getVehicleCategoryApi();
  //
  //     // await FrenchiesAddVehicleType();
  //     //await FrenchiesAddVehicleList();
  //     //CallLoader.loader();
  //     // await Future.delayed(Duration(milliseconds: 900));
  //     // CallLoader.hideLoader();
  //     //await Get.to(VehicleList());
  //     // Timer(const Duration(seconds: 2),
  //     //     () => FrenchiesAddVehicleList());
  //     // Timer(
  //     //     const Duration(seconds: 2),
  //     //
  //     //         () async =>
  //     //         await FrenchiesAddVehicleList();
  //     //     await Get.to(VehicleList()));
  //     //CallLoader.hideLoader();
  //     // _nurseUserListController.update();
  //     //_nurseUserListController.nurselistsuserApi();
  //
  //     // Get.offAll(NurseListUser());
  //     //Get.to(NurseDetailsSchedulePage());
  //
  //     /// we can navigate to user page.....................................
  //     //Get.to(NurseAppointmentHistory());
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    getdriverssApi();
    getdriverVehicleoldTypeApi();
    // getVehicleCategoryApi();
    selectedVehicleCat.listen((p0) {
      if (p0 != null) {
        getoldvehiclenumberID("${p0.id}");
      }
    });

    // vehicletypeController = TextEditingController(text: '');
    // vehiclecatagaryvehicleController = TextEditingController(text: '');
    ///
    // nameController = TextEditingController(text: '');
    //  branchController = TextEditingController(text: '');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //AddVehicleController
    //nameController.dispose();
  }
  @override
  void dispose() {
    // Get.delete<UpdateolddriverrrController>();
    super.dispose();
  }

  String? validvehicletype(String value) {
    if (value.length < 2) {
      return "              Provide valid type";
    }
    return null;
  }

  String? validcatagary(String value) {
    if (value.length < 2) {
      return "              Provide valid catagary";
    }
    return null;
  }

  Future<void> checkvehicleAdd() async {
    if (updateolddriverformkey.currentState!.validate()) {
      updateolddriverfrrType();
      //await Get.to(VehicleList());
    }
    updateolddriverformkey.currentState!.save();
  }
}
