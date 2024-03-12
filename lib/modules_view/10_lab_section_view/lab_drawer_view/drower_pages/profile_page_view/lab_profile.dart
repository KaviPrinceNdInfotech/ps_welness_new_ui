import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_drawer_view/drower_pages/profile_page_view/profile_components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_drawer_view/drower_pages/profile_page_view/profile_components/head_text.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/10_lab_section_view/lab_drawer_view/drower_pages/profile_page_view/profile_components/credentials.dart';
//import 'package:ps_welness/modules_view/10_lab_section_view/lab_drawer_view/drower_pages/profile_page_view/profile_components/head_text.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/profile_page_view/profile_components/credentials.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/profile_page_view/profile_components/head_text.dart';

class LabProfilePage extends StatelessWidget {
  const LabProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;

    return WillPopScope(
      onWillPop: () async {
        Get.to(LabHomePage());
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
          // appBar: AppBar(
          //   backgroundColor: MyTheme.ThemeColors,
          //   elevation: 0,
          //   title: Text('Update Profile'),
          // ),
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
                      //LabbProfileHeadText,
                      LabbProfileHeadText(),
                      //LabProfileCredentials,
                      LabProfileCredentials(),
                      //LabCredentials()
                      //NurseProfileCredentials(),
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
