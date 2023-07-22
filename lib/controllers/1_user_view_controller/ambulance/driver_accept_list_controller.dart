import 'package:get/get.dart';

import '../../../model/1_user_model/ambulance/accepted_driver_models.dart';
import '../../../servicess_api/api_services_all_api.dart';

class DriverAcceptlistController extends GetxController {
  RxBool isLoading = true.obs;
  //List<DriverProfileDetailModel>? getDriverProfileDetail;
  DriveracceptModeluser? getDriveracceptDetail;

  void driveracceptuserDetailApi() async {
    isLoading(false);
    getDriveracceptDetail = await ApiProvider.AcceptDriverDetailUserApi();
    if (getDriveracceptDetail?.driverName == null) {
      isLoading(false);
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
