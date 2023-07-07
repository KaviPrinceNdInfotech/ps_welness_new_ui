import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesYMWDChemistReportApi_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class YmwdchemisttController extends GetxController {
  final GlobalKey<FormState> ymwdchemisstformkey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  Rx<String?> selectedTerm = (null as String?).obs;
  RxList<String> terms = <String>[].obs;
  FrenchiesYmdwChemistModel? getfrenchiesYmdwChemistModel;
  void frenchiesYMWDChemistReportApi(String role)async{
    isLoading(true);
    getfrenchiesYmdwChemistModel = await ApiProvider.FrenchiesYMWDChemistReportApi(role);
    if(getfrenchiesYmdwChemistModel?.chemistYmwdReport != null){
      isLoading(false);
      ///for search filter
      data.value = getfrenchiesYmdwChemistModel!.chemistYmwdReport!;
    }
  }
  /// for search filter
  RxList< ChemistYmwdReport> data = RxList<ChemistYmwdReport>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List< ChemistYmwdReport>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesYmdwChemistModel!.chemistYmwdReport!;
    } else {
      finalResult = getfrenchiesYmdwChemistModel!.chemistYmwdReport!
          .where((element) => element.chemistName
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
    frenchiesYMWDChemistReportApi('');
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
  }
}
