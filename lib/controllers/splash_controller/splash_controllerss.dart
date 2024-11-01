// import 'dart:async';
//
// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
// import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
// import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesProfileDetail_controller.dart';
// import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchies_banner_controller.dart';
// import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_detail_controller.dart';
// import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_profile_controller.dart';
// import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_upload_report_controller/nurse_upload_report_controller.dart';
// import 'package:ps_welness_new_ui/controllers/6_chemist_view_controllers_RRR/chemist_banner_controller.dart';
// import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_home_controller/doctor_home_controllers.dart';
// import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
// import 'package:ps_welness_new_ui/controllers/device_token_controller/devicetoken_controller.dart';
// import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
// import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/chemist_home/chemist_home_page.dart';
// import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
// import 'package:ps_welness_new_ui/utils/services/account_service.dart';
//
// import '../../modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
// import '../../modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
// //import '../../modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
// import '../../modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';
// import '../../modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';
// import '../../modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';
// //import '../../modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
// //import '../../modules_view/9_doctor_section_view/home_page_view/home_page.dart';
// import '../../modules_view/onboardonds/onboarding_screens.dart';
// import '../10_lab_controller/lab_profile_details_controller/lab_profile_details_controller.dart';
// import '../10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
// import '../1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
// import '../6_chemist_view_controllers_RRR/chemist_profile_detailController.dart';
//
// class SplashScreenViewModel extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<double> animation;
//   LabprofiledetailController _labprofiledetailController =
//       Get.put(LabprofiledetailController());
//   LabUploadReportController _labUploadReportController =
//       Get.put(LabUploadReportController());
//   UserProfileControllers _userprofile = Get.put(UserProfileControllers());
//   ChemistProfileDetailController _chemistProfileDetailController =
//       Get.put(ChemistProfileDetailController());
//   NurseProfileControllersdetail _nurseprofileContrller =
//       Get.put(NurseProfileControllersdetail());
//   DoctorProfileControllers _doctorProfileControllers =
//       Get.put(DoctorProfileControllers());
//   NurseUploadReportController _nursdeUploadReportController =
//       Get.put(NurseUploadReportController());
//   DriverProfileDetailController _driverprofile =
//       Get.put(DriverProfileDetailController());
//
//   DevicetokenController _devicetokenController =
//       Get.put(DevicetokenController());
//
//   ChemistBannerController _chemistBannerController =
//       Get.put(ChemistBannerController());
//
//   DoctorHomepageController _doctorHomepageController =
//       Get.put(DoctorHomepageController());
//
//   ///user banner
//   UserHomepagContreoller _userhomePageController =
//       Get.put(UserHomepagContreoller());
//
//   ///use franchise...........
//   FrenchiesProfileDetailController _frenchiesProfileDetailController =
//       Get.put(FrenchiesProfileDetailController());
//
//   FrenchiesBannerController frenchiesBannerController =
//       Get.put(FrenchiesBannerController());
//
//   @override
//   void onInit() {
//     animationInitilization();
//     super.onInit();
//     accountService.getAccountData.then((accountData) {
//       Timer(
//         const Duration(seconds: 1), // Delay by 1 second
//         () async {
//           if (accountData == null) {
//             Get.to(OnboardingPage());
//
//             ///todo: 2 sep....2023..
//             throw Exception();
//           } else {
//             switch (accountData.role) {
//               case 'patient':
//                 _userprofile.userprofileApi();
//                 _userprofile.update();
//                 _devicetokenController.UsertokenApi();
//                 await _userhomePageController.sliderBannerApi();
//                 await Get.to(UserHomePage());
//                 throw Exception();
//               case 'Franchise':
//                 _frenchiesProfileDetailController.frenchiesProfileDetailApi();
//                 _frenchiesProfileDetailController.update();
//                 await frenchiesBannerController.FrenchiesBannerApi();
//                 await Get.to(FranchiesHomePage());
//                 break;
//               case 'lab':
//                 _labUploadReportController.getlabpatientApi();
//                 _labUploadReportController.update();
//                 _labprofiledetailController.update();
//                 _labprofiledetailController.labprofileApi();
//                 Get.to(LabHomePage());
//                 break;
//               case 'doctor':
//                 _doctorProfileControllers.doctorprofileApi();
//                 await _doctorHomepageController.doctorBannerApi();
//                 _doctorProfileControllers.update();
//                 _devicetokenController.DoctortokenApi();
//                 Get.to(DoctorHomePage());
//                 break;
//               case 'driver':
//                 _driverprofile.driverProfileDetailApi();
//                 _driverprofile.update();
//                 _devicetokenController.DrivertokenApi();
//                 Get.to(DriverHomePage());
//                 break;
//               case 'nurse':
//                 _nurseprofileContrller.nurseprofileApi();
//                 _nurseprofileContrller.update();
//                 _devicetokenController.NursetokenApi();
//                 _nursdeUploadReportController.getnursepatientssApi();
//                 _nursdeUploadReportController.update();
//                 Get.to(NurseHomePage());
//                 break;
//               case 'RWA':
//                 Get.to(RwaHomePage());
//                 break;
//               case 'chemist':
//                 await _chemistProfileDetailController
//                     .chemistProfileDetailsApi();
//                 _chemistProfileDetailController.update();
//                 await _chemistBannerController.chemistBannerApi();
//                 _chemistBannerController.update();
//                 await Future.delayed(
//                     Duration(milliseconds: 900)); // Delay for 0.9 seconds
//                 await Get.to(ChemistHomePage());
//                 break;
//               default:
//                 break;
//             }
//           }
//         },
//       );
//     });
//   }
//
//   animationInitilization() {
//     animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 4));
//     animation = CurvedAnimation(parent: animationController, curve: Curves.ease)
//         .obs
//         .value;
//     animation.addListener(() => update());
//     animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     SplashScreenViewModel();
//     animationInitilization();
//
//     super.dispose();
//   }
// }
///
/// todo: 1 may 2024...
import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesProfileDetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchies_banner_controller.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_detail_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_upload_report_controller/nurse_upload_report_controller.dart';
import 'package:ps_welness_new_ui/controllers/6_chemist_view_controllers_RRR/chemist_banner_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_home_controller/doctor_home_controllers.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/device_token_controller/devicetoken_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';

