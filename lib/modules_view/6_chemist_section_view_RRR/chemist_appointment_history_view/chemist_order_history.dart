import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../controllers/6_chemist_view_controllers_RRR/chemist_order_history_controller.dart';
//import 'package:ps_welness_new_ui/controllers/6_chemist_view_controllers_RRR/chemist_order_history_controllercontrollerss.dart';
//import '../../../controllers/6_chemist_view_controllers/chemist_order_history_controller.dart';

class ChemistOrderHistory extends StatelessWidget {
  ChemistOrderHistory({Key? key}) : super(key: key);

  ChemistOrderController _chemistOrderController =
      Get.put(ChemistOrderController());

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
          () => (_chemistOrderController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.05,
                        right: -size.width * 0.04,
                        // bottom: size.height * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.3,
                            width: size.width * 0.45,
                            decoration: const BoxDecoration(
                                //color: Colors.,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/background_stack_png/chemist1.png',
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
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    size: size.height * 0.026,
                                    color: MyTheme.blueww,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  'Order History Chemist',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.022,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
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
                              data: Theme.of(context)
                                  .copyWith(splashColor: Colors.transparent),
                              child: TextField(
                                onChanged: (value) => _chemistOrderController
                                    .filterOrderChemist(value),
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 15.0, color: MyTheme.blueww),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Search Chemist-name',
                                  contentPadding: const EdgeInsets.only(
                                      left: 10.0, bottom: 12.0, top: 6.0),
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
                          _chemistOrderController.foundOrder.value.isEmpty
                              // Container(
                              //   height: size.height * 0.06,
                              //   width: size.width * 0.2,
                              //   decoration: BoxDecoration(
                              //     //color: MyTheme.blueww,
                              //     gradient: MyTheme.gradient2,
                              //     borderRadius: BorderRadius.circular(30),
                              //   ),
                              //   child: Center(
                              //       child: Text(
                              //     'Search',
                              //     style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: size.width * 0.035,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   )),
                              // ),
                              // SizedBox(
                              //   height: size.height * 0.01,
                              // ),

                              ? Center(
                                  child: Text('No List'),
                                )
                              : SizedBox(
                                  height: size.height * 0.71,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _chemistOrderController
                                          ?.foundOrder?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var item =
                                            _chemistOrderController.foundOrder;
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03,
                                              vertical: size.height * 0.0005),
                                          child: Container(
                                            height: size.height * 0.32,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 30 / 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    lightPrimary2,
                                                    darkPrimary,
                                                  ]),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(-0, -0),
                                                  spreadRadius: 0,
                                                  blurRadius: 0,
                                                  color: Colors.cyan.shade300,
                                                ),
                                                BoxShadow(
                                                  offset: Offset(4, 4),
                                                  spreadRadius: 0,
                                                  blurRadius: 0,
                                                  color: Colors.cyan.shade300,
                                                ),
                                              ],
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          size.height * 0.01,
                                                      horizontal:
                                                          size.width * 0.02),
                                                  child: Material(
                                                    elevation: 6,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      topLeft:
                                                          Radius.circular(10),
                                                    ),
                                                    child: Container(
                                                      width: size.width * 0.35,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        gradient:
                                                            MyTheme.gradient8,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Name:',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  MyTheme.text1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.035,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Mobile :',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  MyTheme.text1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.035,
                                                            ),
                                                          ),
                                                          Text(
                                                            'State :',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  MyTheme.text1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.035,
                                                            ),
                                                          ),
                                                          Text(
                                                            'City :',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  MyTheme.text1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.035,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Paid Amount:',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  MyTheme.text1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.035,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Address:',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  MyTheme.text1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  size.width *
                                                                      0.035,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${item?[index].chemistName}',
                                                            style: GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                          ),
                                                          Text(
                                                            '${item?[index].mobileNumber}',
                                                            style: GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                          ),
                                                          Text(
                                                            '${item?[index].stateName ?? 'Not Available'}',
                                                            style: GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                          Text(
                                                            '${item?[index].cityname}',
                                                            style: GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                          ),
                                                          Text(
                                                            '${item?[index].amount}',
                                                            style: GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                          ),
                                                          Text(
                                                            '${item?[index].location}',
                                                            style: GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
