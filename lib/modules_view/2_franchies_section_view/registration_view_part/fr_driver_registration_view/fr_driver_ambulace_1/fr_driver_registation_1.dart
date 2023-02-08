import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';

import 'fr_driver_components/credentials.dart';
import 'fr_driver_components/head_text.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulace_1/fr_driver_components/credentials.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulace_1/fr_driver_components/head_text.dart';

class FrDriverSignup1 extends StatelessWidget {
  const FrDriverSignup1({Key? key}) : super(key: key);

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
                        // image: DecorationImage(
                        //     image: AssetImage(
                        //       'lib/assets/background_stack_png/read.png',
                        //     ),
                        //     fit: BoxFit.cover)
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.0,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  right: -size.width * 0.01,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      // color: Colors.blueGrey,
                      height: size.height * 0.31,
                      width: size.width * 0.4,
                      child: Image.asset(
                        'lib/assets/background_stack_png/driver001.png',
                      ),
                      // Lottie.asset(
                      //   "lib/assets/image/83028-ambulance.zip",
                      //   fit: BoxFit.cover,
                      //   repeat: true,
                      // ),

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
                    FrDriver1HeadText(),
                    FrDriver1Credentials(),
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
