import 'package:get/get.dart';

import '../../../model/1_user_model/lab_list_models.dart';
import '../../../model/9_doctors_model/get_doctor_list_model/get_doctorlist_model.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/lab_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class DoctorListController extends GetxController {
  RxBool isLoading = true.obs;

  GetDoctorListModel? doctorListUser;

  void doctorListApi() async {
    isLoading(true);
    doctorListUser = await ApiProvider.ViewDoctorListApi();
    print('Prince doctor list');
    print(doctorListUser);
    if (doctorListUser != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    doctorListApi();
  }

  @override
  void onClose() {
    doctorListUser = null;
    super.onClose();
  }

  @override
  void dispose() {
    doctorListUser = null;
    super.dispose();
  }
}

///todo from here checkout model value..............
