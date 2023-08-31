import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/buttons/back_buttons.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_doctor_controllers/doctor_controller1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_driver_registration_controller/fr_driver_controller1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_lab_controller/fr_lab_controller1/lab_controller_1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_nurses_controllers/nurses_controller1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_rwa_controller/fr_rwa_controller1.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/patient_user_controller/patient_user_controllerss.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_doctor_views/doctor_signup_1/fr_doctor_signup_part1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulace_1/fr_driver_registation_1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_lab_register/lab_signup1/lab_signup1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_nurses_view/nurses_signup1/nurses_signup1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_rwa_view/rwa_signup1/rwa_signup1.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_vehicle_views/fr_vehicle_sign_up.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/patient_registration/patient_views/patient_sign_up.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_doctor_views/doctor_signup_1/fr_doctor_signup_part1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulace_1/fr_driver_registation_1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_lab_register/lab_signup1/lab_signup1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_nurses_view/nurses_signup1/nurses_signup1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_rwa_view/rwa_signup1/rwa_signup1.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_vehicle_views/fr_vehicle_sign_up.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/patient_registration/patient_views/patient_sign_up.dart';

import '../../../../controllers/2_franchises_controller/registration_part_controller/franchise_chemist_regis_controller/chemist1_fr_controller/fr_chemist_controller.dart';
import '../franchise_chemist_view/franchises_chemist_signup1/franchies_chemist_signup1.dart';

class FrRegistrationCatagaryDetails extends StatelessWidget {
  FrRegistrationCatagaryDetails({Key? key}) : super(key: key);
  Fr_Chemist_1_Controller _fr_chemist_1_controller =
      Get.put(Fr_Chemist_1_Controller());

  ///driver....
  Fr_Driver_1_Controller _frdriver_1_controller =
      Get.put(Fr_Driver_1_Controller());

  ///doctor...
  FrDoctor_1_Controller _frdoctor_1_controller =
      Get.put(FrDoctor_1_Controller());

  ///nurse..
  FrNurses_1_controller _frnurses_1_controller =
      Get.put(FrNurses_1_controller());

  ///lab..
  Fr_Lab_1_Controller _frlab_1_controller = Get.put(Fr_Lab_1_Controller());

  ///rwa..
  FrRwa_1_controller _fr_rwa_1_controller = Get.put(FrRwa_1_controller());

  ///patient...
  Patients_Controller _patient_controller = Get.put(Patients_Controller());

