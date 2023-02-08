import 'package:get/get.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

import '../../model/9_doctors_model/patient_list.dart';
import '../../servicess_api/api_services_all_api.dart';

class PatientListController extends GetxController {
  RxBool isLoading = true.obs;

  PatientList? patientList;

  void labListApi() async {
    isLoading(true);
    patientList = await ApiProvider.ViewPatientsListApi();
    print('Prince lab list');
    print(patientList);
    if (patientList != null) {
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
    patientList = null;
    super.onClose();
  }

  @override
  void dispose() {
    patientList = null;
    super.dispose();
  }
}

///todo from here checkout model value..............
