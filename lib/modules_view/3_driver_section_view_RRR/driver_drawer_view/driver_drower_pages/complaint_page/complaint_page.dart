import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_drawer_view/driver_drower_pages/complaint_page/driver_complaint_components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_drawer_view/driver_drower_pages/complaint_page/driver_complaint_components/head_text.dart';
//import 'package:ps_welness_new_ui/modules_view/3_driver_section_view/driver_drawer_view/driver_drower_pages/complaint_page/driver_complaint_components/credentials.dart';
//import 'package:ps_welness_new_ui/modules_view/3_driver_section_view/driver_drawer_view/driver_drower_pages/complaint_page/driver_complaint_components/head_text.dart';

class ComplaintPageDriver extends StatelessWidget {
  const ComplaintPageDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size.height * 0.014,
                  right: -size.width * 0.006,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.220,
                      width: size.width * 0.50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/useraccount1.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComplaintDriverHeadText(),
                    DriverComplaintCredentials(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
