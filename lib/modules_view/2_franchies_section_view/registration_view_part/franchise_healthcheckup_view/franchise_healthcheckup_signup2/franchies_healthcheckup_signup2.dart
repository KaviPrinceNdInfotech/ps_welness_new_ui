import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/franchise_healthcheckup_view/franchise_healthcheckup_signup2/franchise_healthchkupcomponents2/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/franchise_healthcheckup_view/franchise_healthcheckup_signup2/franchise_healthchkupcomponents2/head_text.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/franchise_healthcheckup_view/franchise_healthcheckup_signup2/franchise_healthchkupcomponents2/credentials.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/franchise_healthcheckup_view/franchise_healthcheckup_signup2/franchise_healthchkupcomponents2/head_text.dart';

class FranchiseHealthCheckupSignup2 extends StatelessWidget {
  const FranchiseHealthCheckupSignup2({Key? key}) : super(key: key);

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
                top: -size.height * 0.023,
                //bottom: size.height * 0.64,
                //left: -30,
                right: -size.width * 0.02,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.25,
                    width: size.width * 0.45,
                    decoration: BoxDecoration(
                        //color: Colors.,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/frchkup1.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FranchiesHealthchkup2HeadText(),
                  FranchiesHealthckup2Credentials(),
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
