import 'package:get/get.dart';

//import 'package:ps_welness_new_ui/model/driver/driver_appoinment_detail_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../model/3_driver_controllers_RRR/driver_appoinment_detail_model.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class DriverAppoinmentDetailController extends GetxController {
  RxBool isLoading = true.obs;
  List<DriverAppoinmentDetailModel>? getDriverAppointmentDetail;

  void driverAppointmentDetailApi() async {
    isLoading(true);
    getDriverAppointmentDetail = await ApiProvider.DriverAppointmentDetails();
    if (getDriverAppointmentDetail?[0].id != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    driverAppointmentDetailApi();
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
