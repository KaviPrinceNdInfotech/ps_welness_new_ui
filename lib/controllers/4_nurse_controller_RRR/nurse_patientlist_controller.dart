import 'package:get/get.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

import '../../model/4_nurse_all_models_RRR/nurse_patient_list_model.dart';
//import 'package:ps_welness_new_ui/model/4_nurse_all_models/nurse_patient_list_model.dart';
//import '../../servicess_api/api_services_all_api.dart';

class NursePatientListController extends GetxController {
  RxBool isLoading = true.obs;
  List<NursePatientListModel>? getNursePatientList;

  void nursePatientListApi() async {
    isLoading(true);
    getNursePatientList = await ApiProvider.NursePatientListApi();
    if (getNursePatientList != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    nursePatientListApi();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
