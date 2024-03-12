import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/patient_list_controller.dart';

class PatientListDoctor extends StatelessWidget {
  PatientListDoctor({Key? key}) : super(key: key);
  PatientListController _patientListController =
      Get.put(PatientListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Booking History'),
        backgroundColor: MyTheme.ThemeColors,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Obx(
            () => (_patientListController.isLoading.value)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(30.0)),
                            color: Colors.white),
                        width: size.width * 0.9,
                        height: size.height * 0.06,
                        margin: new EdgeInsets.fromLTRB(20, 20, 20, 20),
                        padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(splashColor: Colors.transparent),
                          child: TextField(
                            onChanged: (value) => _patientListController
                                .filterappointmentt(value),
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 15.0, color: MyTheme.blueww),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Search patient-name',
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
                      _patientListController
                              .founlistpatientappointment.value.isEmpty
                          ? Center(child: Text('No List'))
                          : Expanded(
                              child: SizedBox(
                                  //height: size.height,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _patientListController
                                          .bookinghistory
                                          ?.bookingHistory
                                          ?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03,
                                              vertical: size.height * 0.0005),
                                          child: Container(
                                            height: size.height * 0.25,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 30 / 6),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      lightPrimary,
                                                      darkPrimary,
                                                    ]),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(-2, -2),
                                                    spreadRadius: 1,
                                                    blurRadius: 4,
                                                    color: darkShadow,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(2, 2),
                                                    spreadRadius: 1,
                                                    blurRadius: 4,
                                                    color: lightShadow,
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://images.unsplash.com/photo-1626624340240-aadc087844fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Ymx1ciUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                                    fit: BoxFit.cover)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                        'Patient Name:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme.text1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.035,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Patient Reg NO:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme.text1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.035,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Appointment Date :',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme.text1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.035,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.03,
                                                        width: size.width * 0.3,
                                                        child: Text(
                                                          'Patient Location:',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            color:
                                                                MyTheme.text1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                size.width *
                                                                    0.035,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Patient City:',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme.text1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
                                                              0.035,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Patient State :',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: MyTheme.text1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.width *
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
                                                        _patientListController
                                                            .bookinghistory!
                                                            .bookingHistory![
                                                                index]
                                                            .patientName
                                                            .toString(),
                                                        //'Kavi Raj',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                      ),
                                                      Text(
                                                        _patientListController
                                                                    .bookinghistory!
                                                                    .bookingHistory![
                                                                        index]
                                                                    .appointmentdate !=
                                                                null
                                                            ? DateFormat(
                                                                    'dd-MM-yyyy')
                                                                .format(_patientListController
                                                                    .bookinghistory!
                                                                    .bookingHistory![
                                                                        index]
                                                                    .appointmentdate!)
                                                            : 'No date', // Formatting the date
                                                        // Formatting the date
                                                        // "${_paymentViewControllers.foundPaymentdr?[index].paymentDate}",
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.03,
                                                        width:
                                                            size.width * 0.45,
                                                        child: Text(
                                                          _patientListController
                                                              .bookinghistory!
                                                              .bookingHistory![
                                                                  index]
                                                              .patientRegNo
                                                              .toString(),
                                                          //'8977889999',
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                        ),
                                                      ),
                                                      Text(
                                                        _patientListController
                                                            .bookinghistory!
                                                            .bookingHistory![
                                                                index]
                                                            .location
                                                            .toString(),
                                                        //'vineet@gmail.com',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                      ),
                                                      Text(
                                                        _patientListController
                                                            .bookinghistory!
                                                            .bookingHistory![
                                                                index]
                                                            .cityName
                                                            .toString(),
                                                        // 'Noida',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
                                                      ),
                                                      Text(
                                                        _patientListController
                                                            .bookinghistory!
                                                            .bookingHistory![
                                                                index]
                                                            .stateName
                                                            .toString(),
                                                        //'UP',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    size.width *
                                                                        0.035),
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
          // Positioned(
          //   top: 50,
          //   child: Container(
          //     height: size.height * 0.10,
          //     width: size.width * 0.19,
          //     decoration: BoxDecoration(
          //       color: Colors.green,
          //       shape: BoxShape.circle,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
