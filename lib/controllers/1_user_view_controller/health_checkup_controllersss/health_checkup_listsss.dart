import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

//import '../../../model/1_user_model/health_checkup_list/health_checkup_list.dart';
//import '../../../model/1_user_model/health_chekup_list_views/health_checkup_list_views.dart';

class HealthCheckupController extends GetxController {
  RxBool isLoading = true.obs;

  HealthCheckupListss? healthCheckupListss;

  void labListApi() async {
    isLoading(true);
    healthCheckupListss = await ApiProvider.LabHistoryApi();
    print('Prince lab list');
    print(healthCheckupListss);
    if (healthCheckupListss?.healthCheckupList != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //foundCheckupcenter.value = healthCheckupListss!.healthCheckupList!;
      //Get.to(()=>Container());
    }
  }

  void HealthcheckupApi() async {
    isLoading(true);
    healthCheckupListss = await ApiProvider.HealthcheckuplistApi();
    print('Prince lab list');
    print(healthCheckupListss);
    if (healthCheckupListss?.healthCheckupList != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundCheckupcenter.value = healthCheckupListss!.healthCheckupList!;
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    labListApi();
    HealthcheckupApi();
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


  RxList<HealthCheckupList> foundCheckupcenter = RxList<HealthCheckupList>([]);
  void filterCheckupcenter (String searchlabName) {
    List<HealthCheckupList>? finalResult = [];
    if (searchlabName.isEmpty) {
      finalResult = healthCheckupListss!.healthCheckupList;
    }else {
      finalResult = healthCheckupListss!.healthCheckupList?.where((element) => element.labName
          .toString().toLowerCase().contains(searchlabName.toString().toLowerCase().trim())
      ).toList();
    }
    print(finalResult?.length);
    foundCheckupcenter.value = foundCheckupcenter;
  }



}

///todo from here checkout model value..............
