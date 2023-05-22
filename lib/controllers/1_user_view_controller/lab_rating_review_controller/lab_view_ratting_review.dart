import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../model/lab_review_model/lab_view_review_model.dart';
import '../../../servicess_api/api_services_all_api.dart';
import '../../../utils/services/account_service.dart';

class ViewlabreviewController extends GetxController {
  //./f//inal GlobalKey<FormState> NurseBooking2formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  LabRatingView? labviewreview;

  ///view review ratting controller.....

  var appointment = ''.obs;

  void labreviewratingApi() async {
    isLoading(true);
    labviewreview = await ApiProvider.ViewLabreviewApi();
    if (labviewreview?.rating != null
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
    labreviewratingApi();

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
