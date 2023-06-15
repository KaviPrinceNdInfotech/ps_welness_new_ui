import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/lab_userr_model/lab_report_model_list.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/lab_userr_model/lab_report_view_models.dart';

//import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/lab_report_model_list.dart';
//import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/lab_report_view_models.dart';

import '../../../servicess_api/api_services_all_api.dart';

class LabreportuserviewController extends GetxController {
  RxBool isLoading = true.obs;
  //ViewreportModel? labviewreport;
  // LabReportimage? labreportimage;
  LabReportUserList? labReportUserList;
  LabReportUserImage? labReportUserImage;

  //LabpaymentModel? labpaymentModel;

  void labuserreportviewApi() async {
    isLoading(true);
    labReportUserList = await ApiProvider.Labreportuserview1Api();
    if (labReportUserList?.viewLabReportByPatient != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      foundlabuserviewProducts.value =
          labReportUserList!.viewLabReportByPatient!;
    }
  }

  void labusrreportimageApi() async {
    isLoading(true);
    labReportUserImage = await ApiProvider.LabuserreportimageApi();
    if (labReportUserImage?.labViewReportFile != null
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
    labuserreportviewApi();
    labusrreportimageApi();
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

  RxList<NurseViewssReport> foundlabuserviewProducts =
      RxList<NurseViewssReport>([]);

  void filterLabPatient(String searchlabuserview) {
    List<NurseViewssReport> finalResults = [];
    if (searchlabuserview.isEmpty) {
      finalResults = labReportUserList!.viewLabReportByPatient!;
    } else {
      finalResults = labReportUserList!.viewLabReportByPatient!
          .where((element) =>
              // print(element.productName);
              // print(productName);
              // print(element.productName
              //     .toString()
              //     .toLowerCase()
              //     .contains(productName.toString().toLowerCase().trim()));
              element.labName
                  .toString()
                  .toLowerCase()
                  .contains(searchlabuserview.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    foundlabuserviewProducts.value = finalResults;
  }
}
