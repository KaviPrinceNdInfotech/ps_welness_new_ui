import 'package:get/get.dart';
//import 'package:ps_welness/model/1_user_model/lab_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

import '../../../servicess_api/api_services_all_api.dart';
import '../lab_list_models.dart';

class HealthCheckupListController extends GetxController {
  RxBool isLoading = true.obs;

  LabListUser? labListUser;

  void labListApi() async {
    isLoading(true);
    labListUser = await ApiProvider.LabHistoryApi();
    print('Prince lab list');
    print(labListUser);
    if (labListUser != null) {
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
    labListUser = null;
    super.onClose();
  }

  @override
  void dispose() {
    labListUser = null;
    super.dispose();
  }
}

///todo from here checkout model value..............
