import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/drawer_contoller/nurse_history_controller/nurse_history_controllerss.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/notiification_view_page/notification_message2.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/drawer_pages_user/about_us_user/about_us.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/drawer_pages_user/complaint_page_user/complaint_page.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/drawer_pages_user/doctor_history/doctor_history_user.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/drawer_pages_user/user_profile_details/profile_user_detail_page.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/user_drawer/reports_section/report_section_list.dart';
import 'package:ps_welness_new_ui/modules_view/change_password_view/change_password_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/my_theme.dart';
import '../../../controllers/1_user_view_controller/ambulance/driver_accept_list_controller.dart';
import '../../../controllers/1_user_view_controller/drawer_contoller/doctor_history_section/doctor_history_controller.dart';
import '../../../controllers/1_user_view_controller/drawer_contoller/lab_history_controller/lab_history_controllers.dart';
import '../../../controllers/1_user_view_controller/user_profile_controller/user_profile_controllerss.dart';
import '../../../controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
import '../../../utils/services/account_service.dart';
import '../../../widgets/circular_loader.dart';
import '../../3_driver_section_view_RRR/driver_drawer_view/driver_drower_pages/supports/support_view.dart';
import '../../sign_in/sigin_screen.dart';
import 'drawer_pages_user/lab_appointment_history/lab_history.dart';
import 'drawer_pages_user/medicine_history/medicine_history_page.dart';
import 'drawer_pages_user/nurse_history/nurse_history_page.dart';
import 'drawer_pages_user/privecy_policy_page/privacy_policy.dart';
import 'drawer_pages_user/profile_page_view/profile_view.dart';
import 'drawer_pages_user/walet_user/wallet_user.dart';

class UserMainDrawer extends StatefulWidget {
  @override
  State<UserMainDrawer> createState() => _UserMainDrawerState();
}

