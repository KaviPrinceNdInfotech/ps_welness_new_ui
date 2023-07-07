import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_appointment_history_controller/nurse_pay_hist_controller.dart';
//import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_appointment_history_controller/nurse_pay_histrt';

class NursePaymentHistory extends StatelessWidget {
  NursePaymentHistory({Key? key}) : super(key: key);
  //NursepaymenthistoryController _nursepaymenthistoryController = Get.put(NursepaymenthistoryController());
  NursePaymentHistoryControllerss _nursePaymentHistoryController =
      Get.put(NursePaymentHistoryControllerss());
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
          () => (_nursePaymentHistoryController.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.041,
                        right: -size.width * 0.124,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.21,
                            width: size.width * 0.65,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/user_assets/nurse_payment1.png',
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
                                  'Payment History',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.032,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(30.0)),
                                  //color: Colors.white
                                  gradient: MyTheme.gradient7,
                                ),
                                width: size.width * 0.72,
                                height: size.height * 0.06,
                                margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                                padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      splashColor: Colors.transparent),
                                  child: TextField(
                                    onChanged: (value) =>
                                        _nursePaymentHistoryController
                                            .filterPaymentNurse(value),
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 15.0, color: MyTheme.blueww),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'search name...',
                                      contentPadding: const EdgeInsets.only(
                                          left: 10.0, bottom: 12.0, top: 6.0),
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
                              Container(
                                height: size.height * 0.06,
                                width: size.width * 0.2,
                                decoration: BoxDecoration(
                                  //color: MyTheme.blueww,
                                  //gradient: MyTheme.gradient10,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Lottie.asset(
                                  'lib/assets/image/70361-searching.zip',
                                  width: 400,
                                  height: 400,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          _nursePaymentHistoryController
                                  .foundPaymentnurse.value.isEmpty
                              ? Center(child: Text('No List'))
                              : SizedBox(
                                  height: size.height * 0.7,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _nursePaymentHistoryController
                                          .foundPaymentnurse.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var item =
                                            _nursePaymentHistoryController
                                                .foundPaymentnurse;
                                        return Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.03,
                                                  vertical:
                                                      size.height * 0.0005),
                                              child: Container(
                                                height: size.height * 0.25,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 30 / 5),
                                                decoration: BoxDecoration(
                                                  color:
                                                      MyTheme.containercolor17,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(-0, -0),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color:
                                                          Colors.red.shade300,
                                                    ),
                                                    BoxShadow(
                                                      offset: Offset(3, 3),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color:
                                                          Colors.red.shade300,
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      top: -70,
                                                      right: 260,
                                                      child: Container(
                                                        height:
                                                            size.height * 0.2,
                                                        width: size.width * 0.4,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          gradient:
                                                              MyTheme.gradient8,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: -120,
                                                      left: 200,
                                                      child: Container(
                                                        height:
                                                            size.height * 0.32,
                                                        width:
                                                            size.width * 0.62,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          //color: Colors.blueGrey,
                                                          gradient: MyTheme
                                                              .gradient81,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
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
                                                                'Patient name',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Patient Mobile :',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
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
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Payment Id:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Date:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: MyTheme
                                                                      .text1,
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
                                                                '${item?[index].patientName}',
                                                                style: GoogleFonts.raleway(
                                                                    color: MyTheme
                                                                        .blueww,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.035),
                                                              ),
                                                              Text(
                                                                '${item?[index].mobileNumber}',
                                                                style: GoogleFonts.raleway(
                                                                    color: MyTheme
                                                                        .blueww,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.035),
                                                              ),
                                                              Text(
                                                                '${item?[index].amount}',
                                                                style: GoogleFonts.raleway(
                                                                    color: MyTheme
                                                                        .blueww,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.035),
                                                              ),
                                                              Text(
                                                                '${item?[index].id}',
                                                                style: GoogleFonts.raleway(
                                                                    color: MyTheme
                                                                        .blueww,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
                                                                        0.035),
                                                              ),
                                                              Text(
                                                                '${item?[index].paymentDate}',
                                                                style: GoogleFonts.raleway(
                                                                    color: MyTheme
                                                                        .blueww,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: size
                                                                            .width *
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
                                            ),
                                          ],
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
