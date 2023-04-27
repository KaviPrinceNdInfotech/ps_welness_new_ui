import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ps_welness_new_ui/controllers/map_controllers/map_controller.dart';
import 'package:ps_welness_new_ui/widgets/controller_bindingss.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/nurse_appointment_controller/nurse_booking_1_controller.dart';
//import 'package:ps_welness/widgets/controller_bindingss.dart';

import 'controllers/10_lab_controller/lab_home_controllers/lab_home_controller.dart';
import 'controllers/1_user_view_controller/doctor_sections/doctors_appointment1.dart';
import 'controllers/1_user_view_controller/doctor_sections/get_doctor_list_controller.dart';
import 'controllers/1_user_view_controller/lab_controller/choose_lab_controller/lab_controller.dart';
import 'controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import 'controllers/1_user_view_controller/medicine_controllers/add_delivery_post_controller.dart';
import 'controllers/1_user_view_controller/nurse_appointment_controller/nurse_booking_1_controller.dart';
import 'controllers/1_user_view_controller/user_home_page_controller/user_home_page_controllers.dart';
import 'controllers/2_franchises_controller/franchies_home_page_controller/franchies_home_page_controllers.dart';
import 'controllers/3_driver_view_controllers/driver_home_page_controller/driver_home_page_controllers.dart';
import 'controllers/4_nurse_controller/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
import 'controllers/4_nurse_controller/nurse_home_page_controller/nurse_home_page_controllers.dart';
import 'controllers/5_rwa_controller/rwa_home_page_controller/rwa_home_page_controllers.dart';
import 'controllers/6_chemist_view_controllers/chemist_home_page_controller/chemist_home_page_controllers.dart';
import 'controllers/9_doctor_controllers/skils_controller/skils_controllers.dart';
import 'controllers/complaint_controller/complaint_controller.dart';
import 'controllers/profile_u_controller/profile_update_controller.dart';
import 'modules_view/splash_screen/splash_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // Get.lazyPut(() => AllProductModel());
    //Get.lazyPut(() => GiftcardModel());
    Get.lazyPut(() => NurseBooking1Controller());
    Get.lazyPut(() => Doctor_appointment_1_Controller());
    Get.lazyPut(() => SkillsListController());
    Get.lazyPut(() => LabListController());
    Get.lazyPut(() => MapController());
    Get.lazyPut(() => UserHomepagContreoller());
    Get.lazyPut(() => DoctorListController());
    Get.lazyPut(() => FranchiseHomepagContreoller());
    Get.lazyPut(() => LabHomepagContreoller());
    Get.lazyPut(() => DriverHomepagContreoller());
    Get.lazyPut(() => NurseHomepagContreoller());
    Get.lazyPut(() => RwaHomepagContreoller());
    Get.lazyPut(() => ChemistHomepagContreoller());
    Get.lazyPut(() => ComplaintController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => NurseBooking1Controller());
    Get.lazyPut(() => NurseAppointmentDetailController());
    Get.lazyPut(() => ChooseLabController());
    Get.lazyPut(() => MedicineAddressController());
    //Get.lazyPut(() => GoogleMapController());


    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  ///todo: changes for map 11 jan 2023........
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  ///..........
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,

      // getPages: [
      //   GetPage(name: TodoScreen.id, page: () => TodoScreen()),
      //   GetPage(name: AddSkilsScreen.id, page: () => AddSkilsScreen()),
      // ],
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      //initialRoute: AddSkilsScreen.id,
    );
  }
}
