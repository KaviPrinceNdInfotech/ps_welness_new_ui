import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesChemistRegistration_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrenchiesChemistDetailController extends GetxController {
  RxBool isLoading = true.obs;
  FrenchiesChemistDetailModel? getfrenchiesChemistDetailModel;
  TextEditingController? chemistName,
      shopName,
      mobile,
      email,
      address,
      gstno,
      licenceno;

  void FrenchiesChemistDetailApi() async {
    //isLoading(true);
    getfrenchiesChemistDetailModel =
        await ApiProvider.FrenchiesChemistDetailApi();
    if (getfrenchiesChemistDetailModel != null) {
      isLoading(true);

      ///for search filter
      data.value = getfrenchiesChemistDetailModel!.chemistRegDetail!;
    }
  }

  void FrenchiesDeleteChemistDetailApi(int id) async {
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesDeleteChemistDetail(id);
    if (r.statusCode == 200) {
      isLoading(false);
    }
  }

  void FrenchiesEditChemistDetailapi(
      id,
      String chemistName,
      String shop,
      String mobile,
      String email,
      String location,
      String gst,
      String licence) async {
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesEditChemistDetail(
        id, chemistName, shop, mobile, email, location, gst, licence);
    if (r.statusCode == 200) {
      isLoading(false);
    }
  }

  /// for search filter
  RxList<ChemistRegDetail> data = RxList<ChemistRegDetail>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<ChemistRegDetail>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesChemistDetailModel!.chemistRegDetail!;
    } else {
      finalResult = getfrenchiesChemistDetailModel!.chemistRegDetail!
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
    FrenchiesChemistDetailApi();
    chemistName = TextEditingController();
    shopName = TextEditingController();
    mobile = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    gstno = TextEditingController();
    licenceno = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
