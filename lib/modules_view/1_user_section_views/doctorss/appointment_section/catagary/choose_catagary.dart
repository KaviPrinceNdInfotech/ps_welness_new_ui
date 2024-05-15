// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ps_welness_new_ui/constants/constants/constants.dart';
// import 'package:ps_welness_new_ui/constants/my_theme.dart';
// import 'package:ps_welness_new_ui/modules_view/1_user_section_views/doctorss/appointment_section/doctorss_lists/doctor_list_appointment.dart';
// //import 'package:ps_welness/constants/constants/constants.dart';
// //import 'package:ps_welness/constants/my_theme.dart';
// //import 'package:ps_welness/modules_view/1_user_section_views/doctorss/appointment_section/doctorss_lists/doctor_list_appointment.dart';
// //import 'package:ps_welness/modules_view/1_user_section_views/appointment_section/doctorss_lists/doctor_list_appointment.dart';
//
// class CatagaryDetails extends StatelessWidget {
//   CatagaryDetails({Key? key}) : super(key: key);
//
//   final List<String> doctorcatagary = [
//     'Cardiologist',
//     'Audiologist',
//     'Dentist',
//     'ENT',
//     'Gynaecologist',
//     'Orthopaedic s',
//     'Paediatrician',
//     'Psychiatrists',
//     'Veterinarian',
//     'Radiologist',
//     'Pulmonologist',
//     'Endocrinologist',
//     'Neurologist',
//     'Veterinarian',
//     'Cardiothoracic',
//   ];
//
//   final List<String> catimage = [
//     'lib/assets/icons/cat1.png',
//     'lib/assets/icons/cat2.png',
//     'lib/assets/icons/cat3.png',
//     'lib/assets/icons/cat4.png',
//     'lib/assets/icons/cat5.png',
//     'lib/assets/icons/cat6.png',
//     'lib/assets/icons/cat7.png',
//     'lib/assets/icons/cat8.png',
//     'lib/assets/icons/cat9.png',
//     'lib/assets/icons/cat10.png',
//     'lib/assets/icons/cat11.png',
//     'lib/assets/icons/cat12.png',
//     'lib/assets/icons/cat13.png',
//     'lib/assets/icons/cat14.png',
//     'lib/assets/icons/cat15.png',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height,
//       width: size.width,
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//             lightPrimary,
//             darkPrimary,
//           ])),
//       child: Scaffold(
//         backgroundColor: Color(0xff11f2ec),
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
//             child: Column(
//               //crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: size.height * 0.17,
//                   color: Color(0xff11f2ec),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: size.height * 0.02,
//                         ),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: size.width * 0.03),
//                             child: Row(
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     Get.back();
//                                   },
//                                   child: Icon(
//                                     Icons.arrow_back,
//                                     color: MyTheme.blueww,
//                                     size: size.height * 0.027,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: size.width * 0.02,
//                                 ),
//                                 Text(
//                                   'Choose category',
//                                   style: GoogleFonts.nunitoSans(
//                                     fontSize: size.width * 0.06,
//                                     color: MyTheme.blueww,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           child: Theme(
//                             data: Theme.of(context)
//                                 .copyWith(splashColor: Colors.transparent),
//                             child: TextField(
//                               autofocus: false,
//                               style: TextStyle(
//                                   fontSize: 15.0, color: MyTheme.blueww),
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(Icons.search),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 hintText: 'Search catagary',
//                                 contentPadding: const EdgeInsets.only(
//                                     left: 10.0, bottom: 12.0, top: 0.0),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(25.7),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(25.7),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           decoration: new BoxDecoration(
//                               borderRadius: new BorderRadius.all(
//                                   new Radius.circular(30.0)),
//                               color: Colors.white),
//                           width: size.width,
//                           height: size.height * 0.06,
//                           margin: new EdgeInsets.fromLTRB(15, 20, 15, 20),
//                           padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.0001,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(size.width * 0.01),
//                   child: Container(
//                     height: size.height * 0.71,
//                     color: Color(0xff11f2ec),
//                     child: GridView.builder(
//                         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                           maxCrossAxisExtent: size.height * 0.21,
//                           mainAxisExtent: size.height * 0.12,
//                           childAspectRatio: 4 / 3,
//                           crossAxisSpacing: size.width * 0.006,
//                           mainAxisSpacing: size.height * 0.006,
//                         ),
//                         itemCount: doctorcatagary.length,
//                         itemBuilder: (BuildContext ctx, index) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: size.width * 0.01,
//                                 vertical: size.height * 0.003),
//                             child: InkWell(
//                               onTap: () {
//                                 Get.to(() => DoctorListUser());
//                               },
//                               child: Container(
//                                 height: size.height * 0.08,
//                                 width: size.width * 0.15,
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: size.height * 0.004),
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       catimage[index],
//                                       height: size.height * 0.08,
//                                       //productimage[index],
//                                       //"lib/assets/image/icons8-hospital-64.png",
//                                     ),
//                                     Padding(
//                                       padding:
//                                           EdgeInsets.all(size.height * 0.001),
//                                       child: Text(
//                                         doctorcatagary[index],
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: GoogleFonts.sunflower(
//                                           fontWeight: FontWeight.bold,
//                                           color: MyTheme.blueww,
//                                           fontSize: size.height * 0.017,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(10),
//                                     boxShadow: [
//                                       const BoxShadow(
//                                         color: Colors.black38,
//                                         offset: Offset(5, 5),
//                                         blurRadius: 0,
//                                         spreadRadius: 0,
//                                       ),
//                                       const BoxShadow(
//                                         color: Colors.black26,
//                                         offset: Offset(0, -0),
//                                         blurRadius: 0,
//                                         spreadRadius: 0,
//                                       ),
//                                     ]),
//                               ),
//                             ),
//                           );
//                           // RoundedButton(
//                           //   imageSrc: 'Container(
//                           //           padding: EdgeInsets.all(appPadding / 2),
//                           //           width: 65,
//                           //           height: 65,
//                           //           decoration: BoxDecoration(
//                           //               shape: BoxShape.circle,
//                           //               gradient: LinearGradient(
//                           //                   begin: Alignment.topCenter,
//                           //                   end: Alignment.bottomCenter,
//                           //                   colors: [
//                           //                     darkPrimary,
//                           //                     lightPrimary,
//                           //                   ]),
//                           //               boxShadow: [
//                           //                 BoxShadow(
//                           //                   offset: Offset(3, 3),
//                           //                   spreadRadius: 1,
//                           //                   blurRadius: 4,
//                           //                   color: darkShadow,
//                           //                 ),
//                           //                 BoxShadow(
//                           //                   offset: Offset(-5, -5),
//                           //                   spreadRadius: 1,
//                           //                   blurRadius: 4,
//                           //                   color: lightShadow,
//                           //                 ),
//                           //               ]),
//                           //           child: Image.asset(imageSrc),
//                           //         ),',
//                           //   press: () {}
//                           // );
//                         }),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// //#00caf7
