import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';
//import 'package:ps_welness/controllers/1_user_view_controller/health_checkup_controllersss/health_checkup_listsss.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/health_checkup_controllersss/health_checkup_listsss.dart';
import '../../book__schealthcheckup_shedule/book_checkup_schedule.dart';
//import 'package:ps_welness/modules_view/1_user_section_views/health_checkup/book_lab_schedule/book_checkup_schedule.dart';

class HealthChkpEnquiryList extends StatelessWidget {
  HealthChkpEnquiryList({Key? key}) : super(key: key);

  final HealthCheckupController _healthCheckupController =
      Get.put(HealthCheckupController());

  ///.............checkup-list.........
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Obx(
        () =>
        (_healthCheckupController.isLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
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
                            'Search Checkup Center',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.02),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(
                              const Radius.circular(30.0)),
                          color: Colors.white),
                      width: size.width * 0.93,
                      height: size.height * 0.064,
                      margin: const EdgeInsets.fromLTRB(15, 20, 10, 20),
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child:
                            // (_nurseHistoryController.isLoading.value)
                            // ? Center(child: CircularProgressIndicator())
                            // :
                            TextField(
                              onChanged: (value) => _healthCheckupController.filterCheckupcenter(value),

                          // // controller: _nurseHistoryController
                          // //     .appointmentController1,
                          // onTap: () {
                          //   // _nurseHistoryController.chooseDate();
                          // },
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 15.0, color: MyTheme.blueww),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search Checkup Center',
                            contentPadding: const EdgeInsets.only(
                                left: 10.0, bottom: 12.0, top: 12.0),
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
                    // Obx(
                    //   () => (_healthCheckupController.isLoading.value)
                    //       ? Center(
                    //           child: CircularProgressIndicator(),
                    //         )
                    //       : _healthCheckupController.healthCheckupListss == null
                    _healthCheckupController.foundCheckupcenter.value.isEmpty
                     ? Center(
                                  child: Text("No List"),
                                )
                              : SizedBox(
                                 // height: size.height * 0.78,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:_healthCheckupController.foundCheckupcenter.length,

                                      // itemCount: _healthCheckupController
                                      //     .healthCheckupListss
                                      //     ?.healthCheckupList
                                      //     .length,
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
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    height: size.height * 0.17,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          height: size.height *
                                                              0.15,
                                                          width:
                                                              size.width * 0.05,
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
                                                              'Checkup Center Name:',
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
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.002,
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
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.002,
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
                                                              'City:',
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
                                                              'Landmark:',
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
                                                        _healthCheckupController.foundCheckupcenter[index].labName.toString(),

                                                              // _healthCheckupController
                                                              //     .healthCheckupListss!
                                                              //     .healthCheckupList[
                                                              //         index]
                                                              //     .labName
                                                              //     .toString(),
                                                              //'SKY Checkup Center',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize:
                                                                    size.width *
                                                                        0.033,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.48,
                                                              child: Text(
                                                                _healthCheckupController.foundCheckupcenter[index].locationName.toString(),

                                                                // _healthCheckupController
                                                                //     .healthCheckupListss!
                                                                //     .healthCheckupList[
                                                                //         index]
                                                                //     .locationName
                                                                //     .toString(),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,

                                                                //'Noida sector12,AK47',
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.033,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              _healthCheckupController.foundCheckupcenter[index].mobileNumber.toString(),

                                                              // _healthCheckupController
                                                              //     .healthCheckupListss!
                                                              //     .healthCheckupList[
                                                              //         index]
                                                              //     .mobileNumber
                                                              //     .toString(),
                                                              // '7877665430',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize:
                                                                    size.width *
                                                                        0.033,
                                                              ),
                                                            ),
                                                            Text(
                                                              _healthCheckupController.foundCheckupcenter[index].cityName.toString(),

                                                              // _healthCheckupController
                                                              //     .healthCheckupListss!
                                                              //     .healthCheckupList[
                                                              //         index]
                                                              //     .cityName
                                                              //     .toString(),

                                                              //'11 am to 6 pm',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize:
                                                                    size.width *
                                                                        0.033,
                                                              ),
                                                            ),
                                                            Text(
                                                              _healthCheckupController.foundCheckupcenter[index].location.toString(),
                                                              // _healthCheckupController
                                                              //     .healthCheckupListss!
                                                              //     .healthCheckupList[
                                                              //         index]
                                                              //     .location
                                                              //     .toString(),
                                                              //'Mon - Sun',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize:
                                                                    size.width *
                                                                        0.033,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Rs.${
                                                                  _healthCheckupController.foundCheckupcenter[index].testAmt

                                                              // _healthCheckupController.healthCheckupListss?.healthCheckupList[index].testAmt.toDouble()
                                                              }',
                                                              //' 300',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                color: Colors
                                                                    .black,
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
                                                  //Spacer(),

                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: PhysicalModel(
                                                        elevation: 15,
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Get.to(() =>
                                                                CheckupSchedulePage());
                                                          },
                                                          child: Container(
                                                              height:
                                                                  size.height *
                                                                      0.036,
                                                              width:
                                                                  size.width *
                                                                      0.25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                          .red
                                                                          .shade200,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomRight:
                                                                            Radius.circular(10),
                                                                        topLeft:
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
                                                                      color: MyTheme
                                                                          .blueww,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    Icons.add,
                                                                    size: size
                                                                            .height *
                                                                        0.02,
                                                                  ),
                                                                ],
                                                              ))),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })),

                  ],
                ),
              ),
      ),
    );
  }
}
