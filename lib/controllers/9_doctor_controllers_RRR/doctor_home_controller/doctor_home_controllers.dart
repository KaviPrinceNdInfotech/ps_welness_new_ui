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
  List<DoctorAppoinmentDetailModel>? getdoctorAppoinmentDetailList;
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
    getdoctorAppoinmentDetailList = await ApiProvider.DoctorAppoinmentDetail();
    if (getdoctorAppoinmentDetailList == null) {
      isLoading(false);
    }
  }

  void doctorAppoinmentHistory() async {
    isLoading(true);
    getdoctorAppoinmentHistory = await ApiProvider.DoctorAppoinmentHistory();
    if (getdoctorAppoinmentHistory?.patients?.length == null) {
      isLoading(false);
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

  RxList<DoctorAppoinmentDetailModel> foundProducts =
      RxList<DoctorAppoinmentDetailModel>([]);
  void filterProducts(String searchproductName) {
    List<DoctorAppoinmentDetailModel> finalResults = [];
    if (searchproductName.isEmpty) {
      finalResults = getdoctorAppoinmentDetailList!;
    } else {
      finalResults = getdoctorAppoinmentDetailList!
          .where((element) => element.doctorName
              .toString()
              .toLowerCase()
              .contains(searchproductName.toString().toLowerCase().trim()))
          .toList();
    }
    foundProducts.value = finalResults;
  }
}
