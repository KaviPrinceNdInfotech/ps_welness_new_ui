import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FrNurses_3_controller extends GetxController {
  final GlobalKey<FormState> frnursesformkey3 = GlobalKey<FormState>();

  late TextEditingController dayController, locationController;



  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    locationController.dispose();
    dayController.dispose();
  }



  void checkNurses3() {
    final isValid = frnursesformkey3.currentState!.validate();
    if (!isValid) {
      return;
    }
    frnursesformkey3.currentState!.save();
  }
}
