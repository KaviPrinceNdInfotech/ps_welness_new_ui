import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers/patient_report_view_controller.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/controllers/9_doctor_controllers/patient_report_view_controller.dart';

class ViewPatientReport extends StatelessWidget {
  ViewPatientReport({Key? key}) : super(key: key);

  DoctorPatientReportControllers _doctorPatientReportControllers =
      Get.put(DoctorPatientReportControllers());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Obx(
        () => (_doctorPatientReportControllers.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _doctorPatientReportControllers.viewPatientReport == null
                ? Center(
                    child: Text('No Data'),
                  )
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.001,
                          ),
                          Container(
                            height: size.height * 0.06,
                            child: Row(
                              children: [
                                Container(
                                    height: size.height * 0.06,
                                    width: size.width * 0.1,
                                    // color: Colors.white70,
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: Icon(
                                                Icons.arrow_back_ios_outlined))
                                        //Icon(Icons.arrow_back_ios_outlined)
                                        )),
                                SizedBox(
                                  width: size.width * 0.06,
                                ),
                                Text(
                                  'View Patient Report Doctor',
                                  style: TextStyle(
                                    fontSize: size.height * 0.022,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Material(
                            elevation: 4,
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width,
                              color: Colors.blueGrey.shade200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Patientname',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.height * 0.02,
                                          ),
                                        ),
                                        Text(
                                          'PatientRegNo',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.height * 0.02,
                                          ),
                                        ),
                                        Text(
                                          'PatientNumber',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.height * 0.02,
                                          ),
                                        ),
                                        Text(
                                          'PatientEmail',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.height * 0.02,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * 0.08,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _doctorPatientReportControllers
                                              .viewPatientReport!.patientName
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.height * 0.02,
                                          ),
                                          //'Patientname'
                                        ),
                                        Text(
                                          _doctorPatientReportControllers
                                              .viewPatientReport!.patientRegNo
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.height * 0.02,
                                          ),

                                          //'PatientRegNo'
                                        ),
                                        Text(
                                          _doctorPatientReportControllers
                                              .viewPatientReport!.mobileNumber
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.height * 0.02,
                                          ),

                                          //'PatientNumber'
                                        ),
                                        Text(
                                          _doctorPatientReportControllers
                                              .viewPatientReport!.emailId
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.height * 0.02,
                                          ),

                                          //'PatietEmail'
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('View Reports',
                                style: TextStyle(
                                  fontSize: size.height * 0.022,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          Obx(
                              ()=> (_doctorPatientReportControllers.isLoading.value)
                                  ? Center(child: CircularProgressIndicator())
                                  : _doctorPatientReportControllers.viewPatientReport!.response!.isEmpty
                                  ? Center(
                                child: Text('Empty list!'),
                              )

                            //child
                                  : SizedBox(
                                height: size.height * 0.55,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _doctorPatientReportControllers.viewPatientReport?.response?.length,
                                    // _doctorPatientReportControllers
                                    //     .viewPatientReport!.response!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return
                                          // Obx(
                                          // () => (_doctorPatientReportControllers
                                          //         .isLoading.value)
                                          //     ? Center(
                                          //         child:
                                          //             CircularProgressIndicator())
                                          //     : _doctorPatientReportControllers
                                          //             .viewPatientReport!
                                          //             .response!
                                          //             .isEmpty
                                          //         //.getcatagartlist!.result!.isEmpty
                                          //         ? Center(
                                          //             child: Text(
                                          //               'No List',
                                          //               style: TextStyle(
                                          //                 fontSize:
                                          //                     size.height * 0.02,
                                          //               ),
                                          //             ),
                                          //           )
                                          //         :
                                          Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.00,
                                            vertical: size.height * 0.0005),
                                        child: Container(
                                          height: size.height * 0.25,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 30 / 7),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  lightPrimary1,
                                                  darkPrimary2,
                                                ]),
                                            boxShadow: [
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
                                            // image: DecorationImage(
                                            //     image: AssetImage(
                                            //         'lib/assets/background_stack_png/appointment6.png'),
                                            //     fit: BoxFit.cover)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Patient Name:',
                                                      style: GoogleFonts.poppins(
                                                        color: MyTheme.blueww,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            size.width * 0.035,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Paid Fees :',
                                                      style: GoogleFonts.poppins(
                                                        color: MyTheme.blueww,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            size.width * 0.035,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Payment Id:',
                                                      style: GoogleFonts.poppins(
                                                        color: MyTheme.blueww,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            size.width * 0.035,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Patient Location:',
                                                      style: GoogleFonts.poppins(
                                                        color: MyTheme.blueww,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            size.width * 0.035,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Payment date:',
                                                      style: GoogleFonts.poppins(
                                                        color: MyTheme.blueww,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            size.width * 0.035,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Payment Timing :',
                                                      style: GoogleFonts.poppins(
                                                        color: MyTheme.blueww,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            size.width * 0.035,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Vineet Mishra',
                                                      style: GoogleFonts.raleway(
                                                          color:
                                                              Colors.red.shade300,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              size.width * 0.035),
                                                    ),
                                                    Text(
                                                      '₹ 1950',
                                                      style: GoogleFonts.raleway(
                                                          color:
                                                              Colors.red.shade300,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              size.width * 0.035),
                                                    ),
                                                    Text(
                                                      '678',
                                                      style: GoogleFonts.raleway(
                                                          color:
                                                              Colors.red.shade300,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              size.width * 0.035),
                                                    ),
                                                    Text(
                                                      'Sector 12, C 52 Noida',
                                                      style: GoogleFonts.raleway(
                                                          color:
                                                              Colors.red.shade300,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              size.width * 0.035),
                                                    ),
                                                    Text(
                                                      'Jan 1,23',
                                                      style: GoogleFonts.raleway(
                                                          color:
                                                              Colors.red.shade300,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              size.width * 0.035),
                                                    ),
                                                    Text(
                                                      '07:00 pm',
                                                      style: GoogleFonts.raleway(
                                                          color:
                                                              Colors.red.shade300,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              size.width * 0.035),
                                                    ),
                                                  ],
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
                  ),
      ),
    );
  }
}
