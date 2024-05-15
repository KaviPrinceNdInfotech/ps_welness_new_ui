import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model_RRR/doctor_profile_model.dart';

import '../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/9_doctors_model/doctor_profile_model.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class DoctorProfileControllers extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;

  void toggle(int index) => selectedIndex.value = index;

  DoctorProfileDetail? doctorProfile;

  //all catagary list .........

  Future<void> doctorprofileApi() async {
    isLoading(true);
    doctorProfile = await ApiProvider.DoctorProfileDetailApi();
    if (doctorProfile?.doctorName != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    doctorprofileApi();
  }

  @override
  void dispose() {
    Get.delete<DoctorProfileControllers>();
    super.dispose();
  }
}
