import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesRWADetail_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class FrenchiesRWADetailController extends GetxController{
  RxBool isLoading = false.obs;
  FrenchiesRwaDetailModel? getfrenchiesRWADetailModel;

  void frenchiesRWADetailApi()async{
    isLoading(true);
    getfrenchiesRWADetailModel = await ApiProvider.FrenchiesRWADetailApi();
    if(getfrenchiesRWADetailModel?.rwaRegDetail != null){
      isLoading(false);
      ///for search filter
      data.value = getfrenchiesRWADetailModel!.rwaRegDetail!;
    }
  }
  void frenchiesDeleteRWADetailApi(int id)async{
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesDeleteRWADetailApi(id);
  }
  void frenchiesEditRWADetailapi(id,String name,String phone,String mobile,String email,String location,String c_number)async{
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesEditRWADetail(id, name,phone,mobile,email,location,c_number);
    if(r.statusCode == 200){
      isLoading(false);
    }
  }
  /// for search filter
  RxList<RwaRegDetail> data = RxList<RwaRegDetail>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<RwaRegDetail>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesRWADetailModel!.rwaRegDetail!;
    } else {
      finalResult = getfrenchiesRWADetailModel!.rwaRegDetail!
          .where((element) => element.authorityName
          .toString()
          .toLowerCase()
          .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }
  @override
  void onInit() {
    frenchiesRWADetailApi();
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