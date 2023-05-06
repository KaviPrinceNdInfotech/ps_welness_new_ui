import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/3_driver_controllers_RRR/driver_payout_history_model.dart';

import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/driver/driver_payout_history_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverPayoutHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  List<DriverPayoutHistoryModel>? getDriverPayoutHistory;
  void driverPayoutHistoryApi() async {
    isLoading(true);
    getDriverPayoutHistory = await ApiProvider.DriverPayoutHistoryApi();
    if (getDriverPayoutHistory != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    driverPayoutHistoryApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
