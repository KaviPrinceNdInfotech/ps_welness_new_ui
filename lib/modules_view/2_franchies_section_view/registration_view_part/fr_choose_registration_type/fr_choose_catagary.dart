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
//import 'package:ps_welness/modules_view/1_user_section_views/appointment_section/doctorss_lists/doctor_list_appointment.dart';

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
    // 'Radiologist',
    // 'Pulmonologist',
    // 'Endocrinologist',
    // 'Neurologist',
    // 'Veterinarian',
    // 'Cardiothoracic',
  ];

  // Get.defaultDialog(
  //     backgroundColor: MyTheme.ThemeColors,
  //     title: 'Registrations',
  //     content: SingleChildScrollView(
  //       child: Column(
  //         //mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ///vehicle registration
  //           InkWell(
  //             onTap: () {
  //               Get.back();
  //               Get.to(() =>
  //                   FrVehicleSignup());
  //             },
  //             child:
  //                 NeumorphicTextFieldContainer(
  //               child: Container(
  //                   height:
  //                       size.height * 0.04,
  //                   width: size.width,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     borderRadius:
  //                         BorderRadius
  //                             .circular(10),
  //                   ),
  //                   child: Center(
  //                     child: Row(
  //                       mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .center,
  //                       children: [
  //                         Icon(
  //                           FontAwesomeIcons
  //                               .car,
  //                           size:
  //                               size.height *
  //                                   0.03,
  //                         ),
  //                         SizedBox(
  //                           width:
  //                               size.width *
  //                                   0.03,
  //                         ),
  //                         Text(
  //                           'Register Vehicle',
  //                           style:
  //                               TextStyle(
  //                             fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                             fontSize:
  //                                 size.height *
  //                                     0.02,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )),
  //             ),
  //           ),
  ///
  //           ///Driver registration
  //           InkWell(
  //             onTap: () {
  //               Get.to(() =>
  //                   FrDriverSignup1());
  //             },
  //             child:
  //                 NeumorphicTextFieldContainer(
  //               child: Container(
  //                   height:
  //                       size.height * 0.04,
  //                   width: size.width,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     borderRadius:
  //                         BorderRadius
  //                             .circular(10),
  //                   ),
  //                   child: Center(
  //                     child: Row(
  //                       mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .center,
  //                       children: [
  //                         Icon(
  //                           FontAwesomeIcons
  //                               .person,
  //                           size:
  //                               size.height *
  //                                   0.03,
  //                         ),
  //                         SizedBox(
  //                           width:
  //                               size.width *
  //                                   0.03,
  //                         ),
  //                         Text(
  //                           'Driver Registration',
  //                           style:
  //                               TextStyle(
  //                             fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                             fontSize:
  //                                 size.height *
  //                                     0.02,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                   // ElevatedButton(
  //                   //   onPressed: () {},
  //                   //   child: Text(
  //                   //     'Select Date',
  //                   //     style: TextStyle(
  //                   //       color: Colors.black,
  //                   //     ),
  //                   //   ),
  //                   //   style: ButtonStyle(
  //                   //     backgroundColor:
  //                   //         MaterialStateProperty
  //                   //             .all(Colors
  //                   //                 .white70),
  //                   //     padding:
  //                   //         MaterialStateProperty
  //                   //             .all(EdgeInsets
  //                   //                 .all(50)),
  //                   //     textStyle:
  //                   //         MaterialStateProperty
  //                   //             .all(TextStyle(
  //                   //                 fontSize:
  //                   //                     30,
  //                   //                 color: Colors
  //                   //                     .black)),
  //                   //   ),
  //                   // ),
  //                   // TextFormField(
  //                   //   controller:
  //                   //       _appointmentUserController
  //                   //           .appointmentController,
  //                   //   onTap: () {
  //                   //     _appointmentUserController
  //                   //         .chooseDate();
  //                   //   },
  //                   //
  //                   //   cursorColor: Colors.black,
  //                   //   obscureText: false,
  //                   //   decoration: InputDecoration(
  //                   //     hintText: 'Select date',
  //                   //     helperStyle: TextStyle(
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       fontSize: 18,
  //                   //     ),
  //                   //     prefixIcon: Icon(
  //                   //       Icons
  //                   //           .calendar_today_outlined,
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       size: 20,
  //                   //     ),
  //                   //     border: InputBorder.none,
  //                   //   ),
  //                   //   keyboardType:
  //                   //       TextInputType.multiline,
  //                   //   maxLines: 1,
  //                   //   autofocus: true,
  //                   //   //obscureText: true,
  //                   //   //controller: _loginpasswordController.mobileController,
  //                   // ),
  //                   ),
  //             ),
  //           ),
  //
  ///          ///Doctor registration
  //           InkWell(
  //             onTap: () {
  //               Get.to(() =>
  //                   FrDoctorSignup1());
  //             },
  //             child:
  //                 NeumorphicTextFieldContainer(
  //               child: Container(
  //                   height:
  //                       size.height * 0.04,
  //                   width: size.width,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     borderRadius:
  //                         BorderRadius
  //                             .circular(10),
  //                   ),
  //                   child: Center(
  //                     child: Row(
  //                       mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .center,
  //                       children: [
  //                         Icon(
  //                           FontAwesomeIcons
  //                               .kitMedical,
  //                           size:
  //                               size.height *
  //                                   0.03,
  //                         ),
  //                         SizedBox(
  //                           width:
  //                               size.width *
  //                                   0.08,
  //                         ),
  //                         Text(
  //                           'Register Doctor',
  //                           style:
  //                               TextStyle(
  //                             fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                             fontSize:
  //                                 size.height *
  //                                     0.02,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                   // ElevatedButton(
  //                   //   onPressed: () {},
  //                   //   child: Text(
  //                   //     'Select Date',
  //                   //     style: TextStyle(
  //                   //       color: Colors.black,
  //                   //     ),
  //                   //   ),
  //                   //   style: ButtonStyle(
  //                   //     backgroundColor:
  //                   //         MaterialStateProperty
  //                   //             .all(Colors
  //                   //                 .white70),
  //                   //     padding:
  //                   //         MaterialStateProperty
  //                   //             .all(EdgeInsets
  //                   //                 .all(50)),
  //                   //     textStyle:
  //                   //         MaterialStateProperty
  //                   //             .all(TextStyle(
  //                   //                 fontSize:
  //                   //                     30,
  //                   //                 color: Colors
  //                   //                     .black)),
  //                   //   ),
  //                   // ),
  //                   // TextFormField(
  //                   //   controller:
  //                   //       _appointmentUserController
  //                   //           .appointmentController,
  //                   //   onTap: () {
  //                   //     _appointmentUserController
  //                   //         .chooseDate();
  //                   //   },
  //                   //
  //                   //   cursorColor: Colors.black,
  //                   //   obscureText: false,
  //                   //   decoration: InputDecoration(
  //                   //     hintText: 'Select date',
  //                   //     helperStyle: TextStyle(
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       fontSize: 18,
  //                   //     ),
  //                   //     prefixIcon: Icon(
  //                   //       Icons
  //                   //           .calendar_today_outlined,
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       size: 20,
  //                   //     ),
  //                   //     border: InputBorder.none,
  //                   //   ),
  //                   //   keyboardType:
  //                   //       TextInputType.multiline,
  //                   //   maxLines: 1,
  //                   //   autofocus: true,
  //                   //   //obscureText: true,
  //                   //   //controller: _loginpasswordController.mobileController,
  //                   // ),
  //                   ),
  //             ),
  //           ),
  //
  ///          ///patient registration
  //           InkWell(
  //             onTap: () {
  //               Get.back();
  //               Get.to(
  //                   () => PatientSignup());
  //             },
  //             child:
  //                 NeumorphicTextFieldContainer(
  //               child: Container(
  //                   height:
  //                       size.height * 0.04,
  //                   width: size.width,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     borderRadius:
  //                         BorderRadius
  //                             .circular(10),
  //                   ),
  //                   child: Center(
  //                     child: Row(
  //                       mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .center,
  //                       children: [
  //                         Icon(
  //                           FontAwesomeIcons
  //                               .user,
  //                           size:
  //                               size.height *
  //                                   0.03,
  //                         ),
  //                         SizedBox(
  //                           width:
  //                               size.width *
  //                                   0.03,
  //                         ),
  //                         Text(
  //                           'Registration patient',
  //                           style:
  //                               TextStyle(
  //                             fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                             fontSize:
  //                                 size.height *
  //                                     0.02,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                   // ElevatedButton(
  //                   //   onPressed: () {},
  //                   //   child: Text(
  //                   //     'Select Date',
  //                   //     style: TextStyle(
  //                   //       color: Colors.black,
  //                   //     ),
  //                   //   ),
  //                   //   style: ButtonStyle(
  //                   //     backgroundColor:
  //                   //         MaterialStateProperty
  //                   //             .all(Colors
  //                   //                 .white70),
  //                   //     padding:
  //                   //         MaterialStateProperty
  //                   //             .all(EdgeInsets
  //                   //                 .all(50)),
  //                   //     textStyle:
  //                   //         MaterialStateProperty
  //                   //             .all(TextStyle(
  //                   //                 fontSize:
  //                   //                     30,
  //                   //                 color: Colors
  //                   //                     .black)),
  //                   //   ),
  //                   // ),
  //                   // TextFormField(
  //                   //   controller:
  //                   //       _appointmentUserController
  //                   //           .appointmentController,
  //                   //   onTap: () {
  //                   //     _appointmentUserController
  //                   //         .chooseDate();
  //                   //   },
  //                   //
  //                   //   cursorColor: Colors.black,
  //                   //   obscureText: false,
  //                   //   decoration: InputDecoration(
  //                   //     hintText: 'Select date',
  //                   //     helperStyle: TextStyle(
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       fontSize: 18,
  //                   //     ),
  //                   //     prefixIcon: Icon(
  //                   //       Icons
  //                   //           .calendar_today_outlined,
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       size: 20,
  //                   //     ),
  //                   //     border: InputBorder.none,
  //                   //   ),
  //                   //   keyboardType:
  //                   //       TextInputType.multiline,
  //                   //   maxLines: 1,
  //                   //   autofocus: true,
  //                   //   //obscureText: true,
  //                   //   //controller: _loginpasswordController.mobileController,
  //                   // ),
  //                   ),
  //             ),
  //           ),
  //
  ///          ///Chemist registration
  //           InkWell(
  //             onTap: () {
  //               Get.back();
  //               Get.to(() =>
  //                   franchiesChemistSignup1());
  //             },
  //             child:
  //                 NeumorphicTextFieldContainer(
  //               child: Container(
  //                   height:
  //                       size.height * 0.04,
  //                   width: size.width,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     borderRadius:
  //                         BorderRadius
  //                             .circular(10),
  //                   ),
  //                   child: Center(
  //                     child: Row(
  //                       mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .center,
  //                       children: [
  //                         Icon(
  //                           FontAwesomeIcons
  //                               .bookMedical,
  //                           size:
  //                               size.height *
  //                                   0.03,
  //                         ),
  //                         SizedBox(
  //                           width:
  //                               size.width *
  //                                   0.07,
  //                         ),
  //                         Text(
  //                           'Register Chemist',
  //                           style:
  //                               TextStyle(
  //                             fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                             fontSize:
  //                                 size.height *
  //                                     0.02,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )),
  //             ),
  //           ),
  //
  //           ///Nurse registration
  //           InkWell(
  //             onTap: () {
  //               Get.to(() =>
  //                   FrNursesSignup1());
  //             },
  //             child:
  //                 NeumorphicTextFieldContainer(
  //               child: Container(
  //                   height:
  //                       size.height * 0.04,
  //                   width: size.width,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     borderRadius:
  //                         BorderRadius
  //                             .circular(10),
  //                   ),
  //                   child: Center(
  //                     child: Row(
  //                       mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .center,
  //                       children: [
  //                         Icon(
  //                           FontAwesomeIcons
  //                               .userNurse,
  //                           size:
  //                               size.height *
  //                                   0.03,
  //                         ),
  //                         SizedBox(
  //                           width:
  //                               size.width *
  //                                   0.10,
  //                         ),
  //                         Text(
  //                           'Register Nurse',
  //                           style:
  //                               TextStyle(
  //                             fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                             fontSize:
  //                                 size.height *
  //                                     0.02,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                   // ElevatedButton(
  //                   //   onPressed: () {},
  //                   //   child: Text(
  //                   //     'Select Date',
  //                   //     style: TextStyle(
  //                   //       color: Colors.black,
  //                   //     ),
  //                   //   ),
  //                   //   style: ButtonStyle(
  //                   //     backgroundColor:
  //                   //         MaterialStateProperty
  //                   //             .all(Colors
  //                   //                 .white70),
  //                   //     padding:
  //                   //         MaterialStateProperty
  //                   //             .all(EdgeInsets
  //                   //                 .all(50)),
  //                   //     textStyle:
  //                   //         MaterialStateProperty
  //                   //             .all(TextStyle(
  //                   //                 fontSize:
  //                   //                     30,
  //                   //                 color: Colors
  //                   //                     .black)),
  //                   //   ),
  //                   // ),
  //                   // TextFormField(
  //                   //   controller:
  //                   //       _appointmentUserController
  //                   //           .appointmentController,
  //                   //   onTap: () {
  //                   //     _appointmentUserController
  //                   //         .chooseDate();
  //                   //   },
  //                   //
  //                   //   cursorColor: Colors.black,
  //                   //   obscureText: false,
  //                   //   decoration: InputDecoration(
  //                   //     hintText: 'Select date',
  //                   //     helperStyle: TextStyle(
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       fontSize: 18,
  //                   //     ),
  //                   //     prefixIcon: Icon(
  //                   //       Icons
  //                   //           .calendar_today_outlined,
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       size: 20,
  //                   //     ),
  //                   //     border: InputBorder.none,
  //                   //   ),
  //                   //   keyboardType:
  //                   //       TextInputType.multiline,
  //                   //   maxLines: 1,
  //                   //   autofocus: true,
  //                   //   //obscureText: true,
  //                   //   //controller: _loginpasswordController.mobileController,
  //                   // ),
  //                   ),
  //             ),
  //           ),
  //
  ///           ///lab registration
  //           InkWell(
  //             onTap: () {
  //               Get.to(
  //                   () => FrLabSignup1());
  //             },
  //             child:
  //                 NeumorphicTextFieldContainer(
  //               child: Container(
  //                   height:
  //                       size.height * 0.04,
  //                   width: size.width,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     borderRadius:
  //                         BorderRadius
  //                             .circular(10),
  //                   ),
  //                   child: Center(
  //                     child: Row(
  //                       mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .center,
  //                       children: [
  //                         Icon(
  //                           FontAwesomeIcons
  //                               .houseChimneyMedical,
  //                           size:
  //                               size.height *
  //                                   0.03,
  //                         ),
  //                         SizedBox(
  //                           width:
  //                               size.width *
  //                                   0.15,
  //                         ),
  //                         Text(
  //                           'Register Lab',
  //                           style:
  //                               TextStyle(
  //                             fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                             fontSize:
  //                                 size.height *
  //                                     0.02,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                   // ElevatedButton(
  //                   //   onPressed: () {},
  //                   //   child: Text(
  //                   //     'Select Date',
  //                   //     style: TextStyle(
  //                   //       color: Colors.black,
  //                   //     ),
  //                   //   ),
  //                   //   style: ButtonStyle(
  //                   //     backgroundColor:
  //                   //         MaterialStateProperty
  //                   //             .all(Colors
  //                   //                 .white70),
  //                   //     padding:
  //                   //         MaterialStateProperty
  //                   //             .all(EdgeInsets
  //                   //                 .all(50)),
  //                   //     textStyle:
  //                   //         MaterialStateProperty
  //                   //             .all(TextStyle(
  //                   //                 fontSize:
  //                   //                     30,
  //                   //                 color: Colors
  //                   //                     .black)),
  //                   //   ),
  //                   // ),
  //                   // TextFormField(
  //                   //   controller:
  //                   //       _appointmentUserController
  //                   //           .appointmentController,
  //                   //   onTap: () {
  //                   //     _appointmentUserController
  //                   //         .chooseDate();
  //                   //   },
  //                   //
  //                   //   cursorColor: Colors.black,
  //                   //   obscureText: false,
  //                   //   decoration: InputDecoration(
  //                   //     hintText: 'Select date',
  //                   //     helperStyle: TextStyle(
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       fontSize: 18,
  //                   //     ),
  //                   //     prefixIcon: Icon(
  //                   //       Icons
  //                   //           .calendar_today_outlined,
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       size: 20,
  //                   //     ),
  //                   //     border: InputBorder.none,
  //                   //   ),
  //                   //   keyboardType:
  //                   //       TextInputType.multiline,
  //                   //   maxLines: 1,
  //                   //   autofocus: true,
  //                   //   //obscureText: true,
  //                   //   //controller: _loginpasswordController.mobileController,
  //                   // ),
  //                   ),
  //             ),
  //           ),
  //
  ///          ///health checkup registration
  //           InkWell(
  //             onTap: () {
  //               Get.to(() =>
  //                   franchiesHealthcheckupSignup1());
  //             },
  //             child:
  //                 NeumorphicTextFieldContainer(
  //               child: Container(
  //                   height:
  //                       size.height * 0.04,
  //                   width: size.width,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     borderRadius:
  //                         BorderRadius
  //                             .circular(10),
  //                   ),
  //                   child: Center(
  //                     child: Row(
  //                       mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .center,
  //                       children: [
  //                         Icon(
  //                           FontAwesomeIcons
  //                               .checkToSlot,
  //                           size:
  //                               size.height *
  //                                   0.03,
  //                         ),
  //                         SizedBox(
  //                           width:
  //                               size.width *
  //                                   0.03,
  //                         ),
  //                         Text(
  //                           'checkup registration',
  //                           style:
  //                               TextStyle(
  //                             fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                             fontSize:
  //                                 size.height *
  //                                     0.02,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                   // ElevatedButton(
  //                   //   onPressed: () {},
  //                   //   child: Text(
  //                   //     'Select Date',
  //                   //     style: TextStyle(
  //                   //       color: Colors.black,
  //                   //     ),
  //                   //   ),
  //                   //   style: ButtonStyle(
  //                   //     backgroundColor:
  //                   //         MaterialStateProperty
  //                   //             .all(Colors
  //                   //                 .white70),
  //                   //     padding:
  //                   //         MaterialStateProperty
  //                   //             .all(EdgeInsets
  //                   //                 .all(50)),
  //                   //     textStyle:
  //                   //         MaterialStateProperty
  //                   //             .all(TextStyle(
  //                   //                 fontSize:
  //                   //                     30,
  //                   //                 color: Colors
  //                   //                     .black)),
  //                   //   ),
  //                   // ),
  //                   // TextFormField(
  //                   //   controller:
  //                   //       _appointmentUserController
  //                   //           .appointmentController,
  //                   //   onTap: () {
  //                   //     _appointmentUserController
  //                   //         .chooseDate();
  //                   //   },
  //                   //
  //                   //   cursorColor: Colors.black,
  //                   //   obscureText: false,
  //                   //   decoration: InputDecoration(
  //                   //     hintText: 'Select date',
  //                   //     helperStyle: TextStyle(
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       fontSize: 18,
  //                   //     ),
  //                   //     prefixIcon: Icon(
  //                   //       Icons
  //                   //           .calendar_today_outlined,
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       size: 20,
  //                   //     ),
  //                   //     border: InputBorder.none,
  //                   //   ),
  //                   //   keyboardType:
  //                   //       TextInputType.multiline,
  //                   //   maxLines: 1,
  //                   //   autofocus: true,
  //                   //   //obscureText: true,
  //                   //   //controller: _loginpasswordController.mobileController,
  //                   // ),
  //                   ),
  //             ),
  //           ),
  ///
  //           ///health Rwa registration
  //           InkWell(
  //             onTap: () {
  //               Get.to(
  //                   () => FrRwaSignup1());
  //             },
  //             child:
  //                 NeumorphicTextFieldContainer(
  //               child: Container(
  //                   height:
  //                       size.height * 0.04,
  //                   width: size.width,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     borderRadius:
  //                         BorderRadius
  //                             .circular(10),
  //                   ),
  //                   child: Center(
  //                     child: Row(
  //                       mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .center,
  //                       children: [
  //                         Icon(
  //                           FontAwesomeIcons
  //                               .houseMedicalFlag,
  //                           size:
  //                               size.height *
  //                                   0.03,
  //                         ),
  //                         SizedBox(
  //                           width:
  //                               size.width *
  //                                   0.08,
  //                         ),
  //                         Text(
  //                           'RWA registration',
  //                           style:
  //                               TextStyle(
  //                             fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                             fontSize:
  //                                 size.height *
  //                                     0.02,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                   // ElevatedButton(
  //                   //   onPressed: () {},
  //                   //   child: Text(
  //                   //     'Select Date',
  //                   //     style: TextStyle(
  //                   //       color: Colors.black,
  //                   //     ),
  //                   //   ),
  //                   //   style: ButtonStyle(
  //                   //     backgroundColor:
  //                   //         MaterialStateProperty
  //                   //             .all(Colors
  //                   //                 .white70),
  //                   //     padding:
  //                   //         MaterialStateProperty
  //                   //             .all(EdgeInsets
  //                   //                 .all(50)),
  //                   //     textStyle:
  //                   //         MaterialStateProperty
  //                   //             .all(TextStyle(
  //                   //                 fontSize:
  //                   //                     30,
  //                   //                 color: Colors
  //                   //                     .black)),
  //                   //   ),
  //                   // ),
  //                   // TextFormField(
  //                   //   controller:
  //                   //       _appointmentUserController
  //                   //           .appointmentController,
  //                   //   onTap: () {
  //                   //     _appointmentUserController
  //                   //         .chooseDate();
  //                   //   },
  //                   //
  //                   //   cursorColor: Colors.black,
  //                   //   obscureText: false,
  //                   //   decoration: InputDecoration(
  //                   //     hintText: 'Select date',
  //                   //     helperStyle: TextStyle(
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       fontSize: 18,
  //                   //     ),
  //                   //     prefixIcon: Icon(
  //                   //       Icons
  //                   //           .calendar_today_outlined,
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       size: 20,
  //                   //     ),
  //                   //     border: InputBorder.none,
  //                   //   ),
  //                   //   keyboardType:
  //                   //       TextInputType.multiline,
  //                   //   maxLines: 1,
  //                   //   autofocus: true,
  //                   //   //obscureText: true,
  //                   //   //controller: _loginpasswordController.mobileController,
  //                   // ),
  //                   ),
  //             ),
  //           ),
  //
  //           InkWell(
  //             onTap: () {
  //               Get.back();
  //               // Get.to(
  //               //     () => OldDriverView());
  //             },
  //             child: Align(
  //               alignment:
  //                   Alignment.centerRight,
  //               child: Container(
  //                   height:
  //                       size.height * 0.03,
  //                   width:
  //                       size.width * 0.07,
  //                   decoration:
  //                       BoxDecoration(
  //                     color: Colors.white70,
  //                     shape:
  //                         BoxShape.circle,
  //                     // borderRadius:
  //                     //     BorderRadius
  //                     //         .circular(10),
  //                   ),
  //                   child: Center(
  //                       child: Icon(
  //                     Icons.close,
  //                   ))
  //                   // ElevatedButton(
  //                   //   onPressed: () {},
  //                   //   child: Text(
  //                   //     'Select Date',
  //                   //     style: TextStyle(
  //                   //       color: Colors.black,
  //                   //     ),
  //                   //   ),
  //                   //   style: ButtonStyle(
  //                   //     backgroundColor:
  //                   //         MaterialStateProperty
  //                   //             .all(Colors
  //                   //                 .white70),
  //                   //     padding:
  //                   //         MaterialStateProperty
  //                   //             .all(EdgeInsets
  //                   //                 .all(50)),
  //                   //     textStyle:
  //                   //         MaterialStateProperty
  //                   //             .all(TextStyle(
  //                   //                 fontSize:
  //                   //                     30,
  //                   //                 color: Colors
  //                   //                     .black)),
  //                   //   ),
  //                   // ),
  //                   // TextFormField(
  //                   //   controller:
  //                   //       _appointmentUserController
  //                   //           .appointmentController,
  //                   //   onTap: () {
  //                   //     _appointmentUserController
  //                   //         .chooseDate();
  //                   //   },
  //                   //
  //                   //   cursorColor: Colors.black,
  //                   //   obscureText: false,
  //                   //   decoration: InputDecoration(
  //                   //     hintText: 'Select date',
  //                   //     helperStyle: TextStyle(
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       fontSize: 18,
  //                   //     ),
  //                   //     prefixIcon: Icon(
  //                   //       Icons
  //                   //           .calendar_today_outlined,
  //                   //       color: black
  //                   //           .withOpacity(0.7),
  //                   //       size: 20,
  //                   //     ),
  //                   //     border: InputBorder.none,
  //                   //   ),
  //                   //   keyboardType:
  //                   //       TextInputType.multiline,
  //                   //   maxLines: 1,
  //                   //   autofocus: true,
  //                   //   //obscureText: true,
  //                   //   //controller: _loginpasswordController.mobileController,
  //                   // ),
  //                   ),
  //             ),
  //           ),
  //
  //           ///
  //
  //           ///..................
  //         ],
  //       ),
  //     );
  ///
  //radius: 10.0);
  //Get.to(() => DeptSpecList());

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
    // 'lib/assets/icons/cat10.png',
    // 'lib/assets/icons/cat11.png',
    // 'lib/assets/icons/cat12.png',
    // 'lib/assets/icons/cat13.png',
    // 'lib/assets/icons/cat14.png',
    // 'lib/assets/icons/cat15.png',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
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
                //crossAxisAlignment: CrossAxisAlignment.start,
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
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(30.0)),
                              color: Colors.white),
                          width: size.width,
                          height: size.height * 0.06,
                          margin: new EdgeInsets.fromLTRB(15, 20, 15, 20),
                          padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
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
                                    //Get.to(() => AppointmentDetails());
                                  } else if (index == 1) {
                                    Get.to(() => FrDriverSignup1());
                                    //Get.to(() => AddTechnician());
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
                                    Get.to(
                                        () => franchiesHealthcheckupSignup1());
                                  } else if (index == 8) {
                                    Get.to(() => FrRwaSignup1());
                                  }
                                  //Get.to(() => DoctorListUser());
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
