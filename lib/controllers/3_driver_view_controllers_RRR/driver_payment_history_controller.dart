import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/3_driver_controllers_RRR/driver_payment_history_model.dart';

import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverPaymentHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  // List<DriverPaymentHistory>? getDriverPaymentHistory;
  List<DriverPaymentHistoryModel>? getDriverPaymentHistory;

  void driverPaymentHistoryApi() async {
    isLoading(true);
    getDriverPaymentHistory = await ApiProvider.DriverPaymentHistory();
    if (getDriverPaymentHistory != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    driverPaymentHistoryApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
