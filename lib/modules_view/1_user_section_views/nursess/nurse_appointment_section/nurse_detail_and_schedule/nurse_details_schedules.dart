import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controller_RRR/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
//import 'package:ps_welness_new_ui/controllers/4_nurse_controller/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../../../controllers/1_user_view_controller/rating_review_controller/rating_review_nurse_controller.dart';
import '../../../../../controllers/4_nurse_controller_RRR/nurse_appointment_detail_controller/nurse_user_ratting_review_controller/nurse_user_rating_review_controller.dart';
import '../../../../../model/1_user_model/time_slots_common_model/time_slots_common.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/doctorss/appointment_checkout/appointment_checkout.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/appointment_checkout/appointment_checkout.dart';

class NurseDetailsSchedulePage extends StatelessWidget {
  NurseDetailsSchedulePage({Key? key, this.bevel = 2.0}) : super(key: key);
  // String productId;
  RxInt selectedimg = 0.obs;
  RxInt selectedsingleimg = 0.obs;

  final NurseAppointmentDetailController _nurseAppointmentDetailController =
      Get.put(NurseAppointmentDetailController());
  final NurseRatingReviewController _nurseRatingReviewController =
      Get.put(NurseRatingReviewController());
  ReviewRatingNurseController _nurseviewssRatingReviewController =
      Get.put(ReviewRatingNurseController());
  final double bevel;

