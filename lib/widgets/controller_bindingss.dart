import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_controller/driver_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controller_RRR/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controller_RRR/nurse_complain_controller/nurse_complain_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controller_RRR/nurse_drawer_controllers/nurse_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwaBanner_controller.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwa_profile/rwa_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwa_signup_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_payment_controller/doctor_payment_detail_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_update_profile/doctor_updateprofile_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/patient_list_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/patient_report_view_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/skils_controller/skils_controllers.dart';
import 'package:ps_welness_new_ui/controllers/complaint_controller/complaint_controller.dart';
//import 'package:ps_welness_new_ui/controllers/doctor_controllers/doctor_complain_controller/doctor_complain_controllers.dart';
import 'package:ps_welness_new_ui/controllers/map_controllers/map_controller.dart';
import 'package:ps_welness_new_ui/controllers/nurses_controllers_RRR_signuppp/nurses_controller2.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/health_checkup/health_checkup_addresss/health_checkup_components/credentials.dart';

import '../controllers/10_lab_controller/drawer_page_flab_controller/complain_lab_controller.dart';
import '../controllers/10_lab_controller/drawer_page_flab_controller/lab_profile_lab.dart';
import '../controllers/10_lab_controller/lab_appointment_history_controller/lab_pay_hist_controller.dart';
import '../controllers/10_lab_controller/lab_home_controllers/lab_home_controller.dart';
import '../controllers/10_lab_controller/lab_profile_details_controller/lab_profile_details_controller.dart';
import '../controllers/10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
import '../controllers/10_lab_controller/lab_view_report1_controller/lab_viewreport_controller.dart';
import '../controllers/1_user_view_controller/ambulance/get_ambulancetype_controller.dart';
import '../controllers/1_user_view_controller/doctor_rating_review_controller/doctor_view_ratting_review.dart';
import '../controllers/1_user_view_controller/doctor_sections/doctors_appointment1.dart';
import '../controllers/1_user_view_controller/doctor_sections/get_doctor_list_controller.dart';
import '../controllers/1_user_view_controller/health_chkp_view_review/health_chkp_view_review.dart';
import '../controllers/1_user_view_controller/lab_controller/choose_lab_controller/lab_controller.dart';
import '../controllers/1_user_view_controller/lab_rating_review_controller/lab_view_ratting_review.dart';
import '../controllers/1_user_view_controller/medicine_controllers/add_delivery_post_controller.dart';
import '../controllers/1_user_view_controller/medicine_controllers/medicine_address_controller/medicine_address_controller.dart';
import '../controllers/1_user_view_controller/medicine_controllers/medicine_checkout/medicine_chkout_controller.dart';
import '../controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
import '../controllers/1_user_view_controller/nurse_appointment_controller/nurse_booking_1_controller.dart';
import '../controllers/1_user_view_controller/nurse_list_user_list_controller/nurse_list_user_controller.dart';
import '../controllers/1_user_view_controller/rating_review_controller/rating_review_nurse_controller.dart';
import '../controllers/1_user_view_controller/rozarpay_lab_controller/rozarpay_lab_controller.dart';
import '../controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
import '../controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import '../controllers/2_franchises_controller/franchies_home_page_controller/franchies_home_page_controllers.dart';
import '../controllers/3_driver_view_controllers/driver_home_page_controller/driver_home_page_controllers.dart';
//import '../controllers/4_nurse_controller/nurse_home_page_controller/nurse_home_page_controllers.dart';
//import '../controllers/5_rwa_controller/rwa_home_page_controller/rwa_home_page_controllers.dart';
import '../controllers/6_chemist_view_controllers/chemist_home_page_controller/chemist_home_page_controllers.dart';
import '../controllers/9_doctor_controllers_RRR/doctor_controllers_RRR/doctor_complain_controller/doctor_complain_controllers.dart';
import '../controllers/lab_controller/lab_controller1/lab_controller_1.dart';
import '../controllers/login_email/login_email_controller.dart';
import '../controllers/profile_u_controller/profile_update_controller.dart';
import '../controllers/user_controller/user_controller_1.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies....................
    //Get.put(IntroVideoBoxController());
    Get.put(FranchiesSpecialistController());
    Get.put(DoctorProfileControllers());
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
    //Get.put(NurseHomepagContreoller());
    //Get.put(RwaHomepagContreoller());
    Get.put(RwaBannerController());
    Get.put(ChemistHomepagContreoller());
    Get.put(ComplaintController());
    Get.put(ProfileController());
    Get.put(NurseBooking1Controller());
    Get.put(NurseAppointmentDetailController());
    Get.put(ChooseLabController());
    Get.put(MedicineAddressController());
    Get.put(medicine_addresssList_Controller());
    Get.put(LabListController());
    Get.put(LabListController());
    Get.put(RozarPayLabController());
    Get.put(AmbulancegetController());
    Get.put(NurseProfileController()); // Rahul
    Get.put(NurseComplaintController()); // Rahul
    Get.put(DriverProfileController()); // Rahul
    Get.put(DoctorUpdateProfileController()); // Rahul
    Get.put(Nurses_2_Controller()); // Rahul
    Get.put(ComplaintController()); // Rahul
    Get.put(RwaProfileController()); // Rahul
    Get.put(RWASignupController());
    Get.put(NurseUserListController());
    Get.put(MedicineCartListController());
    Get.put(MedicineListController());
    Get.put(CheckoutMedicineController());
    Get.put(UserProfileControllers());
    Get.put(ComplaintLabController());
    Get.put(LabProfileUpdateController());
    Get.put(LabpaymenttController());
    Get.put(LoginpasswordController());
    Get.put(LabprofiledetailController());
    Get.put(Lab_1_Controller());
    Get.put(LabUploadReportController());
    Get.put(LabreportviewController());
    Get.put(ReviewRatingNurseController());
    Get.put(ViewdoctorreviewController());
    Get.put(ViewlabreviewController());
    Get.put(ViewhealthchkpreviewController());
    // Rahul
    //Get.put(GoogleMapController());

    //Get.put(CatagaryByIdController());
  }
// CartNewController _cartNewController = Get.put(CartNewController());
// FavCounterController _favCounterController = Get.put(FavCounterController());

}
