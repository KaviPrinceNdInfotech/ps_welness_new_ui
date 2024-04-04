import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesDoctorDetail_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrenchiesDoctorDetailController extends GetxController {
  RxBool isLoading = true.obs;
  FrenchiesDoctorDetailModel? getfrenchiesDoctorDetailModel;

  Future<void> FrenchiesDoctorDetailApi() async {
    isLoading(true);
    getfrenchiesDoctorDetailModel =
        await ApiProvider.FrenchiesDoctorDetailApi();
    if (getfrenchiesDoctorDetailModel?.doctorRegDetail != null) {
      isLoading(false);

      ///for search filter
      data.value = getfrenchiesDoctorDetailModel!.doctorRegDetail!;
    }
  }

  @override
  void onInit() {
    FrenchiesDoctorDetailApi();
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
  RxList<DoctorRegDetail> data = RxList<DoctorRegDetail>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<DoctorRegDetail>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesDoctorDetailModel!.doctorRegDetail!;
    } else {
      finalResult = getfrenchiesDoctorDetailModel!.doctorRegDetail!
          .where((element) => element.doctorName
              .toString()
              .toLowerCase()
              .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }
}
