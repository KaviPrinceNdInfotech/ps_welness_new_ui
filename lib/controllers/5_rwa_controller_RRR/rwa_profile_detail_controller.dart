import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/5_RWA_controller_RRR/rwa_profile_detail_model.dart';

import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/RWA/rwa_profile_detail_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class RwaProfileDetailController extends GetxController{
  RxBool isLoading = false.obs;
  RwaProfileDetailModel? getRwaProfileDetail;

  void RwaProfileDetailApi() async {
 getRwaProfileDetail  = await ApiProvider.RWAProfileDetailApi();
 if(getRwaProfileDetail?.rwaProfileDetails != null){
   isLoading(false);
 }
  }
  @override
  void onInit() {
    RwaProfileDetailApi();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}