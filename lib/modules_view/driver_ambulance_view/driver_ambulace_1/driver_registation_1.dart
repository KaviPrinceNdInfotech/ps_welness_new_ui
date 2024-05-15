import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/sign_up_list/sign_up_list.dart';

//import 'package:ps_welness/constants/constants/constants.dart';

import 'driver_components/credentials.dart';
import 'driver_components/head_text.dart';

class DriverSignup1 extends StatelessWidget {
  const DriverSignup1({Key? key}) : super(key: key);

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
                  Positioned(
                    top: size.height * 0.029,
                    //bottom: size.height * 0.64,
                    //left: -30,
                    right: size.width * 0.08,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.240,
                        width: size.width * 0.45,
                        decoration: BoxDecoration(
                            //color: Colors.,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  'lib/assets/background_stack_png/read.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.036,
                    //bottom: size.height * 0.64,
                    //left: -30,
                    right: size.width * 0.11,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        // color: Colors.blueGrey,
                        height: size.height * 0.120,
                        width: size.width * 0.4,
                        child: Lottie.asset(
                          "lib/assets/image/83028-ambulance.zip",
                          fit: BoxFit.cover,
                          repeat: true,
                        ),

                        // decoration: BoxDecoration(
                        //     //color: Colors.,
                        //     borderRadius: BorderRadius.only(
                        //       topRight: Radius.circular(20),
                        //     ),
                        //     image: DecorationImage(
                        //         image: Lottie.asset("assets/transaction-completed.json"),(
                        //           'lib/assets/background_stack_png/ambulance3.png',
                        //         ),
                        //         fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Driver1HeadText(),
                      Driver1Credentials(),
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
