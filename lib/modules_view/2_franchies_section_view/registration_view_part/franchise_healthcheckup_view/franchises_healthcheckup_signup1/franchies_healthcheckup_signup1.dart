import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/franchise_healthcheckup_view/franchises_healthcheckup_signup1/franchise_healthchkup1components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/franchise_healthcheckup_view/franchises_healthcheckup_signup1/franchise_healthchkup1components/head_text.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/franchise_healthcheckup_view/franchises_healthcheckup_signup1/franchise_healthchkup1components/credentials.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/franchise_healthcheckup_view/franchises_healthcheckup_signup1/franchise_healthchkup1components/head_text.dart';

class franchiesHealthcheckupSignup1 extends StatelessWidget {
  franchiesHealthcheckupSignup1({Key? key}) : super(key: key);

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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size.height * 0.03,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  right: -size.width * 0.07,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.35,
                      width: size.width * 0.50,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/frchkup2.png',
                                // 'lib/assets/background_stack_png/hospitall.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FranchiseHealthCheckup1HeadText(),
                    Franchieshealthcheckup1Credentials(),

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
