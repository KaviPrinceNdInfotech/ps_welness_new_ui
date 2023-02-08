import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/widgets/widgets/account_check.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rounded_button.dart';


class Chemist1Social extends StatelessWidget {
  const Chemist1Social({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'OR',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(imageSrc: 'assets/images/google.png', press: () {}),
              RoundedButton(
                  imageSrc: 'assets/images/facebook.png', press: () {}),
              RoundedButton(
                  imageSrc: 'assets/images/twitter.png', press: () {}),
            ],
          ),
        ),
        SizedBox(
          height: appPadding,
        ),
        AccountCheck(
          login: false,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignInScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
