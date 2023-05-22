import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../model/1_user_model/view_doctor_review_ratting/view_doctor_review_ratting.dart';
import '../../../servicess_api/api_services_all_api.dart';
import '../../../utils/services/account_service.dart';

class ViewdoctorreviewController extends GetxController {
  //./f//inal GlobalKey<FormState> NurseBooking2formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  DoctorRatingView? doctorviewreview;

  ///view review ratting controller.....

  var appointment = ''.obs;

  void doctorreviewratingApi() async {
    isLoading(true);
    doctorviewreview = await ApiProvider.ViewDoctorreviewApi();
    if (doctorviewreview?.rating != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      // foundlabviewProducts.value = labviewreport!.labViewReport!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    doctorreviewratingApi();

    accountService.getAccountData.then((accountData) {
      Timer(
        const Duration(seconds: 4),
        () {
          //Get.to((page))
          ///
        },
      );
    });
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
