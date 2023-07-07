import 'package:get/get.dart';

import '../../model/3_driver_controllers_RRR/driver_booking_history_model.dart';
import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/driver/driver_booking_history_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverBookingHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  DriverBookingHistoryModel? getDriverBookingHistory;
  void driverBookingHistoryApi() async {
    isLoading(true);
    getDriverBookingHistory = await ApiProvider.DriverBookingHistory();
    if (getDriverBookingHistory?.bookingHistory != null) {
      isLoading(false);
      foundhistorydriver.value = getDriverBookingHistory!.bookingHistory!;
    }
  }

  @override
  void onInit() {
    driverBookingHistoryApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxList<BookingHistory> foundhistorydriver = RxList<BookingHistory>([]);
  void filterdriverhistory(String searchhistorydriverName) {
    List<BookingHistory>? finalResult = [];
    if (searchhistorydriverName.isEmpty) {
      finalResult = getDriverBookingHistory!.bookingHistory!;
    } else {
      finalResult = getDriverBookingHistory!.bookingHistory!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(
                  searchhistorydriverName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    foundhistorydriver.value = finalResult!;
  }
}
