import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants/constants.dart';
import 'nurse_appointment1_components/credentials.dart';
import 'nurse_appointment1_components/head_text.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/nursess/book_nurse_appointment1/nurse_appointment1_components/credentials.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/nursess/book_nurse_appointment1/nurse_appointment1_components/head_text.dart';

class NurseBoooking1 extends StatelessWidget {
  const NurseBoooking1({Key? key}) : super(key: key);

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
                  top: size.height * 0.005,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  right: -size.width * 0.006,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.270,
                      width: size.width * 0.50,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/n4.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Nursebooking1HeadText(),
                    Nursebooking1Credentials(),

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
