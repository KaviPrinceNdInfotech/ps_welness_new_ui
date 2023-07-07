import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDLabReportApi_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class YmwdlabbbController extends GetxController {
  final GlobalKey<FormState> ymwdllabformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  ///this is for State....................................
  Rx<String?> selectedTerm = (null as String?).obs;
  RxList<String> terms = <String>[].obs;
  FrenchiesYmdwLabModel? getfrenchiesYmdwLabModel;

  void frenchiesYMDWLabReportApi(String role)async{
    isLoading(true);
    getfrenchiesYmdwLabModel = await ApiProvider.FrenchiesYMWDLabReportApi(role);
    if(getfrenchiesYmdwLabModel?.labYmwdReport != null){
      isLoading(false);
      ///for search filter
      data.value = getfrenchiesYmdwLabModel!.labYmwdReport!;
    }
  }
  /// for search filter
  RxList<LabYmwdReport> data = RxList<LabYmwdReport>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<LabYmwdReport>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesYmdwLabModel!.labYmwdReport!;
    } else {
      finalResult = getfrenchiesYmdwLabModel!.labYmwdReport!
          .where((element) => element.labName
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
    frenchiesYMDWLabReportApi('');
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
  }
}
