import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/doctor_rating_review_controller/doctor_view_ratting_review.dart';
import 'package:ps_welness_new_ui/controllers/1_user_view_controller/doctor_sections/get_doctor_list_controller.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/doctorss/appointment_section/detail_and_schedule/details_schedules.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/doctorss/doctor_address/doctor_address.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants/my_theme.dart';
import '../../../../../utils/services/account_service.dart';
import '../../../../../widgets/circular_loader.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/doctorss/appointment_section/detail_and_schedule/details_schedules.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/appointment_section/detail_and_schedule/details_schedules.dart';

class DoctorListUser extends StatelessWidget {
  DoctorListUser({Key? key}) : super(key: key);

  DoctorListController _doctorListController = Get.put(DoctorListController());
  ViewdoctorreviewController _viewdoctorreviewController =
      Get.put(ViewdoctorreviewController());

  @override
  //DoctorAddress
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    // Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(DoctorAddress());
        return shouldPop;
      },
      child: Scaffold(
        //backgroundColor: Color(0xff11f2ec),
        body: Obx(
          () => (_doctorListController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
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
                                          Get.offAll(DoctorAddress());
                                          //Get.back();
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
                                        'Doctors',
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
                                margin: new EdgeInsets.fromLTRB(20, 20, 20, 20),
                                padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      splashColor: Colors.transparent),
                                  child: TextField(
                                    onChanged: (value) => _doctorListController
                                        .filterDoctor(value),
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 15.0, color: MyTheme.blueww),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Search Doctor..',
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

                      //Obx(
                      // ()=> (_doctorListController.isLoading.value)
                      // ? Center(child: CircularProgressIndicator())
                      // :_doctorListController.doctorListUser == null
                      // ? Center(
                      //   child: Text('No data'),
                      // )
                      // :

                      _doctorListController.foundDoctors.value.isEmpty
                          ? Center(
                              child: Text("No Doctor Found"),
                            )
                          : SizedBox(
                              height: size.height * 0.73,
                              child: ListView.builder(

                                  ///shrinkWrap: true,
                                  itemCount:
                                      _doctorListController.foundDoctors.length,
                                  //_doctorListController.doctorListUser?.getDoctor?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.00,
                                          vertical: size.height * 0.0),
                                      child: InkWell(
                                        onTap: () {
                                          //Get.to(() => DoctorListUser());
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              size.height * 0.007),
                                          child: Container(
                                            height: size.height * 0.17,
                                            width: size.width * 0.15,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.006),
                                            decoration: BoxDecoration(
                                                color: Color(0xff11f2ec),
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
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  width: size.width * 0.25,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        //catimage[index], height: size.height * 0.08,
                                                        //productimage[index],
                                                        "lib/assets/icons/doctor1.png",
                                                        height:
                                                            size.height * 0.12,
                                                      ),
                                                      Text(
                                                        'Fees: ₹ ${_doctorListController.foundDoctors[index].fee}',
                                                        //'${_doctorListController.doctorListUser?.getDoctor![index].fee.toString()}'
                                                        //doctorcatagary[index],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: MyTheme.blueww,
                                                          fontSize: size.width *
                                                              0.029,
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
                                                        "${_doctorListController.foundDoctors[index].doctorName}",
                                                        // _doctorListController.doctorListUser!.getDoctor![index].doctorName.toString(),
                                                        // _doctorListController.doctorListUser?.getDoctor![index].fee.toString(),
                                                        // 'Kumar Prince',
                                                        //doctorcatagary[index],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: MyTheme.blueww,
                                                          fontSize:
                                                              size.height *
                                                                  0.022,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: size.width * 0.4,
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
                                                                        0.017,
                                                              ),
                                                            ),
                                                            Text(
                                                              "${_doctorListController.foundDoctors[index].rating ?? 0}",

                                                              // '0.0',

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
                                                        "${_doctorListController.foundDoctors[index].departmentName}",
                                                        // _doctorListController.doctorListUser!.getDoctor![index].departmentName.toString(),
                                                        //'Cardiologist',
                                                        //doctorcatagary[index],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.poppins(
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
                                                        '${_doctorListController.foundDoctors[index].experience} yr',
                                                        //doctorcatagary[index],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.poppins(
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
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            SharedPreferences
                                                                prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            prefs.setString(
                                                                "DoctorListId",
                                                                "${_doctorListController.foundDoctors[index].id.toString()}");
                                                            prefs.setString(
                                                                "DoctorListFees",
                                                                "${_doctorListController.foundDoctors[index].fee.toString()}");
                                                            _doctorListController
                                                                .doctordetailApi();
                                                            _doctorListController
                                                                .update();
                                                            CallLoader.loader();
                                                            await Future
                                                                .delayed(
                                                                    Duration(
                                                                        seconds:
                                                                            1));
                                                            CallLoader
                                                                .hideLoader();

                                                            ///from here we can go to next screen with some time ....
                                                            accountService
                                                                .getAccountData
                                                                .then(
                                                                    (accountData) {
                                                              Timer(
                                                                const Duration(
                                                                    milliseconds:
                                                                        0),
                                                                () async {
                                                                  _viewdoctorreviewController
                                                                      .doctorreviewratingApi();
                                                                  _viewdoctorreviewController
                                                                      .update();
                                                                  _doctorListController
                                                                      .slotdoctortimingApi();
                                                                  _doctorListController
                                                                      .update();
                                                                  await _doctorListController
                                                                      .slotdoctortimingApi();
                                                                  _doctorListController
                                                                      .update();

                                                                  _doctorListController
                                                                      .clearSelectedSlot();
                                                                  await Future.delayed(
                                                                      Duration(
                                                                          milliseconds:
                                                                              1000));
                                                                  await Get.offAll(
                                                                      () =>
                                                                          DetailsSchedulePage());
                                                                  await Future.delayed(
                                                                      Duration(
                                                                          milliseconds:
                                                                              10));

                                                                  // await _doctorListController
                                                                  //     .slotdoctortimingApi();
                                                                  // _doctorListController
                                                                  //.update();
                                                                  //Get.to((page))
                                                                  ///
                                                                },
                                                              );
                                                            });
                                                          },
                                                          child: Container(
                                                            height:
                                                                size.height *
                                                                    0.045,
                                                            width: size.width *
                                                                0.5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: MyTheme
                                                                  .containercolor4,
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
                                                                style:
                                                                    GoogleFonts
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
                                                        height:
                                                            size.height * 0.004,
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
                      //),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
