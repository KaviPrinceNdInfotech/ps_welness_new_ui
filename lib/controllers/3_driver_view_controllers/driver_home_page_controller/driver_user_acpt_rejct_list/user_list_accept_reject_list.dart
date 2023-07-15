import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/3_driver_controllers_RRR/user_list_booking_driver/user_list_booking_driver_controller.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../utils/services/account_service.dart';

//import 'package:intl/intl.dart';

class UseracptrejectController extends GetxController {
  RxBool isLoading = true.obs;
  UserListModeldriver? userListModeldriver;

  void driveracceptrejctlistApi() async {
    isLoading(true);
    userListModeldriver = await ApiProvider.UserListUserrApi();
    if (userListModeldriver?.userListForBookingAmbulance != null) {
      isLoading(false);
    }
  }

  ///todo: accept driver booking................
  void acceptbookingdriverApi() async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.AcceptrequestdriverApi();

    if (r.statusCode == 200) {
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 500),
          () {
            // _viewhealthchkpreviewController.healthreviewratingApi();
            //_viewhealthchkpreviewController.update();
            // Get.snackbar(
            //     'Add review Successfully', "Review Submitted. Thank-you."
            //   // "${r.body}"
            // );
            //Get.to(() => CheckupSchedulePage());
            //Get.to((page))
            ///
          },
        );
      });
      CallLoader.hideLoader();
    } else {
      //CallLoader.hideLoader();
    }
  }

  ///todo: Reject driver booking................
  void rejectbookingdriverApi() async {
    ///CallLoader.loader();
    http.Response r = await ApiProvider.RejectrequestdriverApi();

    if (r.statusCode == 200) {
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 500),
          () {
            // _viewhealthchkpreviewController.healthreviewratingApi();
            //_viewhealthchkpreviewController.update();
            // Get.snackbar(
            //     'Add review Successfully', "Review Submitted. Thank-you."
            //   // "${r.body}"
            // );
            //Get.to(() => CheckupSchedulePage());
            //Get.to((page))
            ///
          },
        );
      });
      CallLoader.hideLoader();
    } else {
      //CallLoader.hideLoader();
    }
  }

  @override
  void onInit() {
    super.onInit();
    driveracceptrejctlistApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TextEditingController.dispose();
  }

//bool disableDate(DateTime day) {
//   if ((day.isAfter(DateTime.now().subtract(Duration(days: 4))) &&
//       day.isBefore(DateTime.now().add(Duration(days: 30))))) {
//     return true;
//   }
//   return false;
// }
}
