import 'package:get/get.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../../model/1_user_model/medicine_checkout/medicine_checkout_model.dart';

class NurseCheckoutController extends GetxController {
  RxInt selectedIndex = 0.obs;
  var newpickedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;

  // late TextEditingController appointmentController,
  //     nurseidController;

  NurseCheckoutModel? nurseCheckoutModel;

  ///todo from here we have get nurse checkout by location id...
  void nursecheckoutApi() async {
    //isLoading(true);
    nurseCheckoutModel = await ApiProvider.NursecheckoutApi();
    print('Prince doctor list');
    print(nurseCheckoutModel);
    if (
        //nurseappointmentdetail?.result != nulla
        nurseCheckoutModel != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    nursecheckoutApi();
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
