import 'dart:async';

import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/user_profile_details/user_profile_details.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

//import 'package:ps_welness/model/9_doctors_model/doctor_profile_model.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class UserProfileControllers extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;

  void toggle(int index) => selectedIndex.value = index;

  Userprofilepersonal? userProfile;

  //all catagary list .........

  Future<void> userprofileApi() async {
    isLoading(false);
    userProfile = await ApiProvider.UserProfileApi();
    // if (userProfile == null) {
    //   Timer(
    //     const Duration(seconds: 1),
    //     () {
    //       //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
    //       //Get.to(() => MedicineCart());
    //       //Get.to((page))
    //       ///
    //     },
    //   );
    //   isLoading(true);
    //   userProfile = await ApiProvider.UserProfileApi();
    //   //Get.to(() => TotalPrice());
    //
    //   //foundProducts.value = medicinelistmodel!.data;
    //   //Get.to(()=>Container());
    // }
    if (userProfile?.patientName != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
    isLoading(false);

    //else {}
  }

  @override
  void onInit() {
    super.onInit();
    userprofileApi();
  }

  @override
  void dispose() {
    Get.delete<UserProfileControllers>();
    super.dispose();
  }
}
