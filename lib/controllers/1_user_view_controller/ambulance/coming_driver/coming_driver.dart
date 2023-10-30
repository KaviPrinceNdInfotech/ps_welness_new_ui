import 'package:get/get.dart';

import '../../../../model/1_user_model/ambulance/coming_driver_user.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class CommingDriverController extends GetxController {
  RxBool isLoading = true.obs;
  //List<DriverProfileDetailModel>? getDriverProfileDetail;
  AmbulanceComingUser? getDrivercomingDetail;

  void drivercominguserDetailApi() async {
    isLoading(false);
    getDrivercomingDetail = await ApiProvider.ComingDriverDetailUserApi();
    if (getDrivercomingDetail?.driverName == null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    drivercominguserDetailApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
