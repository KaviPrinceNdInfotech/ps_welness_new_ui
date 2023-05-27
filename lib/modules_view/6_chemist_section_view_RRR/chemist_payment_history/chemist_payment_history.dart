import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/6_chemist_view_controllers_RRR/chemist_payment_history_controller/chemist_payment_controller.dart';

class ChemistPaymentHistory extends StatelessWidget {
  ChemistPaymentHistory({Key? key}) : super(key: key);
  ChemispaymentController _chemispaymentController =
      Get.put(ChemispaymentController());

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
          () => (_chemispaymentController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
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
                            height: size.height * 0.26,
                            width: size.width * 0.75,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/background_stack_png/paymhis3.png',
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
                                  'Payment History Chemist',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.032,
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
                                onChanged: (value) => _chemispaymentController
                                    .filterpaymentChemist(value),
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
                          _chemispaymentController
                                  .foundPaymentHistory.value.isEmpty
                              ? Center(
                                  child: Text('No List'),
                                )
                              : SizedBox(
                                  height: size.height * 0.71,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _chemispaymentController
                                          .foundPaymentHistory?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var item = _chemispaymentController
                                            .foundPaymentHistory;
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
                                                  image: const DecorationImage(
                                                      image: NetworkImage(
                                                          'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                                      fit: BoxFit.fill),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(-0, -0),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color: Colors
                                                          .yellow.shade300,
                                                    ),
                                                    BoxShadow(
                                                      offset: Offset(3, 3),
                                                      spreadRadius: 0,
                                                      blurRadius: 0,
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  //clipBehavior: Clip.none,
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
                                                          gradient: MyTheme
                                                              .sweepGradient1,
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
                                                              .sweepGradient1,
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
                                                                'Name:',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      size.width *
                                                                          0.035,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Bank :',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  // color: MyTheme.text1,
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
                                                                  //color: MyTheme.text1,
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
                                                                  //color: MyTheme.text1,
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
                                                                  //color: MyTheme.text1,
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
                                                                '${item?[index].branchName}',
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
                                                                '${item?[index].paymentId}',
                                                                maxLines: 1,
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
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.2,
                                                                child: Text(
                                                                  '${item?[index].paymentDate}',
                                                                  maxLines: 1,
                                                                  style: GoogleFonts.raleway(
                                                                      color: MyTheme
                                                                          .blueww,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          size.width *
                                                                              0.035),
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
