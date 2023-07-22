import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_payment_controller/doctor_payment_detail_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_profile_controller.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_upload_report_controller/doctor_upload_report_controllers.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_view_report1_controller/doctor_viewreport_controller.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/doctor_update_bank_details/bank_update_view.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/doctor_upload_report/doctor_upload_report.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/doctor_view_reportt/doctor_view_report.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/drawer_view/drower_pages/patient_lists/patient_list.dart';

import '../../../controllers/9_doctor_controllers_RRR/doctor_home_controller/doctor_home_controllers.dart';
//import '../../2_franchies_section_view/franchies_drawer_view/drower_pages/patient_lists/patient_list.dart';
import '../../../widgets/exit_popup_warning/exit_popup.dart';
import '../doctor_appointment_details/doctor_catagary/doctor_catagary.dart';
import '../drawer_view/drawerpage.dart';
import '../payment_historyy/payment_historiess.dart';
//import 'drower_pages/patient_lists/patient_list.dart';

class DoctorHomePage extends StatelessWidget {
  DoctorHomePage({Key? key}) : super(key: key);
  //DoctorHomepageController _doctorHomepageController =
  //Get.put(DoctorHomepageController());
  DoctorHomepageController _doctorHomepageController =
      Get.put(DoctorHomepageController());
  final DoctorPaymentViewControllers _paymentViewControllers =
      Get.put(DoctorPaymentViewControllers());
  DoctorProfileControllers _doctorProfileControllers =
      Get.put(DoctorProfileControllers());
  DoctorrUploadReportController _doctorrUploadReportController =
      Get.put(DoctorrUploadReportController());

  DoctorreportviewController _doctorreportviewController =
      Get.put(DoctorreportviewController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _key = GlobalKey();

    final List<String> productname = [
      'Appointment Detail',
      'Upload Report',
      'Payment History',
      'Appointment History',
      'Report view',
      'Add Bank',
    ];
    List<Color> colors = [
      Color(0xff11eae0),
      Color(0xffe68cf7),
      Colors.yellow,
      Colors.lightGreenAccent,
      Colors.lightGreen
    ];
    final List<String> productimage = [
      'lib/assets/icons/calendar.png',
      'lib/assets/icons/report3.png',
      'lib/assets/icons/history.png',
      'lib/assets/icons/date.png',
      'lib/assets/icons/report2.png',
      'lib/assets/icons/bank_update.png',
      //'lib/assets/icons/contact33.png',
    ];
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        key: _key,
        backgroundColor: MyTheme.ThemeColors,
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/background_stack_png/doctor234.png',
                height: size.height * 0.03,
                width: size.width * 0.06,
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                'PS WELLNESS',
                style: GoogleFonts.alatsi(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              Text(
                'Doctors',
                style: GoogleFonts.alatsi(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: MyTheme.ThemeColors,
          leading: IconButton(
            icon: const Icon(
              Icons.dehaze_rounded,
              size: 23,
              color: Colors.white,
            ),
            onPressed: () {
              _key.currentState!.openDrawer();
              _doctorProfileControllers.doctorprofileApi();
              _doctorProfileControllers.update();
            },
          ),
        ),
        drawer: MainDrawer(),
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
                  decoration: const BoxDecoration(),
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
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(-1, -1),
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  color: Colors.grey.shade100,
                                ),
                                BoxShadow(
                                  offset: Offset(1, 1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  color: Colors.grey.shade100,
                                ),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.00),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      _doctorHomepageController
                                          .doctorAppoinmentDetail();
                                      _doctorHomepageController.update();
                                      Get.to(() => AppointmentDetails());
                                    } else if (index == 1) {
                                      // _doctorrUploadReportController
                                      // .getdoctorrpatientApi();
                                      //.getlabpatientApi();
                                      // _doctorrUploadReportController.update();

                                      Get.to(DoctorUploadReport());
                                    } else if (index == 2) {
                                      _paymentViewControllers
                                          .doctorPaymentHistoryApi();
                                      _paymentViewControllers.update();
                                      Get.to(() => PaymentHistory());
                                    } else if (index == 3) {
                                      _doctorHomepageController
                                          .doctorAppoinmentHistory();
                                      _doctorHomepageController.update();
                                      // doctorHomepageController
                                      //.doctorAppoinmentHistory();
                                      //doctorHomepageController.update();
                                      //Get.to(() => AppointmentHistory());
                                      Get.to(PatientListDoctor());

                                      ///Todo this is showing dark and white mode
                                    } else if (index == 4) {
                                      _doctorreportviewController
                                          .doctorreportviewApi();
                                      _doctorreportviewController.update();
                                      Get.to(() => DoctorViewssReport());
                                    } else if (index == 5) {
                                      Get.to(() => UpdateDoctorBankDetail());
                                      //Get.to(() => SupportView());
                                    }
                                  },
                                  child: Container(
                                    height: size.height * 0.11,
                                    width: size.width * 0.23,
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0xFFBEBEBE),
                                            offset: Offset(03, 03),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          ),
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(-02, -02),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          ),
                                        ]),
                                    child: Image.asset(productimage[index]),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.014,
                                ),
                                Container(
                                  height: size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: MyTheme.white,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      productname[index],
                                      style: GoogleFonts.abhayaLibre(
                                        fontSize: size.height * 0.018,
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
    );
  }
}

class Mycrusial extends StatelessWidget {
  final _sliderKey = GlobalKey();
  Mycrusial({Key? key}) : super(key: key);
  DoctorHomepageController _doctorHomepageController =
      Get.put(DoctorHomepageController());

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

  @override
  Widget build(BuildContext context) {
    var imgpath = 'http://test.pswellness.in/Images/';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx(
      () => (_doctorHomepageController.isLoading.value)
          ? Center(child: CircularProgressIndicator())
          : _doctorHomepageController.getdoctorbannerlist?.bannerImageList ==
                  null
              ? Center(
                  child: Text('No data'),
                )
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
                          autoSliderTransitionTime: Duration(seconds: 2),
                          slideBuilder: (index) {
                            final items = _doctorHomepageController
                                .getdoctorbannerlist?.bannerImageList;
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
                                              '$imgpath${items?[index].bannerPath}' ??
                                                  ''),
                                          fit: BoxFit.cover,
                                          onError: (error, stackTrace) {
                                            Text("No Image Found");
                                            // .log(error, stackTrace);
                                          })),
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
                          itemCount: _doctorHomepageController
                              .getdoctorbannerlist!.bannerImageList!.length,
                          enableAutoSlider: true,
                        ),
                      ),
                    ),
                  ),
                ),
    ));
  }
}

///...........
///
