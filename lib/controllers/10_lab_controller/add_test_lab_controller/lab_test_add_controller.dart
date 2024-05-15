import 'dart:convert';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/model/10_lab_module/add_labtest_view/add_test_vieews.dart';
import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_testname_model_new.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_drawer_view/drower_pages/lab_test_view/add_labtestts/add_test_todo.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

// class RIKeys {
//   static final riKey1 = const Key('__RIKEY1__');
//   static final riKey2 = const Key('__RIKEY2__');
//   static final riKey3 = const Key('__RIKEY3__');
// }

class LabTestListController extends GetxController {
  //final GlobalKey<FormState> testformkey2323 = GlobalKey<FormState>();
  final GlobalKey<FormState> testformkey2323 =
      new GlobalKey<FormState>(debugLabel: '_loginFormKey2');
  //testformkey2323.currentState.show();

  RxBool isLoading = true.obs;
  //GetskillsModel? viewSkilsReport;
  Labtestaddedlist? labtestaddedlist;

  // Rx<TestModel?> selectedTest = (null as TestModel?).obs;
  // List<TestModel> tests = <TestModel>[].obs;

  Rx<LabTestName?> selectedTest = (null as LabTestName?).obs;
  List<LabTestName> tests = <LabTestName>[].obs;

  ///lab test api class.................
  void getTestNameApi() async {
    tests = (await ApiProvider.getTestNameNewApi())!;
    print('Prince lab test  list');
    print(tests);
  }

  void labTestListApi() async {
    isLoading(true);
    labtestaddedlist = await ApiProvider.getTestlabApi();
    if (labtestaddedlist?.labTest != null
        //viewSkilsReport?.skills != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  void addLabTestApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.addTestLabsApi(
      doctoridController.text,
      selectedTest.value?.id.toString(),
    );
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      CallLoader.hideLoader();
      labTestListApi();
      Get.to(
        () => LabtestListScreen(), //next page class
        duration: Duration(
            milliseconds: 200), //duration of transitions, default 1 sec
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
  void deleteTestApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.labtestDeleteApi();
    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);
      CallLoader.hideLoader();
      labTestListApi();
      Get.to(
        () => LabtestListScreen(), //next page class
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
    labTestListApi();
    getTestNameApi();
    super.onInit();

    doctoridController = TextEditingController();

    skillsnameController = TextEditingController();
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
    doctoridController.dispose();
    skillsnameController.dispose();

    Get.delete<LabTestListController>();
    //skillsList != null;
    super.dispose();
  }

  String? validskillss(String value) {
    if (value.length < 2) {
      return "This is required field.";
    }
    return null;
  }

  void checkTest() {
    //addLabTestApi();
    if (testformkey2323.currentState!.validate()) {
      addLabTestApi();
    }
    testformkey2323.currentState!.save();
  }
}

///todo from here checkout model value..............
