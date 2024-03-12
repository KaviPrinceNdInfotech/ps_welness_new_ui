import 'package:get/get.dart';

import '../../../model/10_lab_module/lab_profile_detail_model/profile_details_model.dart';
import '../../../servicess_api/api_services_all_api.dart';

class LabprofiledetailController extends GetxController {
  RxBool isLoading = true.obs;

  LabprofileModel? labprofileModel;

  Future<void> labprofileApi() async {
    isLoading(true);
    labprofileModel = await ApiProvider.LabprofiledetailApi();
    if (labprofileModel != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  var appointment = ''.obs;

  @override
  void onInit() {
    super.onInit();
    labprofileApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    //TextEditingController.dispose();
  }
}
