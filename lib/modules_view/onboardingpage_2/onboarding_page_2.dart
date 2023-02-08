import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: Colors.redAccent,
              ),
              Container(
                height: size.height,
                width: size.width,
                color: Colors.green,
              ),
              Container(
                height: size.height,
                width: size.width,
                color: Colors.orange,
              ),
            ],
          )
        ],
      ),
    );
  }
}
