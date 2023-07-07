import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model_RRR/doctor_payment_history.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import '../../../servicess_api/api_services_all_api.dart';

class DoctorPaymentViewControllers extends GetxController {
  // RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;

  //void toggle(int index) => selectedIndex.value = index;

  DoctorPaymentHistoryModel? getdoctorpaymenthistory;

  void doctorPaymentHistoryApi() async {
    isLoading(true);
    getdoctorpaymenthistory = await ApiProvider.DoctorPaymentHistoryApi();
    if (getdoctorpaymenthistory != null) {
      isLoading(false);
      foundPaymentdr.value = getdoctorpaymenthistory!.paymentHistory!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    doctorPaymentHistoryApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RxList<PaymentHistory> foundPaymentdr = RxList<PaymentHistory>([]);

  void filterpaymentProducts(String searchmedicineName) {
    List<PaymentHistory> finalResults = [];
    if (searchmedicineName.isEmpty) {
      finalResults = getdoctorpaymenthistory!.paymentHistory!;
    } else {
      finalResults = getdoctorpaymenthistory!.paymentHistory!
          .where((element) =>
              // print(element.productName);
              // print(productName);
              // print(element.productName
              //     .toString()
              //     .toLowerCase()
              //     .contains(productName.toString().toLowerCase().trim()));
              element.patientName
                  .toString()
                  .toLowerCase()
                  .contains(searchmedicineName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    foundPaymentdr.value = finalResults;
  }
}
