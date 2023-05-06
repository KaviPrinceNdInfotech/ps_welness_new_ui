import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/rwa_view/rwa_signup2/rwacomponents2/credentials.dart';
//import 'package:ps_welness/modules_view/rwa_view/rwa_signup2/rwacomponents2/head_text.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/rwa_view/rwa_signup2/rwacomponents2/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/rwa_view/rwa_signup2/rwacomponents2/head_text.dart';

class RwaSignup2 extends StatelessWidget {
  const RwaSignup2({Key? key}) : super(key: key);

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
                top: size.height * 0.035,
                right: -size.width * 0.09,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.254,
                    width: size.width * 0.58,
                    decoration: BoxDecoration(
                        //color: Colors.,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/rwa2.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Rwa2HeadText(),
                  Rwa2Credentials(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
