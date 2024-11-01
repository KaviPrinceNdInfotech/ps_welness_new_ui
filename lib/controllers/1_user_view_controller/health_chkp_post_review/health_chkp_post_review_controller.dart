import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';
import '../../../../utils/services/account_service.dart';
import '../../../modules_view/1_user_section_views/health_checkup/book__schealthcheckup_shedule/book_checkup_schedule.dart';
import '../health_chkp_view_review/health_chkp_view_review.dart';

class HealthchkpRatingReviewController extends GetxController {
  ViewhealthchkpreviewController _viewhealthchkpreviewController =
      Get.put(ViewhealthchkpreviewController());

  RxInt selectedimg = 0.obs;
  RxInt selectedprice = 0.obs;
  RxBool isLoading = true.obs;
  RxBool rating1 = false.obs;
  RxBool rating2 = false.obs;
  RxBool rating3 = false.obs;
  RxBool rating4 = false.obs;
  RxBool rating5 = false.obs;

  var ratings = 0.0.obs;
  //NurseRatingView? nurseviewreview;

  addReview() {
    Get.dialog(
      RatingDialog(
          title: Text("data"),
          starColor: Colors.amber,
          submitButtonText: "Post Review",
          onSubmitted: (response) {
            print(ratings.value);
          }),
    );
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController Professional = TextEditingController();
  TextEditingController imagePath = TextEditingController();
  TextEditingController imagebase = TextEditingController();

  ///this is the product detail controller.....product Id.........................
  String pro_Id = '';

  GlobalKey<FormState> reviewKey = GlobalKey<FormState>();

  var selectedPath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFiles = await ImagePicker().pickImage(source: imageSource);
    if (pickedFiles != null) {
      selectedPath.value = pickedFiles.path;
      print("File Path ${selectedPath.value}");
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  RxInt star = 1.obs;

  ///add review 10 april 2023...............
  // ======== Add Review ========= ///
  void addHealthchkpReviewApi() async {
    CallLoader.loader();
    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    print("imagebaseeee644:${imageAsBase64}");
    http.Response r = await ApiProvider.postHealthchkpReviewRating(
      rating1.value,
      rating2.value,
      rating3.value,
      rating4.value,
      rating5.value,
      name.text,
      description.text,
      pro_Id,
      selectedPath.value.split('/').last,
      imageAsBase64,
      Professional.text,
    );

    if (r.statusCode == 200) {
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 500),
          () {
            _viewhealthchkpreviewController.healthreviewratingApi();
            _viewhealthchkpreviewController.update();
            Get.snackbar(
                'Add review Successfully', "Review Submitted. Thank-you."
                // "${r.body}"
                );
            Get.to(() => CheckupSchedulePage());
            //Get.to((page))
            ///
          },
        );
      });
      CallLoader.hideLoader();
    } else {
      //CallLoader.hideLoader();
    }
  }

  ///view review ratting controller.....

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    Get.delete<HealthchkpRatingReviewController>();
    super.dispose();
  }

// var selectedImagePath = ''.obs;
// //var selectedImagePath = ''.obs;
// var selectedImageSize = ''.obs;
}
