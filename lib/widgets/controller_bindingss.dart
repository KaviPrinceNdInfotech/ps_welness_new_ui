import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controller/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/doctor_payment_controller/doctor_payment_detail_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/patient_list_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/patient_report_view_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/skils_controller/skils_controllers.dart';
import 'package:ps_welness_new_ui/controllers/doctor_controllers/doctor_complain_controller/doctor_complain_controllers.dart';
import 'package:ps_welness_new_ui/controllers/map_controllers/map_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/health_checkup/health_checkup_addresss/health_checkup_components/credentials.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/drawer_contoller/lab_history_controller/lab_history_controllers.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/nurse_appointment_controller/nurse_booking_1_controller.dart';
//import 'package:ps_welness/controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';
//import 'package:ps_welness/controllers/4_nurse_controller/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
//import 'package:ps_welness/controllers/9_doctor_controllers/doctor_payment_controller/doctor_payment_detail_controller.dart';
//import 'package:ps_welness/controllers/9_doctor_controllers/doctor_profile_controller.dart';
//import 'package:ps_welness/controllers/9_doctor_controllers/patient_report_view_controller.dart';
//import 'package:ps_welness/controllers/doctor_controllers/doctor_complain_controller/doctor_complain_controllers.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/health_checkup/health_checkup_addresss/health_checkup_components/credentials.dart';

import '../controllers/10_lab_controller/lab_home_controllers/lab_home_controller.dart';
import '../controllers/1_user_view_controller/doctor_sections/doctors_appointment1.dart';
import '../controllers/1_user_view_controller/doctor_sections/get_doctor_list_controller.dart';
import '../controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
import '../controllers/1_user_view_controller/nurse_appointment_controller/nurse_booking_1_controller.dart';
import '../controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
import '../controllers/2_franchises_controller/franchies_home_page_controller/franchies_home_page_controllers.dart';
import '../controllers/3_driver_view_controllers/driver_home_page_controller/driver_home_page_controllers.dart';
import '../controllers/4_nurse_controller/nurse_home_page_controller/nurse_home_page_controllers.dart';
import '../controllers/5_rwa_controller/rwa_home_page_controller/rwa_home_page_controllers.dart';
import '../controllers/6_chemist_view_controllers/chemist_home_page_controller/chemist_home_page_controllers.dart';
import '../controllers/9_doctor_controllers/doctor_drawer_controllers/doctor_profile_controller.dart';
import '../controllers/user_controller/user_controller_1.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies....................
    //Get.put(IntroVideoBoxController());
    Get.put(FranchiesSpecialistController());
    Get.put(DoctorProfileControllers());
    Get.put(DoctorProfileController());
    Get.put(DoctorPatientReportControllers());
    Get.put(DoctorPaymentViewControllers());
    Get.put(LabListController());
    Get.put(NurseBooking1Controller());
    Get.put(NurseAppointmentDetailController());
    Get.put(LabHistoryController());
    Get.put(LabHistoryController());
    Get.put(User_1_Controller());
    Get.put(DoctorComplaintController());
    Get.put(MedicineCartListController());
    Get.put(MedicineListController());
    Get.put(HealthCheckupCredentials());
    Get.put(NurseBooking1Controller());
    Get.put(PatientListController());
    Get.put(Doctor_appointment_1_Controller());
    Get.put(SkillsListController());
    Get.put(LabListController());
    Get.put(MapController());
    Get.put(UserHomepagContreoller());
    Get.put(DoctorListController());
    Get.put(FranchiseHomepagContreoller());
    Get.put(LabHomepagContreoller());
    Get.put(DriverHomepagContreoller());
    Get.put(NurseHomepagContreoller());
    Get.put(RwaHomepagContreoller());
    Get.put(ChemistHomepagContreoller());
    //Get.put(GoogleMapController());

    //Get.put(CatagaryByIdController());
  }
// CartNewController _cartNewController = Get.put(CartNewController());
// FavCounterController _favCounterController = Get.put(FavCounterController());

}
