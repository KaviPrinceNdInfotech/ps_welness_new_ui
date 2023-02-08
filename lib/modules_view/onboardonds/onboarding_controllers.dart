import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
//import 'package:ps_welness/modules_view/sign_in/sigin_screen.dart';

import 'onboarding_models.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  // forwardAction() {
  //   if (isLastPage) {
  //     //pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  //     Get.to(() => LoginPage());
  //     //LoginPage();
  //     //go to home page
  //   } else
  //     pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  // }

  forwardAct() {
    if (isLastPage)
      Get.to(() => SignInScreen());
    //LoginPage());
    else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        'lib/assets/image/24867-online-doctor-app.zip',
        'Get Healthcare Online',
        'We deliver high quality, affordable online healthcare services in all over india.'),
    OnboardingInfo(
        'lib/assets/image/92309-online-doctor.zip',
        'Consult to expert ',
        'Find the right health specialist from our list of experienced doctors.'),
    OnboardingInfo('lib/assets/image/83028-ambulance.zip', 'Quick Availability',
        'Ambulance Availability in 30 minutes.'),
  ];
}
