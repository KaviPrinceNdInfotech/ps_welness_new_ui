import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/servicess_api/rahul_api_provider/api_provider_RRR.dart';

class FranchisesgalaryController extends GetxController {
  final GlobalKey<FormState> franchisesgalaryformkey = GlobalKey<FormState>();

  var selectedpath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedpath.value = pickedFile.path;
      print("&&&&&&&&&&&&&&&&&&&&JJ: ${pickedFile.path}");
    } else {
      print('No image selected');
    }
  }
  late TextEditingController nameController;
  var name = 'Enter Image Name';
  void frenchiesAddGalleryApi() async {
    final imageAsBase64 = base64Encode(await File(selectedpath.value).readAsBytes());
    http.Response r = await ApiProvider.FrenchiesAddGalleryApi(
        nameController.text,
        selectedpath.value.split('/').last,
      imageAsBase64);
    if (r.statusCode == 200) {
    }else{
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: '');
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    nameController.dispose();
  }
  String? validName(String value) {
    if (value.length < 2) {
      return "              Provide valid name";
    }
    return null;
  }
  void checkAddGallery() {
    final isValid = franchisesgalaryformkey.currentState!.validate();
    frenchiesAddGalleryApi();
    if (!isValid) {
      return;
    }
    franchisesgalaryformkey.currentState!.save();
  }
}
