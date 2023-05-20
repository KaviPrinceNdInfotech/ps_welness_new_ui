import 'package:get/get.dart';
//import 'package:ps_welness/model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;

import '../../../../model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
import '../../../../modules_view/1_user_section_views/medicine_view/medicine_cart_section/medicine_cart_sections.dart';
import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class MedicineCartListController extends GetxController {
  // MedicineCartListController _medicineCartListController =
  // Get.put(MedicineCartListController());
  RxBool isLoading = true.obs;
  String MedicineId = "";
  var cartId = "";

  MedicineCartListModel? medicinecartlistmodel;

  void cartmdedicineListApi() async {
    isLoading(false);
    medicinecartlistmodel = await ApiProvider.MedicinecartlistApi();
    print('Prince medicinr listcart: ${medicinecartlistmodel?.data?.length}');
    print(medicinecartlistmodel);
    if (medicinecartlistmodel != null) {
      //Get.to(() => TotalPrice());

      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  ///add to cart...api........abhibhiaya
  void addtocartApi(MedicineId, Quantity) async {
    //CallLoader.loader();
    isLoading(true);
    http.Response r = await ApiProvider.Addtocartmedicineapi(
      MedicineId,
      Quantity,
    );

    if (r.statusCode == 200 || r.statusCode != 200) {
      CallLoader.hideLoader();
      cartmdedicineListApi();

      ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
      Get.off(
        () => MedicineCart(
            // cartId: 88, medicineId: MedicineId,
            // medicineName: "nm123", quantity: Quantity,
            // brandName: 'asd', unitPrice:12.0, totalPrice: 432.0
            ), //next page class
        duration: Duration(
            milliseconds: 400), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );
      //CallLoader.hideLoader();
      //isLoading(false);
    } else {
      CallLoader.hideLoader();

      Get.snackbar("Failed", "${r.body}");
    }
    //MedicineCart(PatientId: PatientId,MedicineId:MedicineId,Quantity:Quantity);

    ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
    // Get.to(
    //      // () => MedicineCart(medicineId: null, cartId: null,), //next page class
    //   duration: Duration(
    //       milliseconds: 300), //duration of transitions, default 1 sec
    //   transition:
    //   // Transition.leftToRight //transition effect
    //   // Transition.fadeIn
    //   //Transition.size
    //   Transition.zoom,
    // );

    //CallLoader.hideLoader();
    //isLoading(false);
  }

  ///todo: add to cart Medicine api........princecart---10may 2023...

  @override
  void onInit() {
    super.onInit();
    cartmdedicineListApi();
  }

  @override
  void onClose() {
    medicinecartlistmodel != null;

    super.onClose();
  }

  @override
  void dispose() {
    Get.delete<MedicineCartListController>();

    medicinecartlistmodel != null;

    super.dispose();
  }
}

///todo from here checkout model value..............
