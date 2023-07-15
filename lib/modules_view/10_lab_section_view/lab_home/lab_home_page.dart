import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_drawer_view/drawerpage.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_home/lab_slider.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_payment_history/lab_payment_history.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view_RRR/chemist_Addd_bank_details/bank_add_view.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/modules_view/10_lab_section_view/lab_drawer_view/drawerpage.dart';
// import 'package:ps_welness/modules_view/10_lab_section_view/lab_payment_history/lab_payment_history.dart';

import '../../../controllers/10_lab_controller/lab_appointment_detail_controller/lab_appointment_detailsss.dart';
import '../../../controllers/10_lab_controller/lab_appointment_history_controller/lab_pay_hist_controller.dart';
import '../../../controllers/10_lab_controller/lab_appointment_history_controllerrs/lab_appointments_history_controllers.dart';
import '../../../controllers/10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
import '../../../controllers/10_lab_controller/lab_view_report1_controller/lab_viewreport_controller.dart';
import '../../../controllers/1_user_view_controller/user_appointment_controller/user_appointment_controllers.dart';
import '../lab_appointment_details/lab_appointment_details.dart';
import '../lab_appointment_history_view/appointment_history_view.dart';
import '../lab_report_list/lab_report_list.dart';
import '../lab_upload_report_post/lab_upload_report_post.dart';

//import 'package:ps_welness/modules_view/1_user_section_views/user_drawer/user_drawHomePage({Key? key}) : super(key: key);

AppointmentUserController _appointmentUserController =
    Get.put(AppointmentUserController());
LabpaymenttController _labpaymentController = Get.put(LabpaymenttController());
LabAppointmentDetailController _appointmentDetailController =
    Get.put(LabAppointmentDetailController());
LabAppointmentHistoryyController _labAppointmentHistoryyController =
    Get.put(LabAppointmentHistoryyController());
LabreportviewController _labreportviewController =
    Get.put(LabreportviewController());
LabUploadReportController _labUploadReportController =
    Get.put(LabUploadReportController());

// AppointmentController _appointmentController =
//     Get.put(AppointmentController());
class LabHomePage extends StatelessWidget {
  const LabHomePage({Key? key}) : super(key: key);

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
      'Update Bank Details',

