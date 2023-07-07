import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NurseUploadReportController extends GetxController{
  //image picker
  var selectedImagePath= ''.obs;
  var selectedImageSize= ''.obs;
  void getImage(ImageSource imageSource) async{
    final pickedFile= await ImagePicker().getImage(source: imageSource);
    if(pickedFile != null)
    {
      selectedImagePath.value=pickedFile.path;
      selectedImageSize.value=((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+ " Mb";
    }else{
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}