import 'dart:async';

import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/3_driver_controllers_RRR/driver_ongoing_ride_model.dart';

import '../../../servicess_api/api_services_all_api.dart';

class OngoingRideController extends GetxController {
  RxBool isLoading = true.obs;
  //List<DriverProfileDetailModel>? getDriverProfileDetail;
  OngoingRideModel? ongoingRide;

  Future<void> ongoingRideApi() async {
    isLoading(true);

    ongoingRide = await ApiProvider.OngoingRideApiApi();
    if (ongoingRide?.patientName == null) {
      Timer(
        const Duration(seconds: 1),
        () {
          //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
          //Get.to(() => MedicineCart());
          //Get.to((page))
          ///
        },
      );
      isLoading(false);
      ongoingRide = await ApiProvider.OngoingRideApiApi();
    }
    if (ongoingRide?.patientName != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      // accountService.getAccountData.then((accountData) {
      //   Timer(
      //     const Duration(seconds: 1),
      //     () {
      //       Get.to(CheckOutMedicine());
      //       //Get.to((page))
      //       ///
      //     },
      //   );
      // });
    }
  }

  @override
  void onInit() {
    ongoingRideApi();

    ///OngoingRideController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
