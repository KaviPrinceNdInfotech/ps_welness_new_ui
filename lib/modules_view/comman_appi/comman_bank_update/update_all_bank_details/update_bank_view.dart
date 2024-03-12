import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_home/rwa_home_page.dart';
//import 'package:ps_welness_new_ui/modules_view/comman_appi/comman_bank_update/update_all_bank_details/bank_profile_components/head_text.dart';
import 'package:ps_welness_new_ui/modules_view/comman_appi/comman_bank_update/update_all_bank_details/bank_update_components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/comman_appi/comman_bank_update/update_all_bank_details/bank_update_components/head_text.dart';

//import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_update_bank_details/bank_update_components/head_text.dart';

//import 'bank_profile_components/credentials.dart';

class UpdateBankDetailRwa extends StatelessWidget {
  UpdateBankDetailRwa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;

    return WillPopScope(
      onWillPop: () async {
        Get.to(RwaHomePage());
        return shouldPop;
      },
      child: Container(
        decoration: BoxDecoration(
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
                    //bottom: size.height * 0.64,
                    //left: -30,
                    right: size.width * 0.04,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: size.height * 0.22,
                        width: size.width * 0.45,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/icons/rwabank1.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UpdateBankHeadText(),
                      UpdateBankCredentials(),
                      //HospitalSocial(),
                      //Spacer(),
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
