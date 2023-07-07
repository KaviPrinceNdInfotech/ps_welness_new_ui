import 'package:get/get.dart';

//import 'package:ps_welness_new_ui/model/driver/driver_appoinment_detail_model.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../model/3_driver_controllers_RRR/driver_appoinment_detail_model.dart';
import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class DriverAppoinmentDetailController extends GetxController {
  RxBool isLoading = true.obs;
  DriverAppoinmentDetailModel? getDriverAppointmentDetail;

  void driverAppointmentDetailApi() async {
    isLoading(true);
    getDriverAppointmentDetail = await ApiProvider.DriverAppointmentDetails();
    if (getDriverAppointmentDetail?.appointmentDetail != null) {
      isLoading(false);
      founappointmentdriver.value =
          getDriverAppointmentDetail!.appointmentDetail!;
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

  RxList<AppointmentDetail> founappointmentdriver =
      RxList<AppointmentDetail>([]);
  void filterdriverappointment(String searchappointmentdriverName) {
    List<AppointmentDetail>? finalResult = [];
    if (searchappointmentdriverName.isEmpty) {
      finalResult = getDriverAppointmentDetail!.appointmentDetail!;
    } else {
      finalResult = getDriverAppointmentDetail!.appointmentDetail!
          .where((element) => element.driverName
              .toString()
              .toLowerCase()
              .contains(
                  searchappointmentdriverName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult!.length);
    founappointmentdriver.value = finalResult!;
  }
}
