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
  var name = '';
  var branch = '';
  FrenchiesAddVehicleListModel? getfrenchiesAddVehicleList;

  ///todo view list button.............
  void FrenchiesAddVehicleList() async {
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

  void FrenchiesAddVehicleType() async {
    http.Response r = await ApiProvider.FrenchiesVehicleType(
        selectedVehicleCat.value?.id.toString(),
        selectedVehicleType.value?.id.toString());
    if (r.statusCode == 200) {}
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
    // nameController = TextEditingController(text: '');
    //  branchController = TextEditingController(text: '');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // nameController.dispose();
  }
  // String? validName(String value) {
  //   if (value.length < 2) {
  //     return "Provide valid Type";
  //   }
  //   return null;
  // }
  // String? validDept(String value) {
  //   if (value.length < 2) {
  //     return "              Provide valid name";
  //   }
  //   return null;
  // }
  // void checkaddVehicle() {
  //   final isValid = addvehicleformkey.currentState!.validate();
  //   if (isValid) {
  //
  //     return;
  //   }else{
  //
  //     Get.snackbar("Failed", "please add all data");
  //   }
  //   addvehicleformkey.currentState!.save();
  //
  // }
}
