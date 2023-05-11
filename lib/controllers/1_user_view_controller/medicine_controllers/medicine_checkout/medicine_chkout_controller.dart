import 'package:get/get.dart';

import '../../../../model/1_user_model/medicine_checkout/medicine_original_chekout.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class CheckoutMedicineController extends GetxController {
  RxBool isLoading = true.obs;

  String addressid = '';

  //AdressbyidModel? getaddressbyid;
  CheckoutmedicineModel? medicinecheckoutModel;

  // void addressidApi() async {
  //   isLoading(true);
  //
  //   getaddressbyid = await ApiProvider.getaddressIdApi(addressid.toString());
  //   if (getaddressbyid != null) {
  //
  //     Get.to(() => TotalPrice());
  //     isLoading(false);
  //
  //     //Get.to(()=>Container());
  //   }
  // }

  ///todo from here checkout model value..............

  void getmedicinecheckoutApi() async {
    isLoading(true);

    medicinecheckoutModel = await ApiProvider.GetMedicineCheckoutApi();
    if (medicinecheckoutModel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);

      //Get.to(()=>Container());
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
