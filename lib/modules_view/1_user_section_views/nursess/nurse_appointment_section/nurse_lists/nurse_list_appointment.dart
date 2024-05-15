import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/nurse_list_user_list_controller/nurse_list_user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/rating_review_controller/rating_review_nurse_controller.dart';
import '../../../../../controllers/4_nurse_controller_RRR/nurse_appointment_detail_controller/nurse_appointment_detailsss.dart';
import '../../../../../utils/services/account_service.dart';
import '../../../../../widgets/circular_loader.dart';
import '../../book_nurse_appointment1/nurse_booking_1.dart';
import '../nurse_detail_and_schedule/nurse_details_schedules.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/doctorss/appointment_section/detail_and_schedule/details_schedules.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/appointment_section/detail_and_schedule/details_schedules.dart';

class NurseListUser extends StatelessWidget {
  NurseListUser({Key? key}) : super(key: key);
  NurseUserListController _nurseUserListController =
      Get.put(NurseUserListController());
  final NurseAppointmentDetailController _nurseAppointmentDetailController =
      Get.put(NurseAppointmentDetailController());
  ReviewRatingNurseController _nurseviewssRatingReviewController =
      Get.put(ReviewRatingNurseController());
  // final NurseAppointmentDetailController _nurseAppointmentDetailController =
  //     Get.put(NurseAppointmentDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(NurseBoooking1());
        return shouldPop;
      },
      child: Scaffold(
        //NurseBoooking1
        //backgroundColor: Color(0xff11f2ec),
        body: Obx(
          () => (_nurseUserListController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              //     : _nurseAppointmentDetailController.nurseappointmentdetail != null
              // ? Center(
              //   child: Text('No Data'),
              // )
              : SafeArea(
                  child: SingleChildScrollView(
                    //physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.17,
                          color: Color(0xff11f2ec),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: size.height * 0.02,
                                ),

                                // SizedBox(
                                //   height: size.height * 0.05,
                                // ),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.04),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.offAll(NurseBoooking1());

                                            // Get.back();
                                          },
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: MyTheme.blueww,
                                            size: size.height * 0.027,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                          'Nurse List',
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: size.width * 0.06,
                                            color: MyTheme.blueww,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(30.0)),
                                      color: Colors.white),
                                  width: size.width * 0.9,
                                  height: size.height * 0.06,
                                  margin:
                                      new EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        splashColor: Colors.transparent),
                                    child: TextField(
                                      onChanged: (value) =>
                                          _nurseUserListController
                                              .filterNurse(value),
                                      autofocus: false,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: MyTheme.blueww),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.search),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Search Nurse..',
                                        contentPadding: const EdgeInsets.only(
                                            left: 10.0, bottom: 12.0, top: 6.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        _nurseUserListController.foundNurses.value.isEmpty
                            // Obx(
                            //   ()=> (_nurseAppointmentDetailController.isLoading.value)
                            //   ? Center(child: CircularProgressIndicator())
                            //   :_nurseAppointmentDetailController?.nurseappointmentdetail ==null
                            //   ?
                            ? Center(
                                child: Text('No List'),
                              )
                            : SizedBox(
                                height: size.height * 0.78,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _nurseUserListController
                                        .foundNurses.length,

                                    ///shrinkWrap: true,
                                    // itemCount: _nurseAppointmentDetailController
                                    //     .nurseappointmentdetail
                                    //     ?.result
                                    //     ?.length,
                                    //6,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.00,
                                            vertical: size.height * 0.0),
                                        child: InkWell(
                                          onTap: () {
                                            ///Get.to(() => DoctorListUser());
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                size.height * 0.007),
                                            child: Container(
                                              height: size.height * 0.176,
                                              width: size.width * 0.15,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      size.width * 0.006),
                                              decoration: BoxDecoration(
                                                  color:
                                                      //MyTheme.ThemeColors,
                                                      Color(0xff11f2ec),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    const BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(3, 4),
                                                      blurRadius: 0,
                                                      spreadRadius: 0,
                                                    ),
                                                    const BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(0, -0),
                                                      blurRadius: 0,
                                                      spreadRadius: 0,
                                                    ),
                                                  ]),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SizedBox(
                                                    width: size.width * 0.24,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          //catimage[index], height: size.height * 0.08,
                                                          //productimage[index],
                                                          "lib/assets/icons/doctor1.png",
                                                          height: size.height *
                                                              0.12,
                                                        ),
                                                        Text(
                                                          " Fees:₹"
                                                          "${_nurseUserListController.foundNurses[index].fee}",
                                                          //     "${_nurseAppointmentDetailController
                                                          //     .nurseappointmentdetail
                                                          // !.result![index].totalFee
                                                          //     .toString()}"
                                                          // ",
                                                          //'Fees: ₹  600',
                                                          //doctorcatagary[index],
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                MyTheme.blueww,
                                                            fontSize:
                                                                size.width *
                                                                    0.03,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.06,
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.6,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${_nurseUserListController.foundNurses[index].nurseName}",
                                                          // _nurseAppointmentDetailController
                                                          //     .nurseappointmentdetail
                                                          //     !.result![index].patientName.toString(),
                                                          //'Mrs Alex',
                                                          //doctorcatagary[index],
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                MyTheme.blueww,
                                                            fontSize:
                                                                size.height *
                                                                    0.022,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.4,
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
                                                                style:
                                                                    GoogleFonts
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
                                                                          0.017,
                                                                ),
                                                              ),
                                                              Text(
                                                                "${_nurseUserListController.foundNurses[index].rating ?? 0}",

                                                                //'0.0',

                                                                //'${_doctorListController.foundDoctors[index].experience} yr',
                                                                //doctorcatagary[index],
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    GoogleFonts
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
                                                                          0.02,
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
                                                        Text(
                                                          "${_nurseUserListController.foundNurses[index].nurseTypeName}",

                                                          // _nurseAppointmentDetailController
                                                          //     .nurseappointmentdetail
                                                          // !.result![index].nurseId.toString(),
                                                          //'ANM',
                                                          //doctorcatagary[index],
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors
                                                                .grey.shade700,
                                                            fontSize:
                                                                size.height *
                                                                    0.017,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Experenced: '
                                                          '${_nurseUserListController.foundNurses[index].experience} (in year)',
                                                          //doctorcatagary[index],
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: MyTheme
                                                                .containercolor14,
                                                            fontSize:
                                                                size.height *
                                                                    0.017,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        PhysicalModel(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: InkWell(
                                                            ///from here save id through share preference
                                                            onTap: () async {
                                                              SharedPreferences
                                                                  prefs =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              prefs.setString(
                                                                  "NurseuserListId",
                                                                  "${_nurseUserListController.foundNurses[index].id.toString()}");
                                                              prefs.setString(
                                                                  "Nurseuserfees",
                                                                  "${_nurseUserListController.foundNurses[index].fee?.toDouble()}");
                                                              _nurseAppointmentDetailController
                                                                  .nursedetailApi();
                                                              _nurseAppointmentDetailController
                                                                  .update();
                                                              _nurseAppointmentDetailController
                                                                  .refresh();
                                                              _nurseviewssRatingReviewController
                                                                  .nursereviewratingApi();
                                                              _nurseviewssRatingReviewController
                                                                  .update();

                                                              ///from here we can go to next screen with some time ....
                                                              await accountService
                                                                  .getAccountData
                                                                  .then(
                                                                      (accountData) {
                                                                Timer(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          1200),
                                                                  () async {
                                                                    _nurseAppointmentDetailController
                                                                        .nursedetailApi();
                                                                    _nurseAppointmentDetailController
                                                                        .update();
                                                                    CallLoader
                                                                        .loader();
                                                                    await Future.delayed(Duration(
                                                                        seconds:
                                                                            2));
                                                                    CallLoader
                                                                        .hideLoader();
                                                                    // await Get.to(DoctorSignup2());
                                                                    await Get.offAll(
                                                                        () =>
                                                                            NurseDetailsSchedulePage());
                                                                    //Get.to((page))
                                                                    ///
                                                                  },
                                                                );
                                                              });
                                                              //nurseappointmentApi
                                                              // Get.to(() => NurseDetailsSchedulePage());
                                                              //Get.to(() => AppointmentCheckout());
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height *
                                                                      0.045,
                                                              width:
                                                                  size.width *
                                                                      0.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: MyTheme
                                                                    .containercolor17,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  'Make an Appointment',
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
                                                                    color: MyTheme
                                                                        .white,
                                                                    fontSize:
                                                                        size.height *
                                                                            0.017,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: size.height *
                                                              0.004,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
