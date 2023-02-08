import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

import '../../modules_view/onboardonds/onboarding_screens.dart';
//import 'package:ps_welness/modules_view/onboardonds/onboarding_screens.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitilization();
    super.onInit();

    Timer(
      const Duration(seconds: 4),
      () => Get.off(
        OnboardingPage(),
        // WelcomeScreen(),
      ),
    );
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
