import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesLabDetail_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrenchiesLabDetailController extends GetxController {
  RxBool isLoading = false.obs;
  FrenchiesLabDetailModel? getfrenchiesLabDetailModel;

  void frenchiesLabDetailApi() async {
    isLoading(true);
    getfrenchiesLabDetailModel = await ApiProvider.FrenchiesLabDetailApi();
    if (getfrenchiesLabDetailModel?.labRegDetail != null) {
      isLoading(false);

      ///for search filter
      data.value = getfrenchiesLabDetailModel!.labRegDetail!;
    }
    isLoading(false);
  }

  void frenchiesDeleteLabDetailApi(id) async {
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesDeleteLabDetailApi(id);
    if (r.statusCode == 200) {}
  }

  void frenchiesEditLabDetailapi(
      id,
      String name,
      String phone,
      String mobile,
      String email,
      String location,
      String gst,
      String licence,
      String aadhar) async {
    isLoading(true);
    http.Response r = await ApiProvider.FrenchiesEditLabDetail(
        id, name, phone, mobile, email, location, gst, licence, aadhar);
    if (r.statusCode == 200) {
      isLoading(false);
    }
  }

  /// for search filter
  RxList<LabRegDetail> data = RxList<LabRegDetail>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<LabRegDetail>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesLabDetailModel!.labRegDetail!;
    } else {
      finalResult = getfrenchiesLabDetailModel!.labRegDetail!
          .where((element) => element.labName
              .toString()
              .toLowerCase()
              .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }

  @override
  void onInit() {
    frenchiesLabDetailApi();
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
