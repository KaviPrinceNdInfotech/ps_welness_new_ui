import 'package:get/get.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../model/1_user_model/doctor_checkout_model/doctor_checkout_modell.dart';

class DoctorCheckoutController extends GetxController {
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;
  // late TextEditingController appointmentController,
  //     nurseidController;

  DoctorCheckoutModel? doctorCheckoutModel;

  ///todo from here we have get nurse checkout by location id...
  Future<void> doctoorcheckoutApi() async {
    //isLoading(true);
    doctorCheckoutModel = await ApiProvider.DoctoercheckoutApi();
    print('Prince doctor list');
    print(doctorCheckoutModel);
    if (
        //nurseappointmentdetail?.result != null
        //doctorCheckoutModel!.doctorName!.isNotEmpty
        doctorCheckoutModel?.doctorName != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    doctoorcheckoutApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TextEditingController.dispose();
  }
}
