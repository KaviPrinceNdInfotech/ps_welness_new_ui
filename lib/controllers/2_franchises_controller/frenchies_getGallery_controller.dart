import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesGetGallery_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class FrenchiesGetGalleryController extends GetxController{
  RxBool isLoading = true.obs;
  FranchiseGetGalleryModel? getfranchiseGetGalleryModel;

  void FrenchiesGetGalleryApi()async{
    isLoading(true);
    getfranchiseGetGalleryModel = await ApiProvider.FrenchiesGetGalleryApi();
    if(getfranchiseGetGalleryModel?.gallery != null){
      isLoading(false);
      ///for search filter
      data.value = getfranchiseGetGalleryModel!.gallery!;
    }
  }
  void frenchiesDeleteGallery(int id)async{
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesDeleteGallery(id);
    if(r.statusCode == 200){
      isLoading(false);
    }
  }

  /// for search filter
  RxList<Gallery> data = RxList<Gallery>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<Gallery>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfranchiseGetGalleryModel!.gallery!;
    } else {
      finalResult = getfranchiseGetGalleryModel!.gallery!
          .where((element) => element.imageName
          .toString()
          .toLowerCase()
          .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }
  @override
  void onInit() {
   FrenchiesGetGalleryApi();
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }
  @override
  void dispose() {
    super.dispose();
  }

}