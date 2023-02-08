import 'package:get/get.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

import '../../../model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';

class HealthCheckupController extends GetxController {
  RxBool isLoading = true.obs;

  HealthCheckupListss? healthCheckupListss;

  void labListApi() async {
    isLoading(true);
    healthCheckupListss = await ApiProvider.LabHistoryApi();
    print('Prince lab list');
    print(healthCheckupListss);
    if (healthCheckupListss != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    labListApi();
  }

  @override
  void onClose() {
    healthCheckupListss = null;
    super.onClose();
  }

  @override
  void dispose() {
    healthCheckupListss = null;
    super.dispose();
  }
}

///todo from here checkout model value..............
