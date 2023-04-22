import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/google_map/new_map/new_g_map.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/lab/choose_lab/choose_lab.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/map_page_user/google_map_2.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/map_page_user/map_page_google_map.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/slider_user/slider_userss.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view/nurse_drawer_view/drower_pages/about_us/about_us.dart';
import '../../9_doctor_section_view/drawer_view/drower_pages/supports/support_view.dart';

//import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/google_map/new_map/new_g_map.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/lab/choose_lab/choose_lab.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/map_page_user/google_map_2.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/map_page_user/map_page_google_map.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/nursess/book_nurse_appointment1/nurse_booking_1.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/user_drawer/user_drawer.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';

import '../../../constants/constants/constants.dart';
import '../../../constants/my_theme.dart';
import '../../../controllers/1_user_view_controller/user_appointment_controller/user_appointment_controllers.dart';
import '../../../controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
import '../../../widgets/widgets/neumorphic_text_field_container.dart';
//import '../../4_nurse_section_view/nurse_drawer_view/drower_pages/supports/support_view.dart';
import '../doctorss/doctor_address/doctor_address.dart';
import '../health_checkup/health_checkup_addresss/health_checkupp_address.dart';
import '../medicine_view/search_section/search_medicine.dart';
import '../nursess/book_nurse_appointment1/nurse_booking_1.dart';
import '../user_drawer/user_drawer.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/reports_section/report_section_list.dart';


//import 'package:ps_welness/modules_view/1_user_section_views/user_drawer/user_drawHomePage({Key? key}) : super(key: key);

AppointmentUserController _appointmentUserController =
    Get.put(AppointmentUserController());

UserHomepagContreoller _userHomepagContreoller = Get.put(UserHomepagContreoller());

