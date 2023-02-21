import 'package:get/get.dart';
//import 'package:ps_welness/model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;

import '../../../../model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
import '../../../../servicess_api/api_services_all_api.dart';


class MedicineCartListController extends GetxController {
  RxBool isLoading = true.obs;
  String MedicineId = "";
  var cartId = "";

  MedicineCartListModel? medicinecartlistmodel;

  void labListApi() async {
    isLoading(true);
    medicinecartlistmodel = await ApiProvider.MedicinecartlistApi();
    print('Prince lab list');
    print(medicinecartlistmodel);
    if (medicinecartlistmodel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  ///add to cart...api................

  //var Id = '';

  void addtocartApi(MedicineId,Quantity) async {
    //CallLoader.loader();
    isLoading(true);
    http.Response r = await ApiProvider.Addtocartmedicineapi(MedicineId,Quantity,);


      if (r.statusCode == 200 || r.statusCode != 200) {
        labListApi();
        ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
        Get.to(
              () => MedicineCart(
                  cartId: 88, medicineId: MedicineId,
                  medicineName: "nm123", quantity: Quantity,
                  brandName: 'asd', unitPrice:12.0, totalPrice: 432.0
              ), //next page class
          duration: Duration(
              milliseconds: 300), //duration of transitions, default 1 sec
          transition:
          // Transition.leftToRight //transition effect
          // Transition.fadeIn
          //Transition.size
          Transition.zoom,
        );

        //CallLoader.hideLoader();
        //isLoading(false);
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

  @override
  void onInit() {
    super.onInit();
    labListApi();
  }

  @override
  void onClose() {

    medicinecartlistmodel = null;

    super.onClose();
  }

  @override

  void dispose() {

    medicinecartlistmodel = null;

    super.dispose();
  }
}

///todo from here checkout model value..............
