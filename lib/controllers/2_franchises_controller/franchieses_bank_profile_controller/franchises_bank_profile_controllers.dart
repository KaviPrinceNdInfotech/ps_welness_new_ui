import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../modules_view/circular_loader/circular_loaders.dart';

class FranchisesBankProfileController extends GetxController {
  final GlobalKey<FormState> franchisesbankprofileformkey =
      GlobalKey<FormState>();

  var selectedImagepath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  late TextEditingController accountholdernameController,
      mobileController,
      locationController,
      accountController,
      ifscController,
      BranchName;
  var account = '';
  var mobile = '';
  var name = '';
  var location = '';
  var accountholdername = '';
  var ifsc = '';
  void franchiesUpdateBankApi() async {
    http.Response r = await ApiProvider.FranchiseUpdateBankApi(
        accountholdernameController.text,
        mobileController.text,
        locationController.text,
        accountController.text,
        ifscController.text,
        BranchName.text);
    if (r.statusCode == 200) {
      // Get.snackbar(
      //   'Success',
      //   "${r.body}",
      //   duration: const Duration(seconds: 1),
      // );
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 900));
      CallLoader.hideLoader();
      await SharedPreferences.getInstance()
          .then((value) => Get.offAll(() => FranchiesHomePage()));
    } else {
      Get.snackbar(
        'Fail',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    accountholdernameController = TextEditingController();
    mobileController = TextEditingController();
    locationController = TextEditingController();
    accountController = TextEditingController();
    ifscController = TextEditingController();
    BranchName = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String? validaccountNumber(String value) {
    if (value.length < 8) {
      return "              Provide valid account no";
    }
    return null;
  }

  String? validMobile(String value) {
    if (value.length < 10) {
      return "              Provide valid Phone number";
    }
    return null;
  }

  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }

  String? validLocation(String value) {
    if (value.length < 2) {
      return "              Provide valid location";
    }
    return null;
  }

  String? validHolderName(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 2) {
      return '              Provide valid Account Holder name.';
    }
    return null;
  }

  String? validIfsc(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 4) {
      return '              Provide valid IFSC code.';
    }
    return null;
  }

  void checkUpdateBankProfilee() {
    final isValid = franchisesbankprofileformkey.currentState!.validate();

    if (isValid) {
      franchiesUpdateBankApi();
      return;
    } else {}
    franchisesbankprofileformkey.currentState!.save();
  }
}
