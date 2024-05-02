import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/model/franchies_models/frenchiesTDSReportDD_model.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';

import '../../../controllers/2_franchises_controller/franchise_tdshistory_report/franchise_tds_history_report.dart';

class FranchiseTdsHistoryReport extends StatelessWidget {
  FranchiseTdsHistoryReport({Key? key}) : super(key: key);

  FranchiseTdsHistoryReportController _franchiseTdsHistoryReportController =
      Get.put(FranchiseTdsHistoryReportController());
  get newvalue => null!;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: size.height * 0.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        height: size.height * 0.032,
                        width: size.width * 0.071,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: size.height * 0.022,
                        )),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'Franchise TDS History',
                    style: TextStyle(
                      color: MyTheme.blueww,
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Obx(
                    () => DropdownButtonFormField<TdsDropdown>(
                        value: _franchiseTdsHistoryReportController
                            .selectedRole.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.list_alt,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select Any'),
                        items: _franchiseTdsHistoryReportController.role
                            .map((TdsDropdown items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.015,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (TdsDropdown? newValue) {
                          _franchiseTdsHistoryReportController
                              .selectedRole.value = newValue!;
                          // _franchiseTdsHistoryReportController.frenchiesTDSReportApi(newValue.name);
                          // _franchiseTdsHistoryReportController.frenchiesTotalTDSAmountApi(newValue.name);

                          // _franchiseTdsHistoryReportController.frenchiesTDSListByDateApi(newValue.name);
                        }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Total TDS Amount :',
                        style: TextStyle(
                          color: MyTheme.blueww,
                          fontSize: size.height * 0.016,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(() =>
                          _franchiseTdsHistoryReportController.isLoading.value
                              ? Center(child: Text("wait"))
                              : Text(
                                  // "₹ ${_franchiseTdsHistoryReportController.getfrenchiesTotalTdsModel?.amount?.toStringAsFixed(2) ?? 0}")
                                  "₹ ${_franchiseTdsHistoryReportController.getfrenchiesTotalTdsModel?.amount ?? 0}",
                                  style: GoogleFonts.poppins(
                                    fontSize: size.width * 0.034,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ))
                    ],
                  )),
            ),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white),
                  width: size.width * 0.34,
                  height: size.height * 0.06,
                  margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                  padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(splashColor: Colors.transparent),
                    child: Obx(
                      () =>
                          // Center(
                          //   child: Text(
                          //     DateFormat("dd-MM-yyyy")
                          //         .format(_franchiseTdsHistoryReportController.selectedDate.value),
                          //     style: TextStyle(fontSize: 15)
                          //   ),
                          // )
                          (_franchiseTdsHistoryReportController.isLoading.value)
                              ? Center(child: Text("Wait"))
                              : TextField(
                                  controller:
                                      _franchiseTdsHistoryReportController
                                          .appointmentController,
                                  onTap: () {
                                    _franchiseTdsHistoryReportController
                                        .chooseDate();
                                  },
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: MyTheme.blueww),
                                  decoration: InputDecoration(
                                    //prefixIcon: Icon(Icons.search),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'dd-mm-yyyy',
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, bottom: 12.0, top: 0.0),
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
                ),
                InkWell(
                  onTap: () {
                    _franchiseTdsHistoryReportController.chooseDate2();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white),
                    width: size.width * 0.34,
                    height: size.height * 0.06,
                    margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                    padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: Obx(
                        () =>
                            //     Center(
                            //   child: Text(
                            //       DateFormat("dd-MM-yyyy")
                            //           .format(_franchiseTdsHistoryReportController.selectedDate2.value).toString(),
                            //       style: TextStyle(fontSize: 15)
                            //   ),
                            // )

                            (_franchiseTdsHistoryReportController
                                    .isLoading.value)
                                ? Center(child: Text("Wait"))
                                : TextField(
                                    controller:
                                        _franchiseTdsHistoryReportController
                                            .appointmentController2,
                                    onTap: () {
                                      _franchiseTdsHistoryReportController
                                          .chooseDate2();
                                    },
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 15.0, color: MyTheme.blueww),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'dd-mm-yyyy',
                                      contentPadding: const EdgeInsets.only(
                                          left: 10.0, bottom: 12.0, top: 0.0),
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
                  ),
                ),
                InkWell(
                  onTap: () {
                    _franchiseTdsHistoryReportController.update();
                    Timer(const Duration(seconds: 1), () {
                      _franchiseTdsHistoryReportController
                          .frenchiesTotalTDSAmountApi();
                      _franchiseTdsHistoryReportController
                          .frenchiesTDSListByDateApi();
                    });
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: MyTheme.blueww,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Obx(
              () => _franchiseTdsHistoryReportController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _franchiseTdsHistoryReportController.gettdsByDateModel ==
                          null
                      ? const Center(
                          child: Text("Record Not Found!!!"),
                        )
                      : SizedBox(
                          //height: size.height * 0.67,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _franchiseTdsHistoryReportController
                                  .gettdsByDateModel?.tdsReport?.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = _franchiseTdsHistoryReportController
                                    .gettdsByDateModel?.tdsReport;
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.0005),
                                  child: Container(
                                    height: size.height * 0.25,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 30 / 9),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              lightPrimary2,
                                              darkPrimary2,
                                            ]),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(-0, -0),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: darkShadow,
                                          ),
                                          BoxShadow(
                                            offset: Offset(1, 3),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: Colors.grey,
                                          ),
                                        ],
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                'https://images.unsplash.com/photo-1464618663641-bbdd760ae84a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'),
                                            fit: BoxFit.cover)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.32,
                                            height: size.height * 0.26,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Name:',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Paid Fees :',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Unique Id:',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.32,
                                                  height: size.height * 0.028,
                                                  child: Text(
                                                    'Location:',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.blueww,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                ),
                                                // Text(
                                                //   'Payment date:',
                                                //   style: GoogleFonts.poppins(
                                                //     color: MyTheme.blueww,
                                                //     fontWeight: FontWeight.w600,
                                                //     fontSize:
                                                //         size.width * 0.035,
                                                //   ),
                                                // ),
                                                ///
                                                // Text(
                                                //   'Payment Timing :',
                                                //   style: GoogleFonts.poppins(
                                                //     color: MyTheme.blueww,
                                                //     fontWeight: FontWeight.w600,
                                                //     fontSize:
                                                //         size.width * 0.035,
                                                //   ),
                                                // ),
                                                Text(
                                                  'Tds Amt:',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                                Text(
                                                  'Payable amount :',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.58,
                                            height: size.height * 0.26,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${item?[index].name}',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                                Text(
                                                  '₹ ${item?[index].paidFees}',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                                Text(
                                                  '${item?[index].uniqueId}',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.58,
                                                  height: size.height * 0.027,
                                                  child: Center(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        '${item?[index].location}',
                                                        style:
                                                            GoogleFonts.roboto(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                ///
                                                // Text(
                                                //   '${item?[index].paymentDate}',
                                                //   style: GoogleFonts.raleway(
                                                //       color: Colors.white,
                                                //       fontWeight:
                                                //           FontWeight.w700,
                                                //       fontSize:
                                                //           size.width * 0.035),
                                                // ),
                                                ///
                                                // Text(
                                                //   '${item?[index].paymentTime}',
                                                //   style: GoogleFonts.raleway(
                                                //       color: Colors.white,
                                                //       fontWeight:
                                                //           FontWeight.w700,
                                                //       fontSize:
                                                //           size.width * 0.035),
                                                // ),
                                                Text(
                                                  '₹ ${item?[index].tdsamt}',
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                                Text(
                                                  '₹ ${item?[index].payableAmount}',
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.035),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
            ),
          ],
        ),
      ),
    );
  }
}
