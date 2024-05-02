import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class HeadText extends StatelessWidget {
  const HeadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appPadding / 1,
        vertical: appPadding / 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'SIGN IN',
                //vv
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              Container(
                  height: size.height * 0.16,
                  //width: size.width * 0.45,
                  child: Center(
                      //         child: Lottie.asset(
                      //   'lib/assets/image/114223-chat-wirth-doctor.zip',
                      //   fit: BoxFit.fitHeight,
                      //   //_controller.onboardingPages[index].imageAsset,
                      //   height: 130.0,
                      //   //width: 150.0,
                      //   repeat: true,
                      //   reverse: true,
                      //   animate: true,
                      // )
                      )),
            ],
          ),
        ],
      ),
    );
  }
}
