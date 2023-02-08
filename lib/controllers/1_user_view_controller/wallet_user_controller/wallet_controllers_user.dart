import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Wallet_2_Controller extends GetxController {
  final GlobalKey<FormState> walletformkey = GlobalKey<FormState>();

  // var status = "online".obs;
  // var followers = 0.obs;
  // RxString textVal = "a".obs;
  // late final editingController = TextEditingController().obs;
  // void updateString() {
  //   textVal.value = editingController.value.text;
  // }

  ///TODO: image picker.................
  ///
  var selectedImagepath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  late TextEditingController ammountController;

  var amount = '';

  //get stateCitymap => null;

  @override
  void onInit() {
    // stateCitymap((key, value) {
    //   states.add(key);
    // }
    //);
    states.refresh();
    //editingController = TextEditingController();

    ammountController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    ammountController.dispose();
  }

  String? validAmount(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  void checkAmount() {
    final isValid = walletformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    walletformkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
