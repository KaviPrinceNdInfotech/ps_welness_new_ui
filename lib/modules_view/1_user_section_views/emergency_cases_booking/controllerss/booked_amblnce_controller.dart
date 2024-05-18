import 'package:get/get.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/emergency_cases_booking/model_emergency/comin_emgy_driver_model.dart';

import '../../../../servicess_api/api_services_all_api.dart';

class CommingemergencyDriverController extends GetxController {
  RxBool isLoading = true.obs;
  //List<DriverProfileDetailModel>? getDriverProfileDetail;
  EmergencyComingDriver? getDriveremrgencyDetail;

  Future<void> drivercominguseremrgencyDetailApi() async {
    isLoading(true); // Start loading

    try {
      // Await the API call properly
      getDriveremrgencyDetail =
          await ApiProvider.ComingDriverEmergencyUserApi();

      // Check if driverName is null
      if (getDriveremrgencyDetail?.driverName == null) {
        isLoading(false); // Stop loading if driverName is null
      }
    } catch (e) {
      print("Error: $e");
    }

    isLoading(false); // Stop loading after API call (whether successful or not)
  }

  @override
  void onInit() {
    drivercominguseremrgencyDetailApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
