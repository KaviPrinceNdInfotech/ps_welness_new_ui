import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesChemistDetail_controller.dart';

class ResitrationChemistDetails extends StatelessWidget {
  ResitrationChemistDetails({Key? key}) : super(key: key);
  FrenchiesChemistDetailController _frenchiesChemistDetailController =
      Get.put(FrenchiesChemistDetailController());
  callTestListView() {
    _frenchiesChemistDetailController.FrenchiesChemistDetailApi();
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
          () => _frenchiesChemistDetailController.isLoading.isFalse
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -size.height * 0.09,
                          right: size.width * 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: size.height * 0.34,
                              width: size.width * 0.33,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'lib/assets/background_stack_png/chemist2.png',
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
                                    'Chemist List',
                                    style: GoogleFonts.alatsi(
                                        fontSize: size.height * 0.032,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff023382)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.01),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 8, 8, 8),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          splashColor: Colors.transparent),
                                      child: TextField(
                                        onChanged: (value) =>
                                            _frenchiesChemistDetailController
                                                .filterPaymentNurse(value),
                                        autofocus: false,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: MyTheme.blueww),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white70,
                                          hintText: 'Enter Chemist Id ',
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0,
                                              bottom: 14.0,
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
                                        borderRadius: BorderRadius.circular(20),
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
                            _frenchiesChemistDetailController.data.value.isEmpty
                                ? Center(child: Text('No List'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: _frenchiesChemistDetailController
                                        .data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var item =
                                          _frenchiesChemistDetailController
                                              .data;
                                      var id = _frenchiesChemistDetailController
                                          .getfrenchiesChemistDetailModel
                                          ?.chemistRegDetail?[index]
                                          .id;
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.03,
                                            vertical: size.height * 0.0005),
                                        child: Container(
                                          height: size.height * 0.25,
                                          margin: const EdgeInsets.symmetric(
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
                                                    'https://images.unsplash.com/photo-1611242320536-f12d3541249b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHJlZCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60'),
                                                fit: BoxFit.cover),
                                          ),
                                          child: Container(
                                            height: size.height * 0.27,
                                            width: double.infinity,
                                            margin: EdgeInsets.symmetric(
                                                vertical:
                                                    size.width * 0.0 / 05),
                                            decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      Color(0xffffffff),
                                                      Color(0xffF0FFF0)
                                                      //darkPrimary,
                                                    ]),
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        'https://images.unsplash.com/flagged/photo-1568196978341-fd5e4d1253ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(-0, -0),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: Colors.red.shade200,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(3, 3),
                                                    spreadRadius: 2,
                                                    blurRadius: 0,
                                                    color: Colors.red.shade500,
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
                                                    height: size.height * 0.27,
                                                    width: size.width * 0.92,
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        color: Colors.cyan[900],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        // image: const DecorationImage(
                                                        //     image: NetworkImage(
                                                        //         'https://images.unsplash.com/flagged/photo-1568196978341-fd5e4d1253ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
                                                        //     fit: BoxFit.cover),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Colors.black,
                                                            offset:
                                                                Offset(3, 3),
                                                            blurRadius: 0,
                                                            spreadRadius: 0,
                                                          ),
                                                          BoxShadow(
                                                            color: Colors.white,
                                                            offset:
                                                                Offset(-1, -1),
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
                                                              'Chemist Id:',
                                                              style: GoogleFonts
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
                                                              'Chemist Name:',
                                                              style: GoogleFonts
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
                                                              'Franchise/Id:',
                                                              style: GoogleFonts
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
                                                              'Shop Name:',
                                                              style: GoogleFonts
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
                                                              style: GoogleFonts
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
                                                              style: GoogleFonts
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
                                                              style: GoogleFonts
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
                                                            //   'GST No:',
                                                            //   style: GoogleFonts
                                                            //       .lato(
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
                                                            Text(
                                                              'Licence No:',
                                                              style: GoogleFonts
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
                                                              'Approval:',
                                                              style: GoogleFonts
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
                                                              'Action:',
                                                              style: GoogleFonts
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
                                                              style: GoogleFonts.lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              '${item?[index].chemistName}',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${item?[index].vendorId}',
                                                              style: GoogleFonts.lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              '${item?[index].shopName}',
                                                              style: GoogleFonts.lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              '${item?[index].mobileNumber}',
                                                              style: GoogleFonts.lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              '${item?[index].emailId}',
                                                              style: GoogleFonts.lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              '${item?[index].location}',
                                                              style: GoogleFonts.lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            //gst...
                                                            // Text(
                                                            //   '${item?[index].gstNumber}',
                                                            //   style: GoogleFonts
                                                            //       .lato(
                                                            //     fontSize:
                                                            //         size.width *
                                                            //             0.03,
                                                            //     fontWeight:
                                                            //         FontWeight
                                                            //             .w700,
                                                            //     color: Colors
                                                            //         .brown
                                                            //         .shade600,
                                                            //   ),
                                                            // ),
                                                            Text(
                                                              '${item?[index].licenceNumber}',
                                                              style: GoogleFonts.lato(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              '${item?[index].isApproved}',
                                                              style: GoogleFonts
                                                                  .lato(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .red
                                                                    .shade900,
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                ///edit...
                                                                // InkWell(
                                                                //   onTap: () {
                                                                //     //  _dialog(id);
                                                                //     var name = item?[
                                                                //             index]
                                                                //         .chemistName;
                                                                //     var shopName =
                                                                //         item?[index]
                                                                //             .shopName;
                                                                //     var mobileNumber =
                                                                //         item?[index]
                                                                //             .mobileNumber;
                                                                //     var emailId =
                                                                //         item?[index]
                                                                //             .emailId;
                                                                //     var location =
                                                                //         item?[index]
                                                                //             .location;
                                                                //     var gstNumber =
                                                                //         item?[index]
                                                                //             .gstNumber;
                                                                //     var licenceNumber =
                                                                //         item?[index]
                                                                //             .licenceNumber;
                                                                //     Navigator.of(
                                                                //             context)
                                                                //         .push(MaterialPageRoute(
                                                                //             builder: (context) => EditChemist(
                                                                //                   id: id.toString(),
                                                                //                   name: name.toString(),
                                                                //                   shopName: shopName.toString(),
                                                                //                   mobile: mobileNumber.toString(),
                                                                //                   email: emailId.toString(),
                                                                //                   location: location.toString(),
                                                                //                   gstNumber: gstNumber.toString(),
                                                                //                   licenceNo: licenceNumber.toString(),
                                                                //                 )));
                                                                //   },
                                                                //   child:
                                                                //       Container(
                                                                //     height: size
                                                                //             .height *
                                                                //         0.03,
                                                                //     width: size
                                                                //             .width *
                                                                //         0.075,
                                                                //     color: Colors
                                                                //         .lightBlueAccent,
                                                                //     child:
                                                                //         Center(
                                                                //       child:
                                                                //           Text(
                                                                //         'Edit',
                                                                //         style: GoogleFonts
                                                                //             .lato(
                                                                //           fontSize:
                                                                //               size.width * 0.025,
                                                                //           fontWeight:
                                                                //               FontWeight.w700,
                                                                //           color:
                                                                //               Colors.white,
                                                                //         ),
                                                                //       ),
                                                                //     ),
                                                                //   ),
                                                                // ),
                                                                ///edit,,,,,end,.;....
                                                                SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.04,
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.04,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    _frenchiesChemistDetailController
                                                                        .FrenchiesDeleteChemistDetailApi(
                                                                            id!);
                                                                    Timer(
                                                                        const Duration(
                                                                            seconds:
                                                                                1),
                                                                        () =>
                                                                            callTestListView());
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.03,
                                                                    width:
                                                                        size.width *
                                                                            0.1,
                                                                    color: Colors
                                                                        .red,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        'Delete',
                                                                        style: GoogleFonts
                                                                            .lato(
                                                                          fontSize:
                                                                              size.width * 0.025,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
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
                                    })
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

  _dialog(id) {
    Get.defaultDialog(
        title: '',
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                controller: _frenchiesChemistDetailController.chemistName,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Chemist Name',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _frenchiesChemistDetailController.shopName,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Shop Name',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _frenchiesChemistDetailController.mobile,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Mobile number',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _frenchiesChemistDetailController.email,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Email id',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: _frenchiesChemistDetailController.licenceno,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'licence number',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                // _frenchiesChemistDetailController.FrenchiesEditChemistDetailapi(id!);
                Timer(
                    const Duration(seconds: 2),
                    () => _frenchiesChemistDetailController
                        .FrenchiesChemistDetailApi());
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.teal,
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        radius: 10.0);
  }
}
