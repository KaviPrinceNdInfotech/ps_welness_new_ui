import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';

import '../../../../constants/constants/constants.dart';
import 'lab_components/credentials.dart';
import 'lab_components/head_text.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/lab/choose_lab/lab_components/credentials.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/lab/choose_lab/lab_components/head_text.dart';

class ChooseLab extends StatelessWidget {
  ChooseLab({Key? key}) : super(key: key);

  //LabListController _labListController = Get.put(LabListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(UserHomePage());
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
          body: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size.height * 0.1,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  right: -size.width * 0.035,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.200,
                      width: size.width * 0.52,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/doctor21.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.05,
                  //bottom: size.height * 0.64,
                  left: -size.width * 0.8,
                  right: -size.width * 0.006,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                        onTap: () {
                          Get.offAll(UserHomePage());

                          //navigator?.pop();
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                  ),
                ),
                Positioned(
                  top: size.height * 0.013,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  right: -size.width * 0.02,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.30,
                      width: size.width * 0.50,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/lab1.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabHeadText(),
                    LabCredentials(),
                    //HospitalSocial(),
                    //Spacer(),
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
