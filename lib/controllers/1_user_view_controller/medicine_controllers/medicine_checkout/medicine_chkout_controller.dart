import 'dart:async';

import 'package:get/get.dart';

import '../../../../model/1_user_model/medicine_checkout/medicine_original_chekout.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class CheckoutMedicineController extends GetxController {
  RxBool isLoading = true.obs;

  String addressid = '';

  CheckoutmedicineModel? medicinecheckoutModel;

  ///todo from here checkout model value..............

  void getmedicinecheckoutApi() async {
    isLoading(true);

    medicinecheckoutModel = await ApiProvider.GetMedicineCheckoutApi();

    if (medicinecheckoutModel?.data?.name == null) {
      Timer(
        const Duration(seconds: 1),
        () {
          //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
          //Get.to(() => MedicineCart());
          //Get.to((page))
          ///
        },
      );
      isLoading(true);
      medicinecheckoutModel = await ApiProvider.GetMedicineCheckoutApi();
      //Get.to(() => TotalPrice());

      //foundProducts.value = medicinelistmodel!.data;
      //Get.to(()=>Container());
    }
    if (medicinecheckoutModel?.data?.name != null) {
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
    getmedicinecheckoutApi();
    // addressidApi();
    super.onInit();
  }

  @override
  void onClose() {
    // getaddressbyid = null;
    medicinecheckoutModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    // getaddressbyid = null;
    medicinecheckoutModel = null;
    super.dispose();
  }
}