  final List<String> doctorcatagary = [
    'Register Vehicle',
    'Register Driver',
    'Register Doctor',
    'Register User',
    'Register Chemist',
    'Register Nurse',
    'Register Lab',
    //'Register checkup',
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
    // 'lib/assets/icons/fr_chkpr.png',
    'lib/assets/icons/fr_rwar.png',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        // _loginpasswordControllerr.onInit();
        CallLoader.loader();
        await Future.delayed(Duration(milliseconds: 300));
        CallLoader.hideLoader();
        // await SharedPreferences.getInstance()
        //     .then((value) => Get.offAll(() => FranchiesHomePage()));
        await Get.offAll(() => FranchiesHomePage());
        // Get.offAll(SignInScreen());
        return shouldPop;
      },
      child: Container(
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
                      height: size.height * 0.1,
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
                                  Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                        onTap: () {
                                          Get.offAll(FranchiesHomePage());
                                        },
                                        child: Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.15,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: GradientButton(
                                            onPressed: () {
                                              Get.offAll(FranchiesHomePage());

                                              //Get.offAll(franchiesChemistSignup1());

                                              //Get.back();
                                            },
                                            //gradient: MyTheme.gradient7,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.arrow_left,
                                                  size: 16,
                                                  color: Colors.yellow.shade200,
                                                ),
                                                Text(
                                                  'back',
                                                  style: TextStyle(
                                                    color:
                                                        Colors.yellow.shade200,
                                                    fontSize:
                                                        size.height * 0.014,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    'Choose Registration category',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: size.width * 0.054,
                                      color: MyTheme.blueww,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          ///search...
                          // Container(
                          //   decoration: const BoxDecoration(
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(30.0)),
                          //       color: Colors.white),
                          //   width: size.width,
                          //   height: size.height * 0.06,
                          //   margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                          //   padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          //   child: Theme(
                          //     data: Theme.of(context)
                          //         .copyWith(splashColor: Colors.transparent),
                          //     child: TextField(
                          //       autofocus: false,
                          //       style: TextStyle(
                          //           fontSize: 15.0, color: MyTheme.blueww),
                          //       decoration: InputDecoration(
                          //         prefixIcon: Icon(Icons.search),
                          //         filled: true,
                          //         fillColor: Colors.white,
                          //         hintText: 'Search catagary',
                          //         contentPadding: const EdgeInsets.only(
                          //             left: 10.0, bottom: 12.0, top: 0.0),
                          //         focusedBorder: OutlineInputBorder(
                          //           borderSide:
                          //               const BorderSide(color: Colors.white),
                          //           borderRadius: BorderRadius.circular(25.7),
                          //         ),
                          //         enabledBorder: UnderlineInputBorder(
                          //           borderSide:
                          //               const BorderSide(color: Colors.white),
                          //           borderRadius: BorderRadius.circular(25.7),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.000,
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
                                  onTap: () async {
                                    if (index == 0) {
                                      CallLoader.loader();
                                      await Future.delayed(
                                          Duration(milliseconds: 800));
                                      CallLoader.hideLoader();
                                      await SharedPreferences.getInstance()
                                          .then((value) =>
                                              Get.to(() => FrVehicleSignup()));
                                      // Get.to(() => FrVehicleSignup());
                                    } else if (index == 1) {
                                      //Get.to(() => FrDriverSignup1());
                                      CallLoader.loader();
                                      await Future.delayed(
                                          Duration(milliseconds: 800));
                                      CallLoader.hideLoader();
                                      await SharedPreferences.getInstance()
                                          .then((value) =>
                                              Get.to(() => FrDriverSignup1()));
                                      //_fr_chemist_1_controller.dispose();
                                      //_frdriver_1_controller.onInit();
                                    } else if (index == 2) {
                                      CallLoader.loader();
                                      await Future.delayed(
                                          Duration(milliseconds: 800));
                                      CallLoader.hideLoader();
                                      await SharedPreferences.getInstance()
                                          .then((value) =>
                                              Get.to(() => FrDoctorSignup1()));
                                      //_fr_chemist_1_controller.dispose();
                                      //_frdoctor_1_controller.onInit();
                                      //Get.to(() => FrDoctorSignup1());
                                    } else if (index == 3) {
                                      CallLoader.loader();
                                      await Future.delayed(
                                          Duration(milliseconds: 800));
                                      CallLoader.hideLoader();
                                      await SharedPreferences.getInstance()
                                          .then((value) =>
                                              Get.to(() => PatientSignup()));
                                      //_fr_chemist_1_controller.dispose();
                                      //_patient_controller.onInit();
                                      //Get.to(() => PatientSignup());
                                    } else if (index == 4) {
                                      // _fr_chemist_1_controller.onInit();
                                      // _fr_chemist_1_controller.refresh();

                                      CallLoader.loader();
                                      await Future.delayed(
                                          Duration(milliseconds: 800));
                                      CallLoader.hideLoader();
                                      await SharedPreferences.getInstance()
                                          .then((value) => Get.to(
                                              () => franchiesChemistSignup1()));
                                      //_fr_chemist_1_controller.dispose();
                                      // _fr_chemist_1_controller.onInit();

                                      // Get.offAll(() => franchiesChemistSignup1());
                                    } else if (index == 5) {
                                      // _fr_chemist_1_controller.onInit();
                                      CallLoader.loader();
                                      await Future.delayed(
                                          Duration(milliseconds: 800));
                                      CallLoader.hideLoader();
                                      await SharedPreferences.getInstance()
                                          .then((value) =>
                                              Get.to(() => FrNursesSignup1()));
                                      //Get.to(() => FrNursesSignup1());
                                      //_frnurses_1_controller.onInit();
                                    } else if (index == 6) {
                                      CallLoader.loader();
                                      await Future.delayed(
                                          Duration(milliseconds: 800));
                                      CallLoader.hideLoader();
                                      await SharedPreferences.getInstance()
                                          .then((value) =>
                                              Get.to(() => FrLabSignup1()));
                                      //_frlab_1_controller.onInit();
                                      // _frlab_1_controller.onClose();
                                      // Get.to(() => FrLabSignup1());
                                    } else if (index == 7) {
                                      CallLoader.loader();
                                      await Future.delayed(
                                          Duration(milliseconds: 800));
                                      CallLoader.hideLoader();
                                      await SharedPreferences.getInstance()
                                          .then((value) =>
                                              Get.to(() => FrRwaSignup1()));
                                      //_fr_chemist_1_controller.dispose();
                                      // _fr_rwa_1_controller.onInit();
                                      //Get.to(() => FrRwaSignup1());
                                    }
                                    // else if (index == 8) {
                                    //   Get.to(() =>
                                    //       franchiesHealthcheckupSignup1());
                                    // }
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
                                          padding: EdgeInsets.all(
                                              size.height * 0.001),
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
      ),
    );
  }
}
//#00caf7
