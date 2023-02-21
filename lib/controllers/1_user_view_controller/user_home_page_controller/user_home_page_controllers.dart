import 'package:get/get.dart';
//import 'package:ps_welness/model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/banner_image_model/banner_get_api.dart';

import '../../../../model/1_user_model/medicine_cart_list_model/medicine_cart_list_models.dart';
import '../../../../servicess_api/api_services_all_api.dart';


class UserHomepagContreoller extends GetxController {
  RxBool isLoading = true.obs;
  String MedicineId = "";
  var cartId = "";

  BannerListModel? banerlistmodel;

  void userbannerApi() async {
    isLoading(true);
    banerlistmodel = await ApiProvider.getbanneruserApi();
    print('Prince lab list');
    print(banerlistmodel);
    if (banerlistmodel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      //Get.to(()=>Container());
    }
  }

  ///add to cart...api................

  //var Id = '';



  @override
  void onInit() {
    super.onInit();
    userbannerApi();
  }

  @override
  void onClose() {

    banerlistmodel = null;

    super.onClose();
  }

  @override

  void dispose() {

    banerlistmodel = null;

    super.dispose();
  }
}

///todo from here checkout model value..............
