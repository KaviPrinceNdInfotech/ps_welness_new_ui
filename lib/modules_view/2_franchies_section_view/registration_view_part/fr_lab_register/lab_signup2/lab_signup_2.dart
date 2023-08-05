import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ps_welness_new_ui/constants/buttons/back_buttons.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_lab_register/lab_signup1/lab_signup1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_lab_register/lab_signup2/lab_components2/head_text.dart';

//import 'package:ps_welness/modules_view/lab_center/lab_signup2/lab_components2/credentials.dart';
//import 'package:ps_welness/modules_view/lab_center/lab_signup2/lab_components2/head_text.dart';

import 'lab_components2/credentials.dart';

class FrLabSignup2 extends StatelessWidget {
  const FrLabSignup2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ///FrLabSignup1
    bool shouldPop = true;
    // Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        //SignUpList
        //SignInScreen
        Get.to(FrLabSignup1());
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
                    top: -size.height * 0.12,
                    right: -size.width * 0.08,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.554,
                        width: size.width * 0.6,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/frlab2.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.01,
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
                              Get.to(FrLabSignup1());

                              //Get.offAll(franchiesChemistSignup1());

                              ///Get.back();
                            },
                            //gradient: MyTheme.gradient7,
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
                      FrLab2HeadText(),
                      FrLab2Credentials(),
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
