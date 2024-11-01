import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';

///import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_user_views/rwa_user_components/head_text.dart';
import 'package:ps_welness_new_ui/modules_view/rwa_view/rwa_signup1/rwacomponents/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/rwa_view/rwa_signup1/rwacomponents/head_text.dart';
import 'package:ps_welness_new_ui/modules_view/sign_up_list/sign_up_list.dart';

class RwaSignup1 extends StatelessWidget {
  const RwaSignup1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool shouldPop = true;
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        //SignUpList
        //SignInScreen
        Get.offAll(SignUpList());
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
                    top: -size.height * 0.02,
                    //bottom: size.height * 0.64,
                    //left: -30,
                    right: -size.width * 0.13,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.30,
                        width: size.width * 0.55,
                        decoration: BoxDecoration(
                            //color: Colors.,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/rwa3.png',
                                  // 'lib/assets/background_stack_png/hospitall.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Rwa1HeadText(),
                      Rwa1Credentials(),

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
