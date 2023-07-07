import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../../../controllers/10_lab_controller/lab_about_us_controller/lab_about_us_controllers.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class AboutUsLabView extends StatelessWidget {
  AboutUsLabView({Key? key}) : super(key: key);

  LabAboutusController _labAboutusController = Get.put(LabAboutusController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyTheme.ThemeColors,

        elevation: 0,

        title: Text('About Lab'),

        //leading: Icon(Icons.arrow_back_ios_outlined),
      ),
      body: Obx(
        () => (_labAboutusController.isLoading.value)
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
                            'About Lab:',
                            style: GoogleFonts.poppins(
                                color: MyTheme.blueww,
                                fontSize: size.width * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "${_labAboutusController.lababoutusModel?.about.toString()}"
                            // 'A laboratory technician performs mechanical, technical or diagnostic tests in a scientific setting. They often conduct scientific research under the supervision of senior technicians, '
                            // 'pathologists or scientists.',
                            ,
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
