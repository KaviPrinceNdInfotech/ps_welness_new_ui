import 'package:get/get.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_appoinmentdetail_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_appoinmenthistory_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_banner_model.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
//import '../../../../servicess_api/api_services_all_api.dart';

class DoctorHomepageController extends GetxController {
  RxBool isLoading = true.obs;
  String MedicineId = "";
  var cartId = "";

  DoctorBannerModel? getdoctorbannerlist;
  DoctorNewAppoinmentDetailModel? doctorNewAppoinmentDetailModel;
  //List<DoctorNewAppoinmentDetailModel>? getdoctorAppoinmentDetailList;
  DoctorAppoinmentHistoryModel? getdoctorAppoinmentHistory;

  void doctorBannerApi() async {
    isLoading(true);
    getdoctorbannerlist = await ApiProvider.getbannerdoctorApi();
    if (getdoctorbannerlist?.bannerImageList != null) {
      isLoading(false);
    }
  }

  void doctorAppoinmentDetail() async {
    isLoading(true);
    doctorNewAppoinmentDetailModel = await ApiProvider.DoctorAppoinmentDetail();
    if (doctorNewAppoinmentDetailModel?.appointmentDetail != null) {
      isLoading(false);
      founddoctoraptProducts.value =
          doctorNewAppoinmentDetailModel!.appointmentDetail!;
    }
  }

  void doctorAppoinmentHistory() async {
    isLoading(true);
    getdoctorAppoinmentHistory = await ApiProvider.DoctorAppoinmentHistory();
    if (getdoctorAppoinmentHistory?.patients != null) {
      isLoading(false);
      founddrhistoryProducts.value = getdoctorAppoinmentHistory!.patients!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    doctorBannerApi();
    doctorAppoinmentDetail();
    doctorAppoinmentHistory();
  }

  @override
  void onClose() {
    super.onClose();
  }

//appointment details.....
  RxList<AppointmentDetail> founddoctoraptProducts =
      RxList<AppointmentDetail>([]);
  void filterdrApointmentProducts(String searchproductName) {
    List<AppointmentDetail> finalResults = [];
    if (searchproductName.isEmpty) {
      finalResults = doctorNewAppoinmentDetailModel!.appointmentDetail!;
    } else {
      finalResults = doctorNewAppoinmentDetailModel!.appointmentDetail!
          .where((element) => element.doctorName
              .toString()
              .toLowerCase()
              .contains(searchproductName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    founddoctoraptProducts.value = finalResults;
  }

  ///payment....history.......
  RxList<Patient> founddrhistoryProducts = RxList<Patient>([]);
  void filterdrpaymengt(String searchphistoryName) {
    List<Patient> finalResults = [];
    if (searchphistoryName.isEmpty) {
      finalResults = getdoctorAppoinmentHistory!.patients!;
    } else {
      finalResults = getdoctorAppoinmentHistory!.patients!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchphistoryName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    founddrhistoryProducts.value = finalResults;
  }
}
