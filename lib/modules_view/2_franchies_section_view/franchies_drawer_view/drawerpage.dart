import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/drawer_page_franchies_controller/franchies_profile_franchies.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesProfileDetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/franchise_share_link_franchise/franchise_share_link.dart';
import 'package:ps_welness_new_ui/modules_view/change_password_view/change_password_view.dart';
import 'package:ps_welness_new_ui/modules_view/comman_appi/get_all_bank_detail/get_bank_detail_controller.dart';
//import 'package:ps_welness_new_ui/modules_view/3_driver_section_view_RRR/driver_drawer_view/driver_drower_pages/supports/support_view.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/widgets/widgets/web_view_aboutus.dart';
import 'package:ps_welness_new_ui/widgets/widgets/web_view_privecy_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../../3_driver_section_view_RRR/driver_drawer_view/driver_drower_pages/supports/support_view.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/about_franchies/about_franchies.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/complaint_page/complaint_page.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/profile_details_franchies/profile_franchies_detail_page.dart';
//import 'package:ps_welness/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/profile_page_view/franchiese_profile.dart';
//import 'package:ps_welness/modules_view/forget_password_view/forget_password_view.dart';

import '../../../widgets/circular_loader.dart';
import '../../../widgets/support_page_comman/support_comman_page.dart';
import 'drower_pages/bank_update_seperate_franchise/bank_update_saperate_franchise.dart';
import 'drower_pages/complaint_page/complaint_page.dart';
import 'drower_pages/profile_details_franchies/profile_franchies_detail_page.dart';
import 'drower_pages/profile_page_view/franchiese_profile.dart';

class FranchiesisMainDrawer extends StatelessWidget {
  LoginpasswordController _loginpasswordControllerr1 = Get.find();

  FrenchiesProfileDetailController _frenchiesProfileDetailController =
      Get.put(FrenchiesProfileDetailController());

  DraweerFranchiesProfileController _draweerFranchiesProfileController =
      Get.put(DraweerFranchiesProfileController());

  BankDetailController _getbank = Get.put(BankDetailController());

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
                      height: size.height * 0.01,
                    ),
                    Obx(
                      () => (_frenchiesProfileDetailController.isLoading.value)
                          ? SizedBox(
                              height: size.height * 0.03,
                              child: CircularProgressIndicator(
                                  //value: 2,
                                  ))
                          : Text(
                              "${_frenchiesProfileDetailController.getfrenchiesProfileDetailModel?.companyName.toString()}"
                                  .toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w700,
                                  color: MyTheme.blueww),
                            ),
                    ),
                    Obx(
                      () => (_frenchiesProfileDetailController.isLoading.value)
                          ? SizedBox(
                              height: size.height * 0.03,
                              child: CircularProgressIndicator(
                                  //value: 2,
                                  ))
                          : Text(
                              "${_frenchiesProfileDetailController.getfrenchiesProfileDetailModel?.emailId.toString()}"

                                  // _doctorProfileControllers.doctorProfile!.emailId
                                  .toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: size.height * 0.016,
                                  fontWeight: FontWeight.w700,
                                  color: MyTheme.blueww),
                            ),
                    ),
                    // Text(
                    //   'Ps Franchises',
                    //   style: GoogleFonts.roboto(
                    //       fontSize: size.height * 0.023,
                    //       fontWeight: FontWeight.w700,
                    //       color: MyTheme.blueww),
                    // ),
                    // Text(
                    //   '',
                    //   style: GoogleFonts.roboto(
                    //       fontSize: size.height * 0.020,
                    //       fontWeight: FontWeight.w700,
                    //       color: MyTheme.blueww),
                    // ),
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
                Get.offNamed('/AboutUs');
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
                'Franchises Profile',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/FranchiessProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _frenchiesProfileDetailController.frenchiesProfileDetailApi();
                _frenchiesProfileDetailController.update();
                Get.to(() => FranchiesDetailProfile());
                //Get.offNamed('/FranchiessProfilePage');
              },
            ),
            ListTile(
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
                'Franchises edit Profile',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/FranchiessProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                //  Get.back();
                _frenchiesProfileDetailController.frenchiesProfileDetailApi();
                _frenchiesProfileDetailController.update();
                _frenchiesProfileDetailController.onInit();
                _draweerFranchiesProfileController.onInit();
                // _frenchiesProfileDetailController.
                _draweerFranchiesProfileController.clearSelectedState();

                /// _draweerFranchiesProfileController.refresh();
                // _draweerFranchiesProfileController.update();

                await Future.delayed(Duration(milliseconds: 1000));

                await Get.offAll(() => FranchiessProfilePage());
                await Future.delayed(Duration(milliseconds: 10));

                await _frenchiesProfileDetailController
                    .frenchiesProfileDetailApi();

                //Get.offNamed('/FranchiessProfilePage');
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
              tileColor: Get.currentRoute == '/UpdateBankChemistSeperateDetail'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                Get.back();

                await _getbank.BankDetailCommonApi();
                _getbank.update();
                _getbank.onInit();
                // _frenchiesProfileDetailController.

                /// _draweerFranchiesProfileController.refresh();
                // _draweerFranchiesProfileController.update();

                await Future.delayed(Duration(milliseconds: 1000));

                await Get.offAll(() => UpdateBankFranchiseSeperateDetail());
                await Future.delayed(Duration(milliseconds: 10));

                await _getbank.BankDetailCommonApi();

                //Get.to(() => UpdateBankFranchiseSeperateDetail());
                //Get.offNamed('/UpdateBankChemistSeperateDetail');
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
              tileColor: Get.currentRoute == '/ComplaintPageFranchies'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => ComplaintPageFranchies());
                Get.offNamed('/ComplaintPageFranchies');
              },
            ),
            //AboutFranchiseeView

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
                //UserAboutUsView
                Get.to(() => WebViewPswebsiteabout());

                ///franchise about us...
                // Get.to(() => AboutFranchiseeView());
                // Get.offNamed('/AboutUsView');
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
              onTap: () async {
                Get.back();
                await _frenchiesProfileDetailController
                    .frenchiesProfileDetailApi();
                _frenchiesProfileDetailController.update();
                //Get.to(() => ShareData());
                await Get.to(() => SharelinkFranchiseweight());
                //harelinkweight());
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
                _loginpasswordControllerr1.onInit();
                CallLoader.loader();
                await Future.delayed(Duration(seconds: 2));
                CallLoader.hideLoader();
                await SharedPreferences.getInstance()
                    .then((value) => value.clear());
                //Get.back();
                await Get.offAll(() => SignInScreen());
                //Get.back();
                // Get.to(() => AboutUs());
                //Get.offNamed('/AboutUs');
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
