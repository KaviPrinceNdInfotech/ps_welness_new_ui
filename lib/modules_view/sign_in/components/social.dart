import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/sign_up_list/sign_up_list.dart';
import 'package:ps_welness_new_ui/widgets/widgets/account_check.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/sign_up_list/sign_up_list.dart';
// import 'package:ps_welness/widgets/widgets/account_check.dart';

class Social extends StatelessWidget {
  const Social({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(
        //   'OR',
        //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        // ),

        ///

        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: appPadding),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       RoundedButton(
        //           imageSrc: 'lib/assets/image/google.png', press: () {}),
        //       RoundedButton(
        //           imageSrc: 'lib/assets/image/facebook.png', press: () {}),
        //       RoundedButton(
        //           imageSrc: 'lib/assets/image/twitter.png', press: () {}),
        //     ],
        //   ),
        // ),

        SizedBox(
          height: appPadding * 0.0,
        ),

        AccountCheck(
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
      ],
    );
  }
}
