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
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/add_vehicle_controller/add_vehicle_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/drawer_page_franchies_controller/franchies_profile_franchies.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesProfileDetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchies_banner_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/update_new_driver_controller/update_newdriver_controllerrr.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_dept_spec_page_view/add_dept_spe.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_dept_spec_page_view/list_dept_spec/list_dept_specialist.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_vehicle/add_vechile_type.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_drawer_view/drawerpage.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/profile_page_view/franchiese_profile.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchise_commission_report/franchise_commission_report.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchise_payment_report/franchise_payment_report.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchise_tds_report/franchise_tds_historyy_report.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_bank_profile_page_view/bank_profile_view.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_galary_page_view/gallary_view.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_newdrivre_update/new_driver_view.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchises_olddrivre_update/old_driver_view.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/galerry_view/gallary_views.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_choose_registration_type/fr_choose_catagary.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/test_name_list/test_name_list.dart';
import 'package:ps_welness_new_ui/widgets/exit_popup_warning/exit_popup.dart';
import 'package:ps_welness_new_ui/widgets/widgets/constant_string.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/2_franchises_controller/frenchiesOldDriver_controller/update_old_driver_post_controllers.dart';
import '../../../controllers/2_franchises_controller/registration_part_controller/franchise_chemist_regis_controller/chemist1_fr_controller/fr_chemist_controller.dart';
import '../../../widgets/circular_loader.dart';
import '../franchise_payout_report/franchise_payout_report.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_chemist_details/chemist_detail.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_doctor_report/my_ymwd_doctor_details/my_ymwd_vehicle_report.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_lab_details/lab_detail.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_nurse_details/nursees_detail.dart';
import '../my_y_m_w_d_reports_view_all/my_ymwd_vehicle_report/my_ymwd_vehicle_details/vehicle_detail.dart';
import '../registration_view_part/fr_choose_registration_details/fr_choose_catagary.dart';

class FranchiesHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _keyfranchise = GlobalKey();
    Fr_Chemist_1_Controller _fr_chemist_1_controller =
        Get.put(Fr_Chemist_1_Controller());
    FranchiesSpecialistController _franchiesSpecialistController =
        Get.put(FranchiesSpecialistController());
    AddVehicleController _addVehicleController =
        Get.put(AddVehicleController());
    FrenchiesProfileDetailController _frenchiesProfileDetailController =
        Get.put(FrenchiesProfileDetailController());

    DraweerFranchiesProfileController _draweerFranchiesProfileController =
        Get.put(DraweerFranchiesProfileController());

    UpdatenewdriverrrController _updatenewVehicleController =
        Get.put(UpdatenewdriverrrController());

    UpdateolddriverrrController _updateoldVehicleController =
        Get.put(UpdateolddriverrrController());

    //AddVehicleController _addVehicleController = Get.put(AddVehicleController());

    // FranchiesSpecialistController _franchiesSpecialistController =
    // Get.put(FranchiesSpecialistController());

    final List<String> productname = [
      'Edit Profile',
      'Add Bank Detail',
      'Vehicle Allotment',
      'Gallery',
      'Add Gallery',
      'Add Test',
      'Add Spec & Dept',
      'Add Vehicle Type',
      'View Spe & Dpt',
      // 'View Dept & Spec',
      'Registration',
      'Registration Details',
      'My Y/M/W/D Report',
      'My Payment Report',
      'My Commission Report',
      'My Payout Report',
      'My TDS Report',
      // 'Contact US'
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
      //'',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      //'',
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
      'lib/assets/icons/frtest.png',
      'lib/assets/icons/frspaclist.png',
      'lib/assets/icons/fradddcarr.png',

      ///
      'lib/assets/icons/frspecial.png',
      //'lib/assets/icons/frspaclist.png',
      'lib/assets/icons/frregister.png',
      'lib/assets/icons/frregisterdetail.png',
      'lib/assets/icons/fryreport.png',
      'lib/assets/icons/frpayment.png',
      'lib/assets/icons/frcommission.png',
      'lib/assets/icons/frpayout.png',
      'lib/assets/icons/frtds.png',
      //'lib/assets/icons/contact44.png',
    ];
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              lightPrimary,
              darkPrimary,
            ])),
        child: Scaffold(
          key: _keyfranchise,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: [
                Container(
                    height: size.height * 0.045,
                    width: size.width * 0.11,
                    child: Image.asset('lib/assets/icons/fr1.png')),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'PS WELLNESS',
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: ' Franchises',
                        style: GoogleFonts.alatsi(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyTheme.containercolor5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            //MyTheme.ThemeColors,
            leading: IconButton(
              icon: const Icon(
                Icons.dehaze_rounded,
                size: 23,
                color: Colors.white,
              ),
              onPressed: () async {
                await _frenchiesProfileDetailController
                    .frenchiesProfileDetailApi();
                _frenchiesProfileDetailController.update();
                _keyfranchise.currentState!.openDrawer();
              },
            ),
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
                    child: Mycrusial(),
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
                    decoration: BoxDecoration(),
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
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.00131,
                                horizontal: size.width * 0.01),
                            decoration: BoxDecoration(
                                color: Color(0xff11eae0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    onTap: () async {
                                      if (index == 0) {
                                        _frenchiesProfileDetailController
                                            .frenchiesProfileDetailApi();
                                        _frenchiesProfileDetailController
                                            .update();
                                        _frenchiesProfileDetailController
                                            .onInit();
                                        _draweerFranchiesProfileController
                                            .onInit();
                                        // _frenchiesProfileDetailController.
                                        _draweerFranchiesProfileController
                                            .clearSelectedState();

                                        /// _draweerFranchiesProfileController.refresh();
                                        // _draweerFranchiesProfileController.update();

                                        await Future.delayed(
                                            Duration(milliseconds: 1000));

                                        await Get.offAll(
                                            () => FranchiessProfilePage());

                                        await Future.delayed(
                                            Duration(milliseconds: 10));

                                        await _frenchiesProfileDetailController
                                            .frenchiesProfileDetailApi();

                                        ///Get.to(() => FranchisesProfilePage());
                                      } else if (index == 1) {
                                        Get.to(() => FranchisesAddBankPage());
                                      } else if (index == 2) {
                                        Get.defaultDialog(
                                            backgroundColor:
                                                MyTheme.ThemeColors,
                                            title: 'Update Drivers',
                                            content: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                        height:
                                                            size.height * 0.07,
                                                        width: size.width * 0.2,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white70,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: const Center(
                                                            child: Icon(
                                                          FontAwesomeIcons
                                                              .driversLicense,
                                                        ))),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      // await _updateoldVehicleController
                                                      //     .getdriverVehicleoldTypeApi();
                                                      // await _updateoldVehicleController
                                                      //     .getdriverssApi();
                                                      //
                                                      // _updateoldVehicleController
                                                      //     .update();
                                                      await Get.to(() =>
                                                          OldDriverView());
                                                    },
                                                    child:
                                                        NeumorphicTextFieldContainer(
                                                      child: Container(
                                                          height: size.height *
                                                              0.05,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
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
                                                          )),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await _updatenewVehicleController
                                                          .getdriverVehiclenewTypeApi();
                                                      _updatenewVehicleController
                                                          .update();
                                                      await Get.to(() =>
                                                          NewDriverView());
                                                    },
                                                    child:
                                                        NeumorphicTextFieldContainer(
                                                      child: Container(
                                                          height: size.height *
                                                              0.05,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
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
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            radius: 10.0);
                                      } else if (index == 3) {
                                        Get.to(() => GallaryViewss());
                                      } else if (index == 4) {
                                        Get.to(() => FranchisesgalaryPage());
                                      } else if (index == 5) {
                                        Get.to(() => TestListView());
                                      } else if (index == 6) {
                                        Get.to(() => AdddeptSpecPage());
                                      } else if (index == 7) {
                                        CallLoader.loader();
                                        await Future.delayed(
                                            Duration(seconds: 1));
                                        CallLoader.hideLoader();
                                        _addVehicleController
                                            .vehiclecatagaryvehicleController
                                            .clear();
                                        _addVehicleController
                                            .vehicletypeController
                                            .clear();

                                        //await _addVehicleController
                                        // .getVehicleCategoryApi();
                                        // _addVehicleController.update();
                                        // _addVehicleController.onInit();
                                        await Get.offAll(
                                            () => AddVehiclePage());
                                      } else if (index == 8) {
                                        _franchiesSpecialistController
                                            .franchiesSpecialistListssApi();
                                        _franchiesSpecialistController.update();
                                        _franchiesSpecialistController.onInit();
                                        CallLoader.loader();
                                        await Future.delayed(
                                            Duration(milliseconds: 900));
                                        CallLoader.hideLoader();
                                        await SharedPreferences.getInstance()
                                            .then((value) =>
                                                Get.to(() => DeptSpecList()));
                                        //Get.to(() => DeptSpecList());
                                      }

                                      ///9
                                      // else if (index == 9) {
                                      //
                                      //
                                      //   ///this is not necessary...
                                      //   _franchiesSpecialistController
                                      //       .franchiesDeptAndSpecListsApi();
                                      //   _franchiesSpecialistController.update();
                                      //   _franchiesSpecialistController.onInit();
                                      //
                                      //   CallLoader.loader();
                                      //   await Future.delayed(
                                      //       Duration(milliseconds: 900));
                                      //   CallLoader.hideLoader();
                                      //   await SharedPreferences.getInstance()
                                      //       .then((value) => Get.to(
                                      //           () => DeptAndSpecialistView()));
                                      //   //Get.to(() => DeptAndSpecialistView());
                                      // }
                                      ///
                                      else if (index == 9) {
                                        CallLoader.loader();
                                        await Future.delayed(
                                            Duration(milliseconds: 900));
                                        CallLoader.hideLoader();
                                        await SharedPreferences.getInstance()
                                            .then((value) => Get.to(() =>
                                                FrRegistrationCatagaryDetails()));

                                        //_fr_chemist_1_controller.onInit();
                                        //Get.to(() =>
                                        // FrRegistrationCatagaryDetails());
                                      } else if (index == 10) {
                                        Get.to(() => FrRegistrationDetails());
                                      } else if (index == 11) {
                                        Get.defaultDialog(
                                            backgroundColor:
                                                MyTheme.ThemeColors,
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
                                                          height: size.height *
                                                              0.04,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
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
                                                          height: size.height *
                                                              0.04,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
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
                                                      Get.to(() =>
                                                          YmwdreportLab());
                                                    },
                                                    child:
                                                        NeumorphicTextFieldContainer(
                                                      child: Container(
                                                          height: size.height *
                                                              0.04,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
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
                                                          height: size.height *
                                                              0.04,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
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
                                                          height: size.height *
                                                              0.04,
                                                          width: size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
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
                                                  // InkWell(
                                                  //   onTap: () {
                                                  //     Get.to(() =>
                                                  //         YmwdreportHlthChkup());
                                                  //   },
                                                  //   child:
                                                  //       NeumorphicTextFieldContainer(
                                                  //     child: Container(
                                                  //         height:
                                                  //             size.height * 0.04,
                                                  //         width: size.width,
                                                  //         decoration:
                                                  //             BoxDecoration(
                                                  //           color: Colors.white70,
                                                  //           borderRadius:
                                                  //               BorderRadius
                                                  //                   .circular(10),
                                                  //         ),
                                                  //         child: Center(
                                                  //           child: Row(
                                                  //             mainAxisAlignment:
                                                  //                 MainAxisAlignment
                                                  //                     .center,
                                                  //             children: [
                                                  //               Icon(
                                                  //                 FontAwesomeIcons
                                                  //                     .checkToSlot,
                                                  //                 size:
                                                  //                     size.height *
                                                  //                         0.03,
                                                  //               ),
                                                  //               SizedBox(
                                                  //                 width:
                                                  //                     size.width *
                                                  //                         0.03,
                                                  //               ),
                                                  //               Text(
                                                  //                 'For Health Checkup',
                                                  //                 style:
                                                  //                     TextStyle(
                                                  //                   fontWeight:
                                                  //                       FontWeight
                                                  //                           .w500,
                                                  //                   fontSize:
                                                  //                       size.height *
                                                  //                           0.02,
                                                  //                 ),
                                                  //               ),
                                                  //             ],
                                                  //           ),
                                                  //         )),
                                                  //   ),
                                                  // ),

                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                          height: size.height *
                                                              0.03,
                                                          width:
                                                              size.width * 0.07,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color:
                                                                Colors.white70,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: const Center(
                                                              child: Icon(
                                                            Icons.close,
                                                          ))),
                                                    ),
                                                  ),

                                                  ///
                                                  ///..................
                                                ],
                                              ),
                                            ),
                                            radius: 10.0);
                                      } else if (index == 12) {
                                        Get.to(() => FranchisePaymentReport());
                                      } else if (index == 13) {
                                        Get.to(
                                            () => FranchiseCommissionReport());
                                      } else if (index == 14) {
                                        Get.to(() => FranchisePayoutReport());
                                      } else if (index == 15) {
                                        Get.to(
                                            () => FranchiseTdsHistoryReport());
                                      } else if (index == 16) {
                                        //Get.back();
                                        // Get.to(() => SupportViewPsComman());
                                      }
                                    },
                                    child: Container(
                                      height: size.height * 0.11,
                                      width: size.width * 0.23,
                                      padding: EdgeInsets.all(7),
                                      child: Image.asset(productimage[index]),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        color: Color(0xffffffff)
                                            .withOpacity(0.999),
                                        borderRadius: const BorderRadius.only(
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
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Mycrusial extends StatelessWidget {
  final _sliderKey = GlobalKey();
  Mycrusial({Key? key}) : super(key: key);
  FrenchiesBannerController frenchiesBannerController =
      Get.put(FrenchiesBannerController());
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  final bool _isPlaying = true;
  //final img = 'http://pswellness.in/Images/';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => (frenchiesBannerController.isLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : frenchiesBannerController
                        .getfrenchiesBannerApi?.bannerImageList ==
                    null
                ? Center(child: Text('No List'))
                : Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: size.height * 0.28,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Material(
                          color: MyTheme.ThemeColors,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          child: CarouselSlider.builder(
                            key: _sliderKey,
                            unlimitedMode: true,
                            autoSliderTransitionTime: Duration(seconds: 1),
                            slideBuilder: (index) {
                              var items = frenchiesBannerController
                                  .getfrenchiesBannerApi?.bannerImageList;
                              return Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Material(
                                  elevation: 12,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: size.height * 38,
                                    width: size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '$IMAGE_BASE_URL${items?[index].bannerPath}' ??
                                                  ''),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              );
                            },
                            slideTransform: DefaultTransform(),
                            slideIndicator: CircularSlideIndicator(
                              indicatorBorderWidth: 2,
                              indicatorRadius: 4,
                              itemSpacing: 15,
                              currentIndicatorColor: Colors.white,
                              padding: EdgeInsets.only(bottom: 0),
                            ),
                            itemCount: frenchiesBannerController
                                .getfrenchiesBannerApi!.bannerImageList.length,
                            enableAutoSlider: true,
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}

///...........
///
