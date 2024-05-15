import 'package:get/get.dart';

import '../../../model/1_user_model/ambulance/accepted_driver_models.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import '../../../services/api_services_all_api.dart'; // Corrected import path

class DriverAcceptlistController extends GetxController {
  RxBool isLoading = true.obs;
  DriveracceptModeluser? getDriveracceptDetail;

  Future<void> driveracceptuserDetailApi() async {
    try {
      isLoading(true);
      getDriveracceptDetail = await ApiProvider
          .AcceptDriverDetailUserApi(); // Corrected function call
      if (getDriveracceptDetail?.payableAmount == null) {
        isLoading(false);
      }
    } finally {
      isLoading(
          false); // Ensure loading indicator is set to false regardless of success or failure
    }
  }

  @override
  void onInit() {
    driveracceptuserDetailApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
