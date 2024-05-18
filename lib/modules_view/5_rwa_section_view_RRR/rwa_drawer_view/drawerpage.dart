import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_about_us/user_about_us_controller.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/about_us_rwa/aboutus_rwa.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwa_profile/rwa_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwa_profile_detail_controller.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_drawer_view/drower_pages/rwa_profile_details/profile_rwa_detail_page.dart';
import 'package:ps_welness_new_ui/modules_view/5_rwa_section_view_RRR/rwa_profile_page_view/profile_view.dart';
import 'package:ps_welness_new_ui/modules_view/change_password_view/change_password_view.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/comman_appi/comman_bank_update/update_all_bank_details/update_bank_view.dart';
import 'package:ps_welness_new_ui/modules_view/comman_appi/get_all_bank_detail/get_bank_detail_controller.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/widgets/share_your_link/share_link_pagee.dart';
import 'package:ps_welness_new_ui/widgets/widgets/web_view_aboutus.dart';
import 'package:ps_welness_new_ui/widgets/widgets/web_view_privecy_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/support_page_comman/support_comman_page.dart';
import 'drower_pages/complaint_page/complaint_page.dart';

class RwaMainDrawer extends StatelessWidget {
  RwaMainDrawer({super.key});
  final RwaProfileDetailController _rwaProfileDetailController =
      Get.put(RwaProfileDetailController());
  RwaAboutusController _rwaAboutusController = Get.put(RwaAboutusController());
  final UserAboutusController _userAboutusController =
      Get.put(UserAboutusController());
  final LoginpasswordController _loginpasswordControllerr4 = Get.find();

  RwaProfileController _rwaProfileControllerupdate =
      Get.put(RwaProfileController());

  BankDetailController _getbank = Get.put(BankDetailController());

  //RwaProfileController _rwaProfileController = Get.put(RwaProfileController());
  //RwaProfileDetailController _rwaProfileDetailController = Get.put(RwaProfileDetailController());

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
                          height: size.height * 0.045,
                        ),
                      )),
                    ),
                    SizedBox(
                      height: size.height * 0.00,
                    ),
                    SizedBox(
                      height: size.height * 0.045,
                      child:
                          // ListView.builder(
                          //     itemCount: 1,
                          //     itemBuilder: (context, index) {
                          //       final item = _rwaProfileDetailController
                          //           .getRwaProfileDetail?.rwaProfileDetails;
                          // return
                          Column(
                        children: [
                          Text(
                            _rwaProfileDetailController
                                    .getRwaProfileDetail?.authorityName
                                    .toString() ??
                                "loading..",

                            //'${_rwaProfileDetailController.getRwaProfileDetail?.authorityName.toString()

                            /// item?[index].authorityName
                            //}',
                            // 'Ps Foundation',
                            style: GoogleFonts.roboto(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w700,
                                color: MyTheme.blueww),
                          ),
                          Text(
                            _rwaProfileDetailController
                                    .getRwaProfileDetail?.emailId
                                    .toString() ??
                                "loading..",
                            style: GoogleFonts.roboto(
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.w700,
                                color: MyTheme.blueww),
                          ),
                        ],
                      ),

                      ///})
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
                //Get.offNamed('/AboutUs');
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
                'RWA Profile detail',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/RwaDetailProfile'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _rwaProfileDetailController.RwaProfileDetailApi();
                _rwaProfileDetailController.update();
                Get.to(() => RwaDetailProfile());
                Get.offNamed('/RwaDetailProfile');
              },
            ),
            //RwaDetailProfile

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
                'RWA Update Profile',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/RwaProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                // Get.back();

                await _rwaProfileDetailController.RwaProfileDetailApi();
                _rwaProfileDetailController.update();
                _rwaProfileDetailController.onInit();

                _rwaProfileControllerupdate.onInit();
                _rwaProfileControllerupdate.clearSelectedState();

                await Future.delayed(Duration(milliseconds: 1000));

                Get.offAll(() => RwaProfilePage());
                await Future.delayed(Duration(milliseconds: 10));

                //Get.offNamed('/RwaProfilePage');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.bank,
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
                'RWA Update Bank',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/RwaProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                // Get.back();

                // await _rwaProfileDetailController.RwaProfileDetailApi();
                // _rwaProfileDetailController.update();
                // _rwaProfileDetailController.onInit();

                await _getbank.BankDetailCommonApi();
                _getbank.update();
                _getbank.onInit();

                // _rwaProfileControllerupdate.onInit();
                //_rwaProfileControllerupdate.clearSelectedState();

                await Future.delayed(Duration(milliseconds: 1000));

                Get.offAll(() => UpdateBankDetailRwa());

                await Future.delayed(Duration(milliseconds: 10));
                await _getbank.BankDetailCommonApi();

                //Get.offNamed('/RwaProfilePage');
              },
            ),
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
              tileColor: Get.currentRoute == '/RWAComplaintPage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => RWAComplaintPage());
                Get.offNamed('/RWAComplaintPage');
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
              tileColor: Get.currentRoute == '/AboutUsView'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                /// _userAboutusController.update();
                //_userAboutusController.useraboutusApi();
                //_rwaAboutusController.update();
                // _rwaAboutusController.rwaaboutusApi();
                Get.to(() => WebViewPswebsiteabout());
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
                _loginpasswordControllerr4.onInit();
                _loginpasswordControllerr4.emailController.clear();
                _loginpasswordControllerr4.passwordController.clear();
                _loginpasswordControllerr4.toggleCheckbox(false);
                CallLoader.loader();
                await Future.delayed(Duration(seconds: 2));
                CallLoader.hideLoader();
                await SharedPreferences.getInstance()
                    .then((value) => value.clear());
                //Get.back();
                await Get.offAll(() => SignInScreen());
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
