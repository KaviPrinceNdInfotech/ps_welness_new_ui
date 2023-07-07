import 'dart:convert';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/9_doctors_model/get_all_skils_model/get_all_skils_model.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/drawer_view/drower_pages/skils_view/add_skils/add_skils_todo.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class SkillsListController extends GetxController {
  final GlobalKey<FormState> skillsformkey = GlobalKey<FormState>();

  RxBool isLoading = true.obs;
  GetskillsModel? viewSkilsReport;

  void skillsListApi() async {
    isLoading(true);
    viewSkilsReport = await ApiProvider.getSkillsApi();
    if (viewSkilsReport?.skills != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  void addskillsApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.doctorSkillsApi(
      doctoridController.text,
      skillsnameController.text,
    );
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      CallLoader.hideLoader();
      skillsListApi();
      Get.to(
        () => SkillsListScreen(), //next page class
        duration: Duration(
            milliseconds: 400), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );

      //Get.back();
      //Get.offAll(() => AddSkilsScreen());

    }
  }

  ///
  //doctorSkillDeleteApi
  void deleteskillsApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.doctorSkillDeleteApi();
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      CallLoader.hideLoader();
      skillsListApi();
      Get.to(
        () => SkillsListScreen(), //next page class
        duration: Duration(
            milliseconds: 400), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );

      //Get.back();
      //Get.offAll(() => AddSkilsScreen());

    }
  }

  late TextEditingController doctoridController, skillsnameController;

  var Doctor_Id = '';
  var SkillName = '';

  @override
  void onInit() {
    super.onInit();

    doctoridController = TextEditingController();

    skillsnameController = TextEditingController();
    skillsListApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //skillsList != null;
    doctoridController.dispose();
    skillsnameController.dispose();

    //super.onClose();
  }

  @override
  void dispose() {
    Get.delete<SkillsListController>();
    //skillsList != null;
    super.dispose();
  }

  String? validskillss(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  void checkSkills() {
    if (skillsformkey.currentState!.validate()) {
      addskillsApi();
    }
    skillsformkey.currentState!.save();
  }
}

///todo from here checkout model value..............
