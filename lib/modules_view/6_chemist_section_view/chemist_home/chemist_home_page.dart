import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_payment_history/chemist_payment_history.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_payout_history/chemist_payout_histories.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_update_bank_details/bank_update_view.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_payment_history/chemist_payment_history.dart';
// import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_payout_history/chemist_payout_histories.dart';
// import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_update_bank_details/bank_update_view.dart';

import '../../../controllers/1_user_view_controller/user_appointment_controller/user_appointment_controllers.dart';
//import '../../10_lab_section_view/lab_drawer_view/drower_pages/supports/support_view.dart';
import '../../10_lab_section_view/lab_drawer_view/drower_pages/supports/support_view.dart';
import '../chemist_appointment_history_view/chemist_order_history.dart';
import '../chemist_drawer_view/drawerpage.dart';
import '../chemist_profile_page_view/profile_view.dart';
import 'chemist_slider.dart';
//import 'drower_pages/supports/support_view.dart';
//import '../lab_appointment_details/lab_appointment_details.dart';
//import '../lab_appointment_history_view/appointment_history_view.dart';

//import 'package:ps_welness/modules_view/1_user_section_views/user_drawer/user_drawHomePage({Key? key}) : super(key: key);

AppointmentUserController _appointmentUserController =
    Get.put(AppointmentUserController());

// AppointmentController _appointmentController =
//     Get.put(AppointmentController());
class ChemistHomePage extends StatelessWidget {
  const ChemistHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _key = GlobalKey();

