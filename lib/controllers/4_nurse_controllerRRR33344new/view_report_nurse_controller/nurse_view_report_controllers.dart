import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/nurse_view_imagereport.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/nurse_view_report.dart';

import '../../../servicess_api/api_services_all_api.dart';

class NursereportviewController extends GetxController {
  RxBool isLoading = true.obs;
  NurseViewReportModel? nurseviewreport;
  NurseImageviewModel? nursereportimage;

  //LabpaymentModel? labpaymentModel;

  void nursereportviewApi() async {
    isLoading(true);
    nurseviewreport = await ApiProvider.Nursereportview1Api();
    if (nurseviewreport?.nurseViewReport != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      foundNurseviewProducts.value = nurseviewreport!.nurseViewReport!;
    }
  }

  void nursereportimageApi() async {
    isLoading(true);
    nursereportimage = await ApiProvider.nursereportimageApi();
    if (nursereportimage?.nurseViewReportFile != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      // foundlabviewProducts.value = labviewreport!.labViewReport!;
    }
  }

  var appointment = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nursereportviewApi();
    nursereportimageApi();
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

  RxList<NurseViewReport> foundNurseviewProducts = RxList<NurseViewReport>([]);

  void filterNursePatient(String searchnurseview) {
    List<NurseViewReport> finalResults = [];
    if (searchnurseview.isEmpty) {
      finalResults = nurseviewreport!.nurseViewReport!;
    } else {
      finalResults = nurseviewreport!.nurseViewReport!
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
                  .contains(searchnurseview.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    foundNurseviewProducts.value = finalResults;
  }
}
