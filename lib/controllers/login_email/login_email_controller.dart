import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';

import '../../modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
import '../../modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import '../../modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';
import '../../modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';
import '../../modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';
import '../../modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import '../../utils/models/account_model.dart';
import '../10_lab_controller/lab_profile_details_controller/lab_profile_details_controller.dart';

class LoginpasswordController extends GetxController {
  final GlobalKey<FormState> loginpasswordformkey = GlobalKey<FormState>();
  LabprofiledetailController _labprofiledetailController =
      Get.put(LabprofiledetailController());
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

          Get.to(LabHomePage());
          break;
        case 'doctor':
          Get.to(DoctorHomePage());
          break;
        case 'driver':
          Get.to(DriverHomePage());
          break;
        case 'nurse':
          Get.to(NurseHomePage());
          break;
        case 'RWA':
          Get.to(RwaHomePage());
          break;
        case 'chemist':
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
