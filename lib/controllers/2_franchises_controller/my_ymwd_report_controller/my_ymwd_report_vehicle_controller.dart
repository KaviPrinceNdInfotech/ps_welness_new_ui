import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDVehicleReportApi_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class YmwdVehicleController extends GetxController {
  final GlobalKey<FormState> ymwdvehicleformkey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  ///this is for State....................................
  Rx<String?> selectedTerm = (null as String?).obs;
  RxList<String> termss = <String>[].obs;
  FrenchiesYmdwVehicleModel? getfrenchiesYmdwVehicleModel;
  void frenchiesYMDWVehicleReportApi(String role)async{
    isLoading(true);
    getfrenchiesYmdwVehicleModel = await ApiProvider.FrenchiesYMWDVehicleReportApi(role);
    if(getfrenchiesYmdwVehicleModel?.vehicleYmwdReport != null){
      isLoading(false);
      ///for search filter
      data.value = getfrenchiesYmdwVehicleModel!.vehicleYmwdReport!;
    }
  }
  /// for search filter
  RxList<VehicleYmwdReport> data = RxList<VehicleYmwdReport>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<VehicleYmwdReport>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesYmdwVehicleModel!.vehicleYmwdReport!;
    } else {
      finalResult = getfrenchiesYmdwVehicleModel!.vehicleYmwdReport!
          .where((element) => element.vehicleNumber
          .toString()
          .toLowerCase()
          .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }
  @override
  void onInit() {
    super.onInit();
    frenchiesYMDWVehicleReportApi('');
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }
}
