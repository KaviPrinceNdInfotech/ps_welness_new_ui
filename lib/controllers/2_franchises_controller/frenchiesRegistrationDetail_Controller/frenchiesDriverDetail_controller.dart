import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesDriverDetails_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrenchiesDriverDetailController extends GetxController{
  RxBool isLoading = true.obs;
  FrenchiesDriverDetailModel? getfrenchiesDriverDetailModel;

  void FrenchiesDriverDetailApi()async{
    isLoading(true);
    getfrenchiesDriverDetailModel = await ApiProvider.FrenchiesDriverDetailApi();
    if(getfrenchiesDriverDetailModel?.driverRegDetail != null){
      isLoading(false);
      ///for search filter
      data.value = getfrenchiesDriverDetailModel!.driverRegDetail!;
    }
  }
  @override
  void onInit() {
    FrenchiesDriverDetailApi();
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
  /// for search filter
  RxList<DriverRegDetail> data = RxList<DriverRegDetail>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<DriverRegDetail>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesDriverDetailModel!.driverRegDetail!;
    } else {
      finalResult = getfrenchiesDriverDetailModel!.driverRegDetail!
          .where((element) => element.driverName
          .toString()
          .toLowerCase()
          .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }

}