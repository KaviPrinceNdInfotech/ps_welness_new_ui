import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/franchies_view/franchies_1_view/franchies_1_components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/franchies_view/franchies_1_view/franchies_1_components/head_text.dart';
import 'package:ps_welness_new_ui/modules_view/sign_up_list/sign_up_list.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/franchies_view/franchies_1_view/franchies_1_components/credentials.dart';
// import 'package:ps_welness/modules_view/franchies_view/franchies_1_view/franchies_1_components/head_text.dart';

class FranchiesSignup1 extends StatelessWidget {
  const FranchiesSignup1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    // Size size = MediaQuery.of(context).size;
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
                  // Positioned(
                  //   top: size.height * 0.00,
                  //   //bottom: size.height * 0.64,
                  //   //left: -30,
                  //   right: -size.width * 0.006,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(2.0),
                  //     child: Container(
                  //       height: size.height * 0.300,
                  //       width: size.width * 0.35,
                  //       decoration: BoxDecoration(
                  //           //color: Colors.,
                  //           borderRadius: BorderRadius.only(
                  //             topRight: Radius.circular(20),
                  //           ),
                  //           image: DecorationImage(
                  //               image: AssetImage(
                  //                 'lib/assets/background_stack_png/franchoies1.png',
                  //               ),
                  //               fit: BoxFit.cover)),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    top: size.height * 0.03,
                    //bottom: size.height * 0.64,
                    //left: -30,
                    right: -size.width * 0.006,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.180,
                        width: size.width * 0.49,
                        decoration: BoxDecoration(
                            //color: Colors.,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/franchoies4.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Franchies1HeadText(),
                      Franchies1Credentials(),
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
