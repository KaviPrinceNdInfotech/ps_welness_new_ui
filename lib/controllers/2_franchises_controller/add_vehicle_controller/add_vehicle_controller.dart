import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesAddVehicleList_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleCategoryDD_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesVehicleTypeDD_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class AddVehicleController extends GetxController {
  final GlobalKey<FormState> addvehicleformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  var selectedImagepath = ''.obs;

  Rx<VehicleCatDropdown?> selectedVehicleCat =
      (null as VehicleCatDropdown?).obs;
  List<VehicleCatDropdown> vehiclesCat = <VehicleCatDropdown>[].obs;
  Rx<VehicleTypeName?> selectedVehicleType = (null as VehicleTypeName?).obs;
  List<VehicleTypeName> vehicleType = <VehicleTypeName>[].obs;

  var vehicletype = '';
  var vehiclecatagary = '';

  late TextEditingController vehicletypeController,
      vehiclecatagaryvehicleController;

  FrenchiesAddVehicleListModel? getfrenchiesAddVehicleList;

  ///todo view list button.............
  Future<void> FrenchiesAddVehicleList() async {
    isLoading(true);
    getfrenchiesAddVehicleList = await ApiProvider.FrenchiesAddVehicleListApi();
    if (getfrenchiesAddVehicleList?.vehicleList != null) {
      isLoading(false);
    }
  }

  void getVehicleCategoryApi() async {
    vehiclesCat = await ApiProvider.getVehicleCategoryApi();
  }

  void getCityByStateID(String stateID) async {
    vehicleType.clear();
    final localList = await ApiProvider.getVehicleTypeApi(stateID);
    vehicleType.addAll(localList);
  }

  Future<void> FrenchiesAddVehicleType() async {
    http.Response r = await ApiProvider.FrenchiesVehicleType(
        selectedVehicleCat.value?.id.toString(),
        selectedVehicleType.value?.id.toString());
    if (r.statusCode == 200) {}
  }

  ///add new vehicle........
  Future<void> addVeciclenewApi() async {
    http.Response r = await ApiProvider.AddnewVehicleApi(
      vehicletypeController.text,
      vehiclecatagaryvehicleController.text,
    );

    if (r.statusCode == 200) {
      // await FrenchiesAddVehicleType();
      //await FrenchiesAddVehicleList();
      //CallLoader.loader();
      // await Future.delayed(Duration(milliseconds: 900));
      // CallLoader.hideLoader();
      //await Get.to(VehicleList());
      // Timer(const Duration(seconds: 2),
      //     () => FrenchiesAddVehicleList());
      // Timer(
      //     const Duration(seconds: 2),
      //
      //         () async =>
      //         await FrenchiesAddVehicleList();
      //     await Get.to(VehicleList()));
      //CallLoader.hideLoader();
      // _nurseUserListController.update();
      //_nurseUserListController.nurselistsuserApi();

      // Get.offAll(NurseListUser());
      //Get.to(NurseDetailsSchedulePage());

      /// we can navigate to user page.....................................
      //Get.to(NurseAppointmentHistory());
    }
  }

  @override
  void onInit() {
    super.onInit();
    FrenchiesAddVehicleList();
    getVehicleCategoryApi();
    selectedVehicleCat.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });

    vehicletypeController = TextEditingController(text: '');
    vehiclecatagaryvehicleController = TextEditingController(text: '');
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
    Get.delete<AddVehicleController>();
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
    if (addvehicleformkey.currentState!.validate()) {
      await addVeciclenewApi();
      //await Get.to(VehicleList());
    }
    addvehicleformkey.currentState!.save();
  }
}
