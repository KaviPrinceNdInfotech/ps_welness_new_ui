import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';

import 'fr_driver_components/credentials.dart';
import 'fr_driver_components/head_text.dart';
class FrDriverSignup1 extends StatelessWidget {
  const FrDriverSignup1({Key? key}) : super(key: key);

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
                  top: size.height * 0.029,
                  right: size.width * 0.08,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.240,
                      width: size.width * 0.45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.0,
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
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FrDriver1HeadText(),
                    FrDriver1Credentials(),
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
