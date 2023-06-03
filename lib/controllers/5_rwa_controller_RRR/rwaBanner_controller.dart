import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/5_RWA_controller_RRR/rwa_banner_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import 'package:ps_welness_new_ui/model/RWA/rwa_banner_model.dart';
//import 'package:ps_welness_new_ui/model/RWA/rwa_payment_report_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

//import '../../model/5_RWA_controller_RRR/rwa_banner_model.dart';
//import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class RwaBannerController extends GetxController {
  RxBool isLoading = true.obs;
  RwaBannerModel? getRwaBannerModel;
  //var appointment = ''.obs;
  void RwaBannerApi() async {
    isLoading(false);
    getRwaBannerModel = await ApiProvider.rwaBannerApi();
    if (getRwaBannerModel!.bannerImageList.isNotEmpty) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    RwaBannerApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    getRwaBannerModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    getRwaBannerModel = null;
    super.dispose();
  }
}
