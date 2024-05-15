import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/sign_up_list/sign_up_list.dart';
import 'package:ps_welness_new_ui/modules_view/user_views/user_components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/user_views/user_components/head_text.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/user_views/user_components/credentials.dart';
// import 'package:ps_welness/modules_view/user_views/user_components/head_text.dart';

class UserSignup1 extends StatelessWidget {
  const UserSignup1({Key? key}) : super(key: key);

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
                      top: size.height * 0.014,
                      //bottom: size.height * 0.64,
                      //left: -30,
                      right: -size.width * 0.006,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: size.height * 0.240,
                          width: size.width * 0.60,
                          decoration: BoxDecoration(
                              //color: Colors.,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'lib/assets/background_stack_png/user2.png',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        User1HeadText(),
                        User1Credentials(),
                        //HospitalSocial(),
                        //Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
