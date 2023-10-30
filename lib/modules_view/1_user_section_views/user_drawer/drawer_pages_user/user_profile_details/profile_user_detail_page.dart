import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
//import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/doctor_profile_controller.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/9_doctor_controllers/doctor_profile_controller.dart';

class UserDetailProfile extends StatelessWidget {
  const UserDetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UserProfileControllers _userrsProfileControllers =
        Get.put(UserProfileControllers());

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
        () => (_userrsProfileControllers.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _userrsProfileControllers.userProfile == null
                ? Center(
                    child: Text('No Data'),
                  )
                : SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SingleChildScrollView(
                          child: Column(
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
                                color: Colors.black38,
                                shadowColor: Colors.cyan.shade700,
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    height: size.height * 0.45,
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      // image: DecorationImage(
                                      //     image: NetworkImage(
                                      //       'https://images.unsplash.com/photo-1543333995-a78aea2eee50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fHBhdGllbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
                                      //     ),
                                      //     fit: BoxFit.fill)
                                    ),
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
                                                FontAwesomeIcons
                                                    .locationPinLock,
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
                                                _userrsProfileControllers
                                                    .userProfile!.patientName
                                                    .toString()

                                                // _doctorProfileControllers
                                                //     .doctorProfile!.doctorName
                                                //     .toString(),
                                                //'Prince Kumar',
                                                // 'Kumar Prince',
                                                ,
                                                style: GoogleFonts.poppins(
                                                  fontSize: size.height * 0.018,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.yellow.shade800,
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                _userrsProfileControllers
                                                    .userProfile!.emailId
                                                    .toString(),

                                                //'prince@gmail.com',
                                                style: GoogleFonts.poppins(
                                                  fontSize: size.height * 0.018,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.yellow.shade800,
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                _userrsProfileControllers
                                                    .userProfile!.mobileNumber
                                                    .toString(),
                                                // '7089706632',
                                                style: GoogleFonts.poppins(
                                                  fontSize: size.height * 0.018,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.yellow.shade800,
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                _userrsProfileControllers
                                                    .userProfile!.location
                                                    .toString(),
                                                // 'Sec,C53',
                                                style: GoogleFonts.poppins(
                                                  fontSize: size.height * 0.014,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.yellow.shade800,
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                _userrsProfileControllers
                                                    .userProfile!.cityName
                                                    .toString(),
                                                //'Patna',
                                                style: GoogleFonts.poppins(
                                                  fontSize: size.height * 0.018,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.yellow.shade800,
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                _userrsProfileControllers
                                                    .userProfile!.location
                                                    .toString(),
                                                //'Bihar',
                                                style: GoogleFonts.poppins(
                                                  fontSize: size.height * 0.014,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.yellow.shade800,
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                // _doctorProfileControllers
                                                //     .doctorProfile!.clinicName
                                                //     .toString(),
                                                '110090',
                                                style: GoogleFonts.poppins(
                                                  fontSize: size.height * 0.018,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.yellow.shade800,
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
                        ),
                        Positioned(
                          top: size.height * 0.14,
                          left: size.width * 0.35,
                          //right: size.width * 0.0,
                          child: PhysicalModel(
                            elevation: 14,
                            color: Colors.black38,
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
                                'User Profile Details',
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
