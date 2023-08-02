import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/widgets/exit_popup_warning/exit_popup.dart';

//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/sign_in/components/social.dart';

import '../../widgets/widgets/account_check.dart';
import '../sign_up_list/sign_up_list.dart';
import 'components/credentials.dart';
import 'components/head_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Container(
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
                  bottom: -size.height * 0.47,
                  //left: -30,
                  right: size.width * 0.16,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.406,
                      width: size.width,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/welcome1backgrnd.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -size.height * 0.32,
                  //left: -30,
                  right: -size.width * 0.29,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.406,
                      width: size.width,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/image/1.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.41,
                  //left: -30,
                  left: size.width * 0.30,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      height: size.height * 0.365,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/welcome2_login.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.0,
                  //left: -30,
                  right: size.width * 0.16,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AccountCheck(
                      login: true,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpList();
                              //UserSignup1();

                              //SignUpScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadText(),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    SizedBox(height: size.height * 0.485, child: Credentials()),
                    // Social(),
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
