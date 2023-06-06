import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_appointment_history_controller/nurse_pay_hist_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_upload_report_controller/nurse_upload_report_controller.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/view_report_nurse_controller/nurse_view_report_controllers.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_drawer_view/drower_pages/supports/support_view.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_appointment_details/nurse_appointment_details.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_appointment_history_view/appointment_history_view.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_drawer_view/drawerpage.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_payment_history/nurse_payment_history.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_report_view/nurse_report_view.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_upload_report/nurse_upload_report.dart';

class NurseHomePage extends StatelessWidget {
  NurseHomePage({Key? key}) : super(key: key);
  NursePaymentHistoryControllerss _nursePaymentHistoryController =
      Get.put(NursePaymentHistoryControllerss());
  NurseUploadReportController _nursdeUploadReportController =
      Get.put(NurseUploadReportController());
  NursereportviewController _nursereportviewController =
      Get.put(NursereportviewController());

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
      'Contact Us',
    ];

    final List<String> underprocess = [
      '',
      '',
      '',
      '',
      '',
      '',
    ];

    List<Color> colors = [
      Color(0xff11eae0),
      Color(0xffe68cf7),
      Colors.yellow,
      Colors.lightGreenAccent,
      Colors.lightGreen
    ];

    final List<String> productimage = [
      'lib/assets/user_assets/appointment_detailsss.png',
      'lib/assets/user_assets/upload_report.png',
      'lib/assets/user_assets/transaction.png',
      'lib/assets/user_assets/apointment_his.png',
      'lib/assets/user_assets/view_reportts.png',
      'lib/assets/icons/contact2.png',
    ];
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            lightPrimary,
            darkPrimary,
          ])),
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              Container(
                  height: size.height * 0.035,
                  width: size.width * 0.09,
                  child: Image.asset('lib/assets/icons/dash_nurse.png')),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'PS WELLNESS',
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        //color: Color(0xff023382)
                      ),
                    ),
                    TextSpan(
                      text: ' NURSE',
                      style: GoogleFonts.alatsi(
                        fontSize: 20,
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
          leading: IconButton(
            icon: const Icon(
              Icons.dehaze_rounded,
              size: 23,
              color: Colors.white,
            ),
            onPressed: () {
              _key.currentState!.openDrawer();
            },
          ),
          // leading: Icon(Icons.read_more_outlined),
        ),
        drawer: NurseMainDrawer(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => NurseeAppointmentDetail());
                                    } else if (index == 1) {
                                      // _nursdeUploadReportController
                                      //.getnursepatientApi();
                                      _nursdeUploadReportController
                                          .postnurseUploadreportApi();
                                      _nursdeUploadReportController.update();
                                      Get.to(() => NurseUploadReport());
                                    } else if (index == 2) {
                                      _nursePaymentHistoryController
                                          .nursePaymentHistoryApi();
                                      _nursePaymentHistoryController.update();
                                      Get.to(() => NursePaymentHistory());
                                    } else if (index == 3) {
                                      Get.to(() => NurseeAppointmentHistory());
                                    } else if (index == 4) {
                                      _nursereportviewController
                                          .nursereportviewApi();
                                      _nursereportviewController.update();
                                      Get.to(NurseReportView());
                                    } else if (index == 5) {
                                      Get.to(() => SupportView());
                                    }
                                  },
                                  child: Container(
                                    height: size.height * 0.11,
                                    width: size.width * 0.23,
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            offset: const Offset(03, 03),
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
                                    child: Image.asset(
                                      productimage[index],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.005,
                                ),
                                Container(
                                  height: size.height * 0.033,
                                  decoration: BoxDecoration(
                                      color:
                                          Color(0xffffffff).withOpacity(0.999),
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
    );
  }
}

class Mycrusial extends StatelessWidget {
  final _sliderKey = GlobalKey();
  Mycrusial({Key? key}) : super(key: key);

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  final List<String> images = [
    'https://images.unsplash.com/photo-1578307986144-d248cb7434db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTF8blNwa29NdC1DeW98fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1612277795421-9bc7706a4a34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjB8blNwa29NdC1DeW98fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1613758947307-f3b8f5d80711?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8blNwa29NdC1DeW98fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1612277795163-49a1a64e8f34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTB8blNwa29NdC1DeW98fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1587556930720-58ec521056a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG51cnNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1590611936760-eeb9bc598548?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG51cnNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1592671748854-2e0ed15b0441?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bnVyc2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  ];
  final bool _isPlaying = true;

  //get _sliderKey => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
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
                //scrollPhysics: NeverScrollableScrollPhysics(),
                key: _sliderKey,
                unlimitedMode: true,
                autoSliderTransitionTime: Duration(seconds: 1),
                //autoSliderDelay: Duration(seconds: 5),
                slideBuilder: (index) {
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
                          border: Border.all(color: Colors.white, width: 3),
                          image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.fill),
                        ),
                        //color: colors[index],
                        // child: Text(
                        //   letters[index],
                        //   style: TextStyle(fontSize: 200, color: Colors.white),
                        // ),
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
                itemCount: images.length,
                enableAutoSlider: true,
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
