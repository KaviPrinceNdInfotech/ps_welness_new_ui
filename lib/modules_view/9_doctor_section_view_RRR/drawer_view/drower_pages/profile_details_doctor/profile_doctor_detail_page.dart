import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';

class DoctorDetailProfile extends StatelessWidget {
  DoctorDetailProfile({Key? key}) : super(key: key);

  DoctorProfileControllers _doctorProfileControllers =
      Get.put(DoctorProfileControllers());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyTheme.white,
      body: Obx(
        () => (_doctorProfileControllers.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : _doctorProfileControllers.doctorProfile == null
                ? const Center(
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
                              color: Colors.cyan,
                              shadowColor: Colors.cyan,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  height: size.height * 0.5,
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                            'https://images.unsplash.com/photo-1604116395843-94f7b28a8080?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
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
                                            const Icon(
                                              FontAwesomeIcons.person,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            const Icon(
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
                                              FontAwesomeIcons.shop,
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
                                              FontAwesomeIcons.location,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.clock,
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
                                              _doctorProfileControllers
                                                  .doctorProfile!.doctorName
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.emailId
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.01),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.mobileNumber
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.clinicName
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.01),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.departmentName
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.stateName
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.cityName
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.location
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              _doctorProfileControllers
                                                  .doctorProfile!.availableTime
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w600,
                                                color: MyTheme.blueww,
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
                                  height: size.height * 0.04,
                                  width: size.width * 0.12,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    size: size.height * 0.023,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
                              Text(
                                'Doctor\'s Profile Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.height * 0.024,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.09,
                          left: size.width * 0.0,
                          right: size.width * 0.0,
                          child: PhysicalModel(
                            color: MyTheme.ThemeColors,
                            shadowColor: MyTheme.ThemeColors,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.height * 0.16,
                                width: size.width * 0.12,
                                decoration: const BoxDecoration(
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
                      ],
                    ),
                  ),
      ),
    );
  }
}
