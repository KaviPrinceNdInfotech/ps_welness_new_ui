import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/doctor_profile_controller.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/9_doctor_controllers/doctor_profile_controller.dart';

class DriverDetailProfile extends StatelessWidget {
  const DriverDetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DoctorProfileControllers _doctorProfileControllers =
        Get.put(DoctorProfileControllers());

    return Scaffold(
      backgroundColor: MyTheme.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: MyTheme.ThemeColors,
      //   title: Text(
      //     'Lab Profile details',
      //   ),
      //   centerTitle: true,
      // ),
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
                              color: Colors.orange,
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
                                            'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                                            //'https://images.unsplash.com/photo-1543333995-a78aea2eee50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fHBhdGllbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'
                                            ,
                                          ),
                                          fit: BoxFit.fill)),
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
                                              'Kumar Vs',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.yellow.shade900,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.emailId
                                                  .toString(),
                                              // 'gaurav@gmail.com',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.yellow.shade900,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.mobileNumber
                                                  .toString(),
                                              //'9879776666',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.yellow.shade900,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.location
                                                  .toString(),
                                              //'Sec 6,A51',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.yellow.shade900,
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
                                                color: Colors.yellow.shade900,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.cityName
                                                  .toString(),
                                              //'Bihar',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.yellow.shade900,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              '110090',
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.yellow.shade900,
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
                            color: Colors.orange.shade100,
                            shape: BoxShape.circle,
                            shadowColor: MyTheme.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                'Driver Profile Details',
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
