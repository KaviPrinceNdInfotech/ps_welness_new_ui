import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/constants/my_theme.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../constants/my_theme.dart';
import '../../../../controllers/1_user_view_controller/nurse_history_controller/nurse_booking_history.dart';

class NurseAppointmentHistory extends StatelessWidget {
  NurseAppointmentHistory({Key? key}) : super(key: key);

  NurseBookingHistoryController _nursebookingHistoryController =
      Get.put(NurseBookingHistoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      body: Obx(
              () => (_nursebookingHistoryController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              //: _nurseHistoryController.nurseappointmentdetail != null
          //     ? Center(
          //   child: Text('No Data'),
          // )
              :
           SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: size.height * 0.02),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: size.width * 0.05,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      'Nurse History',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(30.0)),
                        color: Colors.white),
                    width: size.width * 0.72,
                    height: size.height * 0.06,
                    margin: new EdgeInsets.fromLTRB(15, 20, 10, 20),
                    padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: Obx(
                        () => (_nursebookingHistoryController.isLoading.value)
                            ? Center(child: CircularProgressIndicator())
                            : TextField(
                                controller: _nursebookingHistoryController
                                    .appointmentController1,
                                onTap: () {
                                  _nursebookingHistoryController.chooseDate();
                                },
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 15.0, color: MyTheme.blueww),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'dd-mm-yyyy',
                                  contentPadding: const EdgeInsets.only(
                                      left: 10.0, bottom: 12.0, top: 0.0),
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
              Obx(
                      () => (_nursebookingHistoryController.isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                  : _nursebookingHistoryController.nurseappointmentdetail?.nurseAppointments == null
                      ? Center(
                     child: Text('No Data'),
                  )
                      :
                 SizedBox(
                    height: size.height * 0.73,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _nursebookingHistoryController.nurseappointmentdetail?.nurseAppointments?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.0005),
                            child: Container(
                              height: size.height * 0.25,
                              margin: EdgeInsets.symmetric(vertical: 30 / 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
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
                                      image: AssetImage(
                                          'lib/assets/background_stack_png/patient3_history.png'),
                                      fit: BoxFit.cover)),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Service Charge:',
                                          style: GoogleFonts.poppins(
                                            color: MyTheme.text1,
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.width * 0.039,
                                          ),
                                        ),
                                        Text(
                                          'Service Type:',
                                          style: GoogleFonts.poppins(
                                            color: MyTheme.text1,
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.width * 0.039,
                                          ),
                                        ),
                                        Text(
                                          'Service Status:',
                                          style: GoogleFonts.poppins(
                                            color: MyTheme.text1,
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.width * 0.039,
                                          ),
                                        ),
                                        Text(
                                          'Nurse Total days:',
                                          style: GoogleFonts.poppins(
                                            color: MyTheme.text1,
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.width * 0.039,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _nursebookingHistoryController.nurseappointmentdetail!.nurseAppointments![index].totalFee.toString(),
                                          //_nurseHistoryController.nurseappointmentdetail!.result![index].totalFee.toString(),
                                         //'Nov 16,22 - Nov 20,22',
                                          style: GoogleFonts.raleway(
                                              color: Colors.cyanAccent,
                                              fontWeight: FontWeight.w700,
                                              fontSize: size.width * 0.039),
                                        ),
                                        Text(
                                            _nursebookingHistoryController.nurseappointmentdetail!.nurseAppointments![index].paymentDate.toString(),
                                          //'other',
                                          style: GoogleFonts.raleway(
                                              color: Colors.cyanAccent,
                                              fontWeight: FontWeight.w700,
                                              fontSize: size.width * 0.039),
                                        ),
                                        Text(
                                          _nursebookingHistoryController.nurseappointmentdetail!.nurseAppointments![index].paymentDate.toString(),
                                          //'Pending',
                                          style: GoogleFonts.raleway(
                                              color: Colors.cyanAccent,
                                              fontWeight: FontWeight.w700,
                                              fontSize: size.width * 0.039),
                                        ),
                                        Text(
                                          _nursebookingHistoryController.nurseappointmentdetail!.nurseAppointments![index].totaNumberofdays.toString(),
                                         // '6',
                                          style: GoogleFonts.raleway(
                                              color: Colors.cyanAccent,
                                              fontWeight: FontWeight.w700,
                                              fontSize: size.width * 0.039),
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
    );
  }
}
