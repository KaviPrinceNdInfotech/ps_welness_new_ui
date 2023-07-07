import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesOldDriverList_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class FrenchiesOldDriverListController extends GetxController{
  final GlobalKey<FormState> franchisesOldDriverUpdateformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  TextEditingController? driverNameController,vehicleNameController;
  FrenchiesOldDriverListModel? getfrenchiesOldDriverListModel;
  void frenchiesOldDriverList()async{
    isLoading(true);
    getfrenchiesOldDriverListModel = await ApiProvider.FrenchiesOldDriverListApi();
    if(getfrenchiesOldDriverListModel?.getOldDriver != null){
      isLoading(false);
      ///for search filter
      data.value = getfrenchiesOldDriverListModel!.getOldDriver!;
    }
  }
  ///todo frenchies Update Old driver ..... rahul
  void frenchiesOldDriverUpdate(id) async{
    http.Response r = await ApiProvider.FrenchiesOldDriverUpdateApi(
        vehicleNameController?.text,
        driverNameController?.text,
        id);
    if(r.statusCode == 200){
    }
  }
  ///todo frenchies Delete Old driver ..... rahul
  void frenchiesOldDriverDelete(int id) async{
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesDeleteOldDriverApi(id);
    if(r.statusCode == 200){
      isLoading(false);
    }
  }

  /// for search filter
  RxList<GetOldDriver> data = RxList<GetOldDriver>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<GetOldDriver>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesOldDriverListModel!.getOldDriver!;
    } else {
      finalResult = getfrenchiesOldDriverListModel!.getOldDriver!
          .where((element) => element.driverName
          .toString()
          .toLowerCase()
          .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }
  @override
  void onInit() {
    frenchiesOldDriverList();
    driverNameController = TextEditingController();
    vehicleNameController = TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }
  String? validDriver(String value) {
    if (value.length < 1) {
      return "enter Driver Name";
    }
    return null;
  }
  String? validVehicleNo(String value) {
    if (value.length < 1) {
      return "enter Vehicle number";
    }
    return null;
  }
  void checkFranchisesOldDriver(id) {
    if (franchisesOldDriverUpdateformkey.currentState!.validate()) {
      frenchiesOldDriverUpdate(id);
      Timer(const Duration(seconds: 4), () => frenchiesOldDriverList());
      Get.back();
    }
    franchisesOldDriverUpdateformkey.currentState!.save();
  }
}