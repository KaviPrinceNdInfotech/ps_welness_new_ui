import 'package:get/get.dart';

import '../../model/9_doctors_model/view_patient_report_model.dart';
import '../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/9_doctors_model/view_patient_report_model.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class DoctorPatientReportControllers extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;

  void toggle(int index) => selectedIndex.value = index;

  ViewPatientReport? viewPatientReport;

  //all catagary list .........

  void viewpatientreportApi() async {
    isLoading(true);
    viewPatientReport = await ApiProvider.ViewPatientReportsApi();
    if (viewPatientReport != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    viewpatientreportApi();
  }

  @override
  void dispose() {
    Get.delete<DoctorPatientReportControllers>();
    super.dispose();
  }
}