// AppointmentController _appointmentController =
//     Get.put(AppointmentController());
class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _key = GlobalKey();

    final List<String> productname = [
      'Book Nurse',
      'Book Doctor',
      'Book Ambulance',
      'Lab',
      'Complete Health Checkup',
      'Buy Medicine',
      'Contact US',
      'Funeral Service',

      // 'service 7',
      // 'service 8',
    ];

    final List<String> underprocess = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '     Coming Soon..',

      // 'service 7',
      // 'service 8',
    ];

    List<Color> colors = [
      Color(0xff11eae0),
      Color(0xffe68cf7),
      Colors.yellow,
      Colors.lightGreenAccent,
      Colors.lightGreen
    ];

    final List<String> productimage = [
      'lib/assets/user_assets/1nurse.png',
      'lib/assets/user_assets/4doctor.png',
      'lib/assets/user_assets/6ambulance.png',
      'lib/assets/user_assets/11lab.png',
      'lib/assets/user_assets/16checkup.png',
      'lib/assets/user_assets/18medicine.png',
      'lib/assets/icons/contact44.png',
      'lib/assets/user_assets/20funeral.png',
      // 'service 7',
      // 'service 8',
    ];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              Container(
                  height: size.height * 0.045,
                  width: size.width * 0.11,
                  child: Image.asset(
                      //'lib/assets/user_assets/12lab.png'
                      'lib/assets/background_stack_png/users_patient.png'
                  )),

              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'PS WELLNESS',
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        //color: Color(0xff023382)
                      ),
                    ),
                    TextSpan(
                      text: ' USER',
                      style: GoogleFonts.alatsi(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: MyTheme.containercolor5,
                        //color: Color(0xff023382)
                      ),
                    ),
                  ],
                ),
              ),

              // Text(
              //   'PS WELLNESS',
              //   style: GoogleFonts.alatsi(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 22,
              //   ),
              // ),

            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,

          //MyTheme.ThemeColors,
          leading: IconButton(
            icon: Icon(
              Icons.dehaze_rounded,
              size: 23,
              color: Colors.white,
            ),
            onPressed: () {
              _key.currentState!.openDrawer();
            },
          ),
          // leading: Icon(Icons.read_more_outlined),
        ),
        drawer: UserMainDrawer(),
        body: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  height: size.height * 0.23,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: MySlider(),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.005,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.001,
                      horizontal: size.width * 0.01),
                  child: Container(
                    height: size.height * 0.585,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        ),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: size.height * 0.25,
                          mainAxisExtent: size.height * 0.188,
                          childAspectRatio: 4 / 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: productname.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            height: size.height * 0.08,
                            //width: double.,
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.00131,
                                horizontal: size.width * 0.01),
                            decoration: BoxDecoration(
                                color: Color(0xff11eae0),
                                //colors[index],
                                // gradient: LinearGradient(
                                //     begin: Alignment.centerLeft,
                                //     end: Alignment.centerRight,
                                //     colors: [
                                //       Color(0xffffffff),
                                //       Color(0xffffffff)
                                //       //darkPrimary,
                                //     ]),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(-0, -0),
                                    spreadRadius: 0,
                                    blurRadius: 0,
                                    color: Colors.grey.shade100,
                                  ),
                                  BoxShadow(
                                    offset: Offset(3, 3),
                                    spreadRadius: 0,
                                    blurRadius: 0,
                                    color: Colors.grey.shade300,
                                  ),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.000,
                                  horizontal: size.width * 0.000),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      underprocess[index],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.abhayaLibre(
                                        fontSize: size.height * 0.016,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        Get.to(() => NurseBoooking1());
                                      } else if (index == 1) {
                                        Get.to(() => DoctorAddress());
                                        //Get.to(() => CatagaryDetails());
                                      } else if (index == 2) {
                                        Get.defaultDialog(
                                            backgroundColor: MyTheme.ThemeColors,
                                            title: 'Select ambulance Type',
                                            content: SingleChildScrollView(
                                              child: Column(
                                                //mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(() => MapView());
                                                      //OrderTrackingPage());
                                                      // MapUser());
                                                    },
                                                    child:
                                                        NeumorphicTextFieldContainer(
                                                      child: Container(
                                                          height:
                                                              size.height * 0.05,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Regular',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    size.height *
                                                                        0.02,
                                                              ),
                                                            ),
                                                          )
                                                          // ElevatedButton(
                                                          //   onPressed: () {},
                                                          //   child: Text(
                                                          //     'Select Date',
                                                          //     style: TextStyle(
                                                          //       color: Colors.black,
                                                          //     ),
                                                          //   ),
                                                          //   style: ButtonStyle(
                                                          //     backgroundColor:
                                                          //         MaterialStateProperty
                                                          //             .all(Colors
                                                          //                 .white70),
                                                          //     padding:
                                                          //         MaterialStateProperty
                                                          //             .all(EdgeInsets
                                                          //                 .all(50)),
                                                          //     textStyle:
                                                          //         MaterialStateProperty
                                                          //             .all(TextStyle(
                                                          //                 fontSize:
                                                          //                     30,
                                                          //                 color: Colors
                                                          //                     .black)),
                                                          //   ),
                                                          // ),
                                                          // TextFormField(
                                                          //   controller:
                                                          //       _appointmentUserController
                                                          //           .appointmentController,
                                                          //   onTap: () {
                                                          //     _appointmentUserController
                                                          //         .chooseDate();
                                                          //   },
                                                          //
                                                          //   cursorColor: Colors.black,
                                                          //   obscureText: false,
                                                          //   decoration: InputDecoration(
                                                          //     hintText: 'Select date',
                                                          //     helperStyle: TextStyle(
                                                          //       color: black
                                                          //           .withOpacity(0.7),
                                                          //       fontSize: 18,
                                                          //     ),
                                                          //     prefixIcon: Icon(
                                                          //       Icons
                                                          //           .calendar_today_outlined,
                                                          //       color: black
                                                          //           .withOpacity(0.7),
                                                          //       size: 20,
                                                          //     ),
                                                          //     border: InputBorder.none,
                                                          //   ),
                                                          //   keyboardType:
                                                          //       TextInputType.multiline,
                                                          //   maxLines: 1,
                                                          //   autofocus: true,
                                                          //   //obscureText: true,
                                                          //   //controller: _loginpasswordController.mobileController,
                                                          // ),
                                                          ),
                                                    ),
                                                  ),

                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(() => MapUsers());
                                                    },
                                                    child:
                                                        NeumorphicTextFieldContainer(
                                                      child: Container(
                                                          height:
                                                              size.height * 0.05,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Road Accident',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    size.height *
                                                                        0.02,
                                                              ),
                                                            ),
                                                          )
                                                          // ElevatedButton(
                                                          //   onPressed: () {},
                                                          //   child: Text(
                                                          //     'Select Date',
                                                          //     style: TextStyle(
                                                          //       color: Colors.black,
                                                          //     ),
                                                          //   ),
                                                          //   style: ButtonStyle(
                                                          //     backgroundColor:
                                                          //         MaterialStateProperty
                                                          //             .all(Colors
                                                          //                 .white70),
                                                          //     padding:
                                                          //         MaterialStateProperty
                                                          //             .all(EdgeInsets
                                                          //                 .all(50)),
                                                          //     textStyle:
                                                          //         MaterialStateProperty
                                                          //             .all(TextStyle(
                                                          //                 fontSize:
                                                          //                     30,
                                                          //                 color: Colors
                                                          //                     .black)),
                                                          //   ),
                                                          // ),
                                                          // TextFormField(
                                                          //   controller:
                                                          //       _appointmentUserController
                                                          //           .appointmentController,
                                                          //   onTap: () {
                                                          //     _appointmentUserController
                                                          //         .chooseDate();
                                                          //   },
                                                          //
                                                          //   cursorColor: Colors.black,
                                                          //   obscureText: false,
                                                          //   decoration: InputDecoration(
                                                          //     hintText: 'Select date',
                                                          //     helperStyle: TextStyle(
                                                          //       color: black
                                                          //           .withOpacity(0.7),
                                                          //       fontSize: 18,
                                                          //     ),
                                                          //     prefixIcon: Icon(
                                                          //       Icons
                                                          //           .calendar_today_outlined,
                                                          //       color: black
                                                          //           .withOpacity(0.7),
                                                          //       size: 20,
                                                          //     ),
                                                          //     border: InputBorder.none,
                                                          //   ),
                                                          //   keyboardType:
                                                          //       TextInputType.multiline,
                                                          //   maxLines: 1,
                                                          //   autofocus: true,
                                                          //   //obscureText: true,
                                                          //   //controller: _loginpasswordController.mobileController,
                                                          // ),
                                                          ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(() => MapUser());
                                                    },
                                                    child:
                                                        NeumorphicTextFieldContainer(
                                                      child: Container(
                                                          height:
                                                              size.height * 0.05,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Air Ambulance',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    size.height *
                                                                        0.02,
                                                              ),
                                                            ),
                                                          )
                                                          // ElevatedButton(
                                                          //   onPressed: () {},
                                                          //   child: Text(
                                                          //     'Select Date',
                                                          //     style: TextStyle(
                                                          //       color: Colors.black,
                                                          //     ),
                                                          //   ),
                                                          //   style: ButtonStyle(
                                                          //     backgroundColor:
                                                          //         MaterialStateProperty
                                                          //             .all(Colors
                                                          //                 .white70),
                                                          //     padding:
                                                          //         MaterialStateProperty
                                                          //             .all(EdgeInsets
                                                          //                 .all(50)),
                                                          //     textStyle:
                                                          //         MaterialStateProperty
                                                          //             .all(TextStyle(
                                                          //                 fontSize:
                                                          //                     30,
                                                          //                 color: Colors
                                                          //                     .black)),
                                                          //   ),
                                                          // ),
                                                          // TextFormField(
                                                          //   controller:
                                                          //       _appointmentUserController
                                                          //           .appointmentController,
                                                          //   onTap: () {
                                                          //     _appointmentUserController
                                                          //         .chooseDate();
                                                          //   },
                                                          //
                                                          //   cursorColor: Colors.black,
                                                          //   obscureText: false,
                                                          //   decoration: InputDecoration(
                                                          //     hintText: 'Select date',
                                                          //     helperStyle: TextStyle(
                                                          //       color: black
                                                          //           .withOpacity(0.7),
                                                          //       fontSize: 18,
                                                          //     ),
                                                          //     prefixIcon: Icon(
                                                          //       Icons
                                                          //           .calendar_today_outlined,
                                                          //       color: black
                                                          //           .withOpacity(0.7),
                                                          //       size: 20,
                                                          //     ),
                                                          //     border: InputBorder.none,
                                                          //   ),
                                                          //   keyboardType:
                                                          //       TextInputType.multiline,
                                                          //   maxLines: 1,
                                                          //   autofocus: true,
                                                          //   //obscureText: true,
                                                          //   //controller: _loginpasswordController.mobileController,
                                                          // ),
                                                          ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(() => MapUser());
                                                    },
                                                    child:
                                                        NeumorphicTextFieldContainer(
                                                      child: Container(
                                                          height:
                                                              size.height * 0.05,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Funeral/Mortuary Service',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    size.height *
                                                                        0.02,
                                                              ),
                                                            ),
                                                          )
                                                          // ElevatedButton(
                                                          //   onPressed: () {},
                                                          //   child: Text(
                                                          //     'Select Date',
                                                          //     style: TextStyle(
                                                          //       color: Colors.black,
                                                          //     ),
                                                          //   ),
                                                          //   style: ButtonStyle(
                                                          //     backgroundColor:
                                                          //         MaterialStateProperty
                                                          //             .all(Colors
                                                          //                 .white70),
                                                          //     padding:
                                                          //         MaterialStateProperty
                                                          //             .all(EdgeInsets
                                                          //                 .all(50)),
                                                          //     textStyle:
                                                          //         MaterialStateProperty
                                                          //             .all(TextStyle(
                                                          //                 fontSize:
                                                          //                     30,
                                                          //                 color: Colors
                                                          //                     .black)),
                                                          //   ),
                                                          // ),
                                                          // TextFormField(
                                                          //   controller:
                                                          //       _appointmentUserController
                                                          //           .appointmentController,
                                                          //   onTap: () {
                                                          //     _appointmentUserController
                                                          //         .chooseDate();
                                                          //   },
                                                          //
                                                          //   cursorColor: Colors.black,
                                                          //   obscureText: false,
                                                          //   decoration: InputDecoration(
                                                          //     hintText: 'Select date',
                                                          //     helperStyle: TextStyle(
                                                          //       color: black
                                                          //           .withOpacity(0.7),
                                                          //       fontSize: 18,
                                                          //     ),
                                                          //     prefixIcon: Icon(
                                                          //       Icons
                                                          //           .calendar_today_outlined,
                                                          //       color: black
                                                          //           .withOpacity(0.7),
                                                          //       size: 20,
                                                          //     ),
                                                          //     border: InputBorder.none,
                                                          //   ),
                                                          //   keyboardType:
                                                          //       TextInputType.multiline,
                                                          //   maxLines: 1,
                                                          //   autofocus: true,
                                                          //   //obscureText: true,
                                                          //   //controller: _loginpasswordController.mobileController,
                                                          // ),
                                                          ),
                                                    ),
                                                  ),

                                                  // SizedBox(
                                                  //     height: size.height * 0.05,
                                                  //     child: TestPickerWidget()),
                                                  ///..................
                                                  // Obx(
                                                  //   () => Text(
                                                  //     DateFormat("dd-MM-yyyy")
                                                  //         .format(_appointmentController
                                                  //             .selectedDate.value)
                                                  //         .toString(),
                                                  //     style: TextStyle(fontSize: 25),
                                                  //   ),
                                                  // ),

                                                  // SizedBox(
                                                  //   height: 30.0,
                                                  // ),
                                                  // ElevatedButton(
                                                  //   style:
                                                  //       ElevatedButton.styleFrom(
                                                  //     foregroundColor:
                                                  //         Colors.yellow,
                                                  //     backgroundColor: Colors
                                                  //         .red, // foreground
                                                  //   ),
                                                  //   onPressed: () {
                                                  //     Get.back();
                                                  //     // Get.to(() =>
                                                  //     //     AppointmentHistory()
                                                  //     // );
                                                  //     // todoController.todos.add(
                                                  //     //   Todo(
                                                  //     //     text: textEditingController.text,
                                                  //     //   ),
                                                  //     // );
                                                  //     //Get.back();
                                                  //   },
                                                  //   child: Text(
                                                  //     'Appointment History',
                                                  //     style: TextStyle(
                                                  //         color: Colors.white,
                                                  //         fontSize: 16.0),
                                                  //   ),
                                                  //   //color: Colors.redAccent,
                                                  // )
                                                ],
                                              ),
                                            ),
                                            
                                            radius: 10.0);
                                        //whatsAppOpen();
                                        // _launchWhatsapp();

                                        // Get.to(() => ComplainList());
                                        //Get.to(() => Profoile());
                                      } else if (index == 3) {
                                        Get.to(() => ChooseLab());
                                        ///
                                        //Get.to(() => TheJwelleryStore());

                                        //Get.to(() => CarouselDemo());
                                      } else if (index == 4) {
                                        Get.to(() => HealthCheckup1());
                                        //Get.defaultDialog(
                                        //barrierDismissible: true,

                                      } else if (index == 5) {
                                        Get.to(() => SearchMedicine());
                                        // Get.defaultDialog(
                                        //     barrierDismissible: true,
                                        //     backgroundColor: MyTheme.t1containercolor,
                                        //     title: '',
                                        //     content: Column(
                                        //       mainAxisSize: MainAxisSize.min,
                                        //       children: [
                                        //         Directionality(
                                        //           textDirection: TextDirection.ltr,
                                        //           child: Center(
                                        //             child: Padding(
                                        //               padding:
                                        //                   const EdgeInsets.all(0.0),
                                        //               child: TextFormField(
                                        //                 decoration: InputDecoration(
                                        //                   filled: true,
                                        //
                                        //                   fillColor: MyTheme
                                        //                       .t1bacgroundcolors1,
                                        //                   hintText:
                                        //                       'Enter Service Name',
                                        //                   contentPadding:
                                        //                       const EdgeInsets.only(
                                        //                           left: 14.0,
                                        //                           bottom: 4.0,
                                        //                           top: 16.0),
                                        //                   focusedBorder:
                                        //                       OutlineInputBorder(
                                        //                     borderSide: new BorderSide(
                                        //                         color: Colors.green),
                                        //                     borderRadius:
                                        //                         new BorderRadius
                                        //                             .circular(10),
                                        //                   ),
                                        //                   enabledBorder:
                                        //                       UnderlineInputBorder(
                                        //                     borderSide: new BorderSide(
                                        //                         color:
                                        //                             Colors.transparent),
                                        //                     borderRadius:
                                        //                         new BorderRadius
                                        //                             .circular(10.0),
                                        //                   ),
                                        //                   //focusedBorder: InputBorder.none,
                                        //                   //enabledBorder: InputBorder.none,
                                        //                   // errorBorder: InputBorder.none,
                                        //                   // border: InputBorder.none,
                                        //
                                        //                   border: OutlineInputBorder(
                                        //                     borderSide: BorderSide(
                                        //                         color: Colors.red,
                                        //                         width: 2.0),
                                        //                     borderRadius:
                                        //                         BorderRadius.circular(
                                        //                             10),
                                        //                   ),
                                        //                   // labelText: "Password",
                                        //                   prefixIcon: Padding(
                                        //                     padding:
                                        //                         EdgeInsets.symmetric(
                                        //                             vertical:
                                        //                                 size.height *
                                        //                                     0.012,
                                        //                             horizontal:
                                        //                                 size.width *
                                        //                                     0.02),
                                        //                     child: Image.asset(
                                        //                       'lib/assets/images/profile.png',
                                        //                       color:
                                        //                           MyTheme.t1Iconcolor,
                                        //                       height: 10,
                                        //                       width: 10,
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 keyboardType: TextInputType
                                        //                     .visiblePassword,
                                        //                 //obscureText: true,
                                        //                 // controller:
                                        //                 // _registerComplainController.nameController,
                                        //                 // onSaved: (value) {
                                        //                 //   _registerComplainController.name = value!;
                                        //                 // },
                                        //                 // validator: (value) {
                                        //                 //   return _registerComplainController
                                        //                 //       .validateName(value!);
                                        //                 // },
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         // TextField(
                                        //         //   //controller: settingsScreenController.categoryNameController,
                                        //         //   keyboardType: TextInputType.text,
                                        //         //   maxLines: 1,
                                        //         //   decoration: InputDecoration(
                                        //         //       labelText: 'Service name',
                                        //         //       hintMaxLines: 1,
                                        //         //       border: OutlineInputBorder(
                                        //         //           borderSide: BorderSide(
                                        //         //               color: Colors.green,
                                        //         //               width: 4.0))),
                                        //         // ),
                                        //         SizedBox(
                                        //           height: 30.0,
                                        //         ),
                                        //         PhysicalModel(
                                        //           color: Colors.white,
                                        //           shadowColor: Colors.grey,
                                        //           elevation: 4,
                                        //           borderRadius:
                                        //               BorderRadius.circular(10),
                                        //           child: Padding(
                                        //             padding: const EdgeInsets.all(3.0),
                                        //             child: Container(
                                        //               height: size.height * 0.04,
                                        //               width: size.width * 0.4,
                                        //               decoration: BoxDecoration(
                                        //                 color: MyTheme.t1Iconcolor,
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(10),
                                        //               ),
                                        //               child: Center(
                                        //                 child: Text(
                                        //                   'ADD SERVICE',
                                        //                   style: TextStyle(
                                        //                       color: Colors.white,
                                        //                       fontSize: 14.0,
                                        //                       fontWeight:
                                        //                           FontWeight.w600),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     radius: 10.0);
                                        ///
                                        //Get.to(() => ServicesPage());
                                      } else if (index == 6) {
                                        Get.to(() => SupportView());
                                      } else if (index == 7) {
                                        //Get.to(() => TermsMemberPage());
                                      }
                                    },
                                    child: Container(
                                      height: size.height * 0.11,
                                      width: size.width * 0.23,
                                      padding: EdgeInsets.all(7),
                                      child: Image.asset(
                                        productimage[index],
                                        // "lib/assets/image/icons8-hospital-64.png",
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
                                              //color: Color(0xFFBEBEBE),
                                              offset: Offset(03, 03),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                            const BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(-02, -02),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                          ]),
                                    ),
                                  ),

                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Container(
                                    height: size.height * 0.033,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffffff).withOpacity(0.9),
                                        //Colors.pink.shade100,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        )),
                                    child: Center(
                                      child: Text(
                                        productname[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.abhayaLibre(
                                          fontSize: size.height * 0.018,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // child: child,
                          );
                          //   Container(
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //       color: Colors.amber,
                          //       borderRadius: BorderRadius.circular(15)),
                          //   child: Text(productname[index]),
                          // );
                        }),
                  ),
                )
              ],
            ),
          ),

      ),
    );
  }
}

