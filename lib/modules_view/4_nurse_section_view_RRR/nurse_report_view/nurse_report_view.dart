// import 'package:flutter/material.dart';
//
// class NurseReportView extends StatelessWidget {
//
//  final List item=[
//   "https://www.thenewsminute.com/sites/all/var/www/images/dhanush%20medical%20report(1).jpeg",
//    "https://www.thenewsminute.com/sites/all/var/www/images/dhanush%20medical%20report(1).jpeg"
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Report View"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//            ListView.builder(
//              itemCount: item.length,
//                physics: NeverScrollableScrollPhysics(),
//                shrinkWrap: true,
//                itemBuilder: (context,index){
//                  return  Padding(
//                    padding: const EdgeInsets.only(top: 5.0),
//                    child: Container(
//                      //height: 250, width: double.infinity,
//                      color: Colors.red,
//                      child: Image.network(item[index],
//                        fit: BoxFit.fill,),
//                    ),
//                  );
//                })
//           ],
//         ),
//       ),
//     );
//   }
// }

///
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/view_report_nurse_controller/nurse_view_report_controllers.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_report_view/nurse_report_image_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/circular_loader.dart';

class NurseReportView extends StatelessWidget {
  NurseReportView({Key? key}) : super(key: key);

  // DriverPayoutController _driverPayoutController = Get.put(DriverPayoutController());
  // DriverPayoutHistoryController _driverPayoutHistoryController =
  //     Get.put(DriverPayoutHistoryController());

  //LabreportviewController _labreportviewController =
  // Get.put(LabreportviewController());
  NursereportviewController _nursereportviewController =
      Get.put(NursereportviewController());

  // LabreportviewController _labreportviewController =
  // Get.put(LabreportviewController());

