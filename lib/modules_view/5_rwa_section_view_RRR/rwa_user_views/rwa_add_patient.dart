import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_user_views/add_patient_rwa/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_user_views/add_patient_rwa/head_text.dart';
//import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_user_views/rwa_user_components/credentials.dart';
//import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_user_views/rwa_user_components/head_text.dart';
//import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view/rwa_user_views/rwa_user_components/head_text.dart';

class RwaaaAddPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
                  top: size.height * 0.014,
                  right: -size.width * 0.006,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.240,
                      width: size.width * 0.60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/patient4.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RwaaddHeadText(),
                    RwaAddPatientCredentials(),
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
