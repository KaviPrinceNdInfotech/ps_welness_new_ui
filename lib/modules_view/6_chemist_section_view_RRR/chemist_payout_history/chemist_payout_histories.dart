import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../controllers/6_chemist_view_controllers_RRR/chemist_payout_history_controller/chemist_payoutHistory_controller.dart';
//import 'package:ps_welness/constants/my_theme.dart';

//import '../../../controllers/6_chemist_view_controllers/chemist_payout_history_controller/chemist_payoutHistory_controller.dart';

class ChemistPayoutHistory extends StatelessWidget {
  ChemistPayoutHistory({Key? key}) : super(key: key);

  ChemistPayoutController _chemistPayoutController =
      Get.put(ChemistPayoutController());

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
          () => (_chemistPayoutController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -size.height * 0.041,
                          right: -size.width * 0.124,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: size.height * 0.22,
                              width: size.width * 0.75,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'lib/assets/background_stack_png/paymhis4.png',
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
                                    'Payout History',
                                    style: GoogleFonts.alatsi(
                                        fontSize: size.height * 0.032,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff023382)),
                                  ),
                                ],
                              ),
                            ),
                            //Spacer(),
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
                                  onChanged: (value) => _chemistPayoutController
                                      .filterPayoutChemist(value),
                                  //.filterOrderChemist(value),
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
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            _chemistPayoutController.foundPayout.value.isEmpty
                                ? Center(
                                    child: Text('No List'),
                                  )
                                : SizedBox(
                                    height: size.height * 0.77,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _chemistPayoutController
                                            .foundPayout?.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var item = _chemistPayoutController
                                              .foundPayout;
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.03,
                                                vertical: size.height * 0.0005),
                                            child: Container(
                                              height: size.height * 0.13,
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
                                                    color:
                                                        Colors.yellow.shade300,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(3, 3),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: Colors.grey.shade200,
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
                                                        blurRadius: 2,
                                                        color: Colors
                                                            .green.shade200,
                                                      ),
                                                    ]),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height:
                                                            size.height * 0.09,
                                                        width:
                                                            size.width * 0.18,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0xFFBEBEBE),
                                                                offset: Offset(
                                                                    5, 5),
                                                                blurRadius: 10,
                                                                spreadRadius: 1,
                                                              ),
                                                              BoxShadow(
                                                                color: Colors
                                                                    .white,
                                                                offset: Offset(
                                                                    -5, -5),
                                                                blurRadius: 10,
                                                                spreadRadius: 1,
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
                                                            '${item?[index].chemistName}',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.045,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: MyTheme
                                                                  .blueww,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                size.height *
                                                                    0.02,
                                                          ),
                                                          Text(
                                                            '${item?[index].paymentDate}',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.grey,
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
                                                            '${item?[index].amount}',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.05,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                size.height *
                                                                    0.02,
                                                          ),
                                                          Text(
                                                            'Received',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.green,
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
