import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_upload_report_controller/nurse_upload_report_controller.dart';
import 'package:ps_welness_new_ui/controllers/6_chemist_view_controllers_RRR/chemist_profile_detailController.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';

import '../../modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
import '../../modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import '../../modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';
import '../../modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';
import '../../modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';
//import '../../modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import '../../utils/models/account_model.dart';
import '../10_lab_controller/lab_profile_details_controller/lab_profile_details_controller.dart';
import '../10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
import '../1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import '../5_rwa_controller_RRR/rwaBanner_controller.dart';

class LoginpasswordController extends GetxController {
  final GlobalKey<FormState> loginpasswordformkey = GlobalKey<FormState>();
  LabprofiledetailController _labprofiledetailController =
      Get.put(LabprofiledetailController());
  LabUploadReportController _labUploadReportController =
      Get.put(LabUploadReportController());
  UserProfileControllers _userprofile = Get.put(UserProfileControllers());
  ChemistProfileDetailController _chemistProfileDetailController =
      Get.put(ChemistProfileDetailController());
  RwaBannerController _rwaBannerController = Get.put(RwaBannerController());
  NurseProfileControllers _nurseprofileContrller =
      Get.put(NurseProfileControllers());
  DoctorProfileControllers _doctorProfileControllers =
      Get.put(DoctorProfileControllers());

  NurseUploadReportController _nursdeUploadReportController =
      Get.put(NurseUploadReportController());

  var Id = '';

  void emailApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.LoginEmailApi(
      emailController.text,
      passwordController.text,
    );

    if (r.statusCode == 200) {
      print("ACCOUNT ${r.body}");
      final accountData = accountModelFromJson(r.body);
      print("ACCOUNT ${accountData.toJson()}");
      await accountService.setAccountData(accountData);
      CallLoader.hideLoader();

      switch (accountData.role) {
        case 'patient':
          _userprofile.userprofileApi();
          _userprofile.update();

          /// we can navigate to user page.....................................
          Get.to(const UserHomePage());
          break;
        // case 'Patient':
        //
        //   /// we can navigate to user page.....................................
        //   Get.to(const UserHomePage());
        //   break;
        /// we can navigate to franchise page.....................................
        case 'Franchise':
          Get.to(FranchiesHomePage());
          break;
        case 'lab':
          _labprofiledetailController.update();
          _labprofiledetailController.labprofileApi();
          _labUploadReportController.getlabpatientApi();
          _labUploadReportController.update();

          Get.to(LabHomePage());
          break;
        case 'doctor':
          _doctorProfileControllers.doctorprofileApi();
          _doctorProfileControllers.update();
          Get.to(DoctorHomePage());
          break;
        case 'driver':
          Get.to(DriverHomePage());
          break;
        case 'nurse':
          _nursdeUploadReportController.getnursepatientssApi();
          _nursdeUploadReportController.update();
          _nurseprofileContrller.nurseprofileApi();
          _nurseprofileContrller.update();
          Get.to(NurseHomePage());
          break;
        case 'RWA':
          _rwaBannerController.RwaBannerApi();
          _rwaBannerController.update();
          Get.to(RwaHomePage());
          break;
        case 'chemist':
          _chemistProfileDetailController.chemistProfileDetailsApi();
          _chemistProfileDetailController.update();
          Get.to(ChemistHomePage());
          break;
        default:
          break;
      }
    }
  }

  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    Get.delete<LoginpasswordController>();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validEmail(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    // if (!GetUtils.isEmail(value)) {
    //   return "              Email is not valid";
    // }
    return null;
  }

  String? validPassword(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length < 5) {
      return '              Password should have atleast 5 characters';
    }
    // if (!RegExp(r'[A-Z0-9a-z]*').hasMatch(value)) {
    //   return '              Enter a stronger password';
    // }
    //return null;
  }

  void checkLoginpassword() {
    if (loginpasswordformkey.currentState!.validate()) {
      emailApi();
    }
    loginpasswordformkey.currentState!.save();
  }
}

//}
//     final isValid = loginpasswordformkey.currentState!.validate();
//
//     if (!isValid) {
//       emailApi();
//
//       return;
//     }
//     loginpasswordformkey.currentState!.save();
//     //Get.to(SignUpList());
//   }
// }
