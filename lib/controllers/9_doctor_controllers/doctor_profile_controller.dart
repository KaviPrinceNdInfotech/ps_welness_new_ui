import 'package:get/get.dart';

import '../../model/9_doctors_model/doctor_profile_model.dart';
import '../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/9_doctors_model/doctor_profile_model.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class DoctorProfileControllers extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;

  void toggle(int index) => selectedIndex.value = index;

  DoctorProfile? doctorProfile;

  //all catagary list .........

  void doctorprofileApi() async {
    isLoading(true);
    doctorProfile = await ApiProvider.DoctorProfileApi();
    if (doctorProfile != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
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
