import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_dept_spec_page_view/add_dept_spe.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_dept_spec_page_view/list_dept_spec/list_dept_specialist.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_vehicle/add_vechile_type.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_drawer_view/drawerpage.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/slider_franchise.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchise_commission_report/franchise_commission_report.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchise_payment_report/franchise_payment_report.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchise_tds_report/franchise_tds_historyy_report.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_bank_profile_page_view/bank_profile_view.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_galary_page_view/gallary_view.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_newdrivre_update/new_driver_view.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_olddrivre_update/old_driver_view.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_profile_page_view/profile_view.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/galerry_view/gallary_views.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_choose_registration_type/fr_choose_catagary.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/test_name_list/test_name_list.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/view_dept_specialist_view/view_dept_special_list.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/add_dept_spec_page_view/add_dept_spe.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/add_dept_spec_page_view/list_dept_spec/list_dept_specialist.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/add_vehicle/add_vechile_type.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchies_drawer_view/drawerpage.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchise_commission_report/franchise_commission_report.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchise_payment_report/franchise_payment_report.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchise_tds_report/franchise_tds_historyy_report.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchises_bank_profile_page_view/bank_profile_view.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchises_galary_page_view/gallary_view.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchises_newdrivre_update/new_driver_view.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchises_olddrivre_update/old_driver_view.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchises_profile_page_view/profile_view.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/galerry_view/gallary_views.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_choose_registration_type/fr_choose_catagary.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/test_name_list/test_name_list.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/view_dept_specialist_view/view_dept_special_list.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';

import '../../../controllers/1_user_view_controller/user_appointment_controller/user_appointment_controllers.dart';
import '../../../controllers/2_franchises_controller/franchies_home_page_controller/franchies_home_page_controllers.dart';
import '../../10_lab_section_view/lab_drawer_view/drower_pages/supports/support_view.dart';
import '../franchise_payout_report/franchise_payout_report.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_chemist_details/chemist_detail.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_doctor_report/my_ymwd_doctor_details/my_ymwd_vehicle_report.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_healthchkpsss_details/hlthchkps_detail.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_lab_details/lab_detail.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_nurse_details/nursees_detail.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_vehicle_report/my_ymwd_vehicle_details/vehicle_detail.dart';
import '../registration_view_part/fr_choose_registration_details/fr_choose_catagary.dart';

//import 'package:ps_welness/modules_view/1_user_section_views/user_drawer/user_drawHomePage({Key? key}) : super(key: key);

AppointmentUserController _appointmentUserController =
    Get.put(AppointmentUserController());

// AppointmentController _appointmentController =
//     Get.put(AppointmentController());
class FranchiesHomePage extends StatelessWidget {
  const FranchiesHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _key = GlobalKey();

