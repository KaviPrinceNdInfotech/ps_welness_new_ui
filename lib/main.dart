import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ps_welness_new_ui/controllers/10_lab_controller/drawer_page_flab_controller/complain_lab_controller.dart';
import 'package:ps_welness_new_ui/controllers/10_lab_controller/drawer_page_flab_controller/lab_profile_lab.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/add_vehicle_controller/add_vehicle_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/drawer_page_franchies_controller/franchies_profile_franchies.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/franchise_payment_report/franchise_payment_report.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/franchise_tdshistory_report/franchise_tds_history_report.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_lab_controller/fr_lab_controller1/lab_controller_1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_nurses_controllers/nurses_controller1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_rwa_controller/fr_rwa_controller1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/patient_user_controller/patient_user_controllerss.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_controller_RRR/driver_controller1.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_aboutus_controller/nurse_about_us_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_appointment_history_controller/nurse_pay_hist_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/view_report_nurse_controller/nurse_view_report_controllers.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/about_us_rwa/aboutus_rwa.dart';
//import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_appointment_history_controller/nurse_pay_histrt';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwaBanner_controller.dart';
import 'package:ps_welness_new_ui/controllers/6_chemist_view_controllers_RRR/chemistManageProfile_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_home_controller/doctor_home_controllers.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/map_controllers/map_controller.dart';
import 'package:ps_welness_new_ui/controllers/rwa_controller/rwa_controller1.dart';
//import 'package:ps_welness_new_ui/modules_view/3_driver_section_view/driver_home/driver_home_page.dart';
import 'package:ps_welness_new_ui/widgets/controller_bindingss.dart';

//import 'package:ps_welness/controllers/1_user_view_controller/nurse_appointment_controller/nurse_booking_1_controller.dart';
//import 'package:ps_welness/widgets/controller_bindingss.dart';

import 'controllers/10_lab_controller/lab_appointment_history_controller/lab_pay_hist_controller.dart';
import 'controllers/10_lab_controller/lab_home_controllers/lab_home_controller.dart';
import 'controllers/10_lab_controller/lab_profile_details_controller/lab_profile_details_controller.dart';
import 'controllers/10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
import 'controllers/10_lab_controller/lab_view_report1_controller/lab_viewreport_controller.dart';
import 'controllers/1_user_view_controller/ambulance/driver_accept_list_controller.dart';
import 'controllers/1_user_view_controller/ambulance/get_ambulancetype2_controller.dart';
import 'controllers/1_user_view_controller/ambulance/get_ambulancetype3_controller.dart';
import 'controllers/1_user_view_controller/ambulance/get_ambulancetype_controller.dart';
import 'controllers/1_user_view_controller/ambulance/near_driverlist_controller.dart';
import 'controllers/1_user_view_controller/doctor_rating_review_controller/doctor_view_ratting_review.dart';
import 'controllers/1_user_view_controller/doctor_sections/doctors_appointment1.dart';
import 'controllers/1_user_view_controller/doctor_sections/get_doctor_list_controller.dart';
import 'controllers/1_user_view_controller/health_chkp_view_review/health_chkp_view_review.dart';
import 'controllers/1_user_view_controller/lab_controller/choose_lab_controller/lab_controller.dart';
import 'controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import 'controllers/1_user_view_controller/lab_rating_review_controller/lab_view_ratting_review.dart';
import 'controllers/1_user_view_controller/medicine_controllers/add_delivery_post_controller.dart';
import 'controllers/1_user_view_controller/medicine_controllers/medicine_address_controller/medicine_address_controller.dart';
import 'controllers/1_user_view_controller/medicine_controllers/medicine_cart_section/medicine_cart_list.dart';
import 'controllers/1_user_view_controller/medicine_controllers/medicine_list_controllers/medicine_list_controller.dart';
import 'controllers/1_user_view_controller/nurse_appointment_controller/nurse_booking_1_controller.dart';
import 'controllers/1_user_view_controller/nurse_list_user_list_controller/nurse_list_user_controller.dart';
import 'controllers/1_user_view_controller/rating_review_controller/rating_review_nurse_controller.dart';
import 'controllers/1_user_view_controller/rozarpay_lab_controller/rozarpay_lab_controller.dart';
import 'controllers/1_user_view_controller/user_about_us/user_about_us_controller.dart';
import 'controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
import 'controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
//import 'controllers/2_franchises_controller/franchies_home_page_controller/franchies_home_page_controllers.dart';
import 'controllers/3_driver_view_controllers/driver_home_page_controller/driver_home_page_controllers.dart';
import 'controllers/3_driver_view_controllers/driver_home_page_controller/driver_user_acpt_rejct_list/user_list_accept_reject_list.dart';
import 'controllers/4_nurse_controllerRRR33344new/nurse_appointment_detail_controller/nurse_appointment_nurse_detailsss.dart';
import 'controllers/4_nurse_controllerRRR33344new/nurse_complain_controller/nurse_complain_controller.dart';
import 'controllers/4_nurse_controller_RRR/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
import 'controllers/5_rwa_controller_RRR/rwa_complain_controller/rwa_complain_controller.dart';
import 'controllers/6_chemist_view_controllers/chemist_home_page_controller/chemist_home_page_controllers.dart';
import 'controllers/6_chemist_view_controllers_RRR/ChemistUpdateProfile_controller.dart';
import 'controllers/6_chemist_view_controllers_RRR/chemist_aboutus_controller.dart';
import 'controllers/6_chemist_view_controllers_RRR/chemist_banner_controller.dart';
import 'controllers/6_chemist_view_controllers_RRR/chemist_complain_controller/chemist_complain_controller.dart';
import 'controllers/6_chemist_view_controllers_RRR/chemist_order_history_controller.dart';
import 'controllers/6_chemist_view_controllers_RRR/chemist_payment_history_controller/chemist_payment_controller.dart';
import 'controllers/6_chemist_view_controllers_RRR/chemist_payout_history_controller/chemist_payoutHistory_controller.dart';
import 'controllers/6_chemist_view_controllers_RRR/chemist_profile_detailController.dart';
import 'controllers/9_doctor_controllers_RRR/doctor_view_report1_controller/doctor_viewreport_controller.dart';
import 'controllers/9_doctor_controllers_RRR/skils_controller/skils_controllers.dart';
import 'controllers/complaint_controller/complaint_controller.dart';
import 'controllers/device_token_controller/devicetoken_controller.dart';
import 'controllers/lab_controller/lab_controller1/lab_controller_1.dart';
import 'controllers/login_email/login_email_controller.dart';
import 'controllers/profile_u_controller/profile_update_controller.dart';
import 'modules_view/splash_screen/splash_screen.dart';