class _UserMainDrawerState extends State<UserMainDrawer> {
  @override
  Widget build(BuildContext context) {
    ///use media query to provide the main.......
    Size size = MediaQuery.of(context).size;
    DoctorHistoryController _doctorHistoryController =
        Get.put(DoctorHistoryController());
    UserProfileControllers _userprofile = Get.put(UserProfileControllers());
    LabHistoryController _labHistoryController =
        Get.put(LabHistoryController());
    NurseHistoryController _nurseHistoryController =
        Get.put(NurseHistoryController());
    DriverAcceptlistController _driverAcceptlistController =
        Get.put(DriverAcceptlistController());
    Wallet_2_Controller _wallet_2_controller = Get.put(Wallet_2_Controller());

    ///

    return SafeArea(
      child: Drawer(
        backgroundColor: MyTheme.ContainerUnSelectedColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.04),
              decoration: BoxDecoration(
                color: MyTheme.ThemeColors,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: size.width * 0.065,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(size.height * 0.0),
                        child: Image.asset(
                          'lib/assets/image/ps_welness2.png',
                          height: size.height * 0.04,
                        ),
                      )),
                    ),
                    SizedBox(
                      height: size.height * 0.0,
                    ),
                    Text(
                      "${_userprofile.userProfile?.patientName.toString()}"
                      //'Kumar Prince',
                      ,
                      style: GoogleFonts.roboto(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w700,
                          color: MyTheme.blueww),
                    ),
                    Text(
                      "${_userprofile.userProfile?.emailId.toString()}"

                      //'prince@gmail.com',
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
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/UserHomePage'
                  ? Colors.grey[00]
                  : Colors.transparent,
              onTap: () async {
                // await Future.delayed(Duration(milliseconds: 200));
                _driverAcceptlistController.driveracceptuserDetailApi();
                _driverAcceptlistController.update();
                accountService.getAccountData.then((accountData) {
                  // CallLoader.loader();
                  // nearlistdriverApi();

                  Timer(
                    const Duration(microseconds: 300),
                    () {
                      // nearlistdriverApi();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageScreen2(
                                    id: "12345678",
                                  )));
                      // Get.to(MessageScreen(
                      //   id: message.data['id'],
                      // ));
                      //Get.to((MapView));
                      //postAmbulancerequestApi(markers);

                      ///
                    },
                  );
                  CallLoader.hideLoader();
                });
                //Get.back();
                // _driverAcceptlistController.driveracceptuserDetailApi();
                // _driverAcceptlistController.update();
                // Get.to(() => MessageScreen2(
                //       id: '12345678',
                //     ));
                //Get.to(() => UserHomePage());
                //Get.offNamed('/UserHomePage');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.wallet,
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
                'Wallet',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/WolletUser'
                  ? Colors.grey[00]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _wallet_2_controller.walletListssApi();
                _wallet_2_controller.update();
                accountService.getAccountData.then((accountData) {
                  // CallLoader.loader();
                  // nearlistdriverApi();

                  Timer(
                    const Duration(microseconds: 200),
                    () {
                      Get.to(() => WolletUser());

                      // nearlistdriverApi();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => WolletUser()));
                      // Get.to(MessageScreen(
                      //   id: message.data['id'],
                      // ));
                      //Get.to((MapView));
                      //postAmbulancerequestApi(markers);

                      ///
                    },
                  );
                  CallLoader.hideLoader();
                });
                // Get.offNamed('/WolletUser');
              },
            ),
            //UserDetailProfile

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
                'Update Profile',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/ProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => ProfilePage());
                Get.offNamed('/ProfilePage');
              },
            ),

            ///BANK
            // ListTile(
            //   // horizontalTitleGap: 10,
            //   leading: Icon(
            //     Icons.food_bank,
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
            //     'Update Bank',
            //     style: TextStyle(
            //         fontSize: size.height * 0.017,
            //         fontWeight: FontWeight.w600,
            //         color: MyTheme.blueww),
            //   ),
            //   tileColor: Get.currentRoute == '/UpdateBankSeperateDetail'
            //       ? Colors.grey[300]
            //       : Colors.transparent,
            //   onTap: () {
            //     print(Get.currentRoute);
            //     Get.back();
            //     Get.to(() => UpdateBankSeperateDetail());
            //     Get.offNamed('/UpdateBankSeperateDetail');
            //   },
            // ),
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.history,
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
                'Doctor Appointment History',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/DoctorHistoryUser'
                  ? Colors.grey[00]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _doctorHistoryController.update();
                _doctorHistoryController.doctorListHospitalApi();
                Get.to(() => DoctorHistoryUser());
                Get.offNamed('/DoctorHistoryUser');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.bookMedical,
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
                'Medicine History',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/MedicinrHistoryUser'
                  ? Colors.grey[00]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => MedicinrHistoryUser());
                Get.offNamed('/MedicinrHistoryUser');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.kitMedical,
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
                'Lab Appointment History',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/LabHistoryUser'
                  ? Colors.grey[00]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _labHistoryController.update();
                _labHistoryController.labHistorybyUserId();
                Get.to(() => LabHistoryUser());
                Get.offNamed('/LabHistoryUser');
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
                'Profile Detail',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/ProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                // print(Get.currentRoute);
                Get.back();
                _userprofile.update();
                _userprofile.userprofileApi();
                //UserDetailProfile
                Get.to(() => UserDetailProfile());
                //Get.offNamed('/ProfilePage');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.userNurse,
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
                'Nurse Appointment History',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/NurseHistoryUser'
                  ? Colors.grey[00]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _nurseHistoryController.nursehistoryApi();
                _nurseHistoryController.update();
                Get.to(() => NurseHistoryUser());
                Get.offNamed('/NurseHistoryUser');
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
                'My Report',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/ReportList'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => ReportList());
                Get.offNamed('/ReportList');
              },
            ),

            ///add skils............ with backend

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
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/ComplaintPageUser'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => const ComplaintPageUser());
                Get.offNamed('/ComplaintPageUser');
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
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/UserAboutUsView'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => UserAboutUsView());
                Get.offNamed('/UserAboutUsView');
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
              tileColor: Get.currentRoute == '/PrivacyPolicyView'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                Get.back();
                Get.to(() => PrivacyPolicyView());
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
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/SupportView'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => SupportView());
                Get.offNamed('/SupportView');
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
              leading: Icon(
                Icons.delete_forever_outlined,
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
                'Delete Account',
                style: TextStyle(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              onTap: () {
                Get.defaultDialog(
                  title: "Welcome To PS Wellness",
                  middleText: "You content goes here...",
                  content: getContent(),
                  barrierDismissible: true,
                  radius: 20.0,
                  confirm: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: confirmBtn(),
                  ),
                  cancel: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: cancelBtn(),
                  ),
                );

                //Get.to(() => CupponsPage());
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Wollet()));
              }, //PersonalDetails
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
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/AboutUs'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                ///....logout
                SharedPreferences.getInstance().then((value) => value.clear());
                //Get.back();
                Get.to(() => SignInScreen());
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

  Widget confirmBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        child: Text("Confirm"));
  }

  Widget cancelBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        child: Text("Cancel"));
  }

  Widget getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "If Yow want to remove your account,",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "Then you please click confirm button",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "Your data will erase if you press confirm.",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "If you don't want to delete press cancel",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
      ],
    );
  }
}
