import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model_RRR/doctor_homepage_model/doctor_report_image_view.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model_RRR/doctor_homepage_model/doctor_view_report11_model.dart';

import '../../../model/10_lab_module/lab_report_view_model/lab_report_view_model.dart';
import '../../../servicess_api/api_services_all_api.dart';

class DoctorreportviewController extends GetxController {
  RxBool isLoading = true.obs;
  ViewreportModel? labviewreport;
  DoctorImageviewModel? doctorImageviewModel;
  DoctorViewReportModel? doctorViewReportModel;

  //LabpaymentModel? labpaymentModel;

  void doctorreportviewApi() async {
    isLoading(true);
    doctorViewReportModel = await ApiProvider.Doctorreportview1Api();
    if (doctorViewReportModel?.doctorViewReport != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      founddoctorviewProducts.value = doctorViewReportModel!.doctorViewReport!;
    }
  }

  void doctorreportimageeApi() async {
    isLoading(true);
    doctorImageviewModel = await ApiProvider.doctorreportimageApi();
    if (doctorImageviewModel?.doctorViewReportFile != null
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
    doctorreportviewApi();
    doctorreportimageeApi();
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

  RxList<DoctorViewReport> founddoctorviewProducts =
      RxList<DoctorViewReport>([]);

  void filterDoctorPatient(String searchdoctorview) {
    List<DoctorViewReport> finalResults = [];
    if (searchdoctorview.isEmpty) {
      finalResults = doctorViewReportModel!.doctorViewReport!;
    } else {
      finalResults = doctorViewReportModel!.doctorViewReport!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchdoctorview.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    founddoctorviewProducts.value = finalResults;
  }
}
