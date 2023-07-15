import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/profile_page_view/profile_components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/profile_page_view/profile_components/head_text.dart';

class FranchiessProfilePage extends StatelessWidget {
  const FranchiessProfilePage({Key? key}) : super(key: key);

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
                  right: size.width * 0.003,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: size.height * 0.230,
                      width: size.width * 0.40,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/franchoies3.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FrancbhiesProfileeHeadText(),
                    FranchiesProfileCredentials(),
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
