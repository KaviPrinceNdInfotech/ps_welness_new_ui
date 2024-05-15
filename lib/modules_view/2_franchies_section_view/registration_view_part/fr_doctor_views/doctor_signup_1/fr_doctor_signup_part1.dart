import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/buttons/back_buttons.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';

//import 'package:ps_welness/constants/constants/constants.dart';

import '../../fr_choose_registration_type/fr_choose_catagary.dart';
import 'doctor_1_components/credentials.dart';
import 'doctor_1_components/head_text.dart';

class FrDoctorSignup1 extends StatelessWidget {
  const FrDoctorSignup1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    // Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        //SignUpList
        //SignInScreen
        Get.offAll(FrRegistrationCatagaryDetails());
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
                    top: -size.height * 0.03,
                    right: -size.width * 0.006,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.32,
                        width: size.width * 0.49,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/fr_doctor2.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.005,
                    left: size.width * 0.06,
                    child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: size.height * 0.04,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GradientButton(
                            onPressed: () {
                              Get.offAll(FrRegistrationCatagaryDetails());

                              //Get.back();
                            },
                            // gradient: MyTheme.gradient7,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_left,
                                  size: 16,
                                  color: Colors.yellow.shade200,
                                ),
                                Text(
                                  'back',
                                  style: TextStyle(
                                    color: Colors.yellow.shade200,
                                    fontSize: size.height * 0.014,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FrDoctor1HeadText(),
                      FrDoctor1Credentials(),
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
