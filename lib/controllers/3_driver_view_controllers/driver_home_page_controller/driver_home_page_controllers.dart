import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/banner_image_model/banner_get_api.dart';

import '../../../../servicess_api/api_services_all_api.dart';

class DriverHomepagContreoller extends GetxController {
  RxBool isLoading = true.obs;
  String MedicineId = "";
  var cartId = "";

  BannerListModel? banerlistmodel;

  //crusial slider banner api..........

  void sliderBannerApi() async {
    isLoading(true);
    banerlistmodel = await ApiProvider.getbannerdriverApi();
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
