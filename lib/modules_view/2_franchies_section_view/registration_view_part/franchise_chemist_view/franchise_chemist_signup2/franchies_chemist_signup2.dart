import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/buttons/back_buttons.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/franchise_chemist_view/franchise_chemist_signup2/franchise_chemistcomponents2/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/franchise_chemist_view/franchise_chemist_signup2/franchise_chemistcomponents2/head_text.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/franchise_chemist_view/franchises_chemist_signup1/franchies_chemist_signup1.dart';

class FranchiseChemistSignup2 extends StatelessWidget {
  const FranchiseChemistSignup2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //franchiesChemistSignup1
    bool shouldPop = true;
    // Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        //SignUpList
        //SignInScreen
        Get.offAll(franchiesChemistSignup1());
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
                    top: -size.height * 0.04,
                    right: -size.width * 0.02,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.31,
                        width: size.width * 0.5,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/frche1.png',
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
                              Get.to(franchiesChemistSignup1());

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
                      FranchiesChemist2HeadText(),
                      FranchiesChemist2Credentials(),
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
