import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/add_single_department/add_dept_type.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/all_dept_section/all_dept.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/add_single_department/add_dept_type.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/all_dept_section/all_dept.dart';

class DeptAndSpecialistView extends StatelessWidget {
  DeptAndSpecialistView({Key? key}) : super(key: key);
  FranchiesSpecialistController _franchiesSpecialistController =
      Get.put(FranchiesSpecialistController());
  //RwaPayoutController _payoutController = Get.put(RwaPayoutController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: MyTheme.ThemeColors,
        height: size.height,
        width: size.width,
        child: Scaffold(
          backgroundColor: Colors.transparent,

          // backgroundColor: MyTheme.ThemeColors,
          // appBar: AppBar(
          //   centerTitle: true,
          //   elevation: 0,
          //   title: Text('Patient List'),
          //   backgroundColor: MyTheme.ThemeColors,
          // ),

          body: Obx(
            () => (_franchiesSpecialistController.isLoading.value)
                ? Center(child: CircularProgressIndicator())
                // : controller.cartListModel!.result!.isEmpty
                //     ? Center(
                //         child: Text('No List'),
                //       )
                : SingleChildScrollView(
                    child: SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -size.height * 0.017,
                            //bottom: size.height * 0.64,
                            //left: -30,
                            right: -size.width * 0.08,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: size.height * 0.2,
                                width: size.width * 0.57,
                                decoration: BoxDecoration(
                                    //color: Colors.,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'lib/assets/background_stack_png/department2.png',
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
                                        decoration: BoxDecoration(
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
                                      'Departments',
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
                                      //height: size.height * 0.02,
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
                                          // controller: _payoutController
                                          //.appointmentController,
                                          onTap: () {
                                            //_payoutController.chooseDate();
                                          },
                                          autofocus: false,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: MyTheme.blueww),
                                          decoration: InputDecoration(
                                            //prefixIcon: Icon(Icons.search),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            hintText: 'Enter Department Name',
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
                                            enabledBorder: UnderlineInputBorder(
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
                                            color: Colors.black,
                                            fontSize: size.width * 0.03,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.0,
                              ),
                              SizedBox(
                                  height: size.height * 0.73,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _franchiesSpecialistController
                                          .spealistFranchies!
                                          .specialist!
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Obx(
                                          () => (_franchiesSpecialistController
                                                  .isLoading.value)
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : _franchiesSpecialistController
                                                      .spealistFranchies!
                                                      .specialist!
                                                      .isEmpty
                                                  //.getcatagartlist!.result!.isEmpty
                                                  ? Center(
                                                      child: Text('No List'),
                                                    )
                                                  : Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: size
                                                                      .width *
                                                                  0.03,
                                                              vertical:
                                                                  size.height *
                                                                      0.0005),
                                                      child: Container(
                                                        height:
                                                            size.height * 0.13,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    30 / 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          // image: DecorationImage(
                                                          //     image: NetworkImage(
                                                          //         'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                                          //     fit: BoxFit.fill),
                                                          //color: MyTheme.containercolor8,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),

                                                          // gradient: LinearGradient(
                                                          //     begin: Alignment.centerLeft,
                                                          //     end: Alignment.centerRight,
                                                          //     colors: [
                                                          //       lightPrimary,
                                                          //       darkPrimary,
                                                          //     ]),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              offset: Offset(
                                                                  -0, -0),
                                                              spreadRadius: 0,
                                                              blurRadius: 0,
                                                              color: Colors
                                                                  .yellow
                                                                  .shade900,

                                                              // color: darkShadow1,
                                                            ),
                                                            BoxShadow(
                                                              offset:
                                                                  Offset(3, 3),
                                                              spreadRadius: 0,
                                                              blurRadius: 0,
                                                              color: Colors
                                                                  .yellow
                                                                  .shade800,
                                                            ),
                                                          ],
                                                          // image: DecorationImage(
                                                          //     image: NetworkImage(
                                                          //         'https://images.unsplash.com/photo-1626624340240-aadc087844fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Ymx1ciUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                                          //     fit: BoxFit.cover)
                                                        ),
                                                        child: Container(
                                                          height: size.height *
                                                              0.093,
                                                          width:
                                                              double.infinity,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      size.width *
                                                                          0.0 /
                                                                          05),
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient: LinearGradient(
                                                                      begin: Alignment
                                                                          .centerLeft,
                                                                      end: Alignment
                                                                          .centerRight,
                                                                      colors: [
                                                                        Color(
                                                                            0xffffffff),
                                                                        Color(
                                                                            0xffF0FFF0)
                                                                        //darkPrimary,
                                                                      ]),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                  offset:
                                                                      Offset(-0,
                                                                          -0),
                                                                  spreadRadius:
                                                                      0,
                                                                  blurRadius: 0,
                                                                  color: Colors
                                                                      .green
                                                                      .shade200,
                                                                ),
                                                                BoxShadow(
                                                                  offset:
                                                                      Offset(
                                                                          3, 3),
                                                                  spreadRadius:
                                                                      2,
                                                                  blurRadius: 0,
                                                                  color: Colors
                                                                      .yellow
                                                                      .shade900,
                                                                ),
                                                              ]),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Department Name:',
                                                                      style: GoogleFonts
                                                                          .roboto(
                                                                        fontSize:
                                                                            size.width *
                                                                                0.03,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: MyTheme
                                                                            .blueww,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: size
                                                                              .height *
                                                                          0.01,
                                                                    ),
                                                                    Container(
                                                                      height: size
                                                                              .height *
                                                                          0.06,
                                                                      width: size
                                                                              .width *
                                                                          0.62,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          _franchiesSpecialistController
                                                                              .spealistFranchies!
                                                                              .specialist![index]!
                                                                              .departmentName
                                                                              .toString(),
                                                                          // 'Alcoholoism Treatment',
                                                                          style:
                                                                              GoogleFonts.roboto(
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color:
                                                                                MyTheme.ThemeColors,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      // Image.asset(
                                                                      //   'lib/assets/icons/user.png',
                                                                      //   // "lib/assets/image/icons8-hospital-64.png",
                                                                      // ),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.grey[
                                                                              300],
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          boxShadow: [
                                                                            const BoxShadow(
                                                                              color: Colors.black38,
                                                                              // Color(0xFFBEBEBE),
                                                                              offset: Offset(3, 3),
                                                                              blurRadius: 0,
                                                                              spreadRadius: 0,
                                                                            ),
                                                                            const BoxShadow(
                                                                              color: Colors.white,
                                                                              offset: Offset(-1, -1),
                                                                              blurRadius: 1,
                                                                              spreadRadius: 1,
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                  ],
                                                                ),

                                                                Spacer(),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      height: size
                                                                              .height *
                                                                          0.037,
                                                                      width: size
                                                                              .width *
                                                                          0.14,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          'Delete',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          style:
                                                                              GoogleFonts.roboto(
                                                                            fontSize:
                                                                                size.width * 0.033,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color:
                                                                                Colors.red,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      // Image.asset(
                                                                      //   'lib/assets/icons/user.png',
                                                                      //   // "lib/assets/image/icons8-hospital-64.png",
                                                                      // ),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.grey[
                                                                              300],
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          boxShadow: [
                                                                            const BoxShadow(
                                                                              color: Colors.red,
                                                                              // Color(0xFFBEBEBE),
                                                                              offset: Offset(3, 3),
                                                                              blurRadius: 0,
                                                                              spreadRadius: 0,
                                                                            ),
                                                                            const BoxShadow(
                                                                              color: Colors.white,
                                                                              offset: Offset(-1, -1),
                                                                              blurRadius: 1,
                                                                              spreadRadius: 1,
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                    SizedBox(
                                                                      height: size
                                                                              .height *
                                                                          0.01,
                                                                    ),
                                                                    Container(
                                                                      height: size
                                                                              .height *
                                                                          0.04,
                                                                      width: size
                                                                              .width *
                                                                          0.14,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          'Edit',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              1,
                                                                          style:
                                                                              GoogleFonts.roboto(
                                                                            fontSize:
                                                                                size.width * 0.033,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color:
                                                                                Colors.green,
                                                                            //MyTheme.ThemeColors,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      // Image.asset(
                                                                      //   'lib/assets/icons/user.png',
                                                                      //   // "lib/assets/image/icons8-hospital-64.png",
                                                                      // ),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.grey[
                                                                              300],
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          boxShadow: [
                                                                            const BoxShadow(
                                                                              color: Colors.green,
                                                                              // Color(0xFFBEBEBE),
                                                                              offset: Offset(3, 3),
                                                                              blurRadius: 0,
                                                                              spreadRadius: 0,
                                                                            ),
                                                                            const BoxShadow(
                                                                              color: Colors.white,
                                                                              offset: Offset(-1, -1),
                                                                              blurRadius: 1,
                                                                              spreadRadius: 1,
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                  ],
                                                                ),
                                                                // Column(
                                                                //   crossAxisAlignment:
                                                                //       CrossAxisAlignment.start,
                                                                //   mainAxisAlignment:
                                                                //       MainAxisAlignment.center,
                                                                //   children: [
                                                                //     Text(
                                                                //       'Kumar Prince',
                                                                //       style: GoogleFonts.roboto(
                                                                //         fontSize: size.width * 0.045,
                                                                //         fontWeight: FontWeight.w500,
                                                                //         color: MyTheme.blueww,
                                                                //       ),
                                                                //     ),
                                                                //     SizedBox(
                                                                //       height: size.height * 0.02,
                                                                //     ),
                                                                //     Text(
                                                                //       '04 Dec, 2022',
                                                                //       style: GoogleFonts.roboto(
                                                                //         fontSize: size.width * 0.03,
                                                                //         fontWeight: FontWeight.w400,
                                                                //         color: Colors.grey,
                                                                //       ),
                                                                //     ),
                                                                //   ],
                                                                // ),
                                                                // Column(
                                                                //   crossAxisAlignment:
                                                                //       CrossAxisAlignment.start,
                                                                //   mainAxisAlignment:
                                                                //       MainAxisAlignment.center,
                                                                //   children: [
                                                                //     Text(
                                                                //       '₹ 900',
                                                                //       style: GoogleFonts.roboto(
                                                                //         fontSize: size.width * 0.05,
                                                                //         fontWeight: FontWeight.w700,
                                                                //         //color: Colors.red,
                                                                //       ),
                                                                //     ),
                                                                //     SizedBox(
                                                                //       height: size.height * 0.02,
                                                                //     ),
                                                                //     Text(
                                                                //       'Received',
                                                                //       style: GoogleFonts.roboto(
                                                                //         fontSize: size.width * 0.03,
                                                                //         fontWeight: FontWeight.w500,
                                                                //         color: Colors.green,
                                                                //       ),
                                                                //     ),
                                                                //   ],
                                                                // ),
                                                              ],
                                                            ),
                                                          ),
                                                          // child: child,
                                                        ),
                                                      ),
                                                    ),
                                        );
                                      })),

                              SizedBox(
                                height: size.height * 0.004,
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.04,
                                        vertical: size.height * 0.004),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: PhysicalModel(
                                        color: Colors.green,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(5),
                                        shadowColor: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() => AllDeptlistView());
                                          },
                                          child: Container(
                                            height: size.height * 0.04,
                                            width: size.width * 0.16,
                                            decoration: BoxDecoration(
                                              // color: MyTheme.containercolor4,
                                              color: Colors.white70,
                                              //gradient: MyTheme.gradient1,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                                child: Text(
                                              'See all',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width * 0.03,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.04,
                                        vertical: size.height * 0.004),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: PhysicalModel(
                                        color: Colors.green,
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(5),
                                        shadowColor: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() => AddSingleDeptPage());
                                          },
                                          child: Container(
                                            height: size.height * 0.04,
                                            width: size.width * 0.16,
                                            decoration: BoxDecoration(
                                              // color: MyTheme.containercolor4,
                                              color: Colors.red.shade300,
                                              //gradient: MyTheme.gradient1,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Add',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width * 0.03,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Positioned(
                          //   top: 50,
                          //   child: Container(
                          //     height: size.height * 0.10,
                          //     width: size.width * 0.19,
                          //     decoration: BoxDecoration(
                          //       color: Colors.green,
                          //       shape: BoxShape.circle,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: MyTheme.ThemeColors,
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   elevation: 0,
//       //   title: Text('Appintment History'),
//       //   backgroundColor: MyTheme.ThemeColors,
//       // ),
//       body: Column(
//         //clipBehavior: Clip.none,
//         children: [
//           SizedBox(
//             height: size.height * 0.07,
//           ),
//           SizedBox(
//             height: size.height * 0.0,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//             child: Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Container(
//                       height: size.height * 0.032,
//                       width: size.width * 0.071,
//                       decoration: BoxDecoration(
//                         color: Colors.white70,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_ios_outlined,
//                         size: size.height * 0.022,
//                       )),
//                 ),
//                 SizedBox(
//                   width: size.width * 0.02,
//                 ),
//                 Text(
//                   ' See Your Appointment History',
//                   style: TextStyle(
//                     color: MyTheme.blueww,
//                     fontSize: size.width * 0.045,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Container(
//                 decoration: new BoxDecoration(
//                     borderRadius:
//                         new BorderRadius.all(new Radius.circular(30.0)),
//                     color: Colors.white),
//                 width: size.width * 0.72,
//                 height: size.height * 0.06,
//                 margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
//                 child: Theme(
//                   data: Theme.of(context)
//                       .copyWith(splashColor: Colors.transparent),
//                   child: Obx(
//                     () => (_nurseappointmentController.isLoading.value)
//                         ? Center(child: CircularProgressIndicator())
//                         : TextField(
//                             controller: _nurseappointmentController
//                                 .appointmentController,
//                             onTap: () {
//                               _nurseappointmentController.chooseDate();
//                             },
//                             autofocus: false,
//                             style: TextStyle(
//                                 fontSize: 15.0, color: MyTheme.blueww),
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.search),
//                               filled: true,
//                               fillColor: Colors.white,
//                               hintText: 'dd-mm-yyyy',
//                               contentPadding: const EdgeInsets.only(
//                                   left: 10.0, bottom: 12.0, top: 0.0),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(25.7),
//                               ),
//                               enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(25.7),
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: size.height * 0.06,
//                 width: size.width * 0.2,
//                 decoration: BoxDecoration(
//                   color: MyTheme.blueww,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Center(
//                     child: Text(
//                   'Search',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: size.width * 0.035,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )),
//               ),
//             ],
//           ),
//           SizedBox(
//               height: size.height * 0.75,
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 7,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: size.width * 0.03,
//                           vertical: size.height * 0.0005),
//                       child: Container(
//                         height: size.height * 0.25,
//                         margin: EdgeInsets.symmetric(vertical: 30 / 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           gradient: LinearGradient(
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                               colors: [
//                                 lightPrimary2,
//                                 darkPrimary2,
//                               ]),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: Offset(-0, -0),
//                               spreadRadius: 0,
//                               blurRadius: 0,
//                               color: darkShadow,
//                             ),
//                             BoxShadow(
//                               offset: Offset(1, 3),
//                               spreadRadius: 0,
//                               blurRadius: 0,
//                               color: Colors.grey,
//                             ),
//                           ],
//                           // image: DecorationImage(
//                           //     image: AssetImage(
//                           //         'lib/assets/background_stack_png/appointment6.png'),
//                           //     fit: BoxFit.cover)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Patient Name:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Mobile :',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Email:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient Location:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient City:',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Patient State :',
//                                     style: GoogleFonts.poppins(
//                                       color: MyTheme.blueww,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: size.width * 0.035,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Kishor Kumar',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     '9977889999',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'ksk@gmail.com',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'Sector 12, C 59',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'Lakhnaw',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                   Text(
//                                     'UP',
//                                     style: GoogleFonts.raleway(
//                                         color: Colors.grey.shade700,
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: size.width * 0.035),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   })),
//           // Positioned(
//           //   top: 50,
//           //   child: Container(
//           //     height: size.height * 0.10,
//           //     width: size.width * 0.19,
//           //     decoration: BoxDecoration(
//           //       color: Colors.green,
//           //       shape: BoxShape.circle,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
