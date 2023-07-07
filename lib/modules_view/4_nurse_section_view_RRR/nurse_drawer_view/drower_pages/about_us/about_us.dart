import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_aboutus_controller/nurse_about_us_controller.dart';

class NurseAboutUsView extends StatelessWidget {
  NurseAboutUsView({Key? key}) : super(key: key);

  NurseAboutusController _nurseAboutusController =
      Get.put(NurseAboutusController());

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
        () => (_nurseAboutusController.isLoading.value)
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
                          Text(
                            'About Us:',
                            style: GoogleFonts.poppins(
                                color: MyTheme.blueww,
                                fontSize: size.width * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "${_nurseAboutusController.nurseaboutusModel?.about.toString()}",
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
