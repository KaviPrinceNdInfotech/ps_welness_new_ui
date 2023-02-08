import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';

import '../../../controllers/5_rwa_controller/rwa_patient_list_controller/rwa_patient_list_controller.dart';

class RwaPatientList extends StatelessWidget {
  RwaPatientList({Key? key}) : super(key: key);

  RwaPatientListController _rwaPatientListController =
      Get.put(RwaPatientListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // backgroundColor: MyTheme.ThemeColors,
        // appBar: AppBar(
        //   centerTitle: true,
        //   elevation: 0,
        //   title: Text('Patient List'),
        //   backgroundColor: MyTheme.ThemeColors,
        // ),
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -size.height * 0.041,
                //bottom: size.height * 0.64,
                //left: -30,
                right: -size.width * 0.124,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.26,
                    width: size.width * 0.75,
                    decoration: BoxDecoration(
                        //color: Colors.,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/rwa_patient_list2.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.01),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: size.height * 0.026,
                            color: MyTheme.blueww,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'Patient List',
                          style: GoogleFonts.alatsi(
                              fontSize: size.height * 0.032,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff023382)),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    child: Row(
                      children: [
                        Container(
                          //height: size.height * 0.02,
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(30.0)),
                              color: Colors.white70),
                          width: size.width * 0.72,
                          height: size.height * 0.06,
                          margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                          padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(splashColor: Colors.transparent),
                            child: Obx(
                              () => (_rwaPatientListController.isLoading.value)
                                  ? Center(child: CircularProgressIndicator())
                                  : TextField(
                                      controller: _rwaPatientListController
                                          .appointmentController,
                                      onTap: () {
                                        _rwaPatientListController.chooseDate();
                                      },
                                      autofocus: false,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: MyTheme.blueww),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.search),
                                        filled: true,
                                        fillColor: Colors.white70,
                                        hintText: 'dd-mm-yyyy',
                                        contentPadding: const EdgeInsets.only(
                                            left: 10.0, bottom: 12.0, top: 0.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white70),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white70),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            //gradient: MyTheme.sweepGradient1,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                              child: Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                      height: size.height * 0.71,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.0005),
                                  child: Container(
                                    height: size.height * 0.25,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 30 / 5),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60'
                                              //'https://images.unsplash.com/photo-1578496781985-452d4a934d50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGF0aWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'
                                              //'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                              ),
                                          fit: BoxFit.fill),
                                      //color: MyTheme.containercolor8,
                                      borderRadius: BorderRadius.circular(20),

                                      // gradient: LinearGradient(
                                      //     begin: Alignment.centerLeft,
                                      //     end: Alignment.centerRight,
                                      //     colors: [
                                      //       lightPrimary,
                                      //       darkPrimary,
                                      //     ]),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(-0, -0),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          color: Colors.yellow.shade800,

