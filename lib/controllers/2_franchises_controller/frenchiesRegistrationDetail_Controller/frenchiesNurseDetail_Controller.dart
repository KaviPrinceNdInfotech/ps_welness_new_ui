import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesNurseDetails_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrenchiesNurseDetailController extends GetxController {
  RxBool isLoading = false.obs;
  FrenchiesNurseDetailModel? getfrenchiesNurseDetailModel;
  void frenchiesNurseDetailApi() async {
    isLoading(true);
    getfrenchiesNurseDetailModel = await ApiProvider.FrenchiesNurseDetailApi();
    if (getfrenchiesNurseDetailModel?.nurseRegDetail != null) {
      isLoading(false);

      ///for search filter
      data.value = getfrenchiesNurseDetailModel!.nurseRegDetail!;
    }
    isLoading(false);
  }

  void frenchiesDeleteNurseDetailApi(id) async {
    isLoading(true);
    http.Response r = ApiProvider.FrenchiesDeleteNurseDetailApi(id);
    if (r.statusCode == 200) {
      isLoading(false);
    }
  }

  void frenchiesEditNurseDetailapi(id, String name, String nurseType,
      String mobile, String email, String location, String c_number) async {
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesEditNurseDetail(
        id, name, mobile, email, location, c_number);
    if (r.statusCode == 200) {
      frenchiesNurseDetailApi();
      //onInit();
      isLoading(false);
    }
  }

  /// for search filter
  RxList<NurseRegDetail> data = RxList<NurseRegDetail>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<NurseRegDetail>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesNurseDetailModel!.nurseRegDetail!;
    } else {
      finalResult = getfrenchiesNurseDetailModel!.nurseRegDetail!
          .where((element) => element.nurseName
              .toString()
              .toLowerCase()
              .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }

  @override
  void onInit() {
    frenchiesNurseDetailApi();
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
