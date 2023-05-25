import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/chemist_drawer_view/drower_pages/profile_page_view/profile_components/credentials.dart';

import '../../../../4_nurse_section_view_RRR/nurse_drawer_view/drower_pages/profile_page_view/profile_components/head_text.dart';
//import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_drawer_view/drower_pages/profile_page_view/profile_components/credentials.dart';
//import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_drawer_view/drower_pages/profile_page_view/profile_components/head_text.dart';

class ChemistUpdateProfilePage extends StatelessWidget {
  const ChemistUpdateProfilePage({Key? key}) : super(key: key);

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
                      width: size.width * 0.50,
                      decoration: const BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/user_assets/nurse_profile.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NurseProfileHeadText(),
                    ChemistUpdateProfileCredentials(),
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
