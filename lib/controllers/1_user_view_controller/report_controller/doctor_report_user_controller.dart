import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/doctor_userrr_model/doctor_report_model_listss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/doctor_userrr_model/doctor_view_report_modell.dart';

//import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/lab_report_model_list.dart';
//import 'package:ps_welness_new_ui/model/1_user_model/report_moidel3/lab_report_view_models.dart';

import '../../../servicess_api/api_services_all_api.dart';

class DoctorreportuserviewController extends GetxController {
  RxBool isLoading = true.obs;
  //ViewreportModel? labviewreport;
  // LabReportimage? labreportimage;
  DoctorReportUserList? dooctorReportUserList;
  DoctorReportUserImageView? doctorReportUserImage;
  //LabpaymentModel? labpaymentModel;

  void doctoruserreportviewApi() async {
    isLoading(true);
    dooctorReportUserList = await ApiProvider.Doctorreportuserview1Api();
    if (dooctorReportUserList?.doctorReportByPatient != null
        //appointmentdetail != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
      founddoctorruserviewProducts.value =
          dooctorReportUserList!.doctorReportByPatient!;
    }
  }

  void doctorusrreportimageApi() async {
    isLoading(true);
    doctorReportUserImage = await ApiProvider.DoctoruserreportimageApi();
    if (doctorReportUserImage?.doctorViewReportFile != null
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
    doctoruserreportviewApi();
    doctorusrreportimageApi();
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

  RxList<DoctorReportByPatient> founddoctorruserviewProducts =
      RxList<DoctorReportByPatient>([]);

  void filterDoctorrPatient(String searchdoctoruserview) {
    List<DoctorReportByPatient> finalResults = [];
    if (searchdoctoruserview.isEmpty) {
      finalResults = dooctorReportUserList!.doctorReportByPatient!;
    } else {
      finalResults = dooctorReportUserList!.doctorReportByPatient!
          .where((element) =>
              // print(element.productName);
              // print(productName);
              // print(element.productName
              //     .toString()
              //     .toLowerCase()
              //     .contains(productName.toString().toLowerCase().trim()));
              element.doctorName.toString().toLowerCase().contains(
                  searchdoctoruserview.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    founddoctorruserviewProducts.value = finalResults;
  }
}
