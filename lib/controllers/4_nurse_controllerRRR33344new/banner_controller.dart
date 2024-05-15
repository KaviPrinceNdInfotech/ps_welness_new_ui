//getbannernurseApi

import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/banner_image_model/banner_get_api.dart';

import '../../../../servicess_api/api_services_all_api.dart';

class NurseBannerContreoller extends GetxController {
  RxBool isLoading = true.obs;
  String MedicineId = "";
  var cartId = "";

  BannerListModel? banerlistmodel;

  //crusial slider banner api..........

  void sliderBannerApi() async {
    isLoading(true);
    banerlistmodel = await ApiProvider.getbannernurseApi();
    if (banerlistmodel!.bannerImageList != null
        //getsliderbaner!.bannerImageList!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  ///add to cart...api................

  //var Id = '';

  @override
  void onInit() {
    super.onInit();
    sliderBannerApi();
    //userbannerApi();
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
