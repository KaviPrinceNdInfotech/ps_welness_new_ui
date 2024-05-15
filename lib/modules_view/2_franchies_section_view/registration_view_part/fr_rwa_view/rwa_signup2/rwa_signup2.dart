import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_rwa_view/rwa_signup1/rwa_signup1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_rwa_view/rwa_signup2/rwacomponents2/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_rwa_view/rwa_signup2/rwacomponents2/head_text.dart';

import '../../../../../constants/buttons/back_buttons.dart';

class FrRwaSignup2 extends StatelessWidget {
  const FrRwaSignup2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //FrRwaSignup1
    bool shouldPop = true;
    // Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        //SignUpList
        //SignInScreen
        Get.offAll(FrRwaSignup1());
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
                    top: size.height * 0.035,
                    //bottom: size.height * 0.64,
                    //left: -30,
                    right: -size.width * 0.09,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.254,
                        width: size.width * 0.58,
                        decoration: BoxDecoration(
                            //color: Colors.,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/icons/frrwa2.png',
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
                              Get.offAll(FrRwaSignup1());

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
                      FrRwa2HeadText(),
                      FrRwa2Credentials(),
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