// class Mycrusial extends StatelessWidget {
//   final _sliderKey = GlobalKey();
//   UserHomepagContreoller _userHomepagContreoller = Get.put(UserHomepagContreoller());
//   Future<List<String>> getData() async {
//     var url = 'https://api.gyros.farm/api/AdminApi/BannerImage';
//     var res = await http.get(Uri.parse(url));
//     if (res.statusCode == 200) {
//       var data = json.decode(res.body);
//       var rest = data["BannerImageList"];
//       //your json string
//       String jsonString = json.encode(rest);
//       //convert json string to list
//       List<String> newData = List<String>.from(json.decode(jsonString));
//       print("List Size&&&&&&&&&&&&&&&: ${newData}");
//       return newData;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   Mycrusial({Key? key}) : super(key: key);
//
//   final List<Color> colors = [
//     Colors.red,
//     Colors.orange,
//     Colors.yellow,
//     Colors.green,
//     Colors.blue,
//     Colors.indigo,
//     Colors.purple,
//   ];
//
//   final List<String> images = [
//     "https://plus.unsplash.com/premium_photo-1661776255948-7a76baa9d7b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80",
//     "https://images.unsplash.com/photo-1601841162542-956af38ba052?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
//     'https://images.unsplash.com/photo-1599493758267-c6c884c7071f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
//     'https://images.unsplash.com/photo-1576765608622-067973a79f53?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1756&q=80',
//     'https://images.unsplash.com/photo-1588543385566-413e13a51a24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
//     'https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1791&q=80',
//     'https://images.unsplash.com/photo-1624727828489-a1e03b79bba8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80',
//     //"https://images.unsplash.com/photo-1625047509248-ec889cbff17f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
//     // "https://images.unsplash.com/photo-1607400201515-c2c41c07d307?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
//     //"https://images.unsplash.com/photo-1621905251918-48416bd8575a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YWMlMjByZXBhaXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
//     //"https://images.unsplash.com/photo-1604754742629-3e5728249d73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
//     //"https://images.unsplash.com/photo-1513366884929-f0b3bedfb653?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
//     //"https://images.unsplash.com/photo-1577801622187-9a1076d049da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
//     // "https://images.unsplash.com/photo-1615870123253-f3de8aa89e24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXxjVlFHYWlJSTI3OHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
//   ];
//   final bool _isPlaying = true;
//
//   //get _sliderKey => null;
//   var base = 'https://api.gyros.farm/Images/';
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Obx(
//               () => (_userHomepagContreoller.isLoading.value)
//               ? Center(child: CircularProgressIndicator())
//           //: _homePageController.getsliderbaner!.bannerImageList != null
//                   : _userHomepagContreoller.getsliderbaner!.bannerImageList == null
//           //: _allProductController.allProductModel!.result!.isEmpty
//           //_bestSellerController.bestsellermodel!.result!.isEmpty
//               ? Center(
//             child: Text('No data'),
//           )
//
//           :Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Container(
//             height: size.height * 0.28,
//             width: size.width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Material(
//                 color: MyTheme.ThemeColors,
//                 borderRadius: BorderRadius.circular(10),
//                 elevation: 0,
//                 child: CarouselSlider.builder(
//                   //scrollPhysics: NeverScrollableScrollPhysics(),
//                   key: _sliderKey,
//                   unlimitedMode: true,
//                   autoSliderTransitionTime: Duration(seconds: 1),
//                   //autoSliderDelay: Duration(seconds: 5),
//                   slideBuilder: (index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(7.0),
//                       child: Material(
//                         elevation: 12,
//                         borderRadius: BorderRadius.circular(10),
//                         child: Container(
//                           height: size.height * 38,
//                           width: size.width,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.white, width: 3),
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                     images[index]
//                                 ),
//                                 fit: BoxFit.fill),
//                           ),
//                           //color: colors[index],
//                           // child: Text(
//                           //   letters[index],
//                           //   style: TextStyle(fontSize: 200, color: Colors.white),
//                           // ),
//                           child: Image.network(
//                             base +
//                                 '${_userHomepagContreoller.getsliderbaner!.bannerImageList![index].toString()}',
//                             fit: BoxFit.fitWidth,
//                             errorBuilder: (context, error, stackTrace) {
//                               //if image not comming in catagary then we have to purchase
//
//                               return Text(
//                                 'No Image',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: size.height*12,
//                                 ),
//                               );
//                             },
//                             //images[index]
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   slideTransform: DefaultTransform(),
//                   slideIndicator: CircularSlideIndicator(
//                     indicatorBorderWidth: 2,
//                     indicatorRadius: 4,
//                     itemSpacing: 15,
//                     currentIndicatorColor: Colors.white,
//                     padding: EdgeInsets.only(bottom: 0),
//                   ),
//                   itemCount: _userHomepagContreoller.banerlistmodel!.bannerImageList.length,
//                   //images.length,
//                   enableAutoSlider: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

///...........
///
