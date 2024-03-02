import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/user_about_us/user_about_us_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/about_us_doctor_controller/doctor_about_us_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_update_profile/doctor_updateprofile_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/skils_controller/skils_controllers.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/bank_update_seperate_chemist/bank_update_saperate_chemist.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/drawer_view/drower_pages/complaint_page/complaint_page.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/drawer_view/drower_pages/profile_details_doctor/profile_doctor_detail_page.dart';
import 'package:ps_welness_new_ui/modules_view/change_password_view/change_password_view.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/sign_in/sigin_screen.dart';
import 'package:ps_welness_new_ui/widgets/share_your_link/share_link_pagee.dart';
import 'package:ps_welness_new_ui/widgets/widgets/web_view_aboutus.dart';
import 'package:ps_welness_new_ui/widgets/widgets/web_view_privecy_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'drower_pages/complaint_page/complaint_page.dart';
import '../../../widgets/support_page_comman/support_comman_page.dart';
import 'drower_pages/patient_lists/patient_list.dart';
import 'drower_pages/profile_page_view/doctor_profile_view.dart';
import 'drower_pages/skils_view/add_skils/add_skils_todo.dart';

class MainDrawer extends StatelessWidget {
  DoctorProfileControllers _doctorProfileControllers =
      Get.put(DoctorProfileControllers());
  DoctorAboutusController _doctorAboutusController =
      Get.put(DoctorAboutusController());
  UserAboutusController _userAboutusController =
      Get.put(UserAboutusController());
  SkillsListController _skillsListController = Get.put(SkillsListController());
  LoginpasswordController _loginpasswordControllerr6 = Get.find();
  DoctorUpdateProfileController _doctorUpdateProfileController =
      Get.put(DoctorUpdateProfileController());

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
                    height: size.height * 0.003,
                  ),
                  Text(
                    "${_doctorProfileControllers.doctorProfile?.doctorName.toString()}"
                        .toString(),
                    style: GoogleFonts.roboto(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w700,
                        color: MyTheme.blueww),
                  ),
                  Text(
                    "${_doctorProfileControllers.doctorProfile?.emailId.toString()}"

                        // _doctorProfileControllers.doctorProfile!.emailId
                        .toString(),
                    style: GoogleFonts.roboto(
                        fontSize: size.height * 0.016,
                        fontWeight: FontWeight.w700,
                        color: MyTheme.blueww),
                  ),
                ],
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
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
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
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Profile',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/DoctorDetailProfile'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _doctorProfileControllers.doctorprofileApi();
                _doctorProfileControllers.update();
                //_doctorProfileControllers.onInit();

                Get.to(() => DoctorDetailProfile());
                // Get.offNamed('/DoctorDetailProfile');
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
                'List',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/PatientList'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => PatientListDoctor());
                Get.offNamed('/PatientList');
              },
            ),
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.dashcube,
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
                'View Skils',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/SkillsListScreen'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _skillsListController.skillsListApi();
                _skillsListController.update();
                Get.to(() => SkillsListScreen());
                Get.offNamed('/SkillsListScreen');
              },
            ),

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
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            //   title: Text(
            //     'Add Skils',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017,
            //         fontWeight: FontWeight.w600,
            //         color: MyTheme.blueww),
            //   ),
            //   tileColor: Get.currentRoute == '/AddSkillsPageDoctor'
            //       ? Colors.grey[300]
            //       : Colors.transparent,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     Get.to(() => AddSkillsPageDoctor());
            //
            //     Get.offNamed('/AddSkillsPageDoctor');
            //   },
            // ),
            ///
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
                'Update Profile',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/DoctorProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                //Get.back();
                _doctorProfileControllers.doctorprofileApi();
                _doctorProfileControllers.onInit();
                _doctorProfileControllers.update();
                // _doctorProfileControllers.doctorProfile?.stateMasterId = '';
                _doctorUpdateProfileController.onInit();
                // _doctorUpdateProfileController.selectedState.value = null;
                //_doctorUpdateProfileController.selectedCity.value = null;

                _doctorUpdateProfileController.clearSelectedState();
                // _doctorUpdateProfileController.dispose();

                // _doctorUpdateProfileController.onClose();
                // _doctorUpdateProfileController.isClosed;

                //_doctorUpdateProfileController.getStateApi();
                await Future.delayed(Duration(seconds: 0));

                await Get.offAll(() => DoctorUpdateProfilePage());
                // Get.offNamed('/DoctorProfilePage');
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
              tileColor: Get.currentRoute == '/ComplaintPageDoctor'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                Get.back();
                Get.to(() => ComplaintPageDoctor());
                Get.offNamed('/ComplaintPageDoctor');
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
                'About us',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/AboutUsView'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                Get.back();

                ///_userAboutusController.update();
                /// _userAboutusController.useraboutusApi();
                //_doctorAboutusController.update();
                //_doctorAboutusController.doctoraboutusApi();
                // Get.to(() => AboutUsView());
                Get.to(() => WebViewPswebsiteabout());

                ///UserAboutUsView());
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
                _loginpasswordControllerr6.onInit();
                CallLoader.loader();
                await Future.delayed(Duration(seconds: 2));
                CallLoader.hideLoader();
                await SharedPreferences.getInstance()
                    .then((value) => value.clear());
                //Get.back();
                await Get.offAll(() => SignInScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
