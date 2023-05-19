// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
//
// import '../../../../constants/constants/constants.dart';
// import '../../../../controllers/4_nurse_controller_RRR/nurse_appointment_detail_controller/nurse_user_ratting_review_controller/nurse_user_rating_review_controller.dart';
// import '../../../../widgets/widgets/neumorphic_text_field_container.dart';
// import '../../../../widgets/widgets/rectangular_button.dart';
//
// //import 'package:ps_welness_new_ui/controllers/4_nurse_controller/nurse_upload_report/nurseUploadReportController.dart';
//
// class NurseRatingreviewPost extends StatelessWidget {
//   NurseRatingReviewController _labUploadratingrevieweController =
//       Get.put(NurseRatingReviewController());
//
//   String textHolder = '268 ';
//   RxInt selectedimg = 0.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       // backgroundColor: Color(0xffffdb61),
//       appBar: AppBar(
//         leading: InkWell(
//             onTap: () {
//               Get.to(LabHomePage());
//             },
//             child: Icon(Icons.arrow_circle_left)),
//         title: Text("Upload Rating Review"),
//       ),
//       body: Obx(
//         () => (_labUploadratingrevieweController.isLoading.isFalse)
//             ? Center(child: CircularProgressIndicator())
//
//             ///TODO: here we can use layout builder and we can use stack under list view in flutter............
//             : Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//
//                     ///todo: Neme value..........
//                     NeumorphicTextFieldContainer(
//                       child: TextFormField(
//                         maxLines: 1,
//                         autofillHints: [AutofillHints.addressCityAndState],
//                         controller: _labUploadratingrevieweController.name,
//                         onSaved: (value) {
//                           //_labUploadratingrevieweController.name = value!;
//                         },
//                         validator: (value) {
//                           // return _labUploadratingrevieweController.validothers(value!);
//                         },
//                         cursorColor: Colors.black,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(20.0),
//                           hintText: 'Name',
//                           helperStyle: TextStyle(
//                             color: black.withOpacity(0.7),
//                             fontSize: 18,
//                           ),
//                           // prefixIcon: Icon(
//                           //   Icons.comment_bank_outlined,
//                           //   color: black.withOpacity(0.7),
//                           //   size: 20,
//                           // ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//
//                     ///todo: description value..........
//                     NeumorphicTextFieldContainer(
//                       child: TextFormField(
//                         maxLines: 1,
//                         autofillHints: [AutofillHints.addressCityAndState],
//                         controller:
//                             _labUploadratingrevieweController.description,
//                         onSaved: (value) {
//                           //_labUploadratingrevieweController.name = value!;
//                         },
//                         validator: (value) {
//                           // return _labUploadratingrevieweController.validothers(value!);
//                         },
//                         cursorColor: Colors.black,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(20.0),
//                           hintText: 'Descriptions',
//                           helperStyle: TextStyle(
//                             color: black.withOpacity(0.7),
//                             fontSize: 18,
//                           ),
//                           // prefixIcon: Icon(
//                           //   Icons.comment_bank_outlined,
//                           //   color: black.withOpacity(0.7),
//                           //   size: 20,
//                           // ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Obx(
//                       () => _labUploadratingrevieweController
//                                   .selectedImagePath.value !=
//                               ''
//                           ? Image.file(File(_labUploadratingrevieweController
//                               .selectedPath.value))
//                           : Center(
//                               child: InkWell(
//                                 onTap: (() {
//                                   optionsImage();
//                                 }),
//                                 child: Container(
//                                   height: size.height * 0.35,
//                                   width: size.width * 0.9,
//                                   decoration: BoxDecoration(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(12)),
//                                       border: Border.all(
//                                           width: 5,
//                                           color: Color.fromARGB(
//                                               255, 58, 141, 208))),
//                                   child: Center(
//                                     child: Icon(
//                                       Icons.add_box,
//                                       color: Color.fromARGB(255, 58, 141, 208),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                       // Image.file(File(
//                       //         _labUploadReportController.selectedImagePath.value)),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     RectangularButton(
//                         text: 'SUBMIT REPORT',
//                         press: () async {
//                           //CallLoader.loader();
//
//                           ///todo: calling api....
//                           _labUploadratingrevieweController
//                               .addProductReviewApi();
//                           // Get.to(LabCatagaryDetails());
//                           // LabListPage());
//                           //_loginpasswordController.checkLoginpassword();
//                         })
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
//
//   void optionsImage() {
//     Get.defaultDialog(
//       title: "Selcet an option",
//       titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
//       content: SizedBox(
//         width: 780,
//         child: Column(
//           children: [
//             InkWell(
//               onTap: () {
//                 _labUploadratingrevieweController.getImage(ImageSource.camera);
//                 Get.back();
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.camera_enhance,
//                     color: Color.fromARGB(255, 34, 126, 201),
//                     size: 25,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Text(
//                     "Camera",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 34, 126, 201),
//                       fontSize: 25,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Divider(
//               color: Color.fromARGB(255, 34, 126, 201),
//               endIndent: 70,
//               indent: 70,
//             ),
//             InkWell(
//               onTap: () {
//                 _labUploadratingrevieweController.getImage(ImageSource.gallery);
//                 Get.back();
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.photo,
//                     color: Color.fromARGB(255, 34, 126, 201),
//                     size: 25,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Text(
//                     "Gallery",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 34, 126, 201),
//                       fontSize: 25,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
