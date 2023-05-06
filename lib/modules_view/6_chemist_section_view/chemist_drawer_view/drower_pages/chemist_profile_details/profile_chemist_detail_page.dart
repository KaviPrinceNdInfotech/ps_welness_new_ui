import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../../../controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
//import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/doctor_profile_controller.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/controllers/9_doctor_controllers/doctor_profile_controller.dart';

class ChemistDetailProfile extends StatelessWidget {
  const ChemistDetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    DoctorProfileControllers _doctorProfileControllers =
        Get.put(DoctorProfileControllers());

    return Scaffold(
      backgroundColor: MyTheme.white,
      body: Obx(
        () => (_doctorProfileControllers.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _doctorProfileControllers.doctorProfile == null
                ? Center(
                    child: Text('No Data'),
                  )
                : SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: size.height * 0.25,
                              width: size.width,
                              color: MyTheme.ThemeColors,
                            ),
                            SizedBox(
                              height: size.height * 0.1,
                            ),
                            PhysicalModel(
                              color: Colors.red.shade300,
                              shadowColor: Colors.cyan.shade700,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  height: size.height * 0.4,
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                      color: Colors.red.shade200,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1616046560582-41ac3c954715?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80'
                                            //'https://images.unsplash.com/photo-1594135356513-14291e55162a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1424&q=80'
                                            //'https://images.unsplash.com/photo-1623682687826-fe06bf64e6d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTV8blNwa29NdC1DeW98fGVufDB8fHx8&auto=format&fit=crop&w=600&q=60'
                                            //'https://images.unsplash.com/photo-1543333995-a78aea2eee50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fHBhdGllbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'
                                            ,
                                          ),
                                          fit: BoxFit.cover)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.person,
                                              color: Colors.red,
                                            ),

                                            // Text(
                                            //   'Name:',
                                            //   style: GoogleFonts.alatsi(
                                            //     fontSize: size.height * 0.022,
                                            //     fontWeight: FontWeight.bold,
                                            //   ),
                                            // ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.solidMessage,
                                              color: Colors.red,
                                            ),
                                            // Text(
                                            //   'Email:',
                                            //   style: GoogleFonts.alatsi(
                                            //     fontSize: size.height * 0.022,
                                            //     fontWeight: FontWeight.bold,
                                            //   ),
                                            // ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.phone,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.addressCard,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.city,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.locationPinLock,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.sortNumericAsc,
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Symon Chemist',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              'symon@gmail.com',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.mobileNumber
                                                  .toString(),
                                              //'8744552345',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.location
                                                  .toString(),
                                              //'Sec 10,Ak7',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.stateName
                                                  .toString(),
                                              //'Patna',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.cityName
                                                  .toString(),
                                              // 'Bihar',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              '709053',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: size.height * 0.14,
                          left: size.width * 0.35,

                          //right: size.width * 0.0,

                          child: PhysicalModel(
                            elevation: 14,
                            color: Colors.red.shade300,
                            shape: BoxShape.circle,
                            shadowColor: MyTheme.white,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: size.height * 0.15,
                                width: size.width * 0.31,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                      'lib/assets/image/ps_welness2.png',
                                    ))),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.012,
                          left: size.width * 0.0,
                          //right: size.width * 0.0,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: size.height * 0.03,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    size: size.height * 0.023,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                'Chemist Profile Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.height * 0.024,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