      // 'service 7',
      // 'service 8',
    ];

    final List<String> underprocess = [
      '',
      '',
      '',
      '',
      '',
      '',

      // 'service 7',
      // 'service 8',
    ];

    List<Color> colors = [
      Color(0xff11eae0),
      Color(0xffe68cf7),
      Colors.yellow,
      Colors.lightGreenAccent,
      Colors.lightGreen
    ];

    final List<String> productimage = [
      'lib/assets/image/lab_appointment.png',
      'lib/assets/image/lab_report_upload.png',
      'lib/assets/image/history_payment_lab.png',
      'lib/assets/image/appoinment_his_lab.png',
      'lib/assets/image/lab_report_view.png',
      'lib/assets/icons/drbank.png',
      // 'service 7',
      // 'service 8',
    ];
    return Container(
      decoration: BoxDecoration(
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
                  height: size.height * 0.09,
                  width: size.width * 0.15,
                  child: Image.asset(
                      //'lib/assets/user_assets/12lab.png'
                      'lib/assets/background_stack_png/lab_equi1.png')),
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
                      text: ' LAB',
                      style: GoogleFonts.alatsi(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: MyTheme.containercolor5,
                        //color: Color(0xff023382)
                      ),
                    ),
                  ],
                ),
              ),
              // Text(
              //   'PS WELLNESS',
              //   style: GoogleFonts.alatsi(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 22,
              //   ),
              // ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          //MyTheme.ThemeColors,
          leading: IconButton(
            icon: Icon(
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
        drawer: LabMainDrawer(),
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
                  child: MyLabSlider(),
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
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      ),
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
                              //colors[index],
                              // gradient: LinearGradient(
                              //     begin: Alignment.centerLeft,
                              //     end: Alignment.centerRight,
                              //     colors: [
                              //       Color(0xffffffff),
                              //       Color(0xffffffff)
                              //       //darkPrimary,
                              //     ]),
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
                                      //Get.back();
                                      _appointmentDetailController
                                          .labappointmentdetailApi();
                                      _appointmentDetailController.update();
                                      Get.to(() => LabAppointmentDetail());
                                    } else if (index == 1) {
                                      Get.offAll(() => LabUploadReports());
                                      // _labUploadReportController
                                      //     .getlabpatientApi();
                                      // _labUploadReportController.update();
                                      // _labUploadReportController
                                      //     .getTestNameApi();

                                      //Get.to(() => CatagaryDetails());
                                    } else if (index == 2) {
                                      // Get.back();
                                      _labpaymentController.update();
                                      _labpaymentController.labhistoryApi();
                                      Get.to(() => LabPaymentHistory());
                                    } else if (index == 3) {
                                      _labAppointmentHistoryyController
                                          .update();
                                      _labAppointmentHistoryyController
                                          .labappointmenthistoryApi();
                                      Get.to(() => LabAppointmentHistory());

                                      ///
                                      //Get.to(() => TheJwelleryStore());

                                      //Get.to(() => CarouselDemo());
                                    } else if (index == 4) {
                                      _labreportviewController.update();
                                      _labreportviewController
                                          .labreportviewApi();
                                      Get.to(LabViewReport());
                                    } else if (index == 5) {
                                      Get.to(() => AddBankDetail());
                                    }
                                  },
                                  child: Container(
                                    height: size.height * 0.11,
                                    width: size.width * 0.23,
                                    padding: EdgeInsets.all(7),
                                    child: Image.asset(
                                      productimage[index],
                                      // "lib/assets/image/icons8-hospital-64.png",
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            //color: Color(0xFFBEBEBE),
                                            offset: Offset(03, 03),
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
                                      //Colors.pink.shade100,
                                      borderRadius: BorderRadius.only(
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
                        //   Container(
                        //   alignment: Alignment.center,
                        //   decoration: BoxDecoration(
                        //       color: Colors.amber,
                        //       borderRadius: BorderRadius.circular(15)),
                        //   child: Text(productname[index]),
                        // );
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
    'https://images.unsplash.com/photo-1630959305790-4c956ce6c0b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODB8fGxhYm9yYXRvcnl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1595500381751-d940898d13a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fGxhYm9yYXRvcnl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1666214280391-c9ef08d09da8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MzZ8fGxhYm9yYXRvcnl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1518152006812-edab29b069ac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGxhYm9yYXRvcnl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1666214275172-ccc3b98e5519?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8OHx8bGFib3JhdG9yeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1572884267966-02340ebc90ac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bGFib3JhdG9yeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1666214278812-83371e46279f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bGFib3JhdG9yeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
    // 'https://images.unsplash.com/photo-1612277795421-9bc7706a4a34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjB8blNwa29NdC1DeW98fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    // 'https://images.unsplash.com/photo-1613758947307-f3b8f5d80711?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8blNwa29NdC1DeW98fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    // 'https://images.unsplash.com/photo-1612277795163-49a1a64e8f34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTB8blNwa29NdC1DeW98fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    // 'https://images.unsplash.com/photo-1587556930720-58ec521056a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fG51cnNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    // 'https://images.unsplash.com/photo-1590611936760-eeb9bc598548?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG51cnNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    // 'https://images.unsplash.com/photo-1592671748854-2e0ed15b0441?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bnVyc2V8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',

    // "https://plus.unsplash.com/premium_photo-1661776255948-7a76baa9d7b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80",
    //"https://images.unsplash.com/photo-1601841162542-956af38ba052?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
    //'https://images.unsplash.com/photo-1599493758267-c6c884c7071f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
    //'https://images.unsplash.com/photo-1576765608622-067973a79f53?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1756&q=80',
    //'https://images.unsplash.com/photo-1588543385566-413e13a51a24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    //'https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1791&q=80',
    //'https://images.unsplash.com/photo-1624727828489-a1e03b79bba8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80',
    //"https://images.unsplash.com/photo-1625047509248-ec889cbff17f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    // "https://images.unsplash.com/photo-1607400201515-c2c41c07d307?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    //"https://images.unsplash.com/photo-1621905251918-48416bd8575a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YWMlMjByZXBhaXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    //"https://images.unsplash.com/photo-1604754742629-3e5728249d73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    //"https://images.unsplash.com/photo-1513366884929-f0b3bedfb653?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    //"https://images.unsplash.com/photo-1577801622187-9a1076d049da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    // "https://images.unsplash.com/photo-1615870123253-f3de8aa89e24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXxjVlFHYWlJSTI3OHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
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
