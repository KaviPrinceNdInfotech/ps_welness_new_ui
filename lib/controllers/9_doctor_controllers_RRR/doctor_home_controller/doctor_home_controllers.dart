import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_appoinmentdetail_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_appoinmenthistory_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/doctor_banner_model.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

import '../../../model/9_doctors_model/doctor_homepage_model/doctor_appointment_online.dart';
import '../../../modules_view/circular_loader/circular_loaders.dart';
//import '../../../../servicess_api/api_services_all_api.dart';

class DoctorHomepageController extends GetxController {
  RxBool isLoading = true.obs;
  String MedicineId = "";
  var cartId = "";

  DoctorProfileControllers _doctorProfileControllers =
      Get.put(DoctorProfileControllers());

  DoctorBannerModel? getdoctorbannerlist;
  DoctorNewAppoinmentDetailModel? doctorNewAppoinmentDetailModel;
  //List<DoctorNewAppoinmentDetailModel>? getdoctorAppoinmentDetailList;
  DoctorAppoinmentHistorydetailModel? getdoctorAppoinmentHistory;

  OnlineDoctorApt? onlineappointment;

  Future<void> doctorBannerApi() async {
    isLoading(true);
    getdoctorbannerlist = await ApiProvider.getbannerdoctorApi();
    if (getdoctorbannerlist?.bannerImageList != null) {
      isLoading(false);
    }

    // isLoading(false);
  }

  ///offline_appointment...

  Future<void> doctorAppoinmentDetail() async {
    isLoading(true);
    doctorNewAppoinmentDetailModel = await ApiProvider.DoctorAppoinmentDetail();
    if (doctorNewAppoinmentDetailModel?.appointmentDetail != null) {
      isLoading(false);
      founddoctoraptProducts.value =
          doctorNewAppoinmentDetailModel!.appointmentDetail!;
    }
    isLoading(false);
  }

  ///onine_appointment...

  Future<void> doctorAppoinmentOnline() async {
    isLoading(true);
    onlineappointment = await ApiProvider.DoctorAppoinmentOnline();
    if (onlineappointment?.appointmentDetail != null) {
      isLoading(false);
      founddoctoraptProducts2.value = onlineappointment!.appointmentDetail!;
    }
    isLoading(false);
  }

  void doctorAppoinmentHistory() async {
    isLoading(true);
    getdoctorAppoinmentHistory = await ApiProvider.DoctorAppoinmentHistory();
    if (getdoctorAppoinmentHistory?.patients != null) {
      isLoading(false);
      founddrhistoryProducts.value = getdoctorAppoinmentHistory!.patients!;
    }
    isLoading(false);
  }

  ///accept user----apiby---dreeseee....30 april 2024...///accept....

  Future<void> AcceptuserbookingApi() async {
    //await  CallLoader.loader();
    http.Response r = await ApiProvider.userAcceptdrApi();
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      await doctorAppoinmentDetail();
      await Get.to(
        () => DoctorHomePage(
            // id: "12345689119911",
            ), //next page class
        duration: Duration(
            milliseconds: 600), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );
      Get.back();
      await CallLoader.hideLoader();

      //Get.back();
      //Get.offAll(() => AddSkilsScreen());

    }
  }

  ///delete user----apiby---dreeseee....30 april 2024...///delete....

  Future<void> deleteuserdrsaptApi() async {
    //await  CallLoader.loader();
    http.Response r = await ApiProvider.userAptdrdeleteApi();
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      await doctorAppoinmentDetail();
      await Get.to(
        () => DoctorHomePage(
            // id: "12345689119911",
            ), //next page class
        duration: Duration(
            milliseconds: 600), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );
      Get.back();
      await CallLoader.hideLoader();

      //Get.back();
      //Get.offAll(() => AddSkilsScreen());

    }
  }

  @override
  void onInit() {
    super.onInit();
    doctorBannerApi();
    doctorAppoinmentDetail();
    doctorAppoinmentHistory();
    doctorAppoinmentOnline();
    _doctorProfileControllers.doctorprofileApi();
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
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchproductName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    founddoctoraptProducts.value = finalResults;
  }

  /// online appointment details.....
  RxList<AppointmentDetailOnline> founddoctoraptProducts2 =
      RxList<AppointmentDetailOnline>([]);
  void filterdrApointmentProducts2(String searchproductName) {
    List<AppointmentDetailOnline> finalResults = [];
    if (searchproductName.isEmpty) {
      finalResults = onlineappointment!.appointmentDetail!;
    } else {
      finalResults = onlineappointment!.appointmentDetail!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchproductName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    founddoctoraptProducts2.value = finalResults;
  }

  ///payment....history.......
  RxList<PatientAppoitntment> founddrhistoryProducts =
      RxList<PatientAppoitntment>([]);
  void filterdrpaymengt(String searchphistoryName) {
    List<PatientAppoitntment> finalResults = [];
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
