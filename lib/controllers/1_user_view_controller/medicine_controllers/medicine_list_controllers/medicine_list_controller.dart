import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';

import '../../../../model/1_user_model/medicine_list_model/medicine_list_models.dart';
import '../../../../modules_view/1_user_section_views/medicine_view/medicine_cart_section/medicine_cart_sections.dart';
import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
//import 'package:ps_welness/model/1_user_model/medicine_list_model/medicine_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';

class MedicineListController extends GetxController {
  MedicineCartListController _medicineCartListController =
      Get.put(MedicineCartListController());
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

  void addtocartMedicineApi(var Id) async {
    //CallLoader.loader();
    isLoading(true);
    http.Response r = await ApiProvider.AddToCartMedicineApi(Id);

    if (r.statusCode == 200 || r.statusCode != 200) {
      _medicineCartListController.update();
      _medicineCartListController.cartmdedicineListApi();
      _medicineCartListController.refresh();

      ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
      Get.off(
        () => MedicineCart(), //next page class
        duration: Duration(
            milliseconds: 400), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );
    }
  }

  ///increment plus add to cart......post api........

  void medicinepluscartApi(var Id) async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.AddToCartPlusMedicineApi(Id);

    if (r.statusCode == 200) {
      _medicineCartListController.cartmdedicineListApi();
      CallLoader.hideLoader();

      //Get.to(() => Cartproducts());
    }
  }

  ///minus add to cart......post api........

  void medicineminuscartApi(var Id) async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.AddToCartMinusMedicineApi(Id);

    if (r.statusCode == 200) {
      _medicineCartListController.cartmdedicineListApi();
      CallLoader.hideLoader();

      //Get.to(() => Cartproducts());
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
      finalResults = medicinelistmodel!.data
          .where((element) =>
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
