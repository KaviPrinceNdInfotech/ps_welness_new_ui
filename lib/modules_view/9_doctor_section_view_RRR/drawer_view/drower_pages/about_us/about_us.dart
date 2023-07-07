import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../../../controllers/9_doctor_controllers_RRR/about_us_doctor_controller/doctor_about_us_controller.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class AboutUsView extends StatelessWidget {
  AboutUsView({Key? key}) : super(key: key);

  DoctorAboutusController _doctorAboutusController =
      Get.put(DoctorAboutusController());

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
        //leading: Icon(Icons.arrow_back_ios_outlined),
      ),
      body: Obx(
        () => (_doctorAboutusController.isLoading.value)
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
                            //"${_doctorAboutusController.doctoraboutusModel?.about?.about.toString()}"
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
                            "${_doctorAboutusController.doctoraboutusModel?.about?.about.toString()}",
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
