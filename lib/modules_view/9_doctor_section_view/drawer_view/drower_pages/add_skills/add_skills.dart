import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';

import 'add_skils_credentials.dart';
import 'headtext.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

//import 'package:ps_welness/modules_view/drawer_view/drower_pages/complaint_page/complaint_components/credentials.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/complaint_page/complaint_components/head_text.dart';

class AddSkillsPageDoctor extends StatelessWidget {
  const AddSkillsPageDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height * 0.200,
                      width: size.width * 0.40,
                      decoration: BoxDecoration(
                        //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/skill.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkillsHeadText(),
                    AddskillsCredentials(),
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