                                          // color: darkShadow1,
                                        ),
                                        BoxShadow(
                                          offset: Offset(3, 3),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          color: Colors.yellow.shade800,
                                        ),
                                      ],
                                      // image: DecorationImage(
                                      //     image: NetworkImage(
                                      //         'https://images.unsplash.com/photo-1626624340240-aadc087844fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Ymx1ciUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                      //     fit: BoxFit.cover)
                                    ),
                                    child: Stack(
                                      //clipBehavior: Clip.none,
                                      children: [
                                        Positioned(
                                          top: -70,
                                          right: 260,
                                          child: Container(
                                            height: size.height * 0.2,
                                            width: size.width * 0.4,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blueGrey,
                                              //gradient: MyTheme.gradient7,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -70,
                                          left: 260,
                                          child: Container(
                                            height: size.height * 0.2,
                                            width: size.width * 0.5,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blueGrey,
                                              //gradient: MyTheme.gradient71,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Patient Name:',
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Mobile No:',
                                                    style: GoogleFonts.poppins(
                                                      // color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'State:',
                                                    style: GoogleFonts.poppins(
                                                      //color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'City:',
                                                    style: GoogleFonts.poppins(
                                                      //color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Address:',
                                                    style: GoogleFonts.poppins(
                                                      //color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Pin:',
                                                    style: GoogleFonts.poppins(
                                                      //color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Kumar Prince',
                                                    style: GoogleFonts.raleway(
                                                        color: MyTheme.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    '+917019380053',
                                                    style: GoogleFonts.raleway(
                                                        color: MyTheme.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    'UP',
                                                    style: GoogleFonts.raleway(
                                                        color: MyTheme.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    'Noida',
                                                    style: GoogleFonts.raleway(
                                                        color: MyTheme.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    'Sector 15',
                                                    style: GoogleFonts.raleway(
                                                        color: MyTheme.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    '110096',
                                                    style: GoogleFonts.raleway(
                                                        color: MyTheme.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })),
                ],
              ),

              // Positioned(
              //   top: 50,
              //   child: Container(
              //     height: size.height * 0.10,
              //     width: size.width * 0.19,
              //     decoration: BoxDecoration(
              //       color: Colors.green,
              //       shape: BoxShape.circle,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: MyTheme.ThemeColors,
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   elevation: 0,
//       //   title: Text('Appintment History'),
//       //   backgroundColor: MyTheme.ThemeColors,
//       // ),
//       body: Column(
//         //clipBehavior: Clip.none,
//         children: [
//           SizedBox(
//             height: size.height * 0.07,
//           ),
//           SizedBox(
//             height: size.height * 0.0,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//             child: Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Container(
//                       height: size.height * 0.032,
//                       width: size.width * 0.071,
//                       decoration: BoxDecoration(
//                         color: Colors.white70,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_ios_outlined,
//                         size: size.height * 0.022,
//                       )),
//                 ),
//                 SizedBox(
//                   width: size.width * 0.02,
//                 ),
//                 Text(
//                   ' See Your Appointment History',
//                   style: TextStyle(
//                     color: MyTheme.blueww,
//                     fontSize: size.width * 0.045,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Container(
//                 decoration: new BoxDecoration(
//                     borderRadius:
//                         new BorderRadius.all(new Radius.circular(30.0)),
//                     color: Colors.white),
//                 width: size.width * 0.72,
//                 height: size.height * 0.06,
//                 margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
//                 child: Theme(
//                   data: Theme.of(context)
//                       .copyWith(splashColor: Colors.transparent),
//                   child: Obx(
//                     () => (_nurseappointmentController.isLoading.value)
//                         ? Center(child: CircularProgressIndicator())
//                         : TextField(
//                             controller: _nurseappointmentController
//                                 .appointmentController,
//                             onTap: () {
//                               _nurseappointmentController.chooseDate();
//                             },
//                             autofocus: false,
//                             style: TextStyle(
//                                 fontSize: 15.0, color: MyTheme.blueww),
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.search),
//                               filled: true,
//                               fillColor: Colors.white,
//                               hintText: 'dd-mm-yyyy',
//                               contentPadding: const EdgeInsets.only(
//                                   left: 10.0, bottom: 12.0, top: 0.0),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(25.7),
//                               ),
//                               enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(25.7),
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: size.height * 0.06,
//                 width: size.width * 0.2,
//                 decoration: BoxDecoration(
//                   color: MyTheme.blueww,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Center(
//                     child: Text(
//                   'Search',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: size.width * 0.035,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )),
//               ),
//             ],
//           ),
//           SizedBox(
//               height: size.height * 0.75,
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 7,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: size.width * 0.03,
//                           vertical: size.height * 0.0005),
//                       child: Container(
//                         height: size.height * 0.25,
//                         margin: EdgeInsets.symmetric(vertical: 30 / 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           gradient: LinearGradient(
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                               colors: [
//                                 lightPrimary2,
//                                 darkPrimary2,
//                               ]),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: Offset(-0, -0),
//                               spreadRadius: 0,
//                               blurRadius: 0,
//                               color: darkShadow,
//                             ),
//                             BoxShadow(
//                               offset: Offset(1, 3),
//                               spreadRadius: 0,
//                               blurRadius: 0,
//                               color: Colors.grey,
//                             ),
//                           ],
//                           // image: DecorationImage(
//                           //     image: AssetImage(
//                           //         'lib/assets/background_stack_png/appointment6.png'),
//                           //     fit: BoxFit.cover)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Patient Name:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Mobile :',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Email:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Location:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient City:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient State :',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Kishor Kumar',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     '9977889999',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'ksk@gmail.com',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'Sector 12, C 59',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'Lakhnaw',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'UP',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   })),
//           // Positioned(
//           //   top: 50,
//           //   child: Container(
//           //     height: size.height * 0.10,
//           //     width: size.width * 0.19,
//           //     decoration: BoxDecoration(
//           //       color: Colors.green,
//           //       shape: BoxShape.circle,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
