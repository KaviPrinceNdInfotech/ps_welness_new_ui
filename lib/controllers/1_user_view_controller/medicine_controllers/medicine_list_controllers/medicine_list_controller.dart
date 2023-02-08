import 'package:get/get.dart';

import '../../../../model/1_user_model/medicine_list_model/medicine_list_models.dart';
import '../../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
//import 'package:ps_welness/model/1_user_model/medicine_list_model/medicine_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';


class MedicineListController extends GetxController {
  RxBool isLoading = true.obs;

  MedicineList? medicinelistmodel;

  void medicineListApi() async {
    isLoading(true);
    medicinelistmodel = await ApiProvider.MedicinelistApi();
    print('Prince lab list');
    print(medicinelistmodel);
    if (medicinelistmodel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }




  @override
  void onInit() {
    super.onInit();
    medicineListApi();
  }

  @override
  void onClose() {
    medicinelistmodel = null;
    super.onClose();
  }

  @override
  void dispose() {
    medicinelistmodel = null;
    super.dispose();
  }
}

///todo from here checkout model value..............
