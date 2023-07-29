import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_about_us/user_about_us_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/add_department_and_spealist_controller/add_dept_specialist_view.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/add_vehicle_controller/add_vehicle_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/drawer_page_franchies_controller/franchies_profile_franchies.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/franchies_profile_controller/franchieses_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/franchise_comission_report/franchise_commission_report.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/franchise_payment_report/franchise_payment_report.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/franchise_tdshistory_report/franchise_tds_history_report.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/franchises_complain_controller/franchises_complain_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchies_banner_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_lab_controller/fr_lab_controller1/lab_controller_1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_nurses_controllers/nurses_controller1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_rwa_controller/fr_rwa_controller1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/patient_user_controller/patient_user_controllerss.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/vehicle_part_controller/vehicle_part_controller.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_controller_RRR/driver_controller1.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_controller/driver_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_aboutus_controller/nurse_about_us_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_appointment_history_controller/nurse_pay_hist_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_drawer_controllers/nurse_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_upload_report_controller/nurse_upload_report_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/view_report_nurse_controller/nurse_view_report_controllers.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controller_RRR/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controller_RRR/nurse_complain_controller/nurse_complain_controller.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/about_us_rwa/aboutus_rwa.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwaBanner_controller.dart';
//import 'package:ps_welness_new_ui/controllers/4_nurse_controller_RRR/nurse_drawer_controllers/nurse_profilert';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwa_profile/rwa_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwa_signup_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_home_controller/doctor_home_controllers.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_payment_controller/doctor_payment_detail_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_update_profile/doctor_updateprofile_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_view_report1_controller/doctor_viewreport_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/patient_list_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/patient_report_view_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/skils_controller/skils_controllers.dart';
import 'package:ps_welness_new_ui/controllers/complaint_controller/complaint_controller.dart';
import 'package:ps_welness_new_ui/controllers/device_token_controller/devicetoken_controller.dart';
import 'package:ps_welness_new_ui/controllers/franchies_controller/franchies1_controllers.dart';
//import 'package:ps_welness_new_ui/controllers/doctor_controllers/doctor_complain_controller/doctor_complain_controllers.dart';
import 'package:ps_welness_new_ui/controllers/map_controllers/map_controller.dart';
import 'package:ps_welness_new_ui/controllers/nurses_controllers_RRR_signuppp/nurses_controller2.dart';
import 'package:ps_welness_new_ui/controllers/rwa_controller/rwa_controller1.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/health_checkup/health_checkup_addresss/health_checkup_components/credentials.dart';

