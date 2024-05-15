import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

import '../../../controllers/2_franchises_controller/franchise_payout_report/franchise_payout_report.dart';

class FranchisePayoutReport extends StatelessWidget {
  FranchisePayoutReport({Key? key}) : super(key: key);

  FranchisePayoutReportController _franchisePayoutReportController =
      Get.put(FranchisePayoutReportController());

  // var items = [
  //   'Doctor',
  //   'Vehicle',
  //   'Nurse',
  //   'Lab',
  //   'Health Checkup',
  //   'Chemist',
  // ];

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
              height: size.height * 0.01,
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
                    'Franchise Payout Report',
                    style: TextStyle(
                      color: MyTheme.blueww,
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),

            ///
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            //   child: Align(
            //       alignment: Alignment.centerLeft,
            //       child: Row(
            //         children: [
            //           Text(
            //             'Vendor Name:',
            //             style: TextStyle(
            //               color: MyTheme.white,
            //               fontSize: size.height * 0.016,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           SizedBox(
            //             width: size.width * 0.01,
            //           ),
            //           Text(
            //             'Rakesh Kumar',
            //             style: TextStyle(
            //               color: Colors.red.shade800,
            //               fontSize: size.height * 0.022,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ],
            //       )),
            // ),

            ///.................
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.white),
                  width: size.width * 0.72,
                  height: size.height * 0.06,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(splashColor: Colors.transparent),
                    child: Obx(
                      () => (_franchisePayoutReportController.isLoading.value)
                          ? const Center(child: Text("Wait"))
                          : TextField(
                              // controller: _franchisePaymentReportController.appointmentController,
                              onChanged: (value) =>
                                  _franchisePayoutReportController
                                      .filterPaymentNurse(value),
                              autofocus: false,
                              style: TextStyle(
                                  fontSize: 15.0, color: MyTheme.blueww),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Search name',
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, bottom: 14.0, top: 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                Container(
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
              ],
            ),
            Obx(() => _franchisePayoutReportController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : _franchisePayoutReportController.data.value.isEmpty
                    ? Center(child: Text('No List'))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _franchisePayoutReportController.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = _franchisePayoutReportController.data;
                          var now = item?[index].paymentDate;
                          var formatter = DateFormat('dd-MM-yyyy');
                          var timeFormatter = DateFormat('hh:mm a');
                          String time = timeFormatter.format(now!);
                          String date = formatter.format(now);
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.000),
                            child: Container(
                              height: size.height * 0.27,
                              margin:
                                  const EdgeInsets.symmetric(vertical: 30 / 9),
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
                                          'https://images.unsplash.com/photo-1614850523060-8da1d56ae167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'),
                                      fit: BoxFit.cover)),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.30,
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
                                              fontSize: size.width * 0.035,
                                            ),
                                          ),
                                          Text(
                                            'Paid Fees :',
                                            style: GoogleFonts.poppins(
                                              color: MyTheme.blueww,
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width * 0.035,
                                            ),
                                          ),
                                          // Text(
                                          //   'Payment Id:',
                                          //   style: GoogleFonts.poppins(
                                          //     color: MyTheme.blueww,
                                          //     fontWeight: FontWeight.w600,
                                          //     fontSize: size.width * 0.035,
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: size.height * 0.05,
                                            child: Center(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Location:',
                                                  style: GoogleFonts.poppins(
                                                    color: MyTheme.blueww,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        size.width * 0.035,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Payment date:',
                                            style: GoogleFonts.poppins(
                                              color: MyTheme.blueww,
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width * 0.035,
                                            ),
                                          ),
                                          // Text(
                                          //   'Payment Timing :',
                                          //   style: GoogleFonts.poppins(
                                          //     color: MyTheme.blueww,
                                          //     fontWeight: FontWeight.w600,
                                          //     fontSize: size.width * 0.035,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.6,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${item?[index].vendorName}',
                                            style: GoogleFonts.raleway(
                                                color: Colors.brown,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.width * 0.035),
                                          ),
                                          Text(
                                            '₹${item?[index].amount}',
                                            style: GoogleFonts.raleway(
                                                color: Colors.brown,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.width * 0.035),
                                          ),
                                          // Text(
                                          //   '${item?[index].id}',
                                          //   style: GoogleFonts.raleway(
                                          //       color: Colors.brown,
                                          //       fontWeight: FontWeight.w700,
                                          //       fontSize: size.width * 0.035),
                                          // ),
                                          SizedBox(
                                            height: size.height * 0.05,
                                            child: Center(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '${item?[index].location}',
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.brown,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          size.width * 0.03),
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            date,
                                            style: GoogleFonts.raleway(
                                                color: Colors.brown,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.width * 0.035),
                                          ),
                                          // Text(
                                          //   time,
                                          //   style: GoogleFonts.raleway(
                                          //       color: Colors.brown,
                                          //       fontWeight: FontWeight.w700,
                                          //       fontSize: size.width * 0.035),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
          ],
        ),
      ),
    );
  }
}
