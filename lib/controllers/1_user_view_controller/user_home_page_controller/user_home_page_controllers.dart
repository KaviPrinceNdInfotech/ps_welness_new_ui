import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_type_model.dart';
import 'package:ps_welness_new_ui/model/banner_image_model/banner_get_api.dart';

import '../../../../servicess_api/api_services_all_api.dart';

class UserHomepagContreoller extends GetxController {
  RxBool isLoading = true.obs;
  String MedicineId = "";
  var cartId = "";

  BannerListModel? banerlistmodel;

  // SliderListModel? getsliderbaner;

  // void userbannerApi() async {
  //   isLoading(false);
  //   banerlistmodel = await ApiProvider.getbanneruserApi();
  //   print('Prince lab list');
  //   print(banerlistmodel);
  //   if (banerlistmodel?.bannerImageList != null) {
  //     //Get.to(() => TotalPrice());
  //     isLoading(false);
  //     //Get.to(()=>Container());
  //   }
  // }

  //crusial slider banner api..........
  void sliderBannerApi() async {
    isLoading(false);
    banerlistmodel = await ApiProvider.getbanneruserApi();
    if (banerlistmodel!.bannerImageList.isNotEmpty
        //getsliderbaner!.bannerImageList!.isNotEmpty
        ) {
      isLoading(false);
    }
    // else {
    //   isLoading(false);
    // }
  }

  ///.....................
  Ambulancetype? ambulancetype;

  ///ambulance_detail_api.....................23april....2023.........
  void getambulanceApi() async {
    isLoading(true);
    ambulancetype = await ApiProvider.ViewAmbulanceTypeApi();
    print('Prince lab sedule.........');
    print(ambulancetype);
    if (ambulancetype?.ambulanceT != null) {
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
    sliderBannerApi();
    getambulanceApi();
    //userbannerApi();
  }

  @override
  void onClose() {
    banerlistmodel = null;
    ambulancetype = null;

    super.onClose();
  }

  @override
  void dispose() {
    banerlistmodel = null;
    ambulancetype = null;

    super.dispose();
  }
}

///todo from here checkout model value..............
///
///todo:from here future builder..................................
// Future<List<String>> getData() async {
//   var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
//   var res = await http.get(Uri.parse(url));
//   if (res.statusCode == 200) {
//     var data = json.decode(res.body);
//     var rest = data["BannerImageList"];
//     //your json string
//     String jsonString = json.encode(rest);
//     //convert json string to list
//     List<String> newData = List<String>.from(json.decode(jsonString));
//     print("List Size&&&&&&&&&&&&&&&: ${newData}");
//     return newData;
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
