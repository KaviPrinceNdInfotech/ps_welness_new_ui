import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';

//import 'package:ps_welness/constants/constants/constants.dart';

import 'complaint_components/credentials.dart';
import 'complaint_components/head_text.dart';

class ComplaintPageDoctor extends StatelessWidget {
  const ComplaintPageDoctor({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: size.height * 0.200,
                      width: size.width * 0.47,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/icons/doctor1.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComplaintHeadText(),
                    ComplaintCredentials(),
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
