import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';

import '../../../../model/1_user_model/medicine_list_model/medicine_list_models.dart';
import '../../../../modules_view/1_user_section_views/medicine_view/medicine_cart_section/medicine_cart_sections.dart';
import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';
import '../../../../utils/services/account_service.dart';
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
    if (medicinelistmodel == null) {
      Timer(
        const Duration(seconds: 2),
        () {
          //Get.to(() => MedicineCart());
          //Get.to((page))
          ///
        },
      );
      isLoading(true);
      medicinelistmodel = await ApiProvider.MedicinelistApi();
      //Get.to(() => TotalPrice());

      foundProducts.value = medicinelistmodel!.data;
      //Get.to(()=>Container());
    }
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
    // isLoading(true);
    http.Response r = await ApiProvider.AddToCartMedicineApi(Id);

    if (r.statusCode == 200 || r.statusCode != 200) {
      //CallLoader.hideLoader();

      CallLoader.loader();

      _medicineCartListController.update();
      _medicineCartListController.cartmdedicineListApi();
      _medicineCartListController.refresh();
      _medicineCartListController.onInit();

      ///_medicineCartListController.onInit();

      ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
      // Get.to(
      //   () => MedicineCart(), //next page class
      //   duration: Duration(
      //       milliseconds: 400), //duration of transitions, default 1 sec
      //   transition:
      //       // Transition.leftToRight //transition effect
      //       // Transition.fadeIn
      //       //Transition.size
      //       Transition.zoom,
      // );
      //CallLoader.loader();
      //await Future.delayed(Duration(milliseconds: 900));

      //Get.to(() => MedicineCart());

      ///from here we can go to next screen with some time ....
      accountService.getAccountData.then((accountData) async {
        await Timer(
          const Duration(seconds: 1),
          () {
            Get.to(() => MedicineCart());
            //Get.to((page))
            ///
          },
        );
      });
      CallLoader.hideLoader();
      if (r.statusCode == 200) {
        Get.snackbar("Success", "Item Added Successfully");
      } else {
        CallLoader.hideLoader();
        Get.snackbar("Failed", "Item Already Added");
      }
    } else {
      CallLoader.hideLoader();
      //Get.snackbar("Failed", "Item Already Added");
    }
  }

  ///increment plus add to cart......post api........

  void medicinepluscartApi(var Id) async {
    isLoading(true);
    //CallLoader.loader();
    http.Response r = await ApiProvider.AddToCartPlusMedicineApi(Id);

    if (r.statusCode == 200 || r.statusCode != 200) {
      //await Future.delayed(Duration(seconds: 1));

      accountService.getAccountData.then((accountData) async {
        await Timer(
          const Duration(seconds: 1),
          () {
            //Get.to(() => MedicineCart());
            //Get.to((page))
            ///
          },
        );
        _medicineCartListController.cartmdedicineListApi();
        _medicineCartListController.update();
        // _medicineCartListController.refresh();
        _medicineCartListController.onInit();
        //CallLoader.loader();
        isLoading(false);
        //CallLoader.hideLoader();
      });
      //cartmdedicineListApi();
      //_medicineCartListController.update();
      // _medicineCartListController.cartmdedicineListApi();

      // CallLoader.hideLoader();
      //Get.to(() => Cartproducts());
    }
  }

  ///minus add to cart......post api........

  void medicineminuscartApi(var Id) async {
    // CallLoader.loader();
    isLoading(true);

    http.Response r = await ApiProvider.AddToCartMinusMedicineApi(Id);
    if (r.statusCode == 200 || r.statusCode != 200) {
      await Future.delayed(Duration(milliseconds: 100));

      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 500),
          () {
            // Get.to(() => MedicineCart());
            //Get.to((page))
            ///
          },
        );
        _medicineCartListController.cartmdedicineListApi();
        _medicineCartListController.update();
        _medicineCartListController.refresh();
        _medicineCartListController.onInit();
        //CallLoader.hideLoader();
        isLoading(false);
      });

      // _medicineCartListController.update();
      // _medicineCartListController.cartmdedicineListApi();

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
    Get.delete<MedicineListController>();

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
