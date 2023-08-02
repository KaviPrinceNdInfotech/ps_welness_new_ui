import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/user_controller/user_controller_1.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/sign_up_list/sign_up_list.dart';
import 'package:ps_welness_new_ui/utils/services/account_service.dart';
import 'package:ps_welness_new_ui/widgets/widgets/account_check.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/sign_up_list/sign_up_list.dart';
// import 'package:ps_welness/widgets/widgets/account_check.dart';

class Social extends StatelessWidget {
  Social({Key? key}) : super(key: key);
  User_1_Controller _user_1_controller = Get.put(User_1_Controller());

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
          press: () async {
            _user_1_controller.onInit();
            CallLoader.loader();
            await Future.delayed(Duration(seconds: 1));
            CallLoader.hideLoader();
            // Get.offAll(
            //         () => DoctorAddress());
            accountService.getAccountData.then((accountData) {
              Timer(
                const Duration(seconds: 1),
                () {
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
                  //Get.to((page))
                  ///
                },
              );
            });
          },
        ),
      ],
    );
  }
}
