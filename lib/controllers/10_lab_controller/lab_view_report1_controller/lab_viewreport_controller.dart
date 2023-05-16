import 'package:get/get.dart';

import '../../../model/10_lab_module/lab_report_view_model/lab_report_image.dart';
import '../../../model/10_lab_module/lab_report_view_model/lab_report_view_model.dart';
import '../../../servicess_api/api_services_all_api.dart';

class LabreportviewController extends GetxController {
  RxBool isLoading = true.obs;
  ViewreportModel? labviewreport;
  LabReportimage? labreportimage;

  //LabpaymentModel? labpaymentModel;

  void labreportviewApi() async {
    isLoading(true);
    labviewreport = await ApiProvider.Labreportview1Api();
    if (labviewreport?.labViewReport != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      foundlabviewProducts.value = labviewreport!.labViewReport!;
    }
  }

  void labreportimageApi() async {
    isLoading(true);
    labreportimage = await ApiProvider.LabreportimageApi();
    if (labreportimage?.labViewReportFile != null
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
    labreportviewApi();
    labreportimageApi();
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

  RxList<LabViewReport> foundlabviewProducts = RxList<LabViewReport>([]);

  void filterLabPatient(String searchlabview) {
    List<LabViewReport> finalResults = [];
    if (searchlabview.isEmpty) {
      finalResults = labviewreport!.labViewReport!;
    } else {
      finalResults = labviewreport!.labViewReport!
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
                  .contains(searchlabview.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    foundlabviewProducts.value = finalResults;
  }
}
