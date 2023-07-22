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
      foundpaymenthistorydriver.value = getDriverPaymentHistory!;
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

  RxList<DriverPaymentHistoryModel> foundpaymenthistorydriver =
      RxList<DriverPaymentHistoryModel>([]);
  void filterdriverpaymenthistory(String searchpaymenthistorydriverName) {
    List<DriverPaymentHistoryModel>? finalResult = [];
    if (searchpaymenthistorydriverName.isEmpty) {
      finalResult = getDriverPaymentHistory!;
    } else {
      finalResult = getDriverPaymentHistory!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchpaymenthistorydriverName
                  .toString()
                  .toLowerCase()
                  .trim()))
          .toList();
    }
    print(finalResult!.length);
    foundpaymenthistorydriver.value = finalResult!;
  }
}
