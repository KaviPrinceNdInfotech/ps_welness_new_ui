import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesNewDriverList_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;
class FrenchiesNewDriverListController extends GetxController{
  final GlobalKey<FormState> franchisesNewDriverUpdateformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  TextEditingController? driverNameController;
  FrenchiesNewDriverListModel? getfrenchiesNewDriverListModel;
  void frenchiesNewDriverList()async{
    isLoading(true);
    getfrenchiesNewDriverListModel = await ApiProvider.FrenchiesNewDriverListApi();
    if(getfrenchiesNewDriverListModel?.newDriver != null){
      isLoading(false);
      ///for search filter
      data.value = getfrenchiesNewDriverListModel!.newDriver!;
    }
  }
  void frenchiesNewDriverUpdate(id) async{
    http.Response r = await ApiProvider.FrenchiesNewDriverUpdateApi(driverNameController?.text,id);
    if(r.statusCode == 200){
    }
  }
  /// for search filter
  RxList<NewDriver> data = RxList<NewDriver>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<NewDriver>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesNewDriverListModel!.newDriver!;
    } else {
      finalResult = getfrenchiesNewDriverListModel!.newDriver!
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
   frenchiesNewDriverList();
   driverNameController = TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }
  void checkFranchisesNewDriver(id) {
    if (franchisesNewDriverUpdateformkey.currentState!.validate()) {
      frenchiesNewDriverUpdate(id);
      Timer(const Duration(seconds: 4), () => frenchiesNewDriverList());
      Get.back();
    }
    franchisesNewDriverUpdateformkey.currentState!.save();
  }
}