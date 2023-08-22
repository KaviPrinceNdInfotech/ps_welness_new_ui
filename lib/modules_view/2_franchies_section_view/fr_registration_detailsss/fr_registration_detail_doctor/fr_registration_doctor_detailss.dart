import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesDoctorDetail_controller.dart';

import '../../../../constants/my_theme.dart';

class ResitrationDoctorDetails extends StatelessWidget {
  ResitrationDoctorDetails({Key? key}) : super(key: key);

  FrenchiesDoctorDetailController _frenchiesDoctorDetailController =
      Get.put(FrenchiesDoctorDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => _frenchiesDoctorDetailController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _frenchiesDoctorDetailController
                          .getfrenchiesDoctorDetailModel?.doctorRegDetail ==
                      null
                  ? SizedBox(
                      height: size.height,
                      child: Center(child: Text('No List')))
                  : SingleChildScrollView(
                      child: SafeArea(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -size.height * 0.01,
                              right: size.width * 0.0,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: size.height * 0.3,
                                  width: size.width * 0.3,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'lib/assets/background_stack_png/doctors.png',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.01),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          height: size.height * 0.03,
                                          width: size.width * 0.1,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white70,
                                          ),
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            size: size.height * 0.022,
                                            color: MyTheme.blueww,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.03,
                                      ),
                                      Text(
                                        'Doctor',
                                        style: GoogleFonts.alatsi(
                                            fontSize: size.height * 0.032,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff023382)),
                                      ),
                                    ],
                                  ),
                                ),
                                //Spacer(),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.01),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: new BoxDecoration(
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(30.0)),
                                            color: Colors.white70),
                                        width: size.width * 0.45,
                                        height: size.height * 0.06,
                                        margin: new EdgeInsets.fromLTRB(
                                            10, 20, 10, 20),
                                        padding:
                                            new EdgeInsets.fromLTRB(5, 8, 8, 8),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              splashColor: Colors.transparent),
                                          child: TextField(
                                            onChanged: (value) =>
                                                _frenchiesDoctorDetailController
                                                    .filterPaymentNurse(value),
                                            autofocus: false,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: MyTheme.blueww),
                                            decoration: InputDecoration(
                                              //prefixIcon: Icon(Icons.search),
                                              filled: true,
                                              fillColor: Colors.white70,
                                              hintText: 'Enter Doctor Name',
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 10.0,
                                                      bottom: 14.0,
                                                      top: 0.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(25.7),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(25.7),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      PhysicalModel(
                                        color: Colors.green,
                                        elevation: 10,
                                        borderRadius: BorderRadius.circular(20),
                                        shadowColor: Colors.grey,
                                        child: Container(
                                          height: size.height * 0.055,
                                          width: size.width * 0.16,
                                          decoration: BoxDecoration(
                                            color: MyTheme.white,
                                            //color: Colors.white70,
                                            //gradient: MyTheme.gradient1,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Search',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: size.width * 0.03,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                _frenchiesDoctorDetailController
                                        .data.value.isEmpty
                                    ? Center(child: Text('No List'))
                                    : ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            _frenchiesDoctorDetailController
                                                .data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var item =
                                              _frenchiesDoctorDetailController
                                                  .data;
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.03,
                                                vertical: size.height * 0.0005),
                                            child: Container(
                                              height: size.height * 0.25,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 30 / 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(-0, -0),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: Colors.pink.shade900,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(3, 3),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: Colors.pink.shade800,
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      'https://images.unsplash.com/photo-1612776572997-76cc42e058c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8YU1uY09rZllTRFV8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60',
                                                    ),
                                                    fit: BoxFit.cover),
                                              ),
                                              child: Container(
                                                height: size.height * 0.27,
                                                width: double.infinity,
                                                margin: EdgeInsets.symmetric(
                                                    vertical:
                                                        size.width * 0.0 / 05),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                        colors: [
                                                          Color(0xffffffff),
                                                          Color(0xffF0FFF0)
                                                          //darkPrimary,
                                                        ]),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          'https://images.unsplash.com/photo-1612776572997-76cc42e058c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8YU1uY09rZllTRFV8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60'
                                                          //'https://images.unsplash.com/photo-1518783211485-10fd3bfb2ce2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                                          ,
                                                        ),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: Offset(-0, -0),
                                                        spreadRadius: 0,
                                                        blurRadius: 0,
                                                        color: Colors
                                                            .green.shade200,
                                                      ),
                                                      BoxShadow(
                                                        offset: Offset(3, 3),
                                                        spreadRadius: 2,
                                                        blurRadius: 0,
                                                        color: Colors
                                                            .yellow.shade100,
                                                      ),
                                                    ]),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          size.width * 0.01),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height:
                                                            size.height * 0.27,
                                                        width:
                                                            size.width * 0.92,
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[800],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            // image:
                                                            //     DecorationImage(
                                                            //         image:
                                                            //             NetworkImage(
                                                            //           //'https://images.unsplash.com/photo-1483821838526-8d9756a6e1ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1930&q=80'
                                                            //           //'https://images.unsplash.com/photo-1517263904808-5dc91e3e7044?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1976&q=80'
                                                            //           'https://images.unsplash.com/photo-1612776572997-76cc42e058c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8YU1uY09rZllTRFV8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60'
                                                            //           //'https://images.unsplash.com/photo-1518783211485-10fd3bfb2ce2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                                            //           //'https://images.unsplash.com/photo-1543157145-f78c636d023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'
                                                            //           ,
                                                            //         ),
                                                            //         fit: BoxFit
                                                            //             .cover),
                                                            boxShadow: [
                                                              const BoxShadow(
                                                                color: Colors
                                                                    .black,
                                                                // Color(0xFFBEBEBE),
                                                                offset: Offset(
                                                                    3, 3),
                                                                blurRadius: 0,
                                                                spreadRadius: 0,
                                                              ),
                                                              const BoxShadow(
                                                                color: Colors
                                                                    .white,
                                                                offset: Offset(
                                                                    -1, -1),
                                                                blurRadius: 1,
                                                                spreadRadius: 1,
                                                              ),
                                                            ]),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Doctor Id:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Doctor Name:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Fee:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Address:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Franchise:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Department:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Specialist In:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Mobile & Phone:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Email:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Licence No:',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
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
                                                                  '${item?[index].id}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${item?[index].doctorName}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${item?[index].amount}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${item?[index].location}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${item?[index].vendorName}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${item?[index].departmentName}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${item?[index].specialistName}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${item?[index].mobileNumber}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${item?[index].emailId}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${item?[index].licenceNumber}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .yellow
                                                                        .shade100,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // child: child,
                                              ),
                                            ),
                                          );
                                        }),
                              ],
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
