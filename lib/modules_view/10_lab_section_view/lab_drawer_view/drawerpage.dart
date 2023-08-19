import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/10_lab_controller/add_test_lab_controller/lab_test_add_controller.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_about_us/user_about_us_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/skils_controller/skils_controllers.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_drawer_view/drower_pages/lab_test_view/add_labtestts/add_test_todo.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/drawer_pages_user/about_us_user/about_us.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/drawer_pages_user/user_profile_details/profile_lab_detail_page.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/bank_update_seperate_chemist/bank_update_saperate_chemist.dart';
import 'package:ps_welness_new_ui/modules_view/change_password_view/change_password_view.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/widgets/share_your_link/share_link_pagee.dart';
import 'package:ps_welness_new_ui/widgets/support_page_comman/support_comman_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:ps_welness/modules_view/drawer_view/drower_pages/about_us/about_us.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/complaint_page/complaint_page.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/profile_page_view/profile_view.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/supports/support_view.dart';

import '../../../controllers/10_lab_controller/lab_about_us_controller/lab_about_us_controllers.dart';
import '../../../controllers/10_lab_controller/lab_profile_details_controller/lab_profile_details_controller.dart';
import '../../sign_in/sigin_screen.dart';
import 'drower_pages/complaint_page/complaint_lab_page.dart';
import 'drower_pages/profile_page_view/lab_profile.dart';

