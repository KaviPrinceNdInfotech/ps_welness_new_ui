import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/lab_rating_review_controller/lab_view_ratting_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../constants/my_theme.dart';
import '../../../../controllers/1_user_view_controller/lab_controller/lab_list_controller.dart';
import '../../../../utils/services/account_service.dart';
import '../lab_booking_view/lab_booking_schedule.dart';

class LabListPage extends StatelessWidget {
  LabListPage({Key? key}) : super(key: key);
  LabListController _labListController = Get.put(LabListController());
  ViewlabreviewController _viewlabreviewController =
      Get.put(ViewlabreviewController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Obx(
        () => (_labListController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.height * 0.02),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: size.width * 0.05,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Text(
                              'Search Lab List.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.02),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(30.0)),
                                color: Colors.white),
                            width: size.width * 0.93,
                            height: size.height * 0.06,
                            margin: new EdgeInsets.fromLTRB(15, 20, 10, 20),
                            padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(splashColor: Colors.transparent),
                              child:
                                  // (_nurseHistoryController.isLoading.value)
                                  // ? Center(child: CircularProgressIndicator())
                                  // :
                                  TextField(
                                onChanged: (value) =>
                                    _labListController.filterProduct(value),
                                // controller: _nurseHistoryController
                                //     .appointmentController1,
                                onTap: () {
                                  // _nurseHistoryController.chooseDate();
                                },
                                autofocus: false,

                                style: TextStyle(
                                    fontSize: 15.0, color: MyTheme.blueww),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  suffixIcon:
                                      Icon(Icons.home_repair_service_outlined),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Search lab..',
                                  contentPadding: const EdgeInsets.only(
                                      left: 10.0, bottom: 12.0, top: 4.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   height: size.height * 0.06,
                          //   width: size.width * 0.2,
                          //   decoration: BoxDecoration(
                          //     color: MyTheme.blueww,
                          //     borderRadius: BorderRadius.circular(30),
                          //   ),
                          //   child: Center(
                          //       child: Text(
                          //     'Search',
                          //     style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: size.width * 0.035,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   )),
                          // ),
                        ],
                      ),

                      ///.....................................................................

                      // Obx(
                      //   () => (_labListController.isLoading.value)
                      //       ? Center(child: CircularProgressIndicator())
                      //       : _labListController.labListUser == null
                      _labListController.foundlabProducts.value.isEmpty
                          ? Center(
                              child: Text('No List'),
                            )
                          : SizedBox(
                              height: size.height * 0.78,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _labListController
                                      .foundlabProducts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.03,
                                          vertical: size.height * 0.0005),
                                      child: Container(
                                        height: size.height * 0.22,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 30 / 6),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                lightPrimary,
                                                darkPrimary,
                                              ]),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(-0, -0),
                                              spreadRadius: 0,
                                              blurRadius: 0,
                                              color: darkShadow,
                                            ),
                                            BoxShadow(
                                              offset: Offset(3, 3),
                                              spreadRadius: 0,
                                              blurRadius: 0,
                                              color: lightShadow,
                                            ),
                                          ],
                                          // image: DecorationImage(
                                          //     image: NetworkImage(
                                          //         'https://images.unsplash.com/photo-1615631648086-325025c9e51e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                          //         //'https://images.unsplash.com/photo-1587854680352-936b22b91030?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fG1lZGljaW5lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                          //         // 'https://images.unsplash.com/photo-1515350540008-a3f566782a3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
                                          //         //  'https://images.unsplash.com/photo-1563213126-a4273aed2016?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                                          //         //'https://images.unsplash.com/photo-1471864190281-a93a3070b6de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
                                          //         //'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVkaWNpbmV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'
                                          //         //'https://images.unsplash.com/photo-1576073719676-aa95576db207?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1673&q=80'
                                          //         // 'lib/assets/background_stack_png/patient3_history.png'
                                          //         ),
                                          //     fit: BoxFit.cover)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: size.height * 0.184,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          size.width * 0.02,
                                                      vertical:
                                                          size.height * 0.01),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    // crossAxisAlignment:
                                                    //     CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height:
                                                            size.height * 0.15,
                                                        width: size.width * 0.3,
                                                        //color: Colors.orange,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'lib/assets/background_stack_png/lab_equi1.png'),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: SizedBox(
                                                            width: size.width *
                                                                0.3,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'Rating: ',

                                                                  //'${_doctorListController.foundDoctors[index].experience} yr',
                                                                  //doctorcatagary[index],
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade900,

                                                                    //MyTheme
                                                                    //.containercolor2,
                                                                    fontSize:
                                                                        size.height *
                                                                            0.016,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  _labListController
                                                                      .foundlabProducts[
                                                                          index]
                                                                      .rating
                                                                      .toString(),
                                                                  //'0.0',

                                                                  //'${_doctorListController.foundDoctors[index].experience} yr',
                                                                  //doctorcatagary[index],
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .red
                                                                        .shade600,

                                                                    //MyTheme
                                                                    //.containercolor2,
                                                                    fontSize:
                                                                        size.height *
                                                                            0.017,
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .yellow
                                                                      .shade800,
                                                                  size:
                                                                      size.height *
                                                                          0.025,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Lab Name:',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: MyTheme
                                                                  .blueww,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Address:',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: MyTheme
                                                                  .blueww,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Contact No:',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: MyTheme
                                                                  .blueww,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Time:',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: MyTheme
                                                                  .blueww,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Working day:',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: MyTheme
                                                                  .blueww,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Fees:',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: MyTheme
                                                                  .blueww,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            _labListController
                                                                .foundlabProducts[
                                                                    index]
                                                                .labName
                                                                .toString(),
                                                            // _labListController
                                                            //     .labListUser!
                                                            //     .labList[
                                                            //         index]
                                                            //     .labName,
                                                            // 'Vineet ji Lab',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          Text(
                                                            _labListController
                                                                .foundlabProducts[
                                                                    index]
                                                                .location
                                                                .toString(),
                                                            // _labListController
                                                            //     .labListUser!
                                                            //     .labList[
                                                            // index].location,
                                                            style: GoogleFonts
                                                                .roboto(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          Text(
                                                            _labListController
                                                                .foundlabProducts[
                                                                    index]
                                                                .mobileNumber
                                                                .toString(),

                                                            // _labListController
                                                            //     .labListUser!
                                                            //     .labList[
                                                            //         index]
                                                            //     .mobileNumber,
                                                            //'8977665431',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          Text(
                                                            _labListController
                                                                .foundlabProducts[
                                                                    index]
                                                                .openingHours
                                                                .toString(),
                                                            // _labListController
                                                            //     .labListUser!
                                                            //     .labList[
                                                            //         index]
                                                            //     .openingHours,
                                                            //'10 am to 6 pm',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          Text(
                                                            _labListController
                                                                .foundlabProducts[
                                                                    index]
                                                                .workingDay
                                                                .toString(),
                                                            // _labListController
                                                            //     .labListUser!
                                                            //     .labList[
                                                            // index]
                                                            //     .workingDay,
                                                            //'Mon - Sat',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),

                                                          Text(
                                                            'Rs.${_labListController.foundlabProducts[index].fee?.toDouble() ?? 0
                                                            //     _labListController
                                                            //     .labListUser!
                                                            //     .labList[
                                                            // index]
                                                            //     .fee
                                                            }',
                                                            //'700',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize:
                                                                  size.width *
                                                                      0.033,
                                                            ),
                                                          ),
                                                          // Align(
                                                          //     alignment: Alignment.centerRight,
                                                          //     child:
                                                          //         Icon(Icons.access_time_outlined)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              //Spacer(),
                                              Row(
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: PhysicalModel(
                                                        elevation: 15,
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            SharedPreferences
                                                                prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            prefs.setString(
                                                                "LablistssId",
                                                                "${_labListController.foundlabProducts[index].id.toString()}");
                                                            prefs.setString(
                                                                "Labfeess",
                                                                "${_labListController.foundlabProducts[index].fee?.toDouble()}");
                                                            _labListController
                                                                .labdetailApi();
                                                            _labListController
                                                                .update();
                                                            _viewlabreviewController
                                                                .labreviewratingApi();
                                                            _viewlabreviewController
                                                                .update();
                                                            accountService
                                                                .getAccountData
                                                                .then(
                                                                    (accountData) {
                                                              Timer(
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                                () {
                                                                  _viewlabreviewController
                                                                      .labreviewratingApi();
                                                                  _viewlabreviewController
                                                                      .update();
                                                                  Get.to(() =>
                                                                      LabSchedule1Page());

                                                                  //Get.to((page))
                                                                  ///
                                                                },
                                                              );
                                                            });
                                                            // Get.to(() =>
                                                            //LabSchedule1Page());
                                                          },
                                                          child: Container(
                                                              height:
                                                                  size.height *
                                                                      0.036,
                                                              width:
                                                                  size.width *
                                                                      0.94,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: MyTheme
                                                                          .loginPageBoxColor,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomRight:
                                                                            Radius.circular(10),
                                                                        bottomLeft:
                                                                            Radius.circular(10),
                                                                      )),
                                                              //backgroundColor: Colors.white30,
                                                              child: Center(
                                                                  child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'BOOK NOW',
                                                                    style: GoogleFonts
                                                                        .alegreya(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                  // Icon(
                                                                  //   Icons.add,
                                                                  //   size: size.height * 0.02,
                                                                  // ),
                                                                ],
                                                              ))),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                      // ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
