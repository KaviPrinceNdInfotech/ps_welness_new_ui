import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

class NurseeAppointmentHistory extends StatelessWidget {
  NurseeAppointmentHistory({Key? key}) : super(key: key);
  //NurseAppointmentHistoryController _nurseAppointmentHistoryController =
  //Get.put(NurseAppointmentHistoryController());

//  NurseAppointmentController _nurseappointmentdetailController = Get.put(NurseAppointmentController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
            //Obx(
            //   () => (_nurseAppointmentHistoryController.isLoading.value)
            //       ? Center(
            //           child: CircularProgressIndicator(),
            //         )
            //       :
            SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -size.height * 0.041,
                right: size.width * 0.03,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.21,
                    width: size.width * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/user_assets/nurse33.png',
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
                          'Booking History',
                          style: GoogleFonts.alatsi(
                              fontSize: size.height * 0.032,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff023382)),
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       decoration: new BoxDecoration(
                  //         borderRadius: new BorderRadius.all(
                  //             new Radius.circular(30.0)),
                  //         //color: Colors.white
                  //         gradient: MyTheme.gradient7,
                  //       ),
                  //       width: size.width * 0.72,
                  //       height: size.height * 0.06,
                  //       margin: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                  //       padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                  //       child: Theme(
                  //         data: Theme.of(context).copyWith(
                  //             splashColor: Colors.transparent),
                  //         child: TextField(
                  //           onChanged: (value) =>
                  //               _nurseAppointmentHistoryController
                  //                   .filterAppointmentNurse(value),
                  //           autofocus: false,
                  //           style: TextStyle(
                  //               fontSize: 15.0, color: MyTheme.blueww),
                  //           decoration: InputDecoration(
                  //             prefixIcon: Icon(Icons.search),
                  //             filled: true,
                  //             fillColor: Colors.white,
                  //             hintText: 'search name...',
                  //             contentPadding: const EdgeInsets.only(
                  //                 left: 10.0, bottom: 12.0, top: 6.0),
                  //             focusedBorder: OutlineInputBorder(
                  //               borderSide:
                  //                   BorderSide(color: Colors.white),
                  //               borderRadius:
                  //                   BorderRadius.circular(25.7),
                  //             ),
                  //             enabledBorder: UnderlineInputBorder(
                  //               borderSide:
                  //                   BorderSide(color: Colors.white),
                  //               borderRadius:
                  //                   BorderRadius.circular(25.7),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: size.height * 0.06,
                  //       width: size.width * 0.2,
                  //       decoration: BoxDecoration(
                  //         //color: MyTheme.blueww,
                  //         //gradient: MyTheme.gradient10,
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //       child: Lottie.asset(
                  //         'lib/assets/image/70361-searching.zip',
                  //         width: 400,
                  //         height: 400,
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  // _nurseAppointmentHistoryController
                  //         .foundappointment.value.isEmpty
                  // ? Center(child: Text('No List'))
                  SizedBox(
                      height: size.height * 0.71,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          // _nurseAppointmentHistoryController.getNurseAppointmentHistory.,
                          itemBuilder: (BuildContext context, int index) {
                            // var item =
                            //     _nurseAppointmentHistoryController
                            //         .foundappointment;
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03,
                                      vertical: size.height * 0.0005),
                                  child: Container(
                                    height: size.height * 0.25,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 30 / 5),
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
                                          color: Colors.black38,
                                        ),
                                        BoxShadow(
                                          offset: Offset(4, 4),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          color: Colors.black38,
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: -60,
                                          left: -125,
                                          child: Container(
                                            height: size.height * 0.39,
                                            width: size.width * 0.77,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: MyTheme.gradient4,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Patient Mobile :',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Paid Amount:',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Patient Address:',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Start slot:',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          size.width * 0.035,
                                                    ),
                                                  ),
                                                  Text(
                                                    'End Slot :',
                                                    style: GoogleFonts.poppins(
                                                      color: MyTheme.text1,
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
                                                    "Kavi Singh",
                                                    //'${item?[index].patientName}',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    "567788888",
                                                    // '${item?[index].mobileNumber}',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    "100",
                                                    //'${item?[index].amount}',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    "c53 noida",
                                                    // '${item?[index].location}',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    "9 am",
                                                    //'${item?[index].startSlotTime}',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            size.width * 0.035),
                                                  ),
                                                  Text(
                                                    "9pm",
                                                    //'${item?[index].endSlotTime}',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors
                                                            .grey.shade800,
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
        //  ),
      ),
    );
  }
}
