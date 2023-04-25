import 'package:get/get.dart';

import '../../../../model/1_user_model/medicine_list_model/medicine_list_models.dart';
import '../../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
//import 'package:ps_welness/model/1_user_model/medicine_list_model/medicine_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';


class MedicineListController extends GetxController {
  RxBool isLoading = true.obs;

  MedicineList? medicinelistmodel;
  @override
  void onInit() {

    medicineListApi();

    super.onInit();
  }

  void medicineListApi() async {
    isLoading(true);
    medicinelistmodel = await ApiProvider.MedicinelistApi();
    print('Prince lab list');
    print(medicinelistmodel);
    if (medicinelistmodel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      foundProducts.value = medicinelistmodel!.data;
      //Get.to(()=>Container());
    }
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
  RxList<Datum> foundProducts = RxList<Datum>([]);

  void filterProducts(String searchmedicineName) {
    List<Datum> finalResults = [];
    if (searchmedicineName.isEmpty) {
      finalResults = medicinelistmodel!.data;
    } else {
      finalResults = medicinelistmodel!.data.where((element) =>
      // print(element.productName);
      // print(productName);
      // print(element.productName
      //     .toString()
      //     .toLowerCase()
      //     .contains(productName.toString().toLowerCase().trim()));
      element.medicineName
          .toString()
          .toLowerCase()
          .contains(searchmedicineName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    foundProducts.value = finalResults;
  }
}

///todo from here checkout model value..............