  @override
  Widget build(BuildContext context) {
    var base = 'http://test.pswellness.in/Images/';
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => (_nursereportviewController.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -size.height * 0.03,
                        //bottom: size.height * 0.64,
                        //left: -30,
                        right: -size.width * 0.06,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: size.height * 0.24,
                            width: size.width * 0.55,
                            decoration: BoxDecoration(
                                //color: Colors.,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/background_stack_png/lab2.png',
                                      //'lib/assets/background_stack_png/paymhis2.png',
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
                                  'Nurse\'s Report View',
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
                            padding: EdgeInsets.only(top: size.height * 0.01),
                            child: Container(
                              //height: size.height * 0.02,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(30.0)),
                                  color: Colors.white30),
                              // width: size.width * 0.92,
                              height: size.height * 0.06,
                              margin: new EdgeInsets.fromLTRB(10, 15, 10, 20),
                              padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(splashColor: Colors.transparent),
                                child:
                                    // Obx(
                                    //   () => (_driverPayoutController.isLoading.value)
                                    //       ? Center(child: CircularProgressIndicator())
                                    //       :
                                    TextField(
                                  onChanged: (value) =>
                                      _nursereportviewController
                                          .filterNursePatient(value),
                                  // controller: _driverPayoutController.appointmentController,
                                  onTap: () {
                                    // _driverPayoutController.chooseDate();
                                  },
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: MyTheme.blueww),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'choose name..',
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, bottom: 12.0, top: 5.0),
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
                                //  ),
                              ),
                            ),
                          ),
                          _nursereportviewController
                                  .foundNurseviewProducts.value.isEmpty
                              ? Center(
                                  child: Text("No List"),
                                )
                              : SizedBox(
                                  height: size.height * 0.71,

                                  ///height: size.height,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _nursereportviewController
                                          .foundNurseviewProducts.length,
                                      // _driverPayoutHistoryController
                                      //     .getDriverPayoutHistory?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // DateTime? now = _driverPayoutHistoryController
                                        //     .getDriverPayoutHistory?[index]
                                        //     .joiningDate;
                                        // String Date =
                                        //     DateFormat('dd-MM-yyyy').format(now!);
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03,
                                              vertical: size.height * 0.0005),
                                          child: Container(
                                            height: size.height * 0.13,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 30 / 5),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                                  fit: BoxFit.fill),

                                              //color: MyTheme.containercolor8,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(-0, -0),
                                                  spreadRadius: 0,
                                                  blurRadius: 0,
                                                  color: Colors.yellow.shade300,

                                                  // color: darkShadow1,
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
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
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
                                                      color:
                                                          Colors.green.shade200,
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
                                                    InkWell(
                                                      onTap: () async {
                                                        ///todo: from here share preference.........
                                                        SharedPreferences
                                                            prefs =
                                                            await SharedPreferences
                                                                .getInstance();
                                                        prefs.setString(
                                                            "nursereportlistId",
                                                            "${_nursereportviewController.foundNurseviewProducts[index].id.toString()}");

                                                        _nursereportviewController
                                                            .nursereportimageApi();
                                                        _nursereportviewController
                                                            .update();
                                                        CallLoader.hideLoader();

                                                        Get.to(
                                                            NurseReportImageView());
                                                      },
                                                      child: Container(
                                                        height:
                                                            size.height * 0.09,
                                                        width:
                                                            size.width * 0.18,
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Image.network(
                                                          base +
                                                              '${_nursereportviewController.foundNurseviewProducts[index].file.toString()}',
                                                          //base+'${_userhomePageController.banerlistmodel!.bannerImageList![index].toString()}',
                                                          fit: BoxFit.fill,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            //if image not comming in catagary then we have to purchase

                                                            return Center(
                                                              child: Text(
                                                                'No Image',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      size.height *
                                                                          0.013,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        // Image.asset(
                                                        //   'lib/assets/icons/user.png',
                                                        //   // "lib/assets/image/icons8-hospital-64.png",
                                                        // ),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              const BoxShadow(
                                                                color: Color(
                                                                    0xFFBEBEBE),
                                                                offset: Offset(
                                                                    5, 5),
                                                                blurRadius: 10,
                                                                spreadRadius: 1,
                                                              ),
                                                              const BoxShadow(
                                                                color: Colors
                                                                    .white,
                                                                offset: Offset(
                                                                    -5, -5),
                                                                blurRadius: 10,
                                                                spreadRadius: 1,
                                                              ),
                                                            ]),
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
                                                          "${_nursereportviewController.foundNurseviewProducts[index].patientName}",
                                                          //'Ram Kumar',
                                                          // '\u{20B9}${_driverPayoutHistoryController.getDriverPayoutHistory?[index].paidAmount}',
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
                                                        // SizedBox(
                                                        //   height: size.height *
                                                        //       0.01,
                                                        // ),
                                                        // Text(
                                                        //   "${_nursereportviewController.foundNurseviewProducts[index].patientName}",
                                                        //
                                                        //   //'blood test',
                                                        //   // Date,
                                                        //   style: GoogleFonts
                                                        //       .roboto(
                                                        //     fontSize:
                                                        //         size.width *
                                                        //             0.04,
                                                        //     fontWeight:
                                                        //         FontWeight.w600,
                                                        //     color: Colors.red,
                                                        //   ),
                                                        // ),
                                                        // SizedBox(
                                                        //   height: size.height *
                                                        //       0.01,
                                                        // ),
                                                        // SizedBox(
                                                        //   width:
                                                        //       size.width * 0.3,
                                                        //   height: size.height *
                                                        //       0.02,
                                                        //   child: Text(
                                                        //     "${_nursereportviewController.foundNurseviewProducts[index].patientName.toString()}",
                                                        //
                                                        //     //'12-12-2023',
                                                        //     // Date,
                                                        //     style: GoogleFonts
                                                        //         .roboto(
                                                        //       fontSize:
                                                        //           size.width *
                                                        //               0.034,
                                                        //       fontWeight:
                                                        //           FontWeight
                                                        //               .w600,
                                                        //       color:
                                                        //           Colors.grey,
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        PhysicalModel(
                                                          color: Colors.white30,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          shape:
                                                              BoxShape.circle,
                                                          elevation: 4,
                                                          child: InkWell(
                                                            onTap: () async {
                                                              ///todo: from here share preference.........
                                                              SharedPreferences
                                                                  prefs =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              prefs.setString(
                                                                  "nursereportlistId",
                                                                  "${_nursereportviewController.foundNurseviewProducts[index].id.toString()}");

                                                              _nursereportviewController
                                                                  .nursereportimageApi();
                                                              _nursereportviewController
                                                                  .update();
                                                              CallLoader
                                                                  .hideLoader();

                                                              Get.to(
                                                                  NurseReportImageView());
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height *
                                                                      0.055,
                                                              width:
                                                                  size.width *
                                                                      0.11,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .cyanAccent,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "View",
                                                                  style:
                                                                      GoogleFonts
                                                                          .roboto(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize:
                                                                        size.width *
                                                                            0.035,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
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
