import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/add_bank_for_driver/add_bnk_view_driver/driver_add_bank_credentials.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/add_bank_for_driver/add_bnk_view_driver/driver_add_bank_head_text.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_home/driver_home_page.dart';

class AddDriverBankDetail extends StatelessWidget {
  AddDriverBankDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        //Get.offAll(LabHomePage());
        //Get.offAll(() => LabHomePage());

        Get.to(() => DriverHomePage());

        //Get.back();
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
                    right: -size.width * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.230,
                        width: size.width * 0.55,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/bank_chemist.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddBankDriverHeadText(),
                      AdddBankdriverCredentials(),
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
