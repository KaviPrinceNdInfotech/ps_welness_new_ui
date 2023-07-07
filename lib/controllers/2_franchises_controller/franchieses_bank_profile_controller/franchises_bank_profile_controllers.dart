import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';
import 'package:http/http.dart' as http;

class FranchisesBankProfileController extends GetxController {
  final GlobalKey<FormState> franchisesbankprofileformkey = GlobalKey<FormState>();

  var selectedImagepath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }
  late TextEditingController accountholdernameController,locationController,accountController,ifscController,BranchName;
  var account = '';
  var name = '';
  var location = '';
  var accountholdername = '';
  var ifsc = '';
  void franchiesUpdateBankApi() async {
    http.Response r = await ApiProvider.FranchiseUpdateBankApi(
        accountholdernameController.text,
        locationController.text,
        accountController.text,
        ifscController.text,
        BranchName.text
    );
    if (r.statusCode == 200) {
    }
  }
  @override
  void onInit() {
    super.onInit();
    accountholdernameController = TextEditingController(text: 'Ram Kumar');
    locationController = TextEditingController(text: 'Noida Sector 63');
    accountController = TextEditingController(text: "2345667754");
    ifscController = TextEditingController(text: 'SBIN000RDS');
    BranchName = TextEditingController(text: 'pnb');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }

  String? validaccountNumber(String value) {
    if (value.length < 8) {
      return "              Provide valid account no";
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
    franchiesUpdateBankApi();
    if (!isValid) {
      return;
    }
    franchisesbankprofileformkey.currentState!.save();
  }
}
