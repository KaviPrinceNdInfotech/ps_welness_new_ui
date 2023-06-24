import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/nurse_payment_history_model.dart';

import '../../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

class NursePaymentHistoryControllerss extends GetxController {
  // RxBool isLoading = false.obs;
  // List<NursePaymentHistoryModel>? getNursePaymentHistory;
  //
  // void nursePaymentHistoryApi() async {
  //   isLoading(true);
  //   getNursePaymentHistory = await ApiProvider.NursePaymentHistoryApi();
  //   if (getNursePaymentHistory != null) {
  //     isLoading(false);
  //     foundPaymentnurse.value = getNursePaymentHistory!;
  //   }
  // }
  //
  // @override
  // void onInit() {
  //   nursePaymentHistoryApi();
  //   super.onInit();
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  // }
  //
  // RxList<NursePaymentHistoryModel> foundPaymentnurse =
  //     RxList<NursePaymentHistoryModel>([]);
  //
  // void filterAppointNurse(String searchpaymentNurse) {
  //   List<NursePaymentHistoryModel>? finalResult = [];
  //   if (searchpaymentNurse.isEmpty) {
  //     finalResult = getNursePaymentHistory!;
  //   } else {
  //     finalResult = getNursePaymentHistory!
  //         ?.where((element) => element.patientName
  //             .toString()
  //             .toLowerCase()
  //             .contains(searchpaymentNurse.toString().toLowerCase().trim()))
  //         .toList();
  //   }
  //   print(finalResult?.length);
  //   foundPaymentnurse.value = finalResult!;
  // }

  RxBool isLoading = true.obs;
  //List<NursePaymentHistoryModel>? getNursePaymentHistory;
  NursePaymentHistoryModel? getNursePaymentHistory;

  void nursePaymentHistoryApi() async {
    isLoading(true);
    getNursePaymentHistory = await ApiProvider.NursePaymentHistoryApi();
    if (getNursePaymentHistory?.nurseHistory != null) {
      isLoading(false);
      foundPaymentnurse.value = getNursePaymentHistory!.nurseHistory!;
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

  RxList<NurseHistory> foundPaymentnurse = RxList<NurseHistory>([]);

  void filterPaymentNurse(String searchpaymentNurse) {
    List<NurseHistory>? finalResult = [];
    if (searchpaymentNurse.isEmpty) {
      finalResult = getNursePaymentHistory!.nurseHistory!;
    } else {
      finalResult = getNursePaymentHistory!.nurseHistory!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchpaymentNurse.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResult?.length);
    foundPaymentnurse.value = finalResult!;
  }
}
