import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/modules_view/sign_in/sigin_screen.dart';

import 'onboarding_controllers.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff0abab5
                //333333
                // 045a80
                ),
            //Color(0xffb7dacc),
            // gradient: MyTheme.gradient1
          ),
          child: Stack(
            children: [
              PageView.builder(
                  controller: _controller.pageController,
                  onPageChanged: _controller.selectedPageIndex,
                  itemCount: _controller.onboardingPages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            _controller.onboardingPages[index].imageAsset,
                            height: 300.0,
                            repeat: true,
                            reverse: true,
                            animate: true,
                          ),
                          SizedBox(height: 32),
                          Text(
                            _controller.onboardingPages[index].title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 29),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 64.0),
                            child: Text(
                              _controller.onboardingPages[index].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children: List.generate(
                    _controller.onboardingPages.length,
                    (index) => Obx(() {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        width: _controller.selectedPageIndex.value == index
                            ? 12
                            : 12,
                        height: 12,
                        decoration: BoxDecoration(
                          //gradient: MyTheme.gradient1,
                          color: _controller.selectedPageIndex.value == index
                              ? Colors.black
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: PhysicalModel(
                  elevation: 2,
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * 0.23,
                      decoration: BoxDecoration(
                        color: Color(0xff0abab5),
                        //gradient: MyTheme.gradient7,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FloatingActionButton(
                        highlightElevation: 1,
                        heroTag: 'next',
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        splashColor: Colors.lightGreenAccent,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        onPressed: _controller.forwardAct,
                        child: Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _controller.isLastPage ? 'START' : 'NEXT',
                                style: TextStyle(
                                  color: Colors.yellow.shade200,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 16,
                                color: Colors.yellow.shade200,
                              )
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: PhysicalModel(
                  elevation: 1,
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * 0.23,
                      decoration: BoxDecoration(
                        color: Color(0xff0abab5),
                        //gradient: MyTheme.gradient7,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FloatingActionButton(
                        highlightElevation: 3,
                        heroTag: 'Skip',
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        splashColor: Colors.lightGreenAccent,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        onPressed: () {
                          Get.to(() => SignInScreen());
                          //SignUpList());
                        },
                        child: Text(
                          'SKIP',
                          style: TextStyle(
                            color: Colors.yellow.shade200,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
