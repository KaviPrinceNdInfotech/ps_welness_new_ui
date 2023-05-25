import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/chemist_profile_page_view/profile_components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/chemist_profile_page_view/profile_components/head_text.dart';
//import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_profile_page_view/profile_components/credentials.dart';
//import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_profile_page_view/profile_components/head_text.dart';

class ChemistProfilePage extends StatelessWidget {
  const ChemistProfilePage({Key? key}) : super(key: key);

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
                  top: size.height * 0.014,
                  right: -size.width * 0.006,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.220,
                      width: size.width * 0.50,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/useraccount.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChemistProfileHeadText(),
                    ChemistProfileCredentials(),
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
