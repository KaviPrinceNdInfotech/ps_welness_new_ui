import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../../controllers/9_doctor_controllers_RRR/doctor_home_controller/doctor_home_controllers.dart';

class AppointmentDetails extends StatelessWidget {
  AppointmentDetails({Key? key}) : super(key: key);
  DoctorHomepageController _doctorHomepageController =
      Get.put(DoctorHomepageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              lightPrimary,
              darkPrimary,
            ])),
        child: Scaffold(
            backgroundColor: Colors.grey.shade100,
            resizeToAvoidBottomInset: false,
            body: Obx(
              () => _doctorHomepageController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            elevation: 1,
                            child: Container(
                              height: size.height * 0.18,
                              decoration: BoxDecoration(
                                color: MyTheme.ThemeColors,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.015),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                              height: size.height * 0.035,
                                              width: size.width * 0.08,
                                              decoration: const BoxDecoration(
                                                color: Colors.white70,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.arrow_back_ios_outlined,
                                                size: size.height * 0.025,
                                              )),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Text(
                                          'See Your upcoming Appointment',
                                          style: TextStyle(
                                            color: MyTheme.blueww,
                                            fontSize: size.width * 0.045,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: size.height * 0.06,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        color: Colors.white),
                                    width: size.width,
                                    // height: size.height * 0.06,
                                    margin: const EdgeInsets.fromLTRB(
                                        20, 20, 15, 10),
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 12, 8, 8),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          splashColor: Colors.transparent),
                                      child: TextField(
                                        autofocus: false,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: MyTheme.blueww),
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.search),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Search name',
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0,
                                              bottom: 1.0,
                                              top: 0.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(25.7),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(25.7),
                                          ),
                                        ),
                                        onChanged: (value) =>
                                            _doctorHomepageController
                                                .filterdrApointmentProducts(
                                                    value),
                                        // onChanged: (value) =>
                                        //     doctorHomepageController
                                        //         .filterProducts(value),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _doctorHomepageController
                                  .founddoctoraptProducts.value.isEmpty
                              ? const Center(child: Text("No Result Found"))
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _doctorHomepageController
                                          .founddoctoraptProducts.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.005,
                                              horizontal: size.width * 0.01),
                                          child: Material(
                                            elevation: 5,
                                            child: Container(
                                              height: size.height * 0.13,
                                              decoration: BoxDecoration(
                                                color: MyTheme.white,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                size.width *
                                                                    0.02),
                                                    child: Material(
                                                      elevation: 9,
                                                      child: Container(
                                                        width:
                                                            size.width * 0.25,
                                                        height:
                                                            size.height * 0.11,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .cyanAccent,
                                                                    width: 1.3),
                                                                image:
                                                                    const DecorationImage(
                                                                  image: NetworkImage(
                                                                      'https://images.unsplash.com/photo-1599493758267-c6c884c7071f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.37,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "${_doctorHomepageController.founddoctoraptProducts?[index].doctorName}",
                                                          style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.02,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                MyTheme.blueww,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${_doctorHomepageController.founddoctoraptProducts?[index].disease}",
                                                          style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.016,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors
                                                                .red.shade300,
                                                          ),
                                                        ),
                                                        //Spacer(),
                                                        Text(
                                                          "${_doctorHomepageController.founddoctoraptProducts?[index].location}",
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.015,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const Icon(
                                                          Icons.calendar_today),
                                                      Text(
                                                        "${_doctorHomepageController.founddoctoraptProducts?[index].startTime}",
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.016,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      //Spacer(),
                                                      Text(
                                                        '12 am',
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.017,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                        ],
                      ),
                    ),
            )));
  }
}
//#00caf7
