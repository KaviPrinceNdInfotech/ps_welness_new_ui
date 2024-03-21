import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesAddVehicleList_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/update_new_vehicle_vehicletypeid_model.dart';
import 'package:ps_welness_new_ui/model/franchies_models/vechle_number_list_newdriverupdate_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class UpdatenewdriverrrController extends GetxController {
  final GlobalKey<FormState> updatenewdriverformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  var selectedImagepath = ''.obs;

  ///

  // Rx<VehicleCatDropdown?> selectedVehicleCat =
  //     (null as VehicleCatDropdown?).obs;
  // List<VehicleCatDropdown> vehiclesCat = <VehicleCatDropdown>[].obs;
  //
  //
  // Rx<VehicleTypeName?> selectedVehicleType = (null as VehicleTypeName?).obs;
  // List<VehicleTypeName> vehicleType = <VehicleTypeName>[].obs;
  ///todo: vehicle type....
  Rx<NewVehicleType?> selectedVehicleCat = (null as NewVehicleType?).obs;
  List<NewVehicleType> vehiclesCat = <NewVehicleType>[].obs;

  Rx<VehicleNumberListElement?> selectedVehicleType =
      (null as VehicleNumberListElement?).obs;
  List<VehicleNumberListElement> vehicleType = <VehicleNumberListElement>[].obs;

  var vehicletype = '';
  var vehiclecatagary = '';

  late TextEditingController vehicletypeController,
      vehiclecatagaryvehicleController;

  FrenchiesAddVehicleListModel? getfrenchiesAddVehicleList;

  ///todo view list button.............
  // Future<void> FrenchiesAddVehicleList() async {
  //   getfrenchiesAddVehicleList = await ApiProvider.FrenchiesAddVehicleListApi();
  //   if (getfrenchiesAddVehicleList?.vehicleList != null) {
  //     isLoading(false);
  //   }
  // }
  ///

  Future<void> getdriverVehiclenewTypeApi() async {
    isLoading(false);

    vehiclesCat = await ApiProvider.getnewdriverVehicletypeApi();
    if (vehiclesCat != null) {
      isLoading(false);
    }
  }

  ///todo: vehle number dropdown.........

  Future<void> getvehiclenumberID(String vechletypeID) async {
    isLoading(false);

    vehicleType.clear();
    final localList = await ApiProvider.getVehicfornewdriverApi(vechletypeID);
    vehicleType.addAll(localList);

    if (vehicleType != null) {
      isLoading(false);
    }
  }

  Future<void> updatenewdriverfrrType() async {
    http.Response r = await ApiProvider.UpdatenewDriverApi(
        selectedVehicleCat.value?.id.toString(),
        selectedVehicleType.value?.id.toString());
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
    getdriverVehiclenewTypeApi();
    // getVehicleCategoryApi();
    selectedVehicleCat.listen((p0) {
      if (p0 != null) {
        getvehiclenumberID("${p0.id}");
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
    Get.delete<UpdatenewdriverrrController>();
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
    if (updatenewdriverformkey.currentState!.validate()) {
      updatenewdriverfrrType();
      //await Get.to(VehicleList());
    }
    updatenewdriverformkey.currentState!.save();
  }
}