import '../../modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
import '../../modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import '../../modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';
import '../../modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';
import '../../modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';
import '../../modules_view/onboardonds/onboarding_screens.dart';
import '../10_lab_controller/lab_profile_details_controller/lab_profile_details_controller.dart';
import '../10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
import '../1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import '../6_chemist_view_controllers_RRR/chemist_profile_detailController.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  /// late AnimationController animationController;
  ///late Animation<double> animation;
  final LabprofiledetailController _labprofiledetailController =
      Get.put(LabprofiledetailController());
  final LabUploadReportController _labUploadReportController =
      Get.put(LabUploadReportController());
  final UserProfileControllers _userprofile = Get.put(UserProfileControllers());
  final ChemistProfileDetailController _chemistProfileDetailController =
      Get.put(ChemistProfileDetailController());
  final NurseProfileControllersdetail _nurseprofileContrller =
      Get.put(NurseProfileControllersdetail());
  final DoctorProfileControllers _doctorProfileControllers =
      Get.put(DoctorProfileControllers());
  final NurseUploadReportController _nursdeUploadReportController =
      Get.put(NurseUploadReportController());
  final DriverProfileDetailController _driverprofile =
      Get.put(DriverProfileDetailController());

  final DevicetokenController _devicetokenController =
      Get.put(DevicetokenController());

  final ChemistBannerController _chemistBannerController =
      Get.put(ChemistBannerController());

  final DoctorHomepageController _doctorHomepageController =
      Get.put(DoctorHomepageController());

  final UserHomepagContreoller _userhomePageController =
      Get.put(UserHomepagContreoller());

  final FrenchiesProfileDetailController _frenchiesProfileDetailController =
      Get.put(FrenchiesProfileDetailController());

  FrenchiesBannerController frenchiesBannerController =
      Get.put(FrenchiesBannerController());

  @override
  void onInit() {
    super.onInit();
    accountService.getAccountData.then((accountData) {
      Timer(
        const Duration(seconds: 1), // Delay by 2 seconds
        () async {
          try {
            if (accountData == null) {
              // If account data is null, navigate to OnboardingPage
              Get.offAll(OnboardingPage());
              // Throw exception after navigating to OnboardingPage
              throw Exception('User account data is null.');
            } else {
              switch (accountData.role) {
                case 'patient':
                  _userprofile.userprofileApi();
                  _userprofile.update();
                  _devicetokenController.UsertokenApi();
                  _userhomePageController.sliderBannerApi();
                  Get.offAll(UserHomePage());
                  break;
                case 'Franchise':
                  _frenchiesProfileDetailController.frenchiesProfileDetailApi();
                  _frenchiesProfileDetailController.update();
                  frenchiesBannerController.FrenchiesBannerApi();
                  Get.offAll(FranchiesHomePage());
                  break;
                case 'lab':
                  _labUploadReportController.getlabpatientApi();
                  _labUploadReportController.update();
                  _labprofiledetailController.update();
                  _labprofiledetailController.labprofileApi();
                  Get.offAll(LabHomePage());
                  break;
                case 'doctor':
                  _doctorProfileControllers.doctorprofileApi();
                  _doctorHomepageController.doctorBannerApi();
                  _doctorProfileControllers.update();
                  _devicetokenController.DoctortokenApi();
                  Get.offAll(DoctorHomePage());
                  break;
                case 'driver':
                  _driverprofile.driverProfileDetailApi();
                  _driverprofile.update();
                  _devicetokenController.DrivertokenApi();
                  Get.offAll(DriverHomePage());
                  break;
                case 'nurse':
                  _nurseprofileContrller.nurseprofileApi();
                  _nurseprofileContrller.update();
                  _devicetokenController.NursetokenApi();
                  _nursdeUploadReportController.getnursepatientssApi();
                  _nursdeUploadReportController.update();
                  Get.to(NurseHomePage());
                  break;
                case 'RWA':
                  Get.offAll(RwaHomePage());
                  break;
                case 'chemist':
                  await _chemistProfileDetailController
                      .chemistProfileDetailsApi();
                  _chemistProfileDetailController.update();
                  await _chemistBannerController.chemistBannerApi();
                  _chemistBannerController.update();
                  await Future.delayed(Duration(milliseconds: 900));
                  Get.offAll(ChemistHomePage());
                  break;
                default:
                  // If the user's role is not recognized, you can log them out and redirect to the onboarding page
                  // Or you can handle this scenario based on your application's logic
                  Get.offAll(OnboardingPage());
                  break;
              }
            }
          } catch (e) {
            // Handle exceptions here
            print('Exception occurred: $e');

            // Navigate to welcome page on exception
            // Get.offAll(WelcomePage());
          }
        },
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