    final List<String> productname = [
      'Manage Profile',
      'Update Bank Details',
      'Order History',
      'My Payment History',
      'My Payout history',
      'Contact Us'

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
      'lib/assets/icons/profile_chemiist.png',
      'lib/assets/icons/bank_update.png',
      'lib/assets/icons/order_history3.png',
      'lib/assets/icons/paymenthisd.png',
      'lib/assets/icons/payout.png',
      'lib/assets/icons/contact1.png',
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
                  height: size.height * 0.045,
                  width: size.width * 0.11,
                  child: Image.asset(
                      //'lib/assets/user_assets/12lab.png'
                      'lib/assets/icons/chemist22.png')),
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
                      text: ' CHEMIST',
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
        drawer: ChemistMainDrawer(),
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
                  child: ChemistSlider(),
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
                                      Get.to(() => ChemistProfilePage());
                                    } else if (index == 1) {
                                      Get.to(() => UpdateBankDetail());
                                      //Get.to(() => DoctorAddress());
                                      //Get.to(() => CatagaryDetails());
                                    } else if (index == 2) {
                                      Get.to(() => ChemistOrderHistory());
                                      //Get.to(() => NursePaymentHistory());
                                      // Get.defaultDialog(
                                      //     backgroundColor: MyTheme.ThemeColors,
                                      //     title: 'Select ambulance Type',
                                      //     content: SingleChildScrollView(
                                      //       child: Column(
                                      //         //mainAxisSize: MainAxisSize.min,
                                      //         children: [
                                      //           InkWell(
                                      //             child:
                                      //                 NeumorphicTextFieldContainer(
                                      //               child: Container(
                                      //                   height:
                                      //                       size.height * 0.05,
                                      //                   width: size.width,
                                      //                   decoration:
                                      //                       BoxDecoration(
                                      //                     color: Colors.white70,
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(10),
                                      //                   ),
                                      //                   child: Center(
                                      //                     child: Text(
                                      //                       'Regular',
                                      //                       style: TextStyle(
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .w500,
                                      //                         fontSize:
                                      //                             size.height *
                                      //                                 0.02,
                                      //                       ),
                                      //                     ),
                                      //                   )
                                      //                   // ElevatedButton(
                                      //                   //   onPressed: () {},
                                      //                   //   child: Text(
                                      //                   //     'Select Date',
                                      //                   //     style: TextStyle(
                                      //                   //       color: Colors.black,
                                      //                   //     ),
                                      //                   //   ),
                                      //                   //   style: ButtonStyle(
                                      //                   //     backgroundColor:
                                      //                   //         MaterialStateProperty
                                      //                   //             .all(Colors
                                      //                   //                 .white70),
                                      //                   //     padding:
                                      //                   //         MaterialStateProperty
                                      //                   //             .all(EdgeInsets
                                      //                   //                 .all(50)),
                                      //                   //     textStyle:
                                      //                   //         MaterialStateProperty
                                      //                   //             .all(TextStyle(
                                      //                   //                 fontSize:
                                      //                   //                     30,
                                      //                   //                 color: Colors
                                      //                   //                     .black)),
                                      //                   //   ),
                                      //                   // ),
                                      //                   // TextFormField(
                                      //                   //   controller:
                                      //                   //       _appointmentUserController
                                      //                   //           .appointmentController,
                                      //                   //   onTap: () {
                                      //                   //     _appointmentUserController
                                      //                   //         .chooseDate();
                                      //                   //   },
                                      //                   //
                                      //                   //   cursorColor: Colors.black,
                                      //                   //   obscureText: false,
                                      //                   //   decoration: InputDecoration(
                                      //                   //     hintText: 'Select date',
                                      //                   //     helperStyle: TextStyle(
                                      //                   //       color: black
                                      //                   //           .withOpacity(0.7),
                                      //                   //       fontSize: 18,
                                      //                   //     ),
                                      //                   //     prefixIcon: Icon(
                                      //                   //       Icons
                                      //                   //           .calendar_today_outlined,
                                      //                   //       color: black
                                      //                   //           .withOpacity(0.7),
                                      //                   //       size: 20,
                                      //                   //     ),
                                      //                   //     border: InputBorder.none,
                                      //                   //   ),
                                      //                   //   keyboardType:
                                      //                   //       TextInputType.multiline,
                                      //                   //   maxLines: 1,
                                      //                   //   autofocus: true,
                                      //                   //   //obscureText: true,
                                      //                   //   //controller: _loginpasswordController.mobileController,
                                      //                   // ),
                                      //                   ),
                                      //             ),
                                      //           ),
                                      //           InkWell(
                                      //             child:
                                      //                 NeumorphicTextFieldContainer(
                                      //               child: Container(
                                      //                   height:
                                      //                       size.height * 0.05,
                                      //                   width: size.width,
                                      //                   decoration:
                                      //                       BoxDecoration(
                                      //                     color: Colors.white70,
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(10),
                                      //                   ),
                                      //                   child: Center(
                                      //                     child: Text(
                                      //                       'Road Accident',
                                      //                       style: TextStyle(
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .w500,
                                      //                         fontSize:
                                      //                             size.height *
                                      //                                 0.02,
                                      //                       ),
                                      //                     ),
                                      //                   )
                                      //                   // ElevatedButton(
                                      //                   //   onPressed: () {},
                                      //                   //   child: Text(
                                      //                   //     'Select Date',
                                      //                   //     style: TextStyle(
                                      //                   //       color: Colors.black,
                                      //                   //     ),
                                      //                   //   ),
                                      //                   //   style: ButtonStyle(
                                      //                   //     backgroundColor:
                                      //                   //         MaterialStateProperty
                                      //                   //             .all(Colors
                                      //                   //                 .white70),
                                      //                   //     padding:
                                      //                   //         MaterialStateProperty
                                      //                   //             .all(EdgeInsets
                                      //                   //                 .all(50)),
                                      //                   //     textStyle:
                                      //                   //         MaterialStateProperty
                                      //                   //             .all(TextStyle(
                                      //                   //                 fontSize:
                                      //                   //                     30,
                                      //                   //                 color: Colors
                                      //                   //                     .black)),
                                      //                   //   ),
                                      //                   // ),
                                      //                   // TextFormField(
                                      //                   //   controller:
                                      //                   //       _appointmentUserController
                                      //                   //           .appointmentController,
                                      //                   //   onTap: () {
                                      //                   //     _appointmentUserController
                                      //                   //         .chooseDate();
                                      //                   //   },
                                      //                   //
                                      //                   //   cursorColor: Colors.black,
                                      //                   //   obscureText: false,
                                      //                   //   decoration: InputDecoration(
                                      //                   //     hintText: 'Select date',
                                      //                   //     helperStyle: TextStyle(
                                      //                   //       color: black
                                      //                   //           .withOpacity(0.7),
                                      //                   //       fontSize: 18,
                                      //                   //     ),
                                      //                   //     prefixIcon: Icon(
                                      //                   //       Icons
                                      //                   //           .calendar_today_outlined,
                                      //                   //       color: black
                                      //                   //           .withOpacity(0.7),
                                      //                   //       size: 20,
                                      //                   //     ),
                                      //                   //     border: InputBorder.none,
                                      //                   //   ),
                                      //                   //   keyboardType:
                                      //                   //       TextInputType.multiline,
                                      //                   //   maxLines: 1,
                                      //                   //   autofocus: true,
                                      //                   //   //obscureText: true,
                                      //                   //   //controller: _loginpasswordController.mobileController,
                                      //                   // ),
                                      //                   ),
                                      //             ),
                                      //           ),
                                      //           InkWell(
                                      //             child:
                                      //                 NeumorphicTextFieldContainer(
                                      //               child: Container(
                                      //                   height:
                                      //                       size.height * 0.05,
                                      //                   width: size.width,
                                      //                   decoration:
                                      //                       BoxDecoration(
                                      //                     color: Colors.white70,
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(10),
                                      //                   ),
                                      //                   child: Center(
                                      //                     child: Text(
                                      //                       'Funeral/Mortuary Service',
                                      //                       style: TextStyle(
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .w500,
                                      //                         fontSize:
                                      //                             size.height *
                                      //                                 0.02,
                                      //                       ),
                                      //                     ),
                                      //                   )
                                      //                   // ElevatedButton(
                                      //                   //   onPressed: () {},
                                      //                   //   child: Text(
                                      //                   //     'Select Date',
                                      //                   //     style: TextStyle(
                                      //                   //       color: Colors.black,
                                      //                   //     ),
                                      //                   //   ),
                                      //                   //   style: ButtonStyle(
                                      //                   //     backgroundColor:
                                      //                   //         MaterialStateProperty
                                      //                   //             .all(Colors
                                      //                   //                 .white70),
                                      //                   //     padding:
                                      //                   //         MaterialStateProperty
                                      //                   //             .all(EdgeInsets
                                      //                   //                 .all(50)),
                                      //                   //     textStyle:
                                      //                   //         MaterialStateProperty
                                      //                   //             .all(TextStyle(
                                      //                   //                 fontSize:
                                      //                   //                     30,
                                      //                   //                 color: Colors
                                      //                   //                     .black)),
                                      //                   //   ),
                                      //                   // ),
                                      //                   // TextFormField(
                                      //                   //   controller:
                                      //                   //       _appointmentUserController
                                      //                   //           .appointmentController,
                                      //                   //   onTap: () {
                                      //                   //     _appointmentUserController
                                      //                   //         .chooseDate();
                                      //                   //   },
                                      //                   //
                                      //                   //   cursorColor: Colors.black,
                                      //                   //   obscureText: false,
                                      //                   //   decoration: InputDecoration(
                                      //                   //     hintText: 'Select date',
                                      //                   //     helperStyle: TextStyle(
                                      //                   //       color: black
                                      //                   //           .withOpacity(0.7),
                                      //                   //       fontSize: 18,
                                      //                   //     ),
                                      //                   //     prefixIcon: Icon(
                                      //                   //       Icons
                                      //                   //           .calendar_today_outlined,
                                      //                   //       color: black
                                      //                   //           .withOpacity(0.7),
                                      //                   //       size: 20,
                                      //                   //     ),
                                      //                   //     border: InputBorder.none,
                                      //                   //   ),
                                      //                   //   keyboardType:
                                      //                   //       TextInputType.multiline,
                                      //                   //   maxLines: 1,
                                      //                   //   autofocus: true,
                                      //                   //   //obscureText: true,
                                      //                   //   //controller: _loginpasswordController.mobileController,
                                      //                   // ),
                                      //                   ),
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
                                      //
                                      //           // SizedBox(
                                      //           //   height: 30.0,
                                      //           // ),
                                      //           // ElevatedButton(
                                      //           //   style:
                                      //           //       ElevatedButton.styleFrom(
                                      //           //     foregroundColor:
                                      //           //         Colors.yellow,
                                      //           //     backgroundColor: Colors
                                      //           //         .red, // foreground
                                      //           //   ),
                                      //           //   onPressed: () {
                                      //           //     Get.back();
                                      //           //     // Get.to(() =>
                                      //           //     //     AppointmentHistory()
                                      //           //     // );
                                      //           //     // todoController.todos.add(
                                      //           //     //   Todo(
                                      //           //     //     text: textEditingController.text,
                                      //           //     //   ),
                                      //           //     // );
                                      //           //     //Get.back();
                                      //           //   },
                                      //           //   child: Text(
                                      //           //     'Appointment History',
                                      //           //     style: TextStyle(
                                      //           //         color: Colors.white,
                                      //           //         fontSize: 16.0),
                                      //           //   ),
                                      //           //   //color: Colors.redAccent,
                                      //           // )
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     radius: 10.0);
                                      //whatsAppOpen();
                                      // _launchWhatsapp();

                                      // Get.to(() => ComplainList());
                                      //Get.to(() => Profoile());
                                    } else if (index == 3) {
                                      Get.to(() => ChemistPaymentHistory());

                                      ///
                                      //Get.to(() => TheJwelleryStore());

                                      //Get.to(() => CarouselDemo());
                                    } else if (index == 4) {
                                      Get.to(() => ChemistPayoutHistory());
                                      //Get.defaultDialog(
                                      //barrierDismissible: true,

                                    } else if (index == 5) {
                                      Get.to(() => SupportView());
                                    } else if (index == 6) {
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
    'https://images.unsplash.com/photo-1523299174285-a59d80640155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1576765608866-5b51046452be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2078&q=80',
    'https://images.unsplash.com/photo-1576089235406-0612d7bb033e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1563213126-a4273aed2016?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBoYXJtYWN5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
    //'https://images.unsplash.com/photo-1666214278812-83371e46279f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bGFib3JhdG9yeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
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
