import 'package:flutter/material.dart';

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
    );
  }
}
