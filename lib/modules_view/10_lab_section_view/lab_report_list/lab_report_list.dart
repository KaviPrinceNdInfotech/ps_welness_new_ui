import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_home/lab_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/constant_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/10_lab_controller/lab_view_report1_controller/lab_viewreport_controller.dart';
import '../../../widgets/circular_loader.dart';
import 'lab_report_viewss.dart';

class LabViewReport extends StatelessWidget {
  LabViewReport({Key? key}) : super(key: key);

  LabreportviewController _labreportviewController =
      Get.put(LabreportviewController());

  // LabreportviewController _labreportviewController =
  // Get.put(LabreportviewController());

  @override
  Widget build(BuildContext context) {
    // var base = 'http://test.pswellness.in/Images/';
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        //Get.offAll(LabHomePage());
        //Get.offAll(() => LabHomePage());
        Get.to(() => LabHomePage());
        return shouldPop;
      },
      child: Container(
        color: MyTheme.ThemeColors,
        height: size.height,
        width: size.width,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Obx(
            () => (_labreportviewController.isLoading.value)
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
                                    'Lab\'s Report View',
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
                                  data: Theme.of(context).copyWith(
                                      splashColor: Colors.transparent),
                                  child:
                                      // Obx(
                                      //   () => (_driverPayoutController.isLoading.value)
                                      //       ? Center(child: CircularProgressIndicator())
                                      //       :
                                      TextField(
                                    onChanged: (value) =>
                                        _labreportviewController
                                            .filterLabPatient(value),
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
                                  //  ),
                                ),
                              ),
                            ),
                            _labreportviewController
                                    .foundlabviewProducts.value.isEmpty
                                ? Center(
                                    child: Text("No List"),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _labreportviewController
                                            .foundlabviewProducts.length,
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
                                                    color:
                                                        Colors.yellow.shade300,

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
                                                      InkWell(
                                                        onTap: () async {
                                                          ///todo: from here share preference.........
                                                          SharedPreferences
                                                              prefs =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          prefs.setString(
                                                              "labreportlistId",
                                                              "${_labreportviewController.foundlabviewProducts[index].id.toString()}");
                                                          _labreportviewController
                                                              .labreportimageApi();
                                                          _labreportviewController
                                                              .update();
                                                          CallLoader
                                                              .hideLoader();

                                                          Get.to(
                                                              LabReportView());
                                                        },
                                                        child: Container(
                                                          height: size.height *
                                                              0.09,
                                                          width:
                                                              size.width * 0.18,
                                                          padding:
                                                              EdgeInsets.all(8),
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
                                                                  offset:
                                                                      Offset(
                                                                          5, 5),
                                                                  blurRadius:
                                                                      10,
                                                                  spreadRadius:
                                                                      1,
                                                                ),
                                                                const BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(-5,
                                                                          -5),
                                                                  blurRadius:
                                                                      10,
                                                                  spreadRadius:
                                                                      1,
                                                                ),
                                                              ]),
                                                          child: Image.network(
                                                            '$IMAGE_BASE_URL${_labreportviewController.foundlabviewProducts[index].file.toString()}',
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
                                                            "${_labreportviewController.foundlabviewProducts[index].patientName}",
                                                            //'Ram Kumar',
                                                            // '\u{20B9}${_driverPayoutHistoryController.getDriverPayoutHistory?[index].paidAmount}',
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
                                                                    0.01,
                                                          ),
                                                          Text(
                                                            "${_labreportviewController.foundlabviewProducts[index].testName}",

                                                            //'blood test',
                                                            // Date,
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                size.height *
                                                                    0.01,
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.3,
                                                            height:
                                                                size.height *
                                                                    0.02,
                                                            child: Text(
                                                              "${_labreportviewController.foundlabviewProducts[index].testName.toString()}",

                                                              //'12-12-2023',
                                                              // Date,
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize:
                                                                    size.width *
                                                                        0.034,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          PhysicalModel(
                                                            color:
                                                                Colors.white30,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            shape:
                                                                BoxShape.circle,
                                                            elevation: 4,
                                                            child: InkWell(
                                                              onTap: () async {
                                                                // CallLoader.loader();
                                                                ///todo: from here share preference.........
                                                                SharedPreferences
                                                                    prefs =
                                                                    await SharedPreferences
                                                                        .getInstance();
                                                                // labreportlistId
                                                                prefs.setString(
                                                                    "labreportlistId",
                                                                    "${_labreportviewController.foundlabviewProducts[index].id.toString()}");

                                                                _labreportviewController
                                                                    .labreportimageApi();
                                                                _labreportviewController
                                                                    .update();
                                                                // CallLoader
                                                                //     .loader();
                                                                Get.to(
                                                                    LabReportView());
                                                                CallLoader
                                                                    .hideLoader();
                                                                //Get.back();
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
                                                                    style: GoogleFonts
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
                                        }),
                                  ),
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
