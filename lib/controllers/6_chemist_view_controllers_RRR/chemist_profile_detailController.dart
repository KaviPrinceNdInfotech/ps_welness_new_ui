import 'package:get/get.dart';

import '../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_profile_detailModel.dart';
import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class ChemistProfileDetailController extends GetxController {
  RxBool isLoading = false.obs;
  ChemistProfileDetailModel? getChemistProfileDetailModel;
  void chemistProfileDetailApi() async {
    getChemistProfileDetailModel = await ApiProvider.chemistProfileDetailApi();
    if (getChemistProfileDetailModel != null) {}
  }

  @override
  void onInit() {
    super.onInit();
    chemistProfileDetailApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
