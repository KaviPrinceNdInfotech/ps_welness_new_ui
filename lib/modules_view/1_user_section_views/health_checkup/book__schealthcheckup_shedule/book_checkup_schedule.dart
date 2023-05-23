import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rating_dialog/rating_dialog.dart';

//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/health_checkup/health_checkup_appointment_checkout/health_checkup_appointment_checkout.dart';

import '../../../../constants/my_theme.dart';
import '../../../../controllers/1_user_view_controller/health_checkup_controllersss/health_checkup_listsss.dart';
import '../../../../controllers/1_user_view_controller/health_chkp_post_review/health_chkp_post_review_controller.dart';
import '../../../../controllers/1_user_view_controller/health_chkp_view_review/health_chkp_view_review.dart';
import '../../../../widgets/circular_loader.dart';
import 'booking_health_checkup_components/health_checkup_credentials.dart';

class CheckupSchedulePage extends StatelessWidget {
  CheckupSchedulePage({Key? key, this.bevel = 2.0}) : super(key: key);
  final double bevel;
  final HealthCheckupController _healthCheckupController =
      Get.put(HealthCheckupController());
  ViewhealthchkpreviewController _viewhealthchkpreviewController =
      Get.put(ViewhealthchkpreviewController());
  HealthchkpRatingReviewController _healthchkpRatingReviewController =
      Get.put(HealthchkpRatingReviewController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var base = 'http://test.pswellness.in/Images/';

    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Obx(
        () => (_healthCheckupController.isLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
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
                                  height: size.height * 0.217,
                                  child: Image(
                                    image: AssetImage(
                                        'lib/assets/background_stack_png/n4.png'),
                                    fit: BoxFit.fill,
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
                              'Since '
                              '${_healthCheckupController.healthCheckupcheDetail?.year}',
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
                                  '${_healthCheckupController.healthCheckupcheDetail?.labName}',
                                  //'SRK Checkup',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.025,
                                    color: MyTheme.ThemeColors1,
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
                                        _viewhealthchkpreviewController
                                            .healthreviewratingApi();
                                        _viewhealthchkpreviewController
                                            .update();
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
                                  '${_healthCheckupController.healthCheckupcheDetail?.healthType}',

                                  //'All type of test available',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.02,
                                    color: Colors.orange.shade400,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: size.height * 0.009,
                              ),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${_healthCheckupController.healthCheckupcheDetail?.locationName}',

                                  //'Address: Noida sector 12 bloc AK47 776660',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.015,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${_healthCheckupController.healthCheckupcheDetail?.about}',

                                  // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
                                height: size.height * 0.00,
                              ),

                              HealthchkpScheduleCredentials(),

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
                              //   child: ListView.builder(
                              //       shrinkWrap: true,
                              //       scrollDirection: Axis.horizontal,
                              //       itemCount: 32,
                              //       itemBuilder: (BuildContext context, int index) {
                              //         return Padding(
                              //           padding: const EdgeInsets.all(3.0),
                              //           child: PhysicalModel(
                              //             color: MyTheme.white,
                              //             borderRadius: BorderRadius.circular(5),
                              //             elevation: 20,
                              //             child: Padding(
                              //               padding: EdgeInsets.symmetric(
                              //                   horizontal: size.width * 0.01,
                              //                   vertical: size.height * 0.004),
                              //               child: Container(
                              //                 //height: size.height * 0.025,
                              //                 width: size.width * 0.17,
                              //                 decoration: BoxDecoration(
                              //                   color: MyTheme.ThemeColors,
                              //                   borderRadius: BorderRadius.circular(5),
                              //                 ),
                              //                 child: Column(
                              //                   mainAxisAlignment:
                              //                       MainAxisAlignment.center,
                              //                   children: [
                              //                     Text(
                              //                       'MAR',
                              //                       style: TextStyle(
                              //                         fontSize: size.height * 0.015,
                              //                         fontWeight: FontWeight.w600,
                              //                         color: Colors.white,
                              //                       ),
                              //                     ),
                              //                     SizedBox(
                              //                       height: size.height * 0.01,
                              //                     ),
                              //                     Text(
                              //                       '${index}',
                              //                       style: TextStyle(
                              //                         fontSize: size.height * 0.016,
                              //                         fontWeight: FontWeight.w600,
                              //                         color: Colors.white,
                              //                       ),
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         );
                              //       }),
                              // ),
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
                                height: size.height * 0.16,
                                width: size.width * 0.95,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    //scrollDirection: Axis.horizontal,
                                    itemCount: _viewhealthchkpreviewController
                                        ?.healthchkpviewreview?.rating?.length,
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
                                                                  '$base${_viewhealthchkpreviewController?.healthchkpviewreview?.rating?[index].image.toString()}',
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
                                                                  "${_viewhealthchkpreviewController?.healthchkpviewreview?.rating?[index].name}",
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
                                                                    "${_viewhealthchkpreviewController?.healthchkpviewreview?.rating?[index].description}",
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
                                                                      "${_viewhealthchkpreviewController?.healthchkpviewreview?.rating?[index].rating.toString()}",
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
                              Spacer(),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.2,
                                    vertical: size.height * 0.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _healthCheckupController.checkuphealth2();

                                    // Get.to(() =>
                                    //     HealthCheckupAppointmentCheckout());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(0.0),
                                      ),
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  clipBehavior: Clip.none,
                                  child: Container(
                                    height: size.height * 0.045,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: bevel,
                                            color: Color(0xFFFFFFFFFF)),
                                        left: BorderSide(
                                            width: bevel,
                                            color: Color(0xFFFFFFFFFF)),
                                        right: BorderSide(
                                            width: bevel,
                                            color: Color(0xFFFF000000)),
                                        bottom: BorderSide(
                                            width: bevel,
                                            color: Color(0xFFFF000000)),
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        CallLoader.loader();
                                        _healthCheckupController
                                            .checkuphealth2();
                                        // Get.to(() =>
                                        // HealthCheckupAppointmentCheckout());
                                      },
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
                              Spacer(),
                              SizedBox(
                                height: size.height * 0.07,
                              ),
                            ],
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
                      controller: _healthchkpRatingReviewController.name,
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
                      controller: _healthchkpRatingReviewController.description,
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
                  () => _healthchkpRatingReviewController.selectedPath.value !=
                          ''
                      ? InkWell(
                          onTap: optionsImage,
                          child: Image.file(
                            File(_healthchkpRatingReviewController
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
            _healthchkpRatingReviewController.ratings.value = response.rating;
            if (_healthchkpRatingReviewController.ratings.value == 1) {
              _healthchkpRatingReviewController.rating1.value = true;
            } else if (_healthchkpRatingReviewController.ratings.value == 2) {
              _healthchkpRatingReviewController.rating1.value = true;
              _healthchkpRatingReviewController.rating2.value = true;
            } else if (_healthchkpRatingReviewController.ratings.value == 3) {
              _healthchkpRatingReviewController.rating1.value = true;
              _healthchkpRatingReviewController.rating2.value = true;
              _healthchkpRatingReviewController.rating3.value = true;
            } else if (_healthchkpRatingReviewController.ratings.value == 4) {
              _healthchkpRatingReviewController.rating1.value = true;
              _healthchkpRatingReviewController.rating2.value = true;
              _healthchkpRatingReviewController.rating3.value = true;
              _healthchkpRatingReviewController.rating4.value = true;
            } else if (_healthchkpRatingReviewController.ratings.value == 4) {
              _healthchkpRatingReviewController.rating1.value = true;
              _healthchkpRatingReviewController.rating2.value = true;
              _healthchkpRatingReviewController.rating3.value = true;
              _healthchkpRatingReviewController.rating4.value = true;
              _healthchkpRatingReviewController.rating5.value = true;
            }

            _healthchkpRatingReviewController.addHealthchkpReviewApi();
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
                _healthchkpRatingReviewController.getImage(ImageSource.camera);
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
                _healthchkpRatingReviewController.getImage(ImageSource.gallery);
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
