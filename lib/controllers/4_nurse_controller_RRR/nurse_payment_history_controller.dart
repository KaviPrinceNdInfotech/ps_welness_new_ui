import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/nurse_payment_history_model.dart';

import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import 'package:ps_welness_new_ui/model/4_nurse_all_models/nurse_appointment_history_model.dart';
//import 'package:ps_welness_new_ui/model/4_nurse_all_models/nurse_payment_history_model.dart';
//import '../../servicess_api/api_services_all_api.dart';

class NursePaymentHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  List<NursePaymentHistoryModel>? getNursePaymentHistory;

  void nursePaymentHistoryApi() async {
    isLoading(true);
    getNursePaymentHistory = await ApiProvider.NursePaymentHistoryApi();
    if (getNursePaymentHistory != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    nursePaymentHistoryApi();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
