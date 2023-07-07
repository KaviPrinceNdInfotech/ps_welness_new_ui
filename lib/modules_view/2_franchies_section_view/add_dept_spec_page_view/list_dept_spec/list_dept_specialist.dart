import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/my_theme.dart';
import '../../../../controllers/2_franchises_controller/get_controller_franchies/get_controller_franchies_speacilist.dart';

class DeptSpecList extends StatelessWidget {
  DeptSpecList({Key? key}) : super(key: key);

  FranchiesSpecialistController _franchiesSpecialistController = Get.put(FranchiesSpecialistController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
        SafeArea(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.01,
                        right: -size.width * 0.124,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width * 0.75,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/background_stack_png/specialist.png',
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
                                vertical: size.height * 0.04),
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
                                  'Dept and Spec List',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.032,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Obx(()=> _franchiesSpecialistController.isLoading.value
                                  ? Center(child: CircularProgressIndicator(),)
                              : SizedBox(
                                height: size.height * 0.78,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _franchiesSpecialistController.getDeptSpecList2Model?.deptspecList?.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      var item = _franchiesSpecialistController.getDeptSpecList2Model?.deptspecList;
                                      return Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            size.width * 0.03,
                                                        vertical:
                                                            size.height * 0.0005),
                                                    child: Container(
                                                      height: size.height * 0.13,
                                                      margin: const EdgeInsets.symmetric(
                                                              vertical: 30 / 5),
                                                      decoration: BoxDecoration(
                                                        image: const DecorationImage(
                                                            image: NetworkImage(
                                                                'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset:
                                                                Offset(-0, -0),
                                                            spreadRadius: 0,
                                                            blurRadius: 0,
                                                            color: Colors
                                                                .yellow.shade300,
                                                          ),
                                                          BoxShadow(
                                                            offset: Offset(3, 3),
                                                            spreadRadius: 0,
                                                            blurRadius: 0,
                                                            color: Colors
                                                                .grey.shade200,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Container(
                                                        height:
                                                            size.height * 0.093,
                                                        width: double.infinity,
                                                        margin:
                                                            EdgeInsets.symmetric(
                                                                vertical:
                                                                    size.width *
                                                                        0.0 /
                                                                        05),
                                                        decoration: BoxDecoration(
                                                            gradient: const LinearGradient(
                                                                begin: Alignment
                                                                    .centerLeft,
                                                                end: Alignment
                                                                    .centerRight,
                                                                colors: [
                                                                  Color(0xffffffff),
                                                                  Color(0xffF0FFF0)
                                                                ]),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(12),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset: Offset(
                                                                    -0, -0),
                                                                spreadRadius: 0,
                                                                blurRadius: 0,
                                                                color: Colors
                                                                    .green
                                                                    .shade200,
                                                              ),
                                                              BoxShadow(
                                                                offset:
                                                                    Offset(3, 3),
                                                                spreadRadius: 2,
                                                                blurRadius: 2,
                                                                color: Colors
                                                                    .green
                                                                    .shade200,
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
                                                              Container(
                                                                height:
                                                                    size.height *
                                                                        0.09,
                                                                width:
                                                                    size.width *
                                                                        0.18,
                                                                padding: const EdgeInsets.all(8),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                10),
                                                                    boxShadow: const[
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0xFFBEBEBE),
                                                                        offset:
                                                                            Offset(
                                                                                5,
                                                                                5),
                                                                        blurRadius:
                                                                            10,
                                                                        spreadRadius:
                                                                            1,
                                                                      ),
                                                                       BoxShadow(
                                                                        color: Colors
                                                                            .white,
                                                                        offset:
                                                                            Offset(
                                                                                -5,
                                                                                -5),
                                                                        blurRadius:
                                                                            10,
                                                                        spreadRadius:
                                                                            1,
                                                                      ),
                                                                    ]),
                                                                child: Image.asset(
                                                                  'lib/assets/icons/profile_chemiist.png',
                                                                ),
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Department',
                                                                    style:
                                                                        GoogleFonts
                                                                            .roboto(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: MyTheme
                                                                          .blueww,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        size.height *
                                                                            0.02,
                                                                  ),
                                                                  Text("${item?[index].departmentName}",
                                                                    style:
                                                                        GoogleFonts
                                                                            .roboto(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.032,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .pink
                                                                          .shade900,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Specialist',
                                                                    style:
                                                                        GoogleFonts
                                                                            .roboto(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: MyTheme
                                                                          .blueww,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        size.height *
                                                                            0.02,
                                                                  ),
                                                                  Text("${item?[index].specialistName}",
                                                                    style: GoogleFonts.roboto(
                                                                      fontSize: size.width * 0.031,
                                                                      fontWeight: FontWeight.w700,
                                                                      color: Colors.red.shade900,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    'Status',
                                                                    style:
                                                                        GoogleFonts
                                                                            .roboto(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: MyTheme
                                                                          .containercolor7,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        size.height *
                                                                            0.02,
                                                                  ),
                                                                  Text("${item?[index].status}",
                                                                    style:
                                                                        GoogleFonts
                                                                            .roboto(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.03,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .green
                                                                          .shade500,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        // child: child,
                                                      ),
                                                    ),
                                                  );
                                    })),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
