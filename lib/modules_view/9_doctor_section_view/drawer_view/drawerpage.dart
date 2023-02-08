import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view/drawer_view/drower_pages/profile_details_doctor/profile_doctor_detail_page.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/controllers/9_doctor_controllers/doctor_profile_controller.dart';
// import 'package:ps_welness/modules_view/9_doctor_section_view/drawer_view/drower_pages/profile_details_doctor/profile_doctor_detail_page.dart';

//import 'package:ps_welness/modules_view/drawer_view/drower_pages/about_us/about_us.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/complaint_page/complaint_page.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/profile_page_view/profile_view.dart';
//import 'package:ps_welness/modules_view/drawer_view/drower_pages/supports/support_view.dart';

import 'drower_pages/about_us/about_us.dart';
import 'drower_pages/complaint_page/complaint_page.dart';
import 'drower_pages/patient_lists/patient_list.dart';
import 'drower_pages/profile_page_view/doctor_profile_view.dart';
import 'drower_pages/skils_view/add_skils/add_skils_todo.dart';
import 'drower_pages/supports/support_view.dart';

class MainDrawer extends StatelessWidget {
  DoctorProfileControllers _doctorProfileControllers =
      Get.put(DoctorProfileControllers());
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
                    Text(
                      _doctorProfileControllers.doctorProfile!.doctorName
                          .toString(),
                      //'Dr.Vineet Mishra',
                      style: GoogleFonts.roboto(
                          fontSize: size.height * 0.023,
                          fontWeight: FontWeight.w700,
                          color: MyTheme.blueww),
                    ),
                    Text(
                      _doctorProfileControllers.doctorProfile!.emailId
                          .toString()
                      //'mishravineet@gmail.com'
                      ,
                      style: GoogleFonts.roboto(
                          fontSize: size.height * 0.020,
                          fontWeight: FontWeight.w700,
                          color: MyTheme.blueww),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: MyTheme.ThemeColors,
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
                Get.to(() => DoctorDetailProfile());
                Get.offNamed('/DoctorDetailProfile');
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
                Get.to(() => PatientList());
                Get.offNamed('/PatientList');
              },
            ),

            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.add,
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
                'Add Skils',
                style: TextStyle(
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/AddSkilsScreen'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => AddSkilsScreen());
                Get.offNamed('/AddSkilsScreen');
              },
            ),

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
                    fontSize: size.height * 0.017,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.blueww),
              ),
              tileColor: Get.currentRoute == '/DoctorProfilePage'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => DoctorProfilePage());
                Get.offNamed('/DoctorProfilePage');
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
              tileColor: Get.currentRoute == '/ComplaintPageDoctor'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
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
                print(Get.currentRoute);
                Get.back();
                Get.to(() => AboutUsView());
                Get.offNamed('/AboutUsView');
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
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // Get.to(() => AboutUs());
                Get.offNamed('/AboutUs');
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