    final List<String> productname = [
      'Edit Profile',
      'Update Bank Detail',
      'Vehicle Allotment',
      'Gallery',
      'Add Gallery',
      'Add Test',

      'Add Spec & Dept',
      'Add Vehicle Type',
      'View Spe & Dpt',
      'View Dept & Spec',
      'Registration',
      'Registration Details',

      'My Y/M/W/D Report',
      'My Payment Report',
      'My Commission Report',
      'My Payout Report',
      'My TDS Report',
      'Contact US'

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
      '',
      '',
      '',
      '',
      '',

      '',
      '',
      '',
      '',
      '',
      '',

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
      'lib/assets/icons/freditprofile.png',
      'lib/assets/icons/frbank1.png',
      'lib/assets/icons/frvehicle.png',
      'lib/assets/icons/fraddgalary.png',

      'lib/assets/icons/frgalary1.png',

      // 'lib/assets/icons/frspaclist.png',
      // 'lib/assets/icons/fraddcar.png',
      'lib/assets/icons/frtest.png',

      'lib/assets/icons/frspaclist.png',
      'lib/assets/icons/fradddcarr.png',

      ///
      'lib/assets/icons/frspecial.png',
      'lib/assets/icons/frspaclist.png',
      'lib/assets/icons/frregister.png',
      'lib/assets/icons/frregisterdetail.png',

      'lib/assets/icons/fryreport.png',
      'lib/assets/icons/frpayment.png',
      'lib/assets/icons/frcommission.png',
      'lib/assets/icons/frpayout.png',
      'lib/assets/icons/frtds.png',
      'lib/assets/icons/contact44.png',

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
                      'lib/assets/icons/fr1.png')),
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
                      text: ' Franchises',
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
        drawer: FranchiesisMainDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.28,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: MyFranchiseSlider(),
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
                                      Get.to(() => FranchisesProfilePage());
                                    } else if (index == 1) {
                                      Get.to(() => FranchisesBankProfilePage());
                                      //Get.to(() => DoctorAddress());
                                      //Get.to(() => CatagaryDetails());
                                    } else if (index == 2) {
                                      Get.defaultDialog(
                                          backgroundColor: MyTheme.ThemeColors,
                                          title: 'Update Drivers',
                                          content: SingleChildScrollView(
                                            child: Column(
                                              //mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    // Get.to(
                                                    //     () => OldDriverView());
                                                  },
                                                  child: Container(
                                                      height:
                                                          size.height * 0.07,
                                                      width: size.width * 0.2,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white70,
                                                        shape: BoxShape.circle,
                                                        // borderRadius:
                                                        //     BorderRadius
                                                        //         .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Icon(
                                                        FontAwesomeIcons
                                                            .driversLicense,
                                                      ))
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
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                        () => OldDriverView());
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
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .refresh,
                                                                size:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.03,
                                                              ),
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .peopleGroup,
                                                                size:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.03,
                                                              ),
                                                              Text(
                                                                'Update Old Driver',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      size.height *
                                                                          0.02,
                                                                ),
                                                              ),
                                                            ],
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
                                                    Get.to(
                                                        () => NewDriverView());
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
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .person,
                                                                size:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.03,
                                                              ),
                                                              Text(
                                                                'Update New Driver',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      size.height *
                                                                          0.02,
                                                                ),
                                                              ),
                                                            ],
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
                                      // Get.to(() => RwaPatientList());
                                      // Get.to(() => ChemistOrderHistory());
                                      //Get.to(() => NursePaymentHistory());
                                      // Get.defaultDialog(
                                      //     backgroundColor: MyTheme.ThemeColors,
                                      //     title: 'Select ambulance Type',
                                      //     content: SingleChildScrollView(
                                      //       child: Column(
                                      //         //mainAxisSize: MainAxisSize.min,
                                      //         children: [
                                      //           InkWell(
                                      //             child:
                                      //                 NeumorphicTextFieldContainer(
                                      //               child: Container(
                                      //                   height:
                                      //                       size.height * 0.05,
                                      //                   width: size.width,
                                      //                   decoration:
                                      //                       BoxDecoration(
                                      //                     color: Colors.white70,
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(10),
                                      //                   ),
                                      //                   child: Center(
                                      //                     child: Text(
                                      //                       'Regular',
                                      //                       style: TextStyle(
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .w500,
                                      //                         fontSize:
                                      //                             size.height *
                                      //                                 0.02,
                                      //                       ),
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
                                      //           InkWell(
                                      //             child:
                                      //                 NeumorphicTextFieldContainer(
                                      //               child: Container(
                                      //                   height:
                                      //                       size.height * 0.05,
                                      //                   width: size.width,
                                      //                   decoration:
                                      //                       BoxDecoration(
                                      //                     color: Colors.white70,
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(10),
                                      //                   ),
                                      //                   child: Center(
                                      //                     child: Text(
                                      //                       'Road Accident',
                                      //                       style: TextStyle(
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .w500,
                                      //                         fontSize:
                                      //                             size.height *
                                      //                                 0.02,
                                      //                       ),
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
                                      //           InkWell(
                                      //             child:
                                      //                 NeumorphicTextFieldContainer(
                                      //               child: Container(
                                      //                   height:
                                      //                       size.height * 0.05,
                                      //                   width: size.width,
                                      //                   decoration:
                                      //                       BoxDecoration(
                                      //                     color: Colors.white70,
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(10),
                                      //                   ),
                                      //                   child: Center(
                                      //                     child: Text(
                                      //                       'Funeral/Mortuary Service',
                                      //                       style: TextStyle(
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .w500,
                                      //                         fontSize:
                                      //                             size.height *
                                      //                                 0.02,
                                      //                       ),
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
                                      //           // SizedBox(
                                      //           //     height: size.height * 0.05,
                                      //           //     child: TestPickerWidget()),
                                      //           ///..................
                                      //           // Obx(
                                      //           //   () => Text(
                                      //           //     DateFormat("dd-MM-yyyy")
                                      //           //         .format(_appointmentController
                                      //           //             .selectedDate.value)
                                      //           //         .toString(),
                                      //           //     style: TextStyle(fontSize: 25),
                                      //           //   ),
                                      //           // ),
                                      //
                                      //           // SizedBox(
                                      //           //   height: 30.0,
                                      //           // ),
                                      //           // ElevatedButton(
                                      //           //   style:
                                      //           //       ElevatedButton.styleFrom(
                                      //           //     foregroundColor:
                                      //           //         Colors.yellow,
                                      //           //     backgroundColor: Colors
                                      //           //         .red, // foreground
                                      //           //   ),
                                      //           //   onPressed: () {
                                      //           //     Get.back();
                                      //           //     // Get.to(() =>
                                      //           //     //     AppointmentHistory()
                                      //           //     // );
                                      //           //     // todoController.todos.add(
                                      //           //     //   Todo(
                                      //           //     //     text: textEditingController.text,
                                      //           //     //   ),
                                      //           //     // );
                                      //           //     //Get.back();
                                      //           //   },
                                      //           //   child: Text(
                                      //           //     'Appointment History',
                                      //           //     style: TextStyle(
                                      //           //         color: Colors.white,
                                      //           //         fontSize: 16.0),
                                      //           //   ),
                                      //           //   //color: Colors.redAccent,
                                      //           // )
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     radius: 10.0);
                                      //whatsAppOpen();
                                      // _launchWhatsapp();

                                      // Get.to(() => ComplainList());
                                      //Get.to(() => Profoile());
                                    } else if (index == 3) {
                                      ///
                                      //Get.to(() => TheJwelleryStore());

                                      Get.to(() => GallaryViewss());
                                    } else if (index == 4) {
                                      Get.to(() => FranchisesgalaryPage());
                                      //Get.defaultDialog(
                                      //barrierDismissible: true,

                                    } else if (index == 5) {
                                      Get.to(() => TestListView());
                                      //Get.to(() => RwaProfilePage());
                                    } else if (index == 6) {
                                      Get.to(() => AdddeptSpecPage());
                                    } else if (index == 7) {
                                      Get.to(() => AddVehiclePage());
                                    } else if (index == 8) {
                                      Get.to(() => DeptSpecList());
                                    } else if (index == 9) {
                                      Get.to(() => DeptAndSpecialistView());
                                    } else if (index == 10) {
                                      Get.to(() =>
                                          FrRegistrationCatagaryDetails());
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
                                      //
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
                                      //           ///Doctor registration
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
                                      //           ///patient registration
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
                                      //           ///Chemist registration
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
                                      //           ///lab registration
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
                                      //           ///health checkup registration
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
                                      //
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
                                      //     ),
                                      //     radius: 10.0);
                                      //Get.to(() => DeptSpecList());
                                    } else if (index == 11) {
                                      Get.to(() => FrRegistrationDetails());

                                      ///
                                      // Get.defaultDialog(
                                      //     backgroundColor: MyTheme.ThemeColors,
                                      //     title: 'Registrations Entries',
                                      //     content: SingleChildScrollView(
                                      //       child: Column(
                                      //         //mainAxisSize: MainAxisSize.min,
                                      //         children: [
                                      //           ///vehicle registration
                                      //           InkWell(
                                      //             onTap: () {
                                      //               Get.back();
                                      //               Get.to(() =>
                                      //                   ResitrationVechileDetails());
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
                                      //                           'Vehicle Entries',
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
                                      //           ///Driver registration
                                      //           InkWell(
                                      //             onTap: () {
                                      //               Get.to(() =>
                                      //                   ResitrationDriverDetails());
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
                                      //                           'Driver Entries',
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
                                      //           ///Doctor registration
                                      //           InkWell(
                                      //             onTap: () {
                                      //               Get.to(() =>
                                      //                   ResitrationDoctorDetails());
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
                                      //                           'Doctor Entries',
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
                                      //           ///patient registration
                                      //           InkWell(
                                      //             onTap: () {
                                      //               Get.back();
                                      //               Get.to(() =>
                                      //                   ResitrationPatientDetails());
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
                                      //                           'Patient Entries',
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
                                      //           ///Chemist registration
                                      //           InkWell(
                                      //             onTap: () {
                                      //               Get.back();
                                      //               Get.to(() =>
                                      //                   ResitrationChemistDetails());
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
                                      //                           'Chemist Entries',
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
                                      //                   ResitrationNurseDetails());
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
                                      //                           'Nurse Entries',
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
                                      //           ///lab registration
                                      //           InkWell(
                                      //             onTap: () {
                                      //               Get.to(() =>
                                      //                   ResitrationLabDetails());
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
                                      //                           'Lab Entries',
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
                                      //           ///health checkup registration
                                      //           InkWell(
                                      //             onTap: () {
                                      //               Get.to(() =>
                                      //                   ResitrationHealthCheckupDetails());
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
                                      //                           'Checkup Entries',
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
                                      //           ///health Rwa registration
                                      //           InkWell(
                                      //             onTap: () {
                                      //               Get.to(() =>
                                      //                   ResitrationRwaDetails());
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
                                      //                           'RWA Entries',
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
                                      //     ),
                                      //     radius: 10.0);
                                      //Get.to(() => DeptSpecList());
                                    } else if (index == 12) {
                                      Get.defaultDialog(
                                          backgroundColor: MyTheme.ThemeColors,
                                          title: 'My Y/M/W/D Report',
                                          content: SingleChildScrollView(
                                            child: Column(
                                              //mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ///for doctor
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                    Get.to(() =>
                                                        Ymwdreportdoctor());
                                                  },
                                                  child:
                                                      NeumorphicTextFieldContainer(
                                                    child: Container(
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white70,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .peopleGroup,
                                                                size:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.08,
                                                              ),
                                                              Text(
                                                                'For Doctor',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      size.height *
                                                                          0.02,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                ),

                                                ///for vehicle
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(() =>
                                                        Ymwdreportvehicle());
                                                  },
                                                  child:
                                                      NeumorphicTextFieldContainer(
                                                    child: Container(
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white70,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .car,
                                                                size:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.07,
                                                              ),
                                                              Text(
                                                                'For Vehicle',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      size.height *
                                                                          0.02,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                ),

                                                ///lab
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                        () => YmwdreportLab());
                                                  },
                                                  child:
                                                      NeumorphicTextFieldContainer(
                                                    child: Container(
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white70,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .bookMedical,
                                                                size:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.11,
                                                              ),
                                                              Text(
                                                                'For Lab',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      size.height *
                                                                          0.02,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                ),

                                                ///for nurse
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                    Get.to(() =>
                                                        YmwdreportNurses());
                                                  },
                                                  child:
                                                      NeumorphicTextFieldContainer(
                                                    child: Container(
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white70,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .user,
                                                                size:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.11,
                                                              ),
                                                              Text(
                                                                'For Nurse',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      size.height *
                                                                          0.02,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                ),

                                                ///for Chemist
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                    Get.to(() =>
                                                        YmwdreportChemist());
                                                  },
                                                  child:
                                                      NeumorphicTextFieldContainer(
                                                    child: Container(
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white70,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .bookMedical,
                                                                size:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.12,
                                                              ),
                                                              Text(
                                                                'For Chemist',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      size.height *
                                                                          0.02,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                ),

                                                ///health checkup registration
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(() =>
                                                        YmwdreportHlthChkup());
                                                  },
                                                  child:
                                                      NeumorphicTextFieldContainer(
                                                    child: Container(
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white70,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                FontAwesomeIcons
                                                                    .checkToSlot,
                                                                size:
                                                                    size.height *
                                                                        0.03,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.03,
                                                              ),
                                                              Text(
                                                                'For Health Checkup',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      size.height *
                                                                          0.02,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                ),

                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                    // Get.to(
                                                    //     () => OldDriverView());
                                                  },
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Container(
                                                        height:
                                                            size.height * 0.03,
                                                        width:
                                                            size.width * 0.07,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white70,
                                                          shape:
                                                              BoxShape.circle,
                                                          // borderRadius:
                                                          //     BorderRadius
                                                          //         .circular(10),
                                                        ),
                                                        child: Center(
                                                            child: Icon(
                                                          Icons.close,
                                                        ))
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

                                                ///

                                                ///..................
                                              ],
                                            ),
                                          ),
                                          radius: 10.0);
                                      //Get.to(() => DeptSpecList());
                                    } else if (index == 13) {
                                      Get.to(() => FranchisePaymentReport());
                                    } else if (index == 14) {
                                      Get.to(() => FranchiseCommissionReport());
                                    } else if (index == 15) {
                                      Get.to(() => FranchisePayoutReport());
                                    } else if (index == 16) {
                                      Get.to(() => FranchiseTdsHistoryReport());
                                    } else if (index == 17) {
                                      //Get.back();
                                      Get.to(() => SupportView());
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
                                            color: Colors.grey.shade300,
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
                                      color:
                                          Color(0xffffffff).withOpacity(0.999),
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
//   FranchiseHomepagContreoller _franchiseHomepagContreoller =Get.put(FranchiseHomepagContreoller());
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
//     'https://media.istockphoto.com/id/1207168332/photo/adult-and-children-hands-holding-paper-family-cutout-family-home-foster-care-homeless-charity.jpg?b=1&s=170667a&w=0&k=20&c=nLT8wduB3SKjWp8WQYa2hW28vckCqFyMwNpteoFq_mA=',
//     'https://images.unsplash.com/photo-1531431057391-da7a1aabd412?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
//     'https://images.unsplash.com/photo-1577896851905-dc99e1f8b4b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
//     'https://images.unsplash.com/photo-1532619675605-1ede6c2ed2b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
//     'https://images.unsplash.com/photo-1536064479547-7ee40b74b807?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
//     //'https://images.unsplash.com/photo-1523299174285-a59d80640155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
//     // 'https://images.unsplash.com/photo-1576765608866-5b51046452be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2078&q=80',
//   ];
//   final bool _isPlaying = true;
//
//   //get _sliderKey => null;
//
//   @override
//   Widget build(BuildContext context) {
//     var base = 'http://test.pswellness.in/Images/';
//     //var base = 'https://api.gyros.farm/Images/';
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Obx(
//             () => (_franchiseHomepagContreoller.isLoading.value)
//             ? Center(child: CircularProgressIndicator())
//             :_franchiseHomepagContreoller.banerlistmodel!.bannerImageList.isEmpty
//         //_userhomePageController.banerlistmodel!.bannerImageList!.isEmpty
//         //: _userhomePageController.getsliderbaner!.bannerImageList == null
//         //: _allProductController.allProductModel!.result!.isEmpty
//         //_bestSellerController.bestsellermodel!.result!.isEmpty
//             ? Center(
//           child: Text('No data'),
//         )
//             : SizedBox(
//           height:size.height*0.33,
//           child: CarouselSlider.builder(
//             //scrollPhysics: NeverScrollableScrollPhysics(),
//             key: _sliderKey,
//             unlimitedMode: true,
//             autoSliderTransitionTime: Duration(seconds: 2),
//             //autoSliderDelay: Duration(seconds: 5),
//             slideBuilder: (index) {
//               return Container(
//                 height: size.height*0.29,
//                 alignment: Alignment.center,
//                 // decoration: BoxDecoration(
//                 //   image: DecorationImage(
//                 //       image: NetworkImage(base +
//                 //           '${_homePageController.getsliderbaner!.bannerImageList![index]}'),
//                 //
//                 //   fit: BoxFit.fill),
//
//                 child: Container(
//                   height: size.height * 0.33,
//                   width: size.width,
//                   // height: 26.h,
//                   child: Image.network(
//                     base + '${_franchiseHomepagContreoller.banerlistmodel!.bannerImageList[index].bannerPath.toString()}',
//                     //base+'${_userhomePageController.banerlistmodel!.bannerImageList![index].toString()}',
//                     fit: BoxFit.fill,
//                     errorBuilder: (context, error, stackTrace) {
//                       //if image not comming in catagary then we have to purchase
//
//                       return Center(
//                         child: Text(
//
//                           'No Image',
//
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: size.height*0.02,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//             slideTransform: ZoomOutSlideTransform(),
//             slideIndicator: CircularSlideIndicator(
//               indicatorBorderWidth: 2,
//               indicatorRadius: 4,
//               itemSpacing: 15,
//               currentIndicatorColor: Colors.white,
//               padding: EdgeInsets.only(bottom: 5),
//             ),
//             itemCount: _franchiseHomepagContreoller.banerlistmodel!.bannerImageList.length,
//             enableAutoSlider: true,
//           ),
//
//           // FutureBuilder<List<String>>(
//           //   future: getData(),
//           //   builder: (context, snapshot) {
//           //     if (snapshot.hasData) {
//           //       var items = snapshot.data;
//           //       var base = 'https://api.gyros.farm/Images/';
//           //       return Container(
//           //         height: 26.h,
//           //         child: CarouselSlider.builder(
//           //           //scrollPhysics: NeverScrollableScrollPhysics(),
//           //           key: _sliderKey,
//           //           unlimitedMode: true,
//           //           autoSliderTransitionTime: Duration(seconds: 2),
//           //           //autoSliderDelay: Duration(seconds: 5),
//           //           slideBuilder: (index) {
//           //             return Container(
//           //               height: 26.h,
//           //               alignment: Alignment.center,
//           //               decoration: BoxDecoration(
//           //                 image: DecorationImage(
//           //                     image: NetworkImage(base + '${items![index]}'),
//           //                     fit: BoxFit.fill),
//           //               ),
//           //             );
//           //           },
//           //           slideTransform: ZoomOutSlideTransform(),
//           //           slideIndicator: CircularSlideIndicator(
//           //             indicatorBorderWidth: 2,
//           //             indicatorRadius: 4,
//           //             itemSpacing: 15,
//           //             currentIndicatorColor: Colors.white,
//           //             padding: EdgeInsets.only(bottom: 6),
//           //           ),
//           //           itemCount: items!.length,
//           //           enableAutoSlider: true,
//           //         ),
//           //       );
//           //
//           //       /*  ListView(
//           //         physics: NeverScrollableScrollPhysics(),
//           //         children: <Widget>[
//           //           Container(
//           //             height: 26.h,
//           //             child: CarouselSlider.builder(
//           //               //scrollPhysics: NeverScrollableScrollPhysics(),
//           //               key: _sliderKey,
//           //               unlimitedMode: true,
//           //               autoSliderTransitionTime: Duration(seconds: 2),
//           //               //autoSliderDelay: Duration(seconds: 5),
//           //               slideBuilder: (index) {
//           //                 return Container(
//           //                   height: 26.h,
//           //                   alignment: Alignment.center,
//           //                   decoration: BoxDecoration(
//           //                     image: DecorationImage(
//           //                         image: NetworkImage('${'Images'}'),
//           //                         fit: BoxFit.fill),
//           //                   ),
//           //                   //color: colors[index],
//           //                   // child: Text(
//           //                   //   letters[index],
//           //                   //   style: TextStyle(fontSize: 200, color: Colors.white),
//           //                   // ),
//           //                 );
//           //               },
//           //               slideTransform: ZoomOutSlideTransform(),
//           //               slideIndicator: CircularSlideIndicator(
//           //                 indicatorBorderWidth: 2,
//           //                 indicatorRadius: 4,
//           //                 itemSpacing: 15,
//           //                 currentIndicatorColor: Colors.white,
//           //                 padding: EdgeInsets.only(bottom: 6),
//           //               ),
//           //               itemCount: images.length,
//           //               enableAutoSlider: true,
//           //             ),
//           //           ),
//           //           Padding(
//           //             padding: const EdgeInsets.symmetric(vertical: 1),
//           //             child: Align(
//           //               child: ConstrainedBox(
//           //                 constraints:
//           //                     BoxConstraints(minWidth: 190, maxWidth: 600),
//           //               ),
//           //             ),
//           //           ),
//           //         ],
//           //       );*/
//           //     } else if (snapshot.hasError) {
//           //       return Text("${snapshot.error}");
//           //     }
//           //     return Center(
//           //         child: CircularProgressIndicator(
//           //       color: Colors.white,
//           //     ));
//           //   },
//           // )
//         ),
//       ),
//     );
//   }
// }

///...........
///
