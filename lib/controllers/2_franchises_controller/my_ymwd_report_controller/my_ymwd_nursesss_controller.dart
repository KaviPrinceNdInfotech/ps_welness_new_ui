import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDNurseReportApi_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class YmwdnursesssController extends GetxController {
  final GlobalKey<FormState> ymwdnursessformkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  Rx<String?> selectedTerm = (null as String?).obs;
  RxList<String> terms = <String>[].obs;
  FrenchiesYmdwNurseModel? getfrenchiesYmdwNurseModel;
 void frenchiesYMWDNurseReportApi(String role)async{
   isLoading(true);
   getfrenchiesYmdwNurseModel = await ApiProvider.FrenchiesYMWDNurseReportApi(role);
   if(getfrenchiesYmdwNurseModel?.nurseYmwdReport != null){
    isLoading(false);
    ///for search filter
    data.value = getfrenchiesYmdwNurseModel!.nurseYmwdReport!;
   }
 }
 /// search filter
  RxList<NurseYmwdReport> data = RxList<NurseYmwdReport>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<NurseYmwdReport>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesYmdwNurseModel!.nurseYmwdReport!;
    } else {
      finalResult = getfrenchiesYmdwNurseModel!.nurseYmwdReport!
          .where((element) => element.nurseName
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
    frenchiesYMWDNurseReportApi('');
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
  }
}
