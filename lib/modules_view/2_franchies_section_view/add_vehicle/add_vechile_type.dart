import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';

import '../../../constants/constants/constants.dart';
import '../../../constants/my_theme.dart';
import 'add_vehicle_components/credentials.dart';

class AddVehiclePage extends StatelessWidget {
  const AddVehiclePage({Key? key}) : super(key: key);

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
                  top: -size.height * 0.02,
                  right: -size.width * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.65,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/vehicle.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.03),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.offAll(FranchiesHomePage());
                            },
                            child: Container(
                              height: size.height * 0.03,
                              width: size.width * 0.1,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white70,
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: size.height * 0.022,
                                color: MyTheme.blueww,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            'Add Vehicle Type',
                            style: GoogleFonts.alatsi(
                                fontSize: size.height * 0.032,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff023382)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.0,
                    ),
                    AddVehicleCredentials(),
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
