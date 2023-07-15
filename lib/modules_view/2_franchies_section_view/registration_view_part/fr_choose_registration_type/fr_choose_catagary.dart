import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_doctor_views/doctor_signup_1/fr_doctor_signup_part1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulace_1/fr_driver_registation_1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_lab_register/lab_signup1/lab_signup1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_nurses_view/nurses_signup1/nurses_signup1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_rwa_view/rwa_signup1/rwa_signup1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_vehicle_views/fr_vehicle_sign_up.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/patient_registration/patient_views/patient_sign_up.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_doctor_views/doctor_signup_1/fr_doctor_signup_part1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulace_1/fr_driver_registation_1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_lab_register/lab_signup1/lab_signup1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_nurses_view/nurses_signup1/nurses_signup1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_rwa_view/rwa_signup1/rwa_signup1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_vehicle_views/fr_vehicle_sign_up.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/patient_registration/patient_views/patient_sign_up.dart';

import '../franchise_chemist_view/franchises_chemist_signup1/franchies_chemist_signup1.dart';
import '../franchise_healthcheckup_view/franchises_healthcheckup_signup1/franchies_healthcheckup_signup1.dart';

class FrRegistrationCatagaryDetails extends StatelessWidget {
  FrRegistrationCatagaryDetails({Key? key}) : super(key: key);

  final List<String> doctorcatagary = [
    'Register Vehicle',
    'Driver Registration',
    'Register Doctor',
    'Registration patient',
    'Register Chemist',
    'Register Nurse',
    'Register Lab',
    'Register checkup',
    'Register Rwa',
  ];
  final List<String> catimage = [
    'lib/assets/icons/frvehicle.png',
    'lib/assets/icons/fr_driverr.png',
    'lib/assets/icons/fr_doctorr.png',
    'lib/assets/icons/fr_patientr.png',
    'lib/assets/icons/fr_chnurser.png',
    'lib/assets/icons/fr_nurser.png',
    'lib/assets/icons/fr_labr.png',
    'lib/assets/icons/fr_chkpr.png',
    'lib/assets/icons/fr_rwar.png',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        backgroundColor: Color(0xff11f2ec),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.18,
                    color: Color(0xff11f2ec),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: MyTheme.blueww,
                                    size: size.height * 0.027,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'Choose Registration category',
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: size.width * 0.06,
                                    color: MyTheme.blueww,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration:  const BoxDecoration(
                              borderRadius:  BorderRadius.all(
                                   Radius.circular(30.0)),
                              color: Colors.white),
                          width: size.width,
                          height: size.height * 0.06,
                          margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child: TextField(
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: MyTheme.blueww),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search catagary',
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, bottom: 12.0, top: 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.0001,
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.01),
                    child: Container(
                      height: size.height * 0.71,
                      color: Color(0xff11f2ec),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: size.height * 0.21,
                            mainAxisExtent: size.height * 0.12,
                            childAspectRatio: 4 / 3,
                            crossAxisSpacing: size.width * 0.006,
                            mainAxisSpacing: size.height * 0.006,
                          ),
                          itemCount: doctorcatagary.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01,
                                  vertical: size.height * 0.003),
                              child: InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    Get.to(() => FrVehicleSignup());
                                  } else if (index == 1) {
                                    Get.to(() => FrDriverSignup1());
                                  } else if (index == 2) {
                                    Get.to(() => FrDoctorSignup1());
                                  } else if (index == 3) {
                                    Get.to(() => PatientSignup());
                                  } else if (index == 4) {
                                    Get.to(() => franchiesChemistSignup1());
                                  } else if (index == 5) {
                                    Get.to(() => FrNursesSignup1());
                                  } else if (index == 6) {
                                    Get.to(() => FrLabSignup1());
                                  } else if (index == 7) {
                                    Get.to(() => franchiesHealthcheckupSignup1());
                                  } else if (index == 8) {
                                    Get.to(() => FrRwaSignup1());
                                  }
                                },
                                child: Container(
                                  height: size.height * 0.08,
                                  width: size.width * 0.15,
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.004),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        catimage[index],
                                        height: size.height * 0.08,
                                        //productimage[index],
                                        //"lib/assets/image/icons8-hospital-64.png",
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(size.height * 0.001),
                                        child: Text(
                                          doctorcatagary[index],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.sunflower(
                                            fontWeight: FontWeight.bold,
                                            color: MyTheme.blueww,
                                            fontSize: size.height * 0.017,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        const BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(5, 5),
                                          blurRadius: 0,
                                          spreadRadius: 0,
                                        ),
                                        const BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, -0),
                                          blurRadius: 0,
                                          spreadRadius: 0,
                                        ),
                                      ]),
                                ),
                              ),
                            );
                            // RoundedButton(
                            //   imageSrc: 'Container(
                            //           padding: EdgeInsets.all(appPadding / 2),
                            //           width: 65,
                            //           height: 65,
                            //           decoration: BoxDecoration(
                            //               shape: BoxShape.circle,
                            //               gradient: LinearGradient(
                            //                   begin: Alignment.topCenter,
                            //                   end: Alignment.bottomCenter,
                            //                   colors: [
                            //                     darkPrimary,
                            //                     lightPrimary,
                            //                   ]),
                            //               boxShadow: [
                            //                 BoxShadow(
                            //                   offset: Offset(3, 3),
                            //                   spreadRadius: 1,
                            //                   blurRadius: 4,
                            //                   color: darkShadow,
                            //                 ),
                            //                 BoxShadow(
                            //                   offset: Offset(-5, -5),
                            //                   spreadRadius: 1,
                            //                   blurRadius: 4,
                            //                   color: lightShadow,
                            //                 ),
                            //               ]),
                            //           child: Image.asset(imageSrc),
                            //         ),',
                            //   press: () {}
                            // );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//#00caf7
