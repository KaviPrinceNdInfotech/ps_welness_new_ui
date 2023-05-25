import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/doctor_sections/get_doctor_list_controller.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../../../controllers/1_user_view_controller/doctor_rating_review_controller/doctor_rating_review.dart';
import '../../../../../controllers/1_user_view_controller/doctor_rating_review_controller/doctor_view_ratting_review.dart';
import '../../doctor_appointments_details/doctor_details_by_id/doctor_detail_credentials.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/doctorss/appointment_checkout/appointment_checkout.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/appointment_checkout/appointment_checkout.dart';

class DetailsSchedulePage extends StatelessWidget {
  DetailsSchedulePage({Key? key, this.bevel = 2.0}) : super(key: key);
  final double bevel;
  RxInt selectedimg = 0.obs;
  RxInt selectedsingleimg = 0.obs;
  ViewdoctorreviewController _viewdoctorreviewController =
      Get.put(ViewdoctorreviewController());
  DoctorRatingReviewController _doctorRatingReviewController =
      Get.put(DoctorRatingReviewController());

  DoctorListController _doctorListController = Get.put(DoctorListController());
  // final DoctorCheckoutController _doctorappointmentcheckout =
  //     Get.put(DoctorCheckoutController());

  @override
  Widget build(BuildContext context) {
    var base = 'http://test.pswellness.in/Images/';

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Obx(
        () => (_doctorListController.isLoading.value &&
                _viewdoctorreviewController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: size.height * 0.3,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                                vertical: size.height * 0.02),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.001,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.21,
                                  width: size.width * 0.24,
                                  child: Image(
                                    image: AssetImage(
                                        'lib/assets/background_stack_png/doc02.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: size.height * 0.266,
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: MyTheme.ThemeColors,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.007,
                            ),
                            Text(
                              'Over '
                              '${_doctorListController.doctordetailbyid?.experience.toString()}'
                              ' years of experience',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.016,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.3,
                      child: Container(
                        height: size.height * 0.7,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.01),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${_doctorListController.doctordetailbyid?.doctorName.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.025,
                                  ),
                                ),
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: size.width * 0.4,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Rating: ',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.yellow.shade900,

                                              //MyTheme
                                              //.containercolor2,
                                              fontSize: size.height * 0.017,
                                            ),
                                          ),
                                          Text(
                                            '0.0',
                                            //'${_doctorListController.foundDoctors[index].experience} yr',
                                            //doctorcatagary[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red.shade600,

                                              //MyTheme
                                              //.containercolor2,
                                              fontSize: size.height * 0.02,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow.shade800,
                                            size: size.height * 0.025,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  PhysicalModel(
                                    color: Colors.black,
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: () {
                                        addReview();
                                        _viewdoctorreviewController
                                            .doctorreviewratingApi();
                                        _viewdoctorreviewController.update();
                                      },
                                      child: Container(
                                        height: size.height * 0.03,
                                        width: size.width * 0.22,
                                        decoration: BoxDecoration(
                                          color: Colors.cyanAccent.shade200,
                                          //yellow.shade600,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Add Review',
                                          style: GoogleFonts.nunitoSans(
                                              fontWeight: FontWeight.w800,
                                              fontSize: size.height * 0.013),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.00,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${_doctorListController.doctordetailbyid?.departmentName.toString()}"
                                  //'Cardiologist'
                                  ,
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.02,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.009,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Fees: ₹'
                                  "${_doctorListController.doctordetailbyid?.fee.toDouble()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.02,
                                    color: Colors.red.shade300,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: size.height * 0.00,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${_doctorListController.doctordetailbyid?.about.toString()}",
                                  //  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                  maxLines: 3,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.016,
                                    //color: Colors.red.shade300,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.0,
                              ),
                              SizedBox(
                                  height: size.height * 0.23,
                                  child: DoctorScheduleCredentials()),
                              SizedBox(
                                height: size.height * 0.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'View Review:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height * 0.014,
                                    color: Colors.black,
                                    //color: Colors.red.shade300,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.14,
                                width: size.width * 0.95,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    //scrollDirection: Axis.horizontal,
                                    itemCount: _viewdoctorreviewController
                                        .doctorviewreview?.rating?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Ink(
                                              child: PhysicalModel(
                                                color: MyTheme.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                elevation: 20,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          size.width * 0.01,
                                                      vertical:
                                                          size.height * 0.004),
                                                  child: Container(
                                                    height: size.height * 0.11,
                                                    width: size.width * 0.9,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          MyTheme.ThemeColors,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                height:
                                                                    size.height *
                                                                        0.08,
                                                                width:
                                                                    size.width *
                                                                        0.2,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  '$base${_viewdoctorreviewController.doctorviewreview?.rating?[index].image.toString()}',
                                                                  //base+'${_userhomePageController.banerlistmodel!.bannerImageList![index].toString()}',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  errorBuilder:
                                                                      (context,
                                                                          error,
                                                                          stackTrace) {
                                                                    //if image not comming in catagary then we have to purchase

                                                                    return Center(
                                                                      child:
                                                                          Text(
                                                                        'No Image',
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              size.height * 0.013,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${_viewdoctorreviewController.doctorviewreview?.rating?[index].name}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        size.height *
                                                                            0.016,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      size.height *
                                                                          0.035,
                                                                  width:
                                                                      size.width *
                                                                          0.5,
                                                                  child: Text(
                                                                    "${_viewdoctorreviewController.doctorviewreview?.rating?[index].description}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          size.height *
                                                                              0.013,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Rating:",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            size.height *
                                                                                0.016,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: Colors
                                                                            .brown,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "${_viewdoctorreviewController.doctorviewreview?.rating?[index].rating.toString()}",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            size.height *
                                                                                0.016,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .yellow,
                                                                      size: size
                                                                              .height *
                                                                          0.02,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: Text(
                              //     'Book a Date:',
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.w600,
                              //       fontSize: size.height * 0.02,
                              //       //color: Colors.red.shade300,
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: size.height * 0.01,
                              // ),
                              // SizedBox(
                              //   height: size.height * 0.08,
                              //   width: size.width,
                              //   child:Container(
                              //     width: double.infinity,
                              //     margin: EdgeInsets.symmetric(vertical: 30 / 3),
                              //     decoration: BoxDecoration(
                              //         gradient: LinearGradient(
                              //             begin: Alignment.centerLeft,
                              //             end: Alignment.centerRight,
                              //             colors: [
                              //               lightPrimary,
                              //               darkPrimary,
                              //             ]),
                              //         borderRadius: BorderRadius.circular(12),
                              //         boxShadow: [
                              //           BoxShadow(
                              //             offset: Offset(-1, -1),
                              //             spreadRadius: 1,
                              //             blurRadius: 3,
                              //             color: Colors.white,
                              //           ),
                              //           BoxShadow(
                              //             offset: Offset(2, 2),
                              //             spreadRadius: 1,
                              //             blurRadius: 0,
                              //             color: Colors.grey,
                              //           ),
                              //         ]),
                              //     child: TextFormField(
                              //       textAlign: TextAlign.left,
                              //       // decoration: InputDecoration(
                              //       //   hintText: 'Enter Something',
                              //       //   contentPadding: EdgeInsets.all(20.0),
                              //       // ),
                              //
                              //       controller: _doctorListController.appointmentController,
                              //       onTap: () {
                              //         _doctorListController.chooseDate();
                              //       },
                              //
                              //       cursorColor: Colors.black,
                              //       obscureText: false,
                              //       decoration: InputDecoration(
                              //         contentPadding: EdgeInsets.all(17.0),
                              //
                              //         hintText: 'Select date',
                              //         helperStyle: TextStyle(
                              //           color: black.withOpacity(0.7),
                              //           fontSize: 18,
                              //         ),
                              //         prefixIcon: Icon(
                              //           Icons.calendar_today_outlined,
                              //           color: black.withOpacity(0.7),
                              //           size: 20,
                              //         ),
                              //         border: InputBorder.none,
                              //       ),
                              //       keyboardType: TextInputType.multiline,
                              //       maxLines: 1,
                              //       autofocus: true,
                              //       //obscureText: true,
                              //       //controller: _loginpasswordController.mobileController,
                              //     ),
                              //   ),
                              //   // ListView.builder(
                              //   //     shrinkWrap: true,
                              //   //     scrollDirection: Axis.horizontal,
                              //   //     itemCount: 32,
                              //   //     itemBuilder: (BuildContext context, int index) {
                              //   //       return Padding(
                              //   //         padding: const EdgeInsets.all(3.0),
                              //   //         child: PhysicalModel(
                              //   //           color: MyTheme.white,
                              //   //           borderRadius: BorderRadius.circular(5),
                              //   //           elevation: 20,
                              //   //           child: Padding(
                              //   //             padding: EdgeInsets.symmetric(
                              //   //                 horizontal: size.width * 0.01,
                              //   //                 vertical: size.height * 0.004),
                              //   //             child: Container(
                              //   //               //height: size.height * 0.025,
                              //   //               width: size.width * 0.17,
                              //   //               decoration: BoxDecoration(
                              //   //                 color: MyTheme.ThemeColors,
                              //   //                 borderRadius: BorderRadius.circular(5),
                              //   //               ),
                              //   //               child: Column(
                              //   //                 mainAxisAlignment:
                              //   //                     MainAxisAlignment.center,
                              //   //                 children: [
                              //   //                   Text(
                              //   //                     'MAR',
                              //   //                     style: TextStyle(
                              //   //                       fontSize: size.height * 0.015,
                              //   //                       fontWeight: FontWeight.w600,
                              //   //                       color: Colors.white,
                              //   //                     ),
                              //   //                   ),
                              //   //                   SizedBox(
                              //   //                     height: size.height * 0.01,
                              //   //                   ),
                              //   //                   Text(
                              //   //                     '${index}',
                              //   //                     style: TextStyle(
                              //   //                       fontSize: size.height * 0.016,
                              //   //                       fontWeight: FontWeight.w600,
                              //   //                       color: Colors.white,
                              //   //                     ),
                              //   //                   ),
                              //   //                 ],
                              //   //               ),
                              //   //             ),
                              //   //           ),
                              //   //         ),
                              //   //       );
                              //   //     }),
                              // ),
                              // // SizedBox(
                              // //   height: size.height * 0.08,
                              // //   width: size.width,
                              // //   child: ListView.builder(
                              // //       shrinkWrap: true,
                              // //       scrollDirection: Axis.horizontal,
                              // //       itemCount: 32,
                              // //       itemBuilder: (BuildContext context, int index) {
                              // //         return Padding(
                              // //           padding: const EdgeInsets.all(3.0),
                              // //           child: PhysicalModel(
                              // //             color: MyTheme.white,
                              // //             borderRadius: BorderRadius.circular(5),
                              // //             elevation: 20,
                              // //             child: Padding(
                              // //               padding: EdgeInsets.symmetric(
                              // //                   horizontal: size.width * 0.01,
                              // //                   vertical: size.height * 0.004),
                              // //               child: Container(
                              // //                 //height: size.height * 0.025,
                              // //                 width: size.width * 0.17,
                              // //                 decoration: BoxDecoration(
                              // //                   color: MyTheme.ThemeColors,
                              // //                   borderRadius: BorderRadius.circular(5),
                              // //                 ),
                              // //                 child: Column(
                              // //                   mainAxisAlignment:
                              // //                       MainAxisAlignment.center,
                              // //                   children: [
                              // //                     Text(
                              // //                       'MAR',
                              // //                       style: TextStyle(
                              // //                         fontSize: size.height * 0.015,
                              // //                         fontWeight: FontWeight.w600,
                              // //                         color: Colors.white,
                              // //                       ),
                              // //                     ),
                              // //                     SizedBox(
                              // //                       height: size.height * 0.01,
                              // //                     ),
                              // //                     Text(
                              // //                       '${index}',
                              // //                       style: TextStyle(
                              // //                         fontSize: size.height * 0.016,
                              // //                         fontWeight: FontWeight.w600,
                              // //                         color: Colors.white,
                              // //                       ),
                              // //                     ),
                              // //                   ],
                              // //                 ),
                              // //               ),
                              // //             ),
                              // //           ),
                              // //         );
                              // //       }),
                              // // ),
                              // SizedBox(
                              //   height: size.height * 0.02,
                              // ),
                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: Text(
                              //     'Book a Time:',
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.w600,
                              //       fontSize: size.height * 0.02,
                              //       //color: Colors.red.shade300,
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: size.height * 0.01,
                              // ),
                              // SizedBox(
                              //   height: size.height * 0.06,
                              //   width: size.width,
                              //   child: ListView.builder(
                              //       shrinkWrap: true,
                              //       scrollDirection: Axis.horizontal,
                              //       itemCount: 32,
                              //       itemBuilder: (BuildContext context, int index) {
                              //         return Padding(
                              //           padding: const EdgeInsets.all(3.0),
                              //           child: Ink(
                              //             child: PhysicalModel(
                              //               color: MyTheme.white,
                              //               borderRadius: BorderRadius.circular(5),
                              //               elevation: 20,
                              //               child: Padding(
                              //                 padding: EdgeInsets.symmetric(
                              //                     horizontal: size.width * 0.01,
                              //                     vertical: size.height * 0.004),
                              //                 child: Container(
                              //                   //height: size.height * 0.025,
                              //                   width: size.width * 0.17,
                              //                   decoration: BoxDecoration(
                              //                     color: MyTheme.ThemeColors,
                              //                     borderRadius:
                              //                         BorderRadius.circular(5),
                              //                   ),
                              //                   child: Column(
                              //                     mainAxisAlignment:
                              //                         MainAxisAlignment.center,
                              //                     children: [
                              //                       Text(
                              //                         '10:00',
                              //                         style: TextStyle(
                              //                           fontSize: size.height * 0.015,
                              //                           fontWeight: FontWeight.w600,
                              //                           color: Colors.white,
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         );
                              //       }),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0.0,
                      left: size.width * 0.0,
                      right: size.width * 0.00,
                      top: size.height * 0.865,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.2),
                        child: ElevatedButton(
                          onPressed: () {
                            //_doctorListController.update();
                            _doctorListController.checkdoctor2();
                            // _doctorappointmentcheckout.doctoorcheckoutApi();
                            //_doctorappointmentcheckout.update();
                            //Get.to(() => DoctorAppointmentCheckout());
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(0.0),
                              ),
                              elevation: 0,
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          clipBehavior: Clip.none,
                          child: Container(
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: bevel, color: Color(0xFFFFFFFFFF)),
                                left: BorderSide(
                                    width: bevel, color: Color(0xFFFFFFFFFF)),
                                right: BorderSide(
                                    width: bevel, color: Color(0xFFFF000000)),
                                bottom: BorderSide(
                                    width: bevel, color: Color(0xFFFF000000)),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        width: bevel,
                                        color: Color(0xFFFFDFDFDF)),
                                    left: BorderSide(
                                        width: bevel,
                                        color: Color(0xFFFFDFDFDF)),
                                    right: BorderSide(
                                        width: bevel,
                                        color: Color(0xFFFF7F7F7F)),
                                    bottom: BorderSide(
                                        width: bevel,
                                        color: Color(0xFFFF7F7F7F)),
                                  ),
                                  color: MyTheme.white
                                  //Color(0xFFBFBFBF),
                                  ),
                              child: Center(
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: size.height * 0.02),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  addReview() {
    Get.dialog(
      RatingDialog(
          starSize: 30,
          title: Text(""),
          starColor: Colors.amber,
          submitButtonText: "Post Review",
          image: Container(
            //color: Colors.green,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: TextFormField(
                      controller: _doctorRatingReviewController.name,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Name"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _doctorRatingReviewController.description,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Description"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  // () => _controller.selectedPath.value != ''
                  () => _doctorRatingReviewController.selectedPath.value != ''
                      ? InkWell(
                          onTap: optionsImage,
                          child: Image.file(
                            File(_doctorRatingReviewController
                                .selectedPath.value),
                          ),
                        )
                      : Center(
                          child: InkWell(
                            onTap: (() {
                              optionsImage();
                            }),
                            child: Container(
                              height: 160,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  border: Border.all(
                                      width: 50,
                                      color:
                                          Color.fromARGB(255, 58, 141, 208))),
                              child: Center(
                                child: Icon(
                                  Icons.add_box,
                                  color: Color.fromARGB(255, 58, 141, 208),
                                ),
                              ),
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
          enableComment: false,
          onSubmitted: (response) {
            _doctorRatingReviewController.ratings.value = response.rating;
            if (_doctorRatingReviewController.ratings.value == 1) {
              _doctorRatingReviewController.rating1.value = true;
            } else if (_doctorRatingReviewController.ratings.value == 2) {
              _doctorRatingReviewController.rating1.value = true;
              _doctorRatingReviewController.rating2.value = true;
            } else if (_doctorRatingReviewController.ratings.value == 3) {
              _doctorRatingReviewController.rating1.value = true;
              _doctorRatingReviewController.rating2.value = true;
              _doctorRatingReviewController.rating3.value = true;
            } else if (_doctorRatingReviewController.ratings.value == 4) {
              _doctorRatingReviewController.rating1.value = true;
              _doctorRatingReviewController.rating2.value = true;
              _doctorRatingReviewController.rating3.value = true;
              _doctorRatingReviewController.rating4.value = true;
            } else if (_doctorRatingReviewController.ratings.value == 4) {
              _doctorRatingReviewController.rating1.value = true;
              _doctorRatingReviewController.rating2.value = true;
              _doctorRatingReviewController.rating3.value = true;
              _doctorRatingReviewController.rating4.value = true;
              _doctorRatingReviewController.rating5.value = true;
            }

            _doctorRatingReviewController.addDoctorProductReviewApi();
          }),
    );
  }

  void optionsImage() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 500,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _doctorRatingReviewController.getImage(ImageSource.camera);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 26,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 120,
              indent: 120,
            ),
            InkWell(
              onTap: () {
                _doctorRatingReviewController.getImage(ImageSource.gallery);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 26,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
