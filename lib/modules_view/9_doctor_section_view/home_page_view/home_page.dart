import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view/view_patient_report/view_patient_report.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/modules_view/9_doctor_section_view/view_patient_report/view_patient_report.dart';

import '../../../controllers/appointment_history_controller/appointment_history_controllers.dart';
import '../appointment_history_view/appointment_history_view.dart';
import '../doctor_appointment_details/doctor_catagary/doctor_catagary.dart';
import '../drawer_view/drawerpage.dart';
import '../payment_historyy/payment_historiess.dart';
//import '../../controllers/appointment_history_controller/appointment_history_controllers.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  AppointmentController _appointmentController =
      Get.put(AppointmentController());

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
      'lib/assets/icons/calendar.png',
      'lib/assets/icons/report3.png',
      'lib/assets/icons/history.png',
      'lib/assets/icons/date.png',
      'lib/assets/icons/report2.png',
      'lib/assets/icons/contact33.png',
      // 'service 7',
      // 'service 8',
    ];
    return Scaffold(
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
                  vertical: size.height * 0.001, horizontal: size.width * 0.01),
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
                                    Get.to(() => AppointmentDetails());
                                  } else if (index == 1) {
                                    //Get.to(() => AddTechnician());
                                  } else if (index == 2) {
                                    Get.to(() => PaymentHistory());
                                  } else if (index == 3) {
                                    Get.to(() => AppointmentHistory());
                                    // Get.defaultDialog(
                                    //     backgroundColor: MyTheme.ThemeColors,
                                    //     title: '',
                                    //     content: SingleChildScrollView(
                                    //       child: Column(
                                    //         //mainAxisSize: MainAxisSize.min,
                                    //         children: [
                                    //           NeumorphicTextFieldContainer(
                                    //             child: Obx(
                                    //               () => (_appointmentController
                                    //                       .isLoading.value)
                                    //                   ? Center(
                                    //                       child:
                                    //                           CircularProgressIndicator())
                                    //                   : TextFormField(
                                    //                       controller:
                                    //                           _appointmentController
                                    //                               .appointmentController,
                                    //                       onTap: () {
                                    //                         _appointmentController
                                    //                             .chooseDate();
                                    //                       },
                                    //
                                    //                       cursorColor:
                                    //                           Colors.black,
                                    //                       obscureText: false,
                                    //                       decoration:
                                    //                           InputDecoration(
                                    //                         hintText:
                                    //                             'Select date',
                                    //                         helperStyle:
                                    //                             TextStyle(
                                    //                           color: black
                                    //                               .withOpacity(
                                    //                                   0.7),
                                    //                           fontSize: 18,
                                    //                         ),
                                    //                         prefixIcon: Icon(
                                    //                           Icons
                                    //                               .calendar_today_outlined,
                                    //                           color: black
                                    //                               .withOpacity(
                                    //                                   0.7),
                                    //                           size: 20,
                                    //                         ),
                                    //                         border: InputBorder
                                    //                             .none,
                                    //                       ),
                                    //                       keyboardType:
                                    //                           TextInputType
                                    //                               .multiline,
                                    //                       maxLines: 1,
                                    //                       autofocus: true,
                                    //                       //obscureText: true,
                                    //                       //controller: _loginpasswordController.mobileController,
                                    //                     ),
                                    //             ),
                                    //           ),
                                    //
                                    //           // SizedBox(
                                    //           //     height: size.height * 0.05,
                                    //           //     child: TestPickerWidget()),
                                    //           ///..................
                                    //           // Obx(
                                    //           //   () => Text(
                                    //           //     DateFormat("dd-MM-yyyy")
                                    //           //         .format(_appointmentController
                                    //           //             .selectedDate.value)
                                    //           //         .toString(),
                                    //           //     style: TextStyle(fontSize: 25),
                                    //           //   ),
                                    //           // ),
                                    //           // ElevatedButton(
                                    //           //   onPressed: () {
                                    //           //     _appointmentController
                                    //           //         .chooseDate()
                                    //           //         .toString();
                                    //           //   },
                                    //           //   child: Text('Select Date'),
                                    //           // ),
                                    //           SizedBox(
                                    //             height: 30.0,
                                    //           ),
                                    //           ElevatedButton(
                                    //             style: ElevatedButton.styleFrom(
                                    //               foregroundColor:
                                    //                   Colors.yellow,
                                    //               backgroundColor:
                                    //                   Colors.red, // foreground
                                    //             ),
                                    //             onPressed: () {
                                    //               Get.back();
                                    //               Get.to(() =>
                                    //                   AppointmentHistory());
                                    //               // todoController.todos.add(
                                    //               //   Todo(
                                    //               //     text: textEditingController.text,
                                    //               //   ),
                                    //               // );
                                    //               //Get.back();
                                    //             },
                                    //             child: Text(
                                    //               'Appointment History',
                                    //               style: TextStyle(
                                    //                   color: Colors.white,
                                    //                   fontSize: 16.0),
                                    //             ),
                                    //             //color: Colors.redAccent,
                                    //           )
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     radius: 10.0);
                                    // whatsAppOpen();
                                    // _launchWhatsapp();

                                    //Get.to(() => ComplainList());

                                    ///Todo this is showing dark and white mode
                                    ///
                                    //Get.to(() => TheJwelleryStore());

                                    //Get.to(() => CarouselDemo());
                                  } else if (index == 4) {
                                    Get.to(() => ViewPatientReport());
                                    //Get.defaultDialog(
                                    //barrierDismissible: true,

                                  } else if (index == 5) {
                                    // Get.defaultDialog(
                                    //     barrierDismissible: true,
                                    //     backgroundColor: MyTheme.t1containercolor,
                                    //     title: '',
                                    //     content: Column(
                                    //       mainAxisSize: MainAxisSize.min,
                                    //       children: [
                                    //         Directionality(
                                    //           textDirection: TextDirection.ltr,
                                    //           child: Center(
                                    //             child: Padding(
                                    //               padding:
                                    //                   const EdgeInsets.all(0.0),
                                    //               child: TextFormField(
                                    //                 decoration: InputDecoration(
                                    //                   filled: true,
                                    //
                                    //                   fillColor: MyTheme
                                    //                       .t1bacgroundcolors1,
                                    //                   hintText:
                                    //                       'Enter Service Name',
                                    //                   contentPadding:
                                    //                       const EdgeInsets.only(
                                    //                           left: 14.0,
                                    //                           bottom: 4.0,
                                    //                           top: 16.0),
                                    //                   focusedBorder:
                                    //                       OutlineInputBorder(
                                    //                     borderSide: new BorderSide(
                                    //                         color: Colors.green),
                                    //                     borderRadius:
                                    //                         new BorderRadius
                                    //                             .circular(10),
                                    //                   ),
                                    //                   enabledBorder:
                                    //                       UnderlineInputBorder(
                                    //                     borderSide: new BorderSide(
                                    //                         color:
                                    //                             Colors.transparent),
                                    //                     borderRadius:
                                    //                         new BorderRadius
                                    //                             .circular(10.0),
                                    //                   ),
                                    //                   //focusedBorder: InputBorder.none,
                                    //                   //enabledBorder: InputBorder.none,
                                    //                   // errorBorder: InputBorder.none,
                                    //                   // border: InputBorder.none,
                                    //
                                    //                   border: OutlineInputBorder(
                                    //                     borderSide: BorderSide(
                                    //                         color: Colors.red,
                                    //                         width: 2.0),
                                    //                     borderRadius:
                                    //                         BorderRadius.circular(
                                    //                             10),
                                    //                   ),
                                    //                   // labelText: "Password",
                                    //                   prefixIcon: Padding(
                                    //                     padding:
                                    //                         EdgeInsets.symmetric(
                                    //                             vertical:
                                    //                                 size.height *
                                    //                                     0.012,
                                    //                             horizontal:
                                    //                                 size.width *
                                    //                                     0.02),
                                    //                     child: Image.asset(
                                    //                       'lib/assets/images/profile.png',
                                    //                       color:
                                    //                           MyTheme.t1Iconcolor,
                                    //                       height: 10,
                                    //                       width: 10,
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //                 keyboardType: TextInputType
                                    //                     .visiblePassword,
                                    //                 //obscureText: true,
                                    //                 // controller:
                                    //                 // _registerComplainController.nameController,
                                    //                 // onSaved: (value) {
                                    //                 //   _registerComplainController.name = value!;
                                    //                 // },
                                    //                 // validator: (value) {
                                    //                 //   return _registerComplainController
                                    //                 //       .validateName(value!);
                                    //                 // },
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //         // TextField(
                                    //         //   //controller: settingsScreenController.categoryNameController,
                                    //         //   keyboardType: TextInputType.text,
                                    //         //   maxLines: 1,
                                    //         //   decoration: InputDecoration(
                                    //         //       labelText: 'Service name',
                                    //         //       hintMaxLines: 1,
                                    //         //       border: OutlineInputBorder(
                                    //         //           borderSide: BorderSide(
                                    //         //               color: Colors.green,
                                    //         //               width: 4.0))),
                                    //         // ),
                                    //         SizedBox(
                                    //           height: 30.0,
                                    //         ),
                                    //         PhysicalModel(
                                    //           color: Colors.white,
                                    //           shadowColor: Colors.grey,
                                    //           elevation: 4,
                                    //           borderRadius:
                                    //               BorderRadius.circular(10),
                                    //           child: Padding(
                                    //             padding: const EdgeInsets.all(3.0),
                                    //             child: Container(
                                    //               height: size.height * 0.04,
                                    //               width: size.width * 0.4,
                                    //               decoration: BoxDecoration(
                                    //                 color: MyTheme.t1Iconcolor,
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(10),
                                    //               ),
                                    //               child: Center(
                                    //                 child: Text(
                                    //                   'ADD SERVICE',
                                    //                   style: TextStyle(
                                    //                       color: Colors.white,
                                    //                       fontSize: 14.0,
                                    //                       fontWeight:
                                    //                           FontWeight.w600),
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     radius: 10.0);
                                    ///
                                    //Get.to(() => ServicesPage());
                                  } else if (index == 6) {
                                    //Get.to(() => MyHolidayPage());
                                  } else if (index == 7) {
                                    //Get.to(() => TermsMemberPage());
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
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        const BoxShadow(
                                          color: Color(0xFFBEBEBE),
                                          offset: Offset(03, 03),
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                        ),
                                        const BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-02, -02),
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.014,
                              ),
                              Container(
                                height: size.height * 0.04,
                                decoration: BoxDecoration(
                                  color: MyTheme.white,
                                  borderRadius: BorderRadius.only(
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
    'https://images.unsplash.com/photo-1601055283742-8b27e81b5553?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1601841162542-956af38ba052?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    'https://images.unsplash.com/photo-1609188076864-c35269136b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8OTczNDcyN3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://plus.unsplash.com/premium_photo-1661281397737-9b5d75b52beb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGRvY3RvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1618498082410-b4aa22193b38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    'https://images.unsplash.com/photo-1579684288361-5c1a2957a700?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1602074882160-e84cb0959e94?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80',

    //"https://plus.unsplash.com/premium_photo-1661776255948-7a76baa9d7b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80",
    //"https://images.unsplash.com/photo-1601841162542-956af38ba052?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
    //'https://images.unsplash.com/photo-1599493758267-c6c884c7071f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
    // 'https://images.unsplash.com/photo-1576765608622-067973a79f53?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1756&q=80',
    //'https://images.unsplash.com/photo-1588543385566-413e13a51a24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    // 'https://images.unsplash.com/photo-1631217868264-e5b90bb7e133?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1791&q=80',
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
