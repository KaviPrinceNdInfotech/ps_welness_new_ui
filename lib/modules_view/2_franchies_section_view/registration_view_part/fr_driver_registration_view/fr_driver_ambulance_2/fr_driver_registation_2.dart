import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/buttons/back_buttons.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulace_1/fr_driver_registation_1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulance_2/fr_components_2_driver/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulance_2/fr_components_2_driver/head_text.dart';

class FrDriverSignup2 extends StatelessWidget {
  const FrDriverSignup2({Key? key}) : super(key: key);
  //FrDriverSignup1

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    // Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        //SignUpList
        //SignInScreen
        Get.offAll(FrDriverSignup1());
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
          body: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size.height * 0.03,
                  right: -size.width * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.240,
                      width: size.width * 0.55,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/driver002.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.06,
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
                            Get.offAll(FrDriverSignup1());

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
                    FrDriver2HeadText(),
                    FrDriver2Credentials(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
