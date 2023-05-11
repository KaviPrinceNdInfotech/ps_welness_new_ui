import 'package:get/get.dart';

import '../../../model/10_lab_module/lab_appointment_history/lab_appointment_history.dart';
import '../../../servicess_api/api_services_all_api.dart';
//import 'package:ps_welness/model/4_nurse_all_models/nurse_appointment_details_list.dart';
//import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//import 'package:intl/intl.dart';

class LabpaymenttController extends GetxController {
  RxBool isLoading = true.obs;

  LabpaymentModel? labpaymentModel;

  // NurseAppointmentDetail? nurseappointmentdetail;

  //all catagary list .........

  void labhistoryApi() async {
    isLoading(true);
    labpaymentModel = await ApiProvider.LabpaymenthistoryApi();
    if (labpaymentModel?.labPayHis != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      foundlabProducts.value = labpaymentModel!.labPayHis!;
    }
  }

  // late TextEditingController appointmentController;

  var appointment = ''.obs;

  @override
  void onInit() {
    super.onInit();
    labhistoryApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    //TextEditingController.dispose();
  }

  RxList<LabPayHi> foundlabProducts = RxList<LabPayHi>([]);

  void filterLabProducts(String searchlab) {
    List<LabPayHi> finalResults = [];
    if (searchlab.isEmpty) {
      finalResults = labpaymentModel!.labPayHis!;
    } else {
      finalResults = labpaymentModel!.labPayHis!
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
                  .contains(searchlab.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    foundlabProducts.value = finalResults;
  }
}
