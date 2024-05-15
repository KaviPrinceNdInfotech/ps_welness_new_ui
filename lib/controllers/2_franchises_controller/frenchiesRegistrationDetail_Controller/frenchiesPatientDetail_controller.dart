import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesPatientDetails_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FrenchiesPatientDetailController extends GetxController {
  RxBool isLoading = true.obs;
  FrenchiesPatientDetailModel? getfrenchiesPatientDetailModel;

  void FrenchiesPatientDetailApi() async {
    isLoading(true);
    getfrenchiesPatientDetailModel =
        await ApiProvider.FrenchiesPatientDetailApi();
    if (getfrenchiesPatientDetailModel?.patientRegDetail != null) {
      isLoading(false);

      ///for search filter
      data.value = getfrenchiesPatientDetailModel!.patientRegDetail!;
    }
    isLoading(false);
  }

  /// for search filter
  RxList<PatientRegDetail> data = RxList<PatientRegDetail>([]);
  void filterPaymentNurse(String searchpaymentNurse) {
    List<PatientRegDetail>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getfrenchiesPatientDetailModel!.patientRegDetail!;
    } else {
      finalResult = getfrenchiesPatientDetailModel!.patientRegDetail!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    data.value = finalResult;
  }

  @override
  void onInit() {
    FrenchiesPatientDetailApi();
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
