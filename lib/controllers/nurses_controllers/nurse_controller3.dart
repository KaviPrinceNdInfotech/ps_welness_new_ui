import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Nurses_3_controller extends GetxController {
  final GlobalKey<FormState> nursesformkey3 = GlobalKey<FormState>();

  late TextEditingController dayController, locationController;

  var day = '';
  var location = '';

  @override
  void onInit() {
    super.onInit();
    locationController = TextEditingController();
    dayController = TextEditingController();
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

  String? validLocation(String value) {
    if (value.length < 2) {
      return "              Provide valid location";
    }
    return null;
  }

  String? validDay(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  void checkNurses3() {
    final isValid = nursesformkey3.currentState!.validate();
    if (!isValid) {
      return;
    }
    nursesformkey3.currentState!.save();
  }
}
