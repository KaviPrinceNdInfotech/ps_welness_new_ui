import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';

import '../../modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
import '../../modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import '../../modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import '../../modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';
import '../../modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';
import '../../modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';
//import '../../modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
//import '../../modules_view/9_doctor_section_view/home_page_view/home_page.dart';
import '../../modules_view/onboardonds/onboarding_screens.dart';
import '../10_lab_controller/lab_profile_details_controller/lab_profile_details_controller.dart';
import '../10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
import '../1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  LabprofiledetailController _labprofiledetailController =
      Get.put(LabprofiledetailController());
  LabUploadReportController _labUploadReportController =
      Get.put(LabUploadReportController());
  UserProfileControllers _userprofile = Get.put(UserProfileControllers());

  @override
  void onInit() {
    animationInitilization();
    super.onInit();
    accountService.getAccountData.then((accountData) {
      Timer(
        const Duration(seconds: 4),
        () {
          if (accountData == null) {
            Get.to(OnboardingPage());
          } else {
            switch (accountData.role) {
              case 'patient':
                _userprofile.userprofileApi();
                _userprofile.update();

                /// we can navigate to user page.....................................
                Get.to(UserHomePage());
                break;

              /// we can navigate to franchise page.....................................
              case 'Franchise':
                Get.to(FranchiesHomePage());
                break;
              case 'lab':
                _labUploadReportController.getlabpatientApi();
                _labUploadReportController.update();
                _labprofiledetailController.update();
                _labprofiledetailController.labprofileApi();
                Get.to(LabHomePage());
                break;
              case 'doctor':
                Get.to(DoctorHomePage());
                break;
              case 'driver':
                Get.to(DriverHomePage());
                break;
              case 'nurse':
                Get.to(NurseHomePage());
                break;
              case 'RWA':
                Get.to(RwaHomePage());
                break;
              case 'chemist':
                Get.to(ChemistHomePage());
                break;
              default:
                break;
            }
          }
        },
      );
    });
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation = CurvedAnimation(parent: animationController, curve: Curves.ease)
        .obs
        .value;
    animation.addListener(() => update());
    animationController.forward();
  }

  @override
  void dispose() {
    SplashScreenViewModel();
    animationInitilization();

    super.dispose();
  }
}
