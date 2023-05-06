import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

import 'nursescomponents2/credentials.dart';
import 'nursescomponents2/head_text.dart';

class NursesSignup2 extends StatelessWidget {
  const NursesSignup2({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: size.height * 0.05,
                right: -size.width * 0.005,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.254,
                    width: size.width * 0.58,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/n5.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Nurses2HeadText(),
                  Nurses2Credentials(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
