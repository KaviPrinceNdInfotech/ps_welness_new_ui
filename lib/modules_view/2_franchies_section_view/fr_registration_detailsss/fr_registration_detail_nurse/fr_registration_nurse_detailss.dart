import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesNurseDetail_Controller.dart';

class ResitrationNurseDetails extends StatelessWidget {
  ResitrationNurseDetails({Key? key}) : super(key: key);
  FrenchiesNurseDetailController _frenchiesNurseDetailController =
      Get.put(FrenchiesNurseDetailController());
  callTestListView() {
    _frenchiesNurseDetailController.frenchiesNurseDetailApi();
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
          () => _frenchiesNurseDetailController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: size.height * 0.0,
                          right: size.width * 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: size.height * 0.24,
                              width: size.width * 0.32,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'lib/assets/background_stack_png/n4.png',
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
                                    'Nurse List',
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
                                            _frenchiesNurseDetailController
                                                .filterPaymentNurse(value),
                                        autofocus: false,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: MyTheme.blueww),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white70,
                                          hintText: 'Enter Nurse Name ',
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0,
                                              bottom: 14.0,
                                              top: 0.0),
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
                            _frenchiesNurseDetailController.data.value.isEmpty
                                ? Center(child: Text('No List'))
                                : ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: _frenchiesNurseDetailController
                                        .data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var item =
                                          _frenchiesNurseDetailController.data;
                                      var id = item[index].id;
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.03,
                                            vertical: size.height * 0.0005),
                                        child: Container(
                                          height: size.height * 0.25,
                                          margin: EdgeInsets.symmetric(
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
                                                    'https://images.unsplash.com/photo-1568301956237-25a54f5f0d21?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
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
                                                        'https://images.unsplash.com/photo-1568301956237-25a54f5f0d21?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
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
                                                    color:
                                                        Colors.indigo.shade500,
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
                                                        color: Colors.cyan[500],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        // image: const DecorationImage(
                                                        //     image: NetworkImage(
                                                        //         'https://images.unsplash.com/photo-1568301956237-25a54f5f0d21?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'),
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
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.3,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Nurse Id:',
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
                                                                'Nurse Name:',
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
                                                                'Nurse Type:',
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
                                                                'Certificate:',
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

                                                              ///todo: aprooval.....
                                                              // Text(
                                                              //   'Approval:',
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
                                                              ///
                                                              // Text(
                                                              //   'Action:',
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
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.55,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${item?[index].nurseId}',
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
                                                                      .white,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${item?[index].nurseName}',
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
                                                                      .white,
                                                                  // .brown.shade600,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${item?[index].nurseTypeName}',
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
                                                                      .white,
                                                                  //.brown.shade600,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${item?[index].vendorName}',
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
                                                                      .white,
                                                                  //.brown.shade600,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${item?[index].mobileNumber}',
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
                                                                      .white,
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
                                                                      .white,
                                                                  //.brown.shade600,
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
                                                                      .white,
                                                                  //.brown.shade600,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${item?[index].certificateNumber}',
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
                                                                      .white,
                                                                  //.brown.shade600,
                                                                ),
                                                              ),

                                                              ///todo: approve..
                                                              // Text(
                                                              //   '${item[index].isApproved}',
                                                              //   style: GoogleFonts
                                                              //       .lato(
                                                              //     fontSize:
                                                              //         size.width *
                                                              //             0.03,
                                                              //     fontWeight:
                                                              //         FontWeight
                                                              //             .w700,
                                                              //     color: Colors
                                                              //         .green
                                                              //         .shade200,
                                                              //   ),
                                                              // ),
                                                              ///todo: end aprooved...
                                                              ///
                                                              /// todo: edit and delete start..
                                                              // Row(
                                                              //   children: [
                                                              //     ///edit...
                                                              //     // InkWell(
                                                              //     //  onTap: (){
                                                              //     //    var name = item[index].nurseName;
                                                              //     //    var nurseType = item[index].nurseTypeName;
                                                              //     //    var mobile = item[index].mobileNumber;
                                                              //     //    var email = item[index].emailId;
                                                              //     //    var location = item[index].location;
                                                              //     //    var c_number = item[index].certificateNumber;
                                                              //     //    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                                              //     //        EditNurse(id: id.toString(), name: name.toString(),nurseType: nurseType.toString(),mobile: mobile.toString(), email: email.toString(),
                                                              //     //          location: location.toString(), c_number: c_number.toString(),)));
                                                              //     //  },
                                                              //     //   child: Container(
                                                              //     //     height:
                                                              //     //         size.height *
                                                              //     //             0.022,
                                                              //     //     width: size.width *
                                                              //     //         0.075,
                                                              //     //     color: Colors
                                                              //     //         .lightBlueAccent,
                                                              //     //     child: Center(
                                                              //     //       child: Text(
                                                              //     //         'Edit',
                                                              //     //         style:
                                                              //     //             GoogleFonts
                                                              //     //                 .lato(
                                                              //     //           fontSize:
                                                              //     //               size.width *
                                                              //     //                   0.025,
                                                              //     //           fontWeight:
                                                              //     //               FontWeight
                                                              //     //                   .w700,
                                                              //     //           color: Colors
                                                              //     //               .white,
                                                              //     //         ),
                                                              //     //       ),
                                                              //     //     ),
                                                              //     //   ),
                                                              //     // ),
                                                              //     ///end edit...
                                                              //     SizedBox(
                                                              //       width:
                                                              //           size.width *
                                                              //               0.04,
                                                              //     ),
                                                              //
                                                              //     ///start delete api...
                                                              //
                                                              //     // SizedBox(
                                                              //     //   width:
                                                              //     //       size.width *
                                                              //     //           0.04,
                                                              //     // ),
                                                              //     // InkWell(
                                                              //     //   onTap: () {
                                                              //     //     _frenchiesNurseDetailController
                                                              //     //         .frenchiesDeleteNurseDetailApi(
                                                              //     //             id);
                                                              //     //     Timer(
                                                              //     //         const Duration(
                                                              //     //             seconds:
                                                              //     //                 1),
                                                              //     //         () =>
                                                              //     //             callTestListView());
                                                              //     //   },
                                                              //     //   child:
                                                              //     //       Container(
                                                              //     //     height: size
                                                              //     //             .height *
                                                              //     //         0.022,
                                                              //     //     width:
                                                              //     //         size.width *
                                                              //     //             0.1,
                                                              //     //     color: Colors
                                                              //     //         .red,
                                                              //     //     child:
                                                              //     //         Center(
                                                              //     //       child:
                                                              //     //           Text(
                                                              //     //         'Delete',
                                                              //     //         style: GoogleFonts
                                                              //     //             .lato(
                                                              //     //           fontSize:
                                                              //     //               size.width * 0.025,
                                                              //     //           fontWeight:
                                                              //     //               FontWeight.w700,
                                                              //     //           color:
                                                              //     //               Colors.white,
                                                              //     //         ),
                                                              //     //       ),
                                                              //     //     ),
                                                              //     //   ),
                                                              //     // ),
                                                              //
                                                              //     ///end delete api...
                                                              //   ],
                                                              // ),
                                                              /// todo: edit and delete end..
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
}
