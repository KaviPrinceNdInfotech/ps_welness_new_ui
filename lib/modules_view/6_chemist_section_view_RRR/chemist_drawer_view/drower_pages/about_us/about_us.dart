import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../../../controllers/6_chemist_view_controllers_RRR/chemist_aboutus_controller.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class AboutUsView extends StatelessWidget {
  AboutUsView({Key? key}) : super(key: key);
  ChemistAboutusController _chemistAboutusController =
      Get.put(ChemistAboutusController());

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
        () => (_chemistAboutusController.isLoading.value)
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
                            "${_chemistAboutusController.chemistaboutusModel?.about.toString()}",

                            //"""Chemists typically specialise in biochemistry, neurochemistry, nuclear chemistry or theoretical chemistry. In the pharmaceutical industry chemists develop drugs and study their properties in order to determine the quality and stability of medicines. Some chemists even work in forensic science to establish evidence in criminal investigations. Experienced chemists are also involved in preparing documentation for product licences.""",
                            //'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
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
