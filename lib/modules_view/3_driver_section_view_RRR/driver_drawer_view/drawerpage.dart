import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_controller/driver_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_view_controllers_RRR/driver_profile_detail_controller.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_drawer_view/driver_drower_pages/complaint_page/complaint_page.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_drawer_view/driver_drower_pages/driver_profile_details/profile_driver_detail_page.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_update_bank_details/bank_update_view.dart';
import 'package:ps_welness_new_ui/modules_view/change_password_view/change_password_view.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/comman_appi/get_all_bank_detail/get_bank_detail_controller.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/widgets/share_your_link/share_link_pagee.dart';
import 'package:ps_welness_new_ui/widgets/widgets/web_view_aboutus.dart';
import 'package:ps_welness_new_ui/widgets/widgets/web_view_privecy_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:ps_welness_new_ui/modules_view/3_driver_section_view/driver_drawer_view/driver_drower_pages/about_us/about_us.dart';
//import 'package:ps_welness_new_ui/modules_view/3_driver_section_view/driver_drawer_view/driver_drower_pages/complaint_page/complaint_page.dart';
//import 'package:ps_welness_new_ui/modules_view/3_driver_section_view/driver_drawer_view/driver_drower_pages/driver_profile_details/profile_driver_detail_page.dart';
//import 'package:ps_welness_new_ui/modules_view/3_driver_section_view/driver_drawer_view/driver_drower_pages/profile_driver_page_view/driver_profile.dart';
//import 'package:ps_welness_new_ui/modules_view/forget_password_view/forget_password_view.dart';

import '../../../controllers/3_driver_view_controllers/driver_home_page_controller/driver_user_acpt_rejct_list/user_list_accept_reject_list.dart';
import '../../../widgets/support_page_comman/support_comman_page.dart';
import '../driver_profile_page_view/profile_view.dart';
import 'driver_drower_pages/location_practice/location_practiceeee.dart';

class DriverMainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DriverProfileDetailController _driverprofile =
        Get.put(DriverProfileDetailController());
    UseracptrejectController _useracptrejectController =
        Get.put(UseracptrejectController());
    LoginpasswordController _loginpasswordControllerr2 = Get.find();
    DriverProfileController _driverProfileControlleredit =
        Get.put(DriverProfileController());
    BankDetailController _getbank = Get.put(BankDetailController());

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
                      radius: size.width * 0.09,
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
                      height: size.height * 0.01,
                    ),
                    Obx(
                      () => (_driverprofile.isLoading.value)
                          ? SizedBox(
                              height: size.height * 0.03,
                              child: CircularProgressIndicator(
                                  //value: 2,
                                  ))
                          : Text(
                              "${_driverprofile.getDriverProfileDetail?.driverName.toString()}",
                              //'Kumar Gaurav',
                              style: GoogleFonts.roboto(
                                  fontSize: size.height * 0.019,
                                  fontWeight: FontWeight.w800,
                                  color: MyTheme.blueww),
                            ),
                    ),
                    Obx(
                      () => (_driverprofile.isLoading.value)
                          ? SizedBox(
                              height: size.height * 0.03,
                              child: CircularProgressIndicator(
                                  //value: 2,
                                  ))
                          : Text(
                              "${_driverprofile.getDriverProfileDetail?.emailId.toString()}",
                              //'kumar@gmail.com',
                              style: GoogleFonts.roboto(
                                  fontSize: size.height * 0.016,
                                  fontWeight: FontWeight.w700,
                                  color: MyTheme.blueww),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
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
                _useracptrejectController.driveracceptrejctlistApi();
                _useracptrejectController.update();
                // Get.to(() => MessageScreen(
                //       id: '123456',
                //     ));
                Get.offNamed('/AboutUs');
              },
            ),
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.person,
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
                'Diver Profile Details',
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
                _driverprofile.driverProfileDetailApi();
                _driverprofile.update();
                Get.to(() => DriverDetailProfile());
                Get.offNamed('/ComplaintPage');
              },
            ),

            ListTile(
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
                Get.to(() => ComplaintPageDriver());
                Get.offNamed('/ComplaintPage');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.edit,
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
                'Edit Profile',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/DriverProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                // Get.back();
                _driverprofile.driverProfileDetailApi();
                _driverprofile.update();
                _driverprofile.onInit();

                _driverProfileControlleredit.onInit();
                _driverProfileControlleredit.clearSelectedState();
                await Future.delayed(Duration(seconds: 1));

                await Get.to(() => DriverProfilePage());
                // Get.offNamed('/DriverProfilePage');
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
              onTap: () async {
                print(Get.currentRoute);

                /// Get.back();

                /// Get.back();
                await _getbank.BankDetailCommonApi();
                _getbank.update();
                _getbank.onInit();
                await Future.delayed(Duration(milliseconds: 1000));

                await Get.to(() => UpdateDriverBankDetail());
                // await Future.delayed(Duration(milliseconds: 10));
                // await _getbank.BankDetailCommonApi();
                //Get.to(() => UpdateBankSeperateDetail());
                //Get.offNamed('/UpdateBankSeperateDetail');
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
                'About Us',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/WebViewPswebsiteabout'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => WebViewPswebsiteabout()
                    //AboutUsViewDriver()
                    );
                Get.offNamed('/WebViewPswebsiteabout');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                Icons.policy,
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
                'Privacy Policy',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/WebViewPswebsiteprivecy'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                Get.back();
                Get.to(() => WebViewPswebsiteprivecy()
                    // PrivacyPolicyView()
                    );
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
                Icons.location_on,
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
                'Update Location',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/GetUserLocation'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                //Get.to(() => DriverUpdateLocationView());
                Get.to(() => MyLocation());
                // Get.offNamed('/GetUserLocation');
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

            ///
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
                _loginpasswordControllerr2.onInit();
                _loginpasswordControllerr2.emailController.clear();
                _loginpasswordControllerr2.passwordController.clear();
                _loginpasswordControllerr2.toggleCheckbox(false);
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
