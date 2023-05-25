import 'package:get/get.dart';

import '../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_bannerModel.dart';
import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/chemist_model/chemist_bannerModel.dart';
//import 'package:ps_welness_new_ui/model/chemist_model/chemist_order_historyModel.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class ChemistBannerController extends GetxController {
  RxBool isLoading = false.obs;
  ChemistBannerModel? getChemistBannerModel;

  void chemistBannerApi() async {
    getChemistBannerModel = await ApiProvider.ChemistBannnerApi();
    if (getChemistBannerModel?.bannerImageList != null) {}
  }

  @override
  void onInit() {
    chemistBannerApi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