  @override
  Widget build(BuildContext context) {
    var base = 'http://test.pswellness.in/Images/';
    // var base = 'https://api.gyros.farm/Images/';
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _nurseAppointmentDetailController.NurseBooking2formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        backgroundColor: MyTheme.ThemeColors,
        body: Obx(
          () => (_nurseAppointmentDetailController.isLoading.value &&
                  _nurseviewssRatingReviewController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              // : _nurseAppointmentDetailController.nursedetailbyId != null
              // ? Center(
              //   child: Text('No Data'),
              // )
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
                                    height: size.height * 0.22,
                                    width: size.width * 0.5,
                                    child: Image(
                                      image: AssetImage(
                                          'lib/assets/background_stack_png/n1.png'),
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
                              color:
                                  //Colors.pink,
                                  MyTheme.ThemeColors,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.007,
                              ),
                              Text(
                                'Overall '
                                '${_nurseAppointmentDetailController.nursedetailbyId?.experience}'
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
                        top: size.height * 0.298,
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
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${_nurseAppointmentDetailController.nursedetailbyId?.nurseName}"
                                      // _nurseAppointmentDetailController.nursedetailbyId!.nurseName.toString(),
                                      //'Mrs Alex'
                                      ,
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
                                                "${_nurseAppointmentDetailController.nursedetailbyId?.rating}",

                                                //'0.0',
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
                                            _nurseviewssRatingReviewController
                                                .nursereviewratingApi();
                                            _nurseviewssRatingReviewController
                                                .update();
                                            // _nurseviewssRatingReviewController
                                            // .refresh();
                                          },
                                          child: Container(
                                            height: size.height * 0.03,
                                            width: size.width * 0.22,
                                            decoration: BoxDecoration(
                                              color: Colors.cyanAccent.shade200,
                                              //yellow.shade600,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Add Review',
                                              style: GoogleFonts.nunitoSans(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize:
                                                      size.height * 0.013),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.000,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${_nurseAppointmentDetailController.nursedetailbyId?.nurseTypeName}",

                                      // _nurseAppointmentDetailController.nursedetailbyId!.nurseTypeName.toString(),
                                      //'ANM',
                                      style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.02,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Fees: ₹'
                                      "${_nurseAppointmentDetailController.nursedetailbyId?.fee?.toDouble()}",
                                      //'100'

                                      //'${_nurseAppointmentDetailController.nursedetailbyId!.fee}',
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
                                      "${_nurseAppointmentDetailController.nursedetailbyId?.about}",

                                      //_nurseAppointmentDetailController.nursedetailbyId!.about.toString(),
                                      //'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                      maxLines: 9,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        //fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.016,
                                        //color: Colors.red.shade300,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Book a Date:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.02,
                                        //color: Colors.red.shade300,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.00,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.075,
                                    width: size.width,
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 30 / 7),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                lightPrimary,
                                                darkPrimary,
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(-1, -1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              color: Colors.white,
                                            ),
                                            BoxShadow(
                                              offset: Offset(2, 2),
                                              spreadRadius: 1,
                                              blurRadius: 0,
                                              color: Colors.grey,
                                            ),
                                          ]),
                                      child: TextFormField(
                                        textAlign: TextAlign.left,
                                        // decoration: InputDecoration(
                                        //   hintText: 'Enter Something',
                                        //   contentPadding: EdgeInsets.all(20.0),
                                        // ),
                                        controller:
                                            _nurseAppointmentDetailController
                                                .appointmentController,
                                        onTap: () {
                                          _nurseAppointmentDetailController
                                              .chooseDate();
                                        },

                                        cursorColor: Colors.black,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(17.0),
                                          hintText: 'Select date',
                                          helperStyle: TextStyle(
                                            color: black.withOpacity(0.7),
                                            fontSize: 18,
                                          ),
                                          prefixIcon: Icon(
                                            Icons.calendar_today_outlined,
                                            color: black.withOpacity(0.7),
                                            size: 20,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 1,
                                        autofocus: true,
                                        //obscureText: true,
                                        //controller: _loginpasswordController.mobileController,
                                      ),
                                    ),
                                    // ListView.builder(
                                    //     shrinkWrap: true,
                                    //     scrollDirection: Axis.horizontal,
                                    //     itemCount: 32,
                                    //     itemBuilder: (BuildContext context, int index) {
                                    //       return Padding(
                                    //         padding: const EdgeInsets.all(3.0),
                                    //         child: PhysicalModel(
                                    //           color: MyTheme.white,
                                    //           borderRadius: BorderRadius.circular(5),
                                    //           elevation: 20,
                                    //           child: Padding(
                                    //             padding: EdgeInsets.symmetric(
                                    //                 horizontal: size.width * 0.01,
                                    //                 vertical: size.height * 0.004),
                                    //             child: Container(
                                    //               //height: size.height * 0.025,
                                    //               width: size.width * 0.17,
                                    //               decoration: BoxDecoration(
                                    //                 color: MyTheme.ThemeColors,
                                    //                 borderRadius: BorderRadius.circular(5),
                                    //               ),
                                    //               child: Column(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment.center,
                                    //                 children: [
                                    //                   Text(
                                    //                     'MAR',
                                    //                     style: TextStyle(
                                    //                       fontSize: size.height * 0.015,
                                    //                       fontWeight: FontWeight.w600,
                                    //                       color: Colors.white,
                                    //                     ),
                                    //                   ),
                                    //                   SizedBox(
                                    //                     height: size.height * 0.01,
                                    //                   ),
                                    //                   Text(
                                    //                     '${index}',
                                    //                     style: TextStyle(
                                    //                       fontSize: size.height * 0.016,
                                    //                       fontWeight: FontWeight.w600,
                                    //                       color: Colors.white,
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       );
                                    //     }),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.00,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Book a Time:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.02,
                                        //color: Colors.red.shade300,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.075,
                                    width: size.width,
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 30 / 7),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                lightPrimary,
                                                darkPrimary,
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(-1, -1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              color: Colors.white,
                                            ),
                                            BoxShadow(
                                              offset: Offset(2, 2),
                                              spreadRadius: 1,
                                              blurRadius: 0,
                                              color: Colors.grey,
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.01,
                                          //vertical: size.height * 0.02
                                        ),
                                        child: Obx(
                                          () => DropdownButtonFormField<
                                                  TimeSlot>(
                                              value:
                                                  _nurseAppointmentDetailController
                                                      .selectedTimeslot.value,
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.more_time,
                                                  color: Colors.black,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                border: InputBorder.none,
                                              ),
                                              hint: Text('Select Your Slots'),
                                              items:
                                                  _nurseAppointmentDetailController
                                                      .timeslot
                                                      .map((TimeSlot timeslot) {
                                                return DropdownMenuItem(
                                                  value: timeslot,
                                                  child: Text(
                                                    timeslot.slotTime
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.height * 0.015,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (TimeSlot? newValue) {
                                                _nurseAppointmentDetailController
                                                    .selectedTimeslot
                                                    .value = newValue!;
                                                // _nurseBooking1Controller.selectedCity.value = null;
                                                // _hospital_2_controller.states.value =
                                                //     newValue! as List<String>;
                                                // _hospital_2_controller.selectedCity.value = null;
                                                // _hospital_2_controller.cities.clear();
                                                // _hospital_2_controller.cities
                                                //     .addAll(stateCityMap[newvalue]!);
                                              }),
                                        ),
                                      ),
                                    ),
                                    // ListView.builder(
                                    //     shrinkWrap: true,
                                    //     scrollDirection: Axis.horizontal,
                                    //     itemCount: 32,
                                    //     itemBuilder: (BuildContext context, int index) {
                                    //       return Padding(
                                    //         padding: const EdgeInsets.all(3.0),
                                    //         child: PhysicalModel(
                                    //           color: MyTheme.white,
                                    //           borderRadius: BorderRadius.circular(5),
                                    //           elevation: 20,
                                    //           child: Padding(
                                    //             padding: EdgeInsets.symmetric(
                                    //                 horizontal: size.width * 0.01,
                                    //                 vertical: size.height * 0.004),
                                    //             child: Container(
                                    //               //height: size.height * 0.025,
                                    //               width: size.width * 0.17,
                                    //               decoration: BoxDecoration(
                                    //                 color: MyTheme.ThemeColors,
                                    //                 borderRadius: BorderRadius.circular(5),
                                    //               ),
                                    //               child: Column(
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment.center,
                                    //                 children: [
                                    //                   Text(
                                    //                     'MAR',
                                    //                     style: TextStyle(
                                    //                       fontSize: size.height * 0.015,
                                    //                       fontWeight: FontWeight.w600,
                                    //                       color: Colors.white,
                                    //                     ),
                                    //                   ),
                                    //                   SizedBox(
                                    //                     height: size.height * 0.01,
                                    //                   ),
                                    //                   Text(
                                    //                     '${index}',
                                    //                     style: TextStyle(
                                    //                       fontSize: size.height * 0.016,
                                    //                       fontWeight: FontWeight.w600,
                                    //                       color: Colors.white,
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       );
                                    //     }),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.002,
                                  ),
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
                                    height: size.height * 0.004,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.20,
                                    child: Obx(
                                      () => (_nurseAppointmentDetailController
                                                  .isLoading.value &&
                                              _nurseviewssRatingReviewController
                                                  .isLoading.value)
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : SizedBox(
                                              height: size.height * 0.13,
                                              width: size.width * 0.95,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  //scrollDirection: Axis.horizontal,
                                                  itemCount:
                                                      _nurseviewssRatingReviewController
                                                          .nurseviewreview
                                                          ?.rating
                                                          ?.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Ink(
                                                            child:
                                                                PhysicalModel(
                                                              color:
                                                                  MyTheme.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              elevation: 20,
                                                              child: Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        size.width *
                                                                            0.01,
                                                                    vertical: size
                                                                            .height *
                                                                        0.003),
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      size.height *
                                                                          0.11,
                                                                  width:
                                                                      size.width *
                                                                          0.9,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: MyTheme
                                                                        .ThemeColors,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
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
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Container(
                                                                              height: size.height * 0.08,
                                                                              width: size.width * 0.2,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.red,
                                                                              ),
                                                                              child: Image.network(
                                                                                '$base${_nurseviewssRatingReviewController.nurseviewreview?.rating?[index].image.toString()}',
                                                                                //base+'${_userhomePageController.banerlistmodel!.bannerImageList![index].toString()}',
                                                                                fit: BoxFit.fill,
                                                                                errorBuilder: (context, error, stackTrace) {
                                                                                  //if image not comming in catagary then we have to purchase

                                                                                  return Center(
                                                                                    child: Text(
                                                                                      'No Image',
                                                                                      style: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: size.height * 0.013,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                "${_nurseviewssRatingReviewController.nurseviewreview?.rating?[index].name}",
                                                                                style: TextStyle(
                                                                                  fontSize: size.height * 0.016,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: size.height * 0.035,
                                                                                width: size.width * 0.5,
                                                                                child: Text(
                                                                                  "${_nurseviewssRatingReviewController.nurseviewreview?.rating?[index].description}",
                                                                                  style: TextStyle(
                                                                                    fontSize: size.height * 0.013,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    "Rating:",
                                                                                    style: TextStyle(
                                                                                      fontSize: size.height * 0.016,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      color: Colors.brown,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    "${_nurseviewssRatingReviewController.nurseviewreview?.rating?[index].rating.toString()}",
                                                                                    style: TextStyle(
                                                                                      fontSize: size.height * 0.016,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      color: Colors.red,
                                                                                    ),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.star,
                                                                                    color: Colors.yellow,
                                                                                    size: size.height * 0.02,
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.9,
                        //bottom: size.height * 0.00,
                        left: size.width * 0.0,
                        right: size.width * 0.00,
                        bottom: 0.005,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.2),
                          child: ElevatedButton(
                            onPressed: () {
                              CallLoader.loader();
                              _nurseAppointmentDetailController.checkNurse2();
                              //Get.to(() => AppointmentCheckout());
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

                          // Container(
                          //   height: 50.0,
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: new BorderRadius.circular(10.0),
                          //         ),
                          //         elevation: 0,
                          //         backgroundColor: Colors.white,
                          //         padding:
                          //             EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          //         textStyle: TextStyle(
                          //             fontSize: size.height * 0.017,
                          //             fontWeight: FontWeight.bold)),
                          //     clipBehavior: Clip.none,
                          //     onPressed: () {},
                          //     //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          //     //padding: EdgeInsets.all(0.0),
                          //     child: Ink(
                          //       decoration: BoxDecoration(
                          //           gradient: LinearGradient(
                          //             colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          //             begin: Alignment.centerLeft,
                          //             end: Alignment.centerRight,
                          //           ),
                          //           borderRadius: BorderRadius.circular(10.0)),
                          //       child: Container(
                          //         constraints:
                          //             BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          //         alignment: Alignment.center,
                          //         child: Text(
                          //           "Book an Appointment",
                          //           textAlign: TextAlign.center,
                          //           style: TextStyle(color: Colors.white),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  ),
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
                      controller: _nurseRatingReviewController.name,
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
                      controller: _nurseRatingReviewController.description,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Description"),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   height: 50,
                //   width: 300,
                //   decoration: BoxDecoration(
                //       border: Border.all(),
                //       borderRadius: BorderRadius.circular(5)),
                //   child: Padding(
                //     padding: EdgeInsets.only(left: 8.0),
                //     child: TextFormField(
                //       inputFormatters: [
                //         LengthLimitingTextInputFormatter(10),
                //       ],
                //       controller: _nurseRatingReviewController.mobile,
                //       keyboardType: TextInputType.phone,
                //       decoration: InputDecoration(
                //           border: InputBorder.none, hintText: "Mobile Number"),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  // () => _controller.selectedPath.value != ''
                  () => _nurseRatingReviewController.selectedPath.value != ''
                      ? InkWell(
                          onTap: optionsImage,
                          child: Image.file(
                            File(_nurseRatingReviewController
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
            _nurseRatingReviewController.ratings.value = response.rating;
            if (_nurseRatingReviewController.ratings.value == 1) {
              _nurseRatingReviewController.rating1.value = true;
            } else if (_nurseRatingReviewController.ratings.value == 2) {
              _nurseRatingReviewController.rating1.value = true;
              _nurseRatingReviewController.rating2.value = true;
            } else if (_nurseRatingReviewController.ratings.value == 3) {
              _nurseRatingReviewController.rating1.value = true;
              _nurseRatingReviewController.rating2.value = true;
              _nurseRatingReviewController.rating3.value = true;
            } else if (_nurseRatingReviewController.ratings.value == 4) {
              _nurseRatingReviewController.rating1.value = true;
              _nurseRatingReviewController.rating2.value = true;
              _nurseRatingReviewController.rating3.value = true;
              _nurseRatingReviewController.rating4.value = true;
            } else if (_nurseRatingReviewController.ratings.value == 5) {
              _nurseRatingReviewController.rating1.value = true;
              _nurseRatingReviewController.rating2.value = true;
              _nurseRatingReviewController.rating3.value = true;
              _nurseRatingReviewController.rating4.value = true;
              _nurseRatingReviewController.rating5.value = true;
            }
            _nurseRatingReviewController.addNurseProductReviewApi();

            // accountService.getAccountData.then((accountData) {
            //   Timer(
            //     const Duration(milliseconds: 900),
            //     () {
            //       _nurseviewssRatingReviewController.update();
            //       _nurseviewssRatingReviewController.nursereviewratingApi();
            //
            //       Get.offAll(() => NurseDetailsSchedulePage());
            //       //Get.to((page))
            //       ///
            //     },
            //   );
            // });
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
                _nurseRatingReviewController.getImage(ImageSource.camera);
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
                _nurseRatingReviewController.getImage(ImageSource.gallery);
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
