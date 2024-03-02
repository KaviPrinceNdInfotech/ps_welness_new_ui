import 'package:get/get.dart';

//import 'package:ps_welness_new_ui/model/driver/driver_profile_detail_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../model/3_driver_controllers_RRR/driver_profile_detail_model.dart';
import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class DriverProfileDetailController extends GetxController {
  RxBool isLoading = true.obs;
  //List<DriverProfileDetailModel>? getDriverProfileDetail;
  DriverProfileDetailModel? getDriverProfileDetail;

  Future<void> driverProfileDetailApi() async {
    isLoading(true);
    getDriverProfileDetail = await ApiProvider.DriverProfileDetailApi();
    if (getDriverProfileDetail != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    driverProfileDetailApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