class LabMainDrawer extends StatelessWidget {
  LabprofiledetailController _labprofiledetailController =
      Get.put(LabprofiledetailController());
  UserAboutusController _userAboutusController =
      Get.put(UserAboutusController());
  LabAboutusController _labAboutusController = Get.put(LabAboutusController());
  SkillsListController _skillsListController = Get.put(SkillsListController());
  LoginpasswordController _loginpasswordController = Get.find();
  LabTestListController _labTestListController =
      Get.put(LabTestListController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Drawer(
        backgroundColor: MyTheme.ContainerUnSelectedColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: MyTheme.ThemeColors,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: size.width * 0.10,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(size.height * 0.02),
                        child: Image.asset(
                          'lib/assets/image/ps_welness2.png',
                          height: size.height * 0.05,
                        ),
                      )),
                    ),
                    SizedBox(
                      height: size.height * 0.00,
                    ),
                    Text(
                      "${_labprofiledetailController.labprofileModel?.labName.toString()}"
                      // 'Ram Singh',
                      ,
                      style: GoogleFonts.roboto(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w700,
                          color: MyTheme.blueww),
                    ),
                    Text(
                      "${_labprofiledetailController.labprofileModel?.emailId.toString()}"

                      // 'ram@gmail.com',
                      ,
                      style: GoogleFonts.roboto(
                          fontSize: size.height * 0.016,
                          fontWeight: FontWeight.w700,
                          color: MyTheme.blueww),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.home,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Home',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/AboutUs'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // Get.to(() => AboutUs());
                Get.offNamed('/AboutUs');
              },
            ),

            ///todo: test..add............
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.list,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Add Lab Test',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/LabtestListScreen'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _labTestListController.labTestListApi();
                _labTestListController.update();
                Get.to(() => LabtestListScreen());
                // Get.offNamed('/LabtestListScreen');
              },
            ),

            ///
            // ListTile(
            //   // horizontalTitleGap: 10,
            //   leading: Icon(
            //     FontAwesomeIcons.solidAddressCard,
            //     color: MyTheme.blueww,
            //     size: size.height * 0.021,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.blueww,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'Add Lab Test',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017,
            //         fontWeight: FontWeight.w600,
            //         color: MyTheme.blueww),
            //   ),
            //   tileColor: Get.currentRoute == '/AddTestPageLab'
            //       ? Colors.grey[300]
            //       : Colors.transparent,
            //   onTap: () {
            //     print(Get.currentRoute);
            //
            //     Get.to(() => AddTestPageLab());
            //
            //     Get.offNamed('/AddTestPageLab');
            //   },
            // ),

            ///

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.edit,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Update Lab Profile',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/LabProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => LabProfilePage());
                Get.offNamed('/LabProfilePage');
              },
            ),

            // ListTile(
            //   // horizontalTitleGap: 10,
            //   leading: Icon(
            //     FontAwesomeIcons.list,
            //     color: MyTheme.blueww,
            //     size: size.height * 0.021,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.blueww,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'List',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017,
            //         fontWeight: FontWeight.w600,
            //         color: MyTheme.blueww),
            //   ),
            //   tileColor: Get.currentRoute == '/PatientList'
            //       ? Colors.grey[300]
            //       : Colors.transparent,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     Get.to(() => PatientList());
            //     Get.offNamed('/PatientList');
            //   },
            // ),

            ///

            // ListTile(
            //   // horizontalTitleGap: 10,
            //   leading: Icon(
            //     FontAwesomeIcons.add,
            //     color: MyTheme.blueww,
            //     size: size.height * 0.021,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.blueww,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'Add Skils',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017,
            //         fontWeight: FontWeight.w600,
            //         color: MyTheme.blueww),
            //   ),
            //   tileColor: Get.currentRoute == '/AddSkilsScreen'
            //       ? Colors.grey[300]
            //       : Colors.transparent,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     Get.to(() => AddSkilsScreen());
            //     Get.offNamed('/AddSkilsScreen');
            //   },
            // ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.sticky_note_2_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Complaint',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/ComplaintPage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => ComplaintLabPage());
                Get.offNamed('/ComplaintPage');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.person,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Lab Profile Detail',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/LapDetailProfile'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _labprofiledetailController.update();
                _labprofiledetailController.labprofileApi();
                //LapDetailProfile
                Get.to(() => LapDetailProfile());
                Get.offNamed('/LapDetailProfile');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.food_bank,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Update Bank',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/UpdateBankSeperateDetail'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => UpdateBankSeperateDetail());
                Get.offNamed('/UpdateBankSeperateDetail');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.account_box,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'About Lab',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/AboutUsView'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _userAboutusController.update();
                _userAboutusController.useraboutusApi();
                //_labAboutusController.update();
                //_labAboutusController.lababoutusApi();
                Get.to(() => UserAboutUsView());
                Get.offNamed('/UserAboutUsView');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.support_agent,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Support',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/SupportViewPsComman'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => SupportViewPsComman());
                Get.offNamed('/SupportViewPsComman');
              },
            ),
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.share_rounded,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Share with others',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/Sharelinkweight'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                Get.back();
                //Get.to(() => ShareData());
                Get.to(() => Sharelinkweight());
              },
            ),
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.password,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Change Password',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/ChangePassword'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => ChangePassword());
                Get.offNamed('/ChangePassword');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.logout,
                color: MyTheme.blueww,
                size: size.height * 0.021,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.blueww,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Logout',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/AboutUs'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () async {
                ///....logout
                _loginpasswordController.onInit();
                CallLoader.loader();
                await Future.delayed(Duration(seconds: 2));
                CallLoader.hideLoader();
                await SharedPreferences.getInstance()
                    .then((value) => value.clear());
                //Get.back();
                await Get.offAll(() => SignInScreen());
              },
            ),

            ///

            // ListTile(
            //   // horizontalTitleGap: 10,
            //   leading: Icon(
            //     Icons.password,
            //     color: MyTheme.blueww,
            //     size: size.height * 0.021,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.blueww,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'Forgot Password',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017,
            //         fontWeight: FontWeight.w600,
            //         color: MyTheme.blueww),
            //   ),
            //   tileColor: Get.currentRoute == '/AboutUs'
            //       ? Colors.grey[300]
            //       : Colors.transparent,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     Get.to(() => ForgotPassword());
            //     Get.offNamed('/AboutUs');
            //   },
            // ),

            ////
            // ListTile(
            //   //horizontalTitleGap: 10,
            //   leading: Icon(
            //     Icons.person_rounded,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.025,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'Service 2',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
            //   ),
            //   tileColor:
            //       Get.currentRoute == '/ProfilePage' ? Colors.grey[300] : null,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     // Get.to(() => ProfilePage());
            //     Get.offNamed('/ProfilePage');
            //   },
            // ),
            // ListTile(
            //   // horizontalTitleGap: 10,
            //   leading: Icon(
            //     FontAwesomeIcons.umbrellaBeach,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.025,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'Service 3',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
            //   ),
            //   tileColor: Get.currentRoute == '/MyHolidayPage'
            //       ? Colors.grey[300]
            //       : null,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     // Get.to(() => MyHolidayPage());
            //     Get.offNamed('/MyHolidayPage');
            //   },
            // ),
            // ListTile(
            //   // horizontalTitleGap: 10,
            //   leading: Icon(
            //     FontAwesomeIcons.hotel,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.025,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'Service 4',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
            //   ),
            //   tileColor: Get.currentRoute == '/AssociatePage'
            //       ? Colors.grey[300]
            //       : null,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     // Get.to(() => AssociatePage());
            //     Get.offNamed('/AssociatePage');
            //   },
            // ),
            // ListTile(
            //   //horizontalTitleGap: 10,
            //   leading: Icon(
            //     FontAwesomeIcons.photoFilm,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.025,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'Service 5',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
            //   ),
            //   tileColor:
            //       Get.currentRoute == '/Gallerys' ? Colors.grey[300] : null,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     //Get.to(() => Gallerys());
            //     Get.offNamed('/Gallerys');
            //   },
            // ),
            // ListTile(
            //   //horizontalTitleGap: 10,
            //   leading: Icon(
            //     FontAwesomeIcons.clockRotateLeft,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.025,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'Service 6',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
            //   ),
            //   tileColor: Get.currentRoute == '/PaymentHistory'
            //       ? Colors.grey[300]
            //       : null,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     //Get.to(() => PaymentHistory());
            //     Get.offNamed('/PaymentHistory');
            //   },
            // ),
            // ListTile(
            //   //horizontalTitleGap: 15,
            //   leading: Icon(
            //     FontAwesomeIcons.circleQuestion,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.025,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     color: MyTheme.t1Iconcolor,
            //     size: size.height * 0.02,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'service 7',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
            //   ),
            //   tileColor:
            //       Get.currentRoute == '/AmcPage' ? Colors.grey[300] : null,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     //Get.to(() => AmcPage());
            //     Get.offNamed('/AmcPage');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
