import 'package:get/get.dart';

import '../../model/6_chemist_model_RRR/chemist_model_RRR/chemist_profile_detailModel.dart';
import '../../servicess_api/api_services_all_api.dart';
//import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class ChemistProfileDetailController extends GetxController {
  RxBool isLoading = true.obs;
  ChemistProfileDetailModel? getChemistProfileDetailModel;
  void chemistProfileDetailsApi() async {
    isLoading(true);
    getChemistProfileDetailModel = await ApiProvider.chemistProfileDetailApi();
    if (getChemistProfileDetailModel != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    chemistProfileDetailsApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