import '../controllers/10_lab_controller/drawer_page_flab_controller/complain_lab_controller.dart';
import '../controllers/10_lab_controller/drawer_page_flab_controller/lab_profile_lab.dart';
import '../controllers/10_lab_controller/lab_appointment_history_controller/lab_pay_hist_controller.dart';
import '../controllers/10_lab_controller/lab_home_controllers/lab_home_controller.dart';
import '../controllers/10_lab_controller/lab_profile_details_controller/lab_profile_details_controller.dart';
import '../controllers/10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
import '../controllers/10_lab_controller/lab_view_report1_controller/lab_viewreport_controller.dart';
import '../controllers/1_user_view_controller/ambulance/driver_accept_list_controller.dart';
import '../controllers/1_user_view_controller/ambulance/get_ambulancetype2_controller.dart';
import '../controllers/1_user_view_controller/ambulance/get_ambulancetype3_controller.dart';
import '../controllers/1_user_view_controller/ambulance/get_ambulancetype_controller.dart';
import '../controllers/1_user_view_controller/ambulance/near_driverlist_controller.dart';
import '../controllers/1_user_view_controller/doctor_rating_review_controller/doctor_view_ratting_review.dart';
import '../controllers/1_user_view_controller/doctor_sections/doctors_appointment1.dart';
import '../controllers/1_user_view_controller/doctor_sections/get_doctor_list_controller.dart';
import '../controllers/1_user_view_controller/health_chkp_view_review/health_chkp_view_review.dart';
import '../controllers/1_user_view_controller/lab_controller/choose_lab_controller/lab_controller.dart';
import '../controllers/1_user_view_controller/lab_rating_review_controller/lab_view_ratting_review.dart';
import '../controllers/1_user_view_controller/medicine_controllers/add_delivery_post_controller.dart';
import '../controllers/1_user_view_controller/medicine_controllers/medicine_address_controller/medicine_address_controller.dart';
import '../controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
import '../controllers/1_user_view_controller/nurse_appointment_controller/nurse_booking_1_controller.dart';
import '../controllers/1_user_view_controller/nurse_list_user_list_controller/nurse_list_user_controller.dart';
import '../controllers/1_user_view_controller/rating_review_controller/rating_review_nurse_controller.dart';
import '../controllers/1_user_view_controller/rozarpay_lab_controller/rozarpay_lab_controller.dart';
import '../controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
import '../controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
//import '../controllers/2_franchises_controller/franchies_home_page_controller/franchies_home_page_controllers.dart';
import '../controllers/3_driver_view_controllers/driver_home_page_controller/driver_home_page_controllers.dart';
//import '../controllers/4_nurse_controller/nurse_home_page_controller/nurse_home_page_controllers.dart';
//import '../controllers/5_rwa_controller/rwa_home_page_controller/rwa_home_page_controllers.dart';
import '../controllers/3_driver_view_controllers/driver_home_page_controller/driver_user_acpt_rejct_list/user_list_accept_reject_list.dart';
import '../controllers/4_nurse_controllerRRR33344new/nurse_appointment_detail_controller/nurse_appointment_nurse_detailsss.dart';
import '../controllers/5_rwa_controller_RRR/rwa_complain_controller/rwa_complain_controller.dart';
import '../controllers/6_chemist_view_controllers/chemist_home_page_controller/chemist_home_page_controllers.dart';
import '../controllers/6_chemist_view_controllers_RRR/ChemistUpdateProfile_controller.dart';
import '../controllers/6_chemist_view_controllers_RRR/chemistManageProfile_controller.dart';
import '../controllers/6_chemist_view_controllers_RRR/chemist_aboutus_controller.dart';
import '../controllers/6_chemist_view_controllers_RRR/chemist_banner_controller.dart';
import '../controllers/6_chemist_view_controllers_RRR/chemist_complain_controller/chemist_complain_controller.dart';
import '../controllers/6_chemist_view_controllers_RRR/chemist_order_history_controller.dart';
import '../controllers/6_chemist_view_controllers_RRR/chemist_payment_history_controller/chemist_payment_controller.dart';
import '../controllers/6_chemist_view_controllers_RRR/chemist_payout_history_controller/chemist_payoutHistory_controller.dart';
import '../controllers/6_chemist_view_controllers_RRR/chemist_profile_detailController.dart';
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
    //Get.put(FranchiseHomepagContreoller());
    Get.put(LabHomepagContreoller());
    Get.put(DriverHomepagContreoller());
    Get.put(DoctorHomepageController());
    Get.put(DoctorProfileControllers());
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
    Get.put(Nurses_22_Controller()); // Rahul
    Get.put(ComplaintController()); // Rahul
    Get.put(RwaProfileController()); // Rahul
    Get.put(RWASignupController());
    Get.put(NurseUserListController());
    Get.put(MedicineCartListController());
    Get.put(MedicineListController());

    /// Get.put(CheckoutMedicineController());
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
    Get.put(ChemistOrderController()); //Rahul
    Get.put(ChemispaymentController()); // Rahul
    Get.put(ChemistProfileDetailController()); // Rahul
    Get.put(ChemistPayoutController()); //  Rahul
    Get.put(ChemistUpdateProfileController()); // Rahul
    Get.put(ChemistManageProfileController()); // Rahul
    Get.put(ChemistComplaintController()); //Rahul
    Get.put(ChemistBannerController());
    Get.put(ChemistAboutusController());
    Get.put(Rwa_11_controller());
    Get.put(RwaComplaintController());
    Get.put(NurseAppointmentNurseDetailController());
    Get.put(NursePaymentHistoryControllerss());
    Get.put(RwaAboutusController());
    Get.put(NurseComplaintController());
    Get.put(NurseUploadReportController());
    Get.put(NursereportviewController());
    Get.put(NurseAboutusController());
    Get.put(UserAboutusController());
    Get.put(DoctorreportviewController());
    Get.put(Driver_1111_Controller());
    Get.put(DriverlistnearController());

    ///franchise...
    Get.put(FrenchiesBannerController()); // Rahul
    Get.put(FranchisesEditProfileController()); //Rahul
    Get.put(Franchies_1_Controller()); //Rahul
    Get.put(FranchisesComplaintController()); //Rahul
    Get.put(AdddepartmentController()); // Rahul
    Get.put(DraweerFranchiesProfileController()); //
    Get.put(FranchisePaymentReportController()); // Rahul
    Get.put(Franchies_vehicle_Controller()); // Rahul
    Get.put(FrNurses_1_controller()); // Rahul
    Get.put(FranchiseTdsHistoryReportController()); // Rahul
    Get.put(FranchiseCommissionReportController()); //Rahul
    Get.put(AddVehicleController());
    Get.put(Patients_Controller());
    Get.put(DevicetokenController());
    Get.put(Fr_Lab_1_Controller());
    Get.put(FrRwa_1_controller());
    Get.put(Ambulanceget3Controller());
    Get.put(Ambulanceget2Controller());
    Get.put(DriverAcceptlistController());
    Get.put(UseracptrejectController());

    /// Get.put(CheckoutMedicineController());

    // Get.put(CatagaryByIdController());

    //Get.lazyPut(() => AddVehicleController());
    //     Get.lazyPut(() => Fr_Lab_1_Controller());
    //     Get.lazyPut(() => FrRwa_1_controller());

    //Get.put(CatagaryByIdController());
  }
// CartNewController _cartNewController = Get.put(CartNewController());
// FavCounterController _favCounterController = Get.put(FavCounterController());

}
