import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesBanner_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrenchiesBannerController extends GetxController{
  RxBool isLoading = true.obs;
  FrenchiesBannerApiMode? getfrenchiesBannerApi;
  void FrenchiesBannerApi()async{
    isLoading(true);
    var prefs = GetStorage();
   var Id = prefs.read("Id").toString();
    print("Rahul%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5: ${Id}");
    getfrenchiesBannerApi = await ApiProvider.FrenchiesBannnerApi(Id);
    if(getfrenchiesBannerApi?.bannerImageList != null){
      isLoading(false);
    }
  }
  @override
  void onInit() {
    FrenchiesBannerApi();
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }
}