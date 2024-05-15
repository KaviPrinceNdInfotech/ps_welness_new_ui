import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesLabDetail_controller.dart';

import '../../../../constants/my_theme.dart';

class ResitrationLabDetails extends StatelessWidget {
  ResitrationLabDetails({Key? key}) : super(key: key);

  FrenchiesLabDetailController _frenchiesLabDetailController =
      Get.put(FrenchiesLabDetailController());
  callTestListView() {
    _frenchiesLabDetailController.frenchiesLabDetailApi();
  }

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
          () => _frenchiesLabDetailController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _frenchiesLabDetailController
                          .getfrenchiesLabDetailModel?.labRegDetail ==
                      null
                  ? SizedBox(
                      height: size.height * 0.68,
                      child: Center(child: Text('No List')))
                  : SingleChildScrollView(
                      child: SafeArea(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -size.height * 0.1,
                              right: size.width * 0.03,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: size.height * 0.34,
                                  width: size.width * 0.5,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'lib/assets/background_stack_png/frlab1.png',
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
                                        'Lab List',
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
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0)),
                                            color: Colors.white70),
                                        width: size.width * 0.45,
                                        height: size.height * 0.06,
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 20, 10, 20),
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 8, 8, 8),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              splashColor: Colors.transparent),
                                          child: TextField(
                                            onChanged: (value) =>
                                                _frenchiesLabDetailController
                                                    .filterPaymentNurse(value),
                                            autofocus: false,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: MyTheme.blueww),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white70,
                                              hintText: 'Enter Lab Name ',
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
                                _frenchiesLabDetailController.data.value.isEmpty
                                    ? Center(child: Text('No List'))
                                    : ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: _frenchiesLabDetailController
                                            .data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var item =
                                              _frenchiesLabDetailController
                                                  .data;
                                          var id = item[index].id;
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.03,
                                                vertical: size.height * 0.0005),
                                            child: Container(
                                              height: size.height * 0.3,
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
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        'https://images.unsplash.com/photo-1628921919890-6d79dc5592c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NnxIRjMxcGQ3aFVIMHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'),
                                                    fit: BoxFit.cover),
                                              ),
                                              child: Container(
                                                height: size.height * 0.3,
                                                width: double.infinity,
                                                margin: EdgeInsets.symmetric(
                                                    vertical:
                                                        size.width * 0.0 / 05),
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                            colors: [
                                                          Color(0xffffffff),
                                                          Color(0xffF0FFF0)
                                                        ]),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://images.unsplash.com/photo-1628921919890-6d79dc5592c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NnxIRjMxcGQ3aFVIMHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: Offset(-0, -0),
                                                        spreadRadius: 0,
                                                        blurRadius: 0,
                                                        color:
                                                            Colors.red.shade200,
                                                      ),
                                                      BoxShadow(
                                                        offset: Offset(3, 3),
                                                        spreadRadius: 2,
                                                        blurRadius: 0,
                                                        color: Colors
                                                            .green.shade900,
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
                                                            size.height * 0.3,
                                                        width:
                                                            size.width * 0.92,
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[200],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            // image: const DecorationImage(
                                                            //     image: NetworkImage(
                                                            //         'https://images.unsplash.com/photo-1628921919890-6d79dc5592c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NnxIRjMxcGQ3aFVIMHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60'),
                                                            //     fit: BoxFit
                                                            //         .cover),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black,
                                                                // Color(0xFFBEBEBE),
                                                                offset: Offset(
                                                                    3, 3),
                                                                blurRadius: 0,
                                                                spreadRadius: 0,
                                                              ),
                                                              BoxShadow(
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
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.2,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Lab Id:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Lab Name:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Franchise:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Landline no:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Mobile No:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Email:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Address:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Licence:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'GST No:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Aadhaar:',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  // Text(
                                                                  //   'Approval:',
                                                                  //   style:
                                                                  //       GoogleFonts
                                                                  //           .lato(
                                                                  //     fontSize:
                                                                  //         size.width *
                                                                  //             0.03,
                                                                  //     fontWeight:
                                                                  //         FontWeight
                                                                  //             .w700,
                                                                  //     color: Colors
                                                                  //         .black,
                                                                  //   ),
                                                                  // ),
                                                                  // Text(
                                                                  //   'Action:',
                                                                  //   style:
                                                                  //       GoogleFonts
                                                                  //           .lato(
                                                                  //     fontSize:
                                                                  //         size.width *
                                                                  //             0.03,
                                                                  //     fontWeight:
                                                                  //         FontWeight
                                                                  //             .w700,
                                                                  //     color: Colors
                                                                  //         .black,
                                                                  //   ),
                                                                  // ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.6,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '${item?[index].lAbId}',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .brown
                                                                          .shade600,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    child: Text(
                                                                      '${item?[index].labName}',
                                                                      style: GoogleFonts
                                                                          .lato(
                                                                        fontSize:
                                                                            size.width *
                                                                                0.03,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        color: Colors
                                                                            .brown
                                                                            .shade600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${item?[index].franchise}',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .brown
                                                                          .shade600,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${item?[index].phoneNumber}',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .brown
                                                                          .shade600,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${item?[index].mobileNumber.toString()}0',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .brown
                                                                          .shade600,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${item?[index].emailId}',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .brown
                                                                          .shade600,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${item?[index].location}',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .brown
                                                                          .shade600,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${item?[index].licenceNumber}',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .brown
                                                                          .shade600,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${item?[index].gstNumber}',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .brown
                                                                          .shade600,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${item?[index].aadharNumber}',
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .brown
                                                                          .shade600,
                                                                    ),
                                                                  ),
                                                                  // Text(
                                                                  //   '${item?[index].isApproved}',
                                                                  //   style:
                                                                  //       GoogleFonts
                                                                  //           .lato(
                                                                  //     fontSize:
                                                                  //         size.width *
                                                                  //             0.03,
                                                                  //     fontWeight:
                                                                  //         FontWeight
                                                                  //             .w700,
                                                                  //     color: Colors
                                                                  //         .green
                                                                  //         .shade900,
                                                                  //   ),
                                                                  // ),
                                                                  ///
                                                                  // Row(
                                                                  //   children: [
                                                                  //     // InkWell(
                                                                  //     //   onTap:
                                                                  //     //       () {
                                                                  //     //     var name =
                                                                  //     //         item?[index].labName;
                                                                  //     //     var phone =
                                                                  //     //         item?[index].phoneNumber;
                                                                  //     //     var mobile =
                                                                  //     //         item?[index].mobileNumber;
                                                                  //     //     var email =
                                                                  //     //         item?[index].emailId;
                                                                  //     //     var location =
                                                                  //     //         item?[index].location;
                                                                  //     //     var gst =
                                                                  //     //         item?[index].gstNumber;
                                                                  //     //     var licence =
                                                                  //     //         item?[index].licenceNumber;
                                                                  //     //     var aadhar =
                                                                  //     //         item?[index].aadharNumber;
                                                                  //     //     Navigator.of(context).push(MaterialPageRoute(
                                                                  //     //         builder: (context) => EditLab(
                                                                  //     //               id: id.toString(),
                                                                  //     //               name: name.toString(),
                                                                  //     //               phone: phone.toString(),
                                                                  //     //               mobile: mobile.toString(),
                                                                  //     //               email: email.toString(),
                                                                  //     //               location: location.toString(),
                                                                  //     //               gst: gst.toString(),
                                                                  //     //               licence: licence.toString(),
                                                                  //     //               aadhar: aadhar.toString(),
                                                                  //     //             )));
                                                                  //     //   },
                                                                  //     //   child:
                                                                  //     //       Container(
                                                                  //     //     height: size.height *
                                                                  //     //         0.02,
                                                                  //     //     width: size.width *
                                                                  //     //         0.075,
                                                                  //     //     color: Colors
                                                                  //     //         .lightBlueAccent,
                                                                  //     //     child:
                                                                  //     //         Center(
                                                                  //     //       child:
                                                                  //     //           Text(
                                                                  //     //         'Edit',
                                                                  //     //         style:
                                                                  //     //             GoogleFonts.lato(
                                                                  //     //           fontSize: size.width * 0.025,
                                                                  //     //           fontWeight: FontWeight.w700,
                                                                  //     //           color: Colors.white,
                                                                  //     //         ),
                                                                  //     //       ),
                                                                  //     //     ),
                                                                  //     //   ),
                                                                  //     // ),
                                                                  //     SizedBox(
                                                                  //       width: size
                                                                  //               .width *
                                                                  //           0.08,
                                                                  //     ),
                                                                  //     InkWell(
                                                                  //       onTap:
                                                                  //           () {
                                                                  //         _frenchiesLabDetailController
                                                                  //             .frenchiesDeleteLabDetailApi(id);
                                                                  //         Timer(
                                                                  //             const Duration(seconds: 1),
                                                                  //             () => callTestListView());
                                                                  //       },
                                                                  //       child:
                                                                  //           Container(
                                                                  //         height: size.height *
                                                                  //             0.02,
                                                                  //         width: size.width *
                                                                  //             0.1,
                                                                  //         color: Colors
                                                                  //             .red,
                                                                  //         child:
                                                                  //             Center(
                                                                  //           child:
                                                                  //               Text(
                                                                  //             'Delete',
                                                                  //             style:
                                                                  //                 GoogleFonts.lato(
                                                                  //               fontSize: size.width * 0.025,
                                                                  //               fontWeight: FontWeight.w700,
                                                                  //               color: Colors.white,
                                                                  //             ),
                                                                  //           ),
                                                                  //         ),
                                                                  //       ),
                                                                  //     ),
                                                                  //   ],
                                                                  // ),
                                                                ],
                                                              ),
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
