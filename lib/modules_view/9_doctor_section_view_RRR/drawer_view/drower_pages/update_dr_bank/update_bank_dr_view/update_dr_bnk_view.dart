import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/drawer_view/drower_pages/update_dr_bank/update_bank_dr_view/head_text_dr_bnk_update.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/drawer_view/drower_pages/update_dr_bank/update_bank_dr_view/update_bank_credentials_dr.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

//import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_update_bank_details/profile_components/credentials.dart';
//import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_update_bank_details/profile_components/head_text.dart';

//import 'bank_update_components/credentials.dart';
//import 'bank_update_components/head_text.dart';

class UpdateBankDrDetail extends StatelessWidget {
  UpdateBankDrDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;

    return WillPopScope(
      onWillPop: () async {
        // Get.back();
        Get.to(DoctorHomePage());
        return shouldPop;
      },
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              lightPrimary,
              darkPrimary,
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: size.height * 0.016,
                    right: -size.width * 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/fr_bank_profile1.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UpdateBankDoctorHeadText(),
                      UpdateBankDoctorCredentials(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
