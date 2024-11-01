import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../controllers/5_rwa_controller_RRR/rwa_payout_history_controller/rwa_payout_controller.dart';
//import 'package:ps_welness/constants/my_theme.dart';

//import '../../../controllers/5_rwa_controller/rwa_payout_history_controller/rwa_payout_controller.dart';

class RwaPayoutHistory extends StatelessWidget {
  RwaPayoutHistory({Key? key}) : super(key: key);

  RwaPayoutController _rwapayoutController = Get.put(RwaPayoutController());

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
          () => (_rwapayoutController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.021,
                        right: -size.width * 0.124,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.22,
                            width: size.width * 0.75,
                            decoration: const BoxDecoration(
                                //color: Colors.,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/background_stack_png/paymhis2.png',
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
                                  'Payout List',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.032,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
                            ),
                          ),
                          // Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.01),
                            child: Container(
                              //height: size.height * 0.02,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(30.0)),
                                  color: Colors.white30),
                              width: size.width,
                              height: size.height * 0.06,
                              margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                              padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child: TextField(
                                  onChanged: (value) => _rwapayoutController
                                      .filterauthorityrwa(value),
                                  //controller: _rwapaymentController
                                  // .appointmentController,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: MyTheme.blueww),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    filled: true,
                                    fillColor: Colors.white30,
                                    hintText: 'Search Name',
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, bottom: 12.0, top: 6.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white30),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white30),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          _rwapayoutController.foundauthority.value.isEmpty
                              ? Center(
                                  child: Text("No Data"),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _rwapayoutController
                                          .foundauthority.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // var item =
                                        //     _rwapayoutController.foundauthority;
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03,
                                              vertical: size.height * 0.0005),
                                          child: Container(
                                            height: size.height * 0.13,
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
                                                  color: Colors.yellow.shade900,
                                                ),
                                                BoxShadow(
                                                  offset: Offset(3, 3),
                                                  spreadRadius: 0,
                                                  blurRadius: 0,
                                                  color: Colors.yellow.shade800,
                                                ),
                                              ],
                                            ),
                                            child: Container(
                                              height: size.height * 0.093,
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
                                                        //darkPrimary,
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(-0, -0),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color:
                                                          Colors.green.shade200,
                                                    ),
                                                    BoxShadow(
                                                      offset: Offset(3, 3),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      color: Colors
                                                          .yellow.shade700,
                                                    ),
                                                  ]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height:
                                                          size.height * 0.09,
                                                      width: size.width * 0.18,
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Image.asset(
                                                        'lib/assets/icons/user.png',
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          boxShadow: [
                                                            const BoxShadow(
                                                              color: Color(
                                                                  0xFFBEBEBE),
                                                              offset:
                                                                  Offset(5, 5),
                                                              blurRadius: 10,
                                                              spreadRadius: 1,
                                                            ),
                                                            const BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              offset: Offset(
                                                                  -5, -5),
                                                              blurRadius: 10,
                                                              spreadRadius: 1,
                                                            ),
                                                          ]),
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
                                                          '${_rwapayoutController.foundauthority[index].authorityName.toString()}',
                                                          //item?[index].authorityName}',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize:
                                                                size.width *
                                                                    0.045,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                MyTheme.blueww,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: size.height *
                                                              0.02,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.22,
                                                          child: Text(
                                                            '${_rwapayoutController.foundauthority[index].paymentDate.toString()}',
                                                            maxLines: 1,
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color:
                                                                  Colors.grey,
                                                            ),
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
                                                          '₹ ${_rwapayoutController.foundauthority[index].amount?.toDouble()}',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize:
                                                                size.width *
                                                                    0.05,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            //color: Colors.red,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: size.height *
                                                              0.02,
                                                        ),
                                                        // Text(
                                                        //   '${item?[index].isPaid}',
                                                        //   style: GoogleFonts
                                                        //       .roboto(
                                                        //     fontSize:
                                                        //         size.width *
                                                        //             0.03,
                                                        //     fontWeight:
                                                        //         FontWeight.w500,
                                                        //     color: Colors.green,
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // child: child,
                                            ),
                                          ),
                                        );
                                      }),
                                ),
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
