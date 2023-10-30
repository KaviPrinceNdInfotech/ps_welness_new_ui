import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_booking_history.dart';

import '../../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverUserPaymentHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  // List<DriverPaymentHistory>? getDriverPaymentHistory;
  AmbulanceUserPaymentHistory? getuserambulancehistory;

  void driveruserPaymentHistoryApi() async {
    isLoading(true);
    getuserambulancehistory = await ApiProvider.DriverUserPaymentHistory();
    if (getuserambulancehistory != null) {
      isLoading(false);
      founduserpaymenthistorydriver.value =
          getuserambulancehistory!.driverDetails!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    driveruserPaymentHistoryApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RxList<DriverDetail> founduserpaymenthistorydriver = RxList<DriverDetail>([]);
  void filterdriverpaymenthistory(String searchpaymenthistoryuserdriverName) {
    List<DriverDetail>? finalResult = [];
    if (searchpaymenthistoryuserdriverName.isEmpty) {
      finalResult = getuserambulancehistory!.driverDetails!;
    } else {
      finalResult = getuserambulancehistory!.driverDetails!
          .where((element) => element.driverName
              .toString()
              .toLowerCase()
              .contains(searchpaymenthistoryuserdriverName
                  .toString()
                  .toLowerCase()
                  .trim()))
          .toList();
    }
    print(finalResult!.length);
    founduserpaymenthistorydriver.value = finalResult!;
  }
}