///firebase background services........function....27..jun..2023....
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    Get.lazyPut(() => NurseBooking1Controller());
    Get.lazyPut(() => Doctor_appointment_1_Controller());
    Get.lazyPut(() => SkillsListController());
    Get.lazyPut(() => LabListController());
    Get.lazyPut(() => MapController());
    Get.lazyPut(() => UserHomepagContreoller());
    Get.lazyPut(() => DoctorListController());
    //Get.lazyPut(() => FranchiseHomepagContreoller());
    Get.lazyPut(() => LabHomepagContreoller());
    Get.lazyPut(() => DriverHomepagContreoller());
    Get.lazyPut(() => RwaBannerController());
    Get.lazyPut(() => ChemistHomepagContreoller());
    Get.lazyPut(() => ComplaintController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => NurseBooking1Controller());
    Get.lazyPut(() => NurseAppointmentDetailController());
    Get.lazyPut(() => ChooseLabController());
    Get.lazyPut(() => MedicineAddressController());
    Get.lazyPut(() => medicine_addresssList_Controller());
    Get.lazyPut(() => LabListController());
    Get.lazyPut(() => LabListController());
    Get.lazyPut(() => RozarPayLabController());
    Get.lazyPut(() => AmbulancegetController());
    Get.lazyPut(() => NurseUserListController());
    Get.lazyPut(() => MedicineCartListController());
    Get.lazyPut(() => MedicineListController());

    ///Get.lazyPut(() => CheckoutMedicineController());
    Get.lazyPut(() => UserProfileControllers());
    Get.lazyPut(() => ComplaintLabController());
    Get.lazyPut(() => LabProfileUpdateController());
    Get.lazyPut(() => LabpaymenttController());
    Get.lazyPut(() => LoginpasswordController());
    Get.lazyPut(() => LabprofiledetailController());
    Get.lazyPut(() => Lab_1_Controller());
    Get.lazyPut(() => LabUploadReportController());
    Get.lazyPut(() => LabreportviewController());
    Get.lazyPut(() => DoctorListController());
    Get.lazyPut(() => ReviewRatingNurseController());
    Get.lazyPut(() => ViewdoctorreviewController());
    Get.lazyPut(() => ViewlabreviewController());
    Get.lazyPut(() => ViewhealthchkpreviewController());
    Get.lazyPut(() => ChemistOrderController());
    Get.lazyPut(() => ChemispaymentController());
    Get.lazyPut(() => ChemistProfileDetailController());
    Get.lazyPut(() => ChemistPayoutController());
    Get.lazyPut(() => ChemistUpdateProfileController());
    Get.lazyPut(() => ChemistManageProfileController());
    Get.lazyPut(() => ChemistComplaintController());
    Get.lazyPut(() => ChemistBannerController());
    Get.lazyPut(() => ChemistAboutusController());
    Get.lazyPut(() => RwaBannerController());
    Get.lazyPut(() => Rwa_11_controller());
    Get.lazyPut(() => RwaComplaintController());
    Get.lazyPut(() => NurseAppointmentNurseDetailController());
    Get.lazyPut(() => NursePaymentHistoryControllerss());
    Get.lazyPut(() => RwaAboutusController());
    Get.lazyPut(() => NurseComplaintController());
    //Get.lazyPut(() => NurseUploadReportController());
    Get.lazyPut(() => NursereportviewController());
    Get.lazyPut(() => NurseAboutusController());
    Get.lazyPut(() => UserAboutusController());
    Get.lazyPut(() => DoctorHomepageController());
    Get.lazyPut(() => DoctorProfileControllers());
    Get.lazyPut(() => DoctorreportviewController());
    Get.lazyPut(() => Driver_1111_Controller());
    Get.lazyPut(() => DriverlistnearController());

    //Get.lazyPut(() => DriverlistnearController(driverrepo:get.find(),fenix: true);

    ///franchise....
    Get.lazyPut(() => DraweerFranchiesProfileController());
    Get.lazyPut(() => FranchisePaymentReportController());
    Get.lazyPut(() => FrNurses_1_controller());
    Get.lazyPut(() => FranchiseTdsHistoryReportController());
    Get.lazyPut(() => Patients_Controller());
    Get.lazyPut(() => AddVehicleController());
    Get.lazyPut(() => Fr_Lab_1_Controller());
    Get.lazyPut(() => FrRwa_1_controller());

    Get.lazyPut(() => DevicetokenController());
    Get.lazyPut(() => Ambulanceget3Controller());
    Get.lazyPut(() => Ambulanceget2Controller());
    Get.lazyPut(() => DriverAcceptlistController());
    Get.lazyPut(() => UseracptrejectController());

    ///
    /// Get.lazyPut(() => CheckoutMedicineController());

    //CheckoutMedicineController

    //Ambulanceget3Controller

    //DevicetokenController
    // Get.lazyPut(() => AmbulancegetController());
    //NurseUploadReportController
    // Get.lazyPut(() => NurseUploadReportController());

    //ChemistAboutusController

    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

///without this you can't show notification in background..new
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

void main() async {
  ///firebase notification...old
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("mytoken${fcmToken}");
  // ///other token...
  //
  // ///call background function firebase....27...jun...2023..old
  // /// FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  //
  // ///you can call local notification......old
  // LocalNotificationService.initialize();
  //
  // ///new_notification_services...new.
  // LocalNotificationService();
  //
  // ///todo: changes for map 11 jan 2023........old
  // if (defaultTargetPlatform == TargetPlatform.android) {
  //   AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  // }
  ///todo new for background message........
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

///my newwwww,,,,,git update 15 july 2023...

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:
          //ChemistHomePage(),
          //LabHomePage(),
          //RwaHomePage(),
          //NurseHomePage()
          //DriverHomePage()
          //DoctorHomePage() //SignUpList()
          SplashScreen(),
      //NurseDetailsSchedulePage(),
      //DetailsSchedulePage(),
      //     MessageScreen(
      //   id: '12345',
      // ),
      //initialRoute: AddSkilsScreen.id,
    );
  }
}

///22.... may 2023....live ........
