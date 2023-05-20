import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../../servicess_api/api_services_all_api.dart';

class NurseRatingReviewController extends GetxController {
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

  // ///............................view rating review..................
  // GetProductReview? getProductreview;
  //
  // void getreviewdetailApi() async {
  //   // var prefs = GetStorage();
  //   //
  //   // productid = prefs.read("Id").toString();
  //   // print('&&&&&&&&&&&&&&&&&&&&&&Id:${productid}');
  //   //productId = id;
  //
  //   isLoading(true);
  //
  //   getProductreview = await ApiProvider.viewreviewApi();
  //   if (getProductreview != null) {
  //     //Get.to(() => ItemDetailss());
  //     isLoading(false);
  //     var prefs = GetStorage();
  //     //saved id..........
  //     //prefs.write("Id".toString(), json.decode(r.body)['Id']);
  //     // productid = prefs.read("Id").toString();
  //     // print('&&&&&&&&&&&&&&&&&&&&&&:${productid}');
  //     ///
  //     // Get.to(
  //     //       () => ItemDetailsss(productId: productid,), //next page class
  //     //   duration: Duration(
  //     //       milliseconds: 300), //duration of transitions, default 1 sec
  //     //   transition:
  //     //   // Transition.leftToRight //transition effect
  //     //   // Transition.fadeIn
  //     //   //Transition.size
  //     //   Transition.zoom,
  //     // );
  //
  //
  //
  //     //Get.to(()=>Container());
  //   }
  // }

  ///add review 10 april 2023...............
  // ======== Add Review ========= ///
  void addNurseProductReviewApi() async {
    CallLoader.loader();

    final imageAsBase64 =
        base64Encode(await File(selectedPath.value).readAsBytes());
    print("imagebaseeee644:${imageAsBase64}");
    http.Response r = await ApiProvider.postReviewRating(
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
      CallLoader.hideLoader();
    } else {
      CallLoader.hideLoader();
    }
  }

  ///view review ratting controller.....

  @override
  void onInit() {
    super.onInit();
    //nursereviewratingApi();
    // getreviewdetailApi();
    // getreviewdetailApi();
    //getProductDetailsApi();
  }

  @override
  void dispose() {
    Get.delete<NurseRatingReviewController>();
    super.dispose();
  }

  // var selectedImagePath = ''.obs;
  // //var selectedImagePath = ''.obs;
  // var selectedImageSize = ''.obs;
}
