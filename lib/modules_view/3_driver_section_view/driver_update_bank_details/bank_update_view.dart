import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

//import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_update_bank_details/profile_components/credentials.dart';
//import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_update_bank_details/profile_components/head_text.dart';

import 'bank_profile_components/credentials.dart';
import 'bank_profile_components/head_text.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/profile_page_view/profile_components/credentials.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/profile_page_view/profile_components/head_text.dart';

class UpdateDriverBankDetail extends StatelessWidget {
  UpdateDriverBankDetail({Key? key}) : super(key: key);

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
                  top: size.height * 0.016,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  right: -size.width * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.230,
                      width: size.width * 0.55,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/bank_chemist.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UpdateDriverrHeadText(),
                    UpdateDriverBankCredentials(),
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
