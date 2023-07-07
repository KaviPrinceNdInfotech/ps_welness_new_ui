import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_about_us/user_about_us_controller.dart';

class UserAboutUsView extends StatelessWidget {
  UserAboutUsView({Key? key}) : super(key: key);

  UserAboutusController _userAboutusController =
      Get.put(UserAboutusController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyTheme.ThemeColors,
        elevation: 0,
        title: Text('About Us'),
      ),
      body: Obx(
        () => (_userAboutusController.isLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'About Us:',
                                style: GoogleFonts.poppins(
                                    color: MyTheme.blueww,
                                    fontSize: size.width * 0.06,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height * 0.07,
                                width: size.width * 0.25,
                                child: Lottie.asset(
                                    'lib/assets/image/68816-about.zip'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            //"qeqeqeqeeqeqe",
                            "${_userAboutusController.useraboutusModel?.about.toString()}",
                            style: GoogleFonts.roboto(
                                color: MyTheme.blueww,
                                fontSize: size.width * 0.037,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
