import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

//import 'package:ps_welness/constants/constants/constants.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/doctor_sections/get_doctor_list_controller.dart';
import '../../../../../controllers/1_user_view_controller/lab_controller/lab_bboking_scedule/lab_booking_schedule_controller.dart';
import '../../../../../model/1_user_model/time_slots_common_model/time_slots_common.dart';

class DoctorScheduleCredentials extends StatelessWidget {
  DoctorScheduleCredentials({Key? key, this.bevel = 2.0}) : super(key: key);
  final double bevel;

  book_lab_schedule_Controller _book_lab_book_schedule_controller =
      Get.put(book_lab_schedule_Controller());
  // LabListController _labListController = Get.put(LabListController());
  DoctorListController _doctorListController = Get.put(DoctorListController());

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: _doctorListController.doctor3formkey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: Obx(
            () => (_doctorListController.isLoading.isTrue)
                ? Center(child: CircularProgressIndicator())
                // : _nurseAppointmentDetailController.nursedetailbyId != null
                // ? Center(
                //   child: Text('No Data'),
                // )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),

                      ///todo:selected date starting...

                      Text(
                        'Date of Booking:',
                        style: TextStyle(
                          fontSize: size.height * 0.016,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.blueww,
                        ),
                      ),

                      // Container(
                      //   width: double.infinity,
                      //   margin: EdgeInsets.symmetric(vertical: 30 / 3),
                      //   decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //           begin: Alignment.centerLeft,
                      //           end: Alignment.centerRight,
                      //           colors: [
                      //             lightPrimary,
                      //             darkPrimary,
                      //           ]),
                      //       borderRadius: BorderRadius.circular(12),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           offset: Offset(-0, -0),
                      //           spreadRadius: 0,
                      //           blurRadius: 0,
                      //           color: darkShadow,
                      //         ),
                      //         BoxShadow(
                      //           offset: Offset(2, 2),
                      //           spreadRadius: 1,
                      //           blurRadius: 0,
                      //           color: lightShadow,
                      //         ),
                      //       ]),
                      //   child: Obx(
                      //     () => (_book_lab_book_schedule_controller.isLoading.value)
                      //         ? Center(child: CircularProgressIndicator())
                      //         : TextFormField(
                      //             controller: _book_lab_book_schedule_controller
                      //                 .appointmentController1,
                      //             onTap: () {
                      //               _book_lab_book_schedule_controller.chooseDate();
                      //             },
                      //
                      //             cursorColor: Colors.black,
                      //             obscureText: false,
                      //             decoration: InputDecoration(
                      //               hintText: 'Select date',
                      //               helperStyle: TextStyle(
                      //                 color: black.withOpacity(0.7),
                      //                 fontSize: 18,
                      //               ),
                      //               prefixIcon: Icon(
                      //                 Icons.calendar_today_outlined,
                      //                 color: black.withOpacity(0.7),
                      //                 size: 20,
                      //               ),
                      //               border: InputBorder.none,
                      //             ),
                      //             keyboardType: TextInputType.multiline,
                      //             maxLines: 1,
                      //             autofocus: true,
                      //             //obscureText: true,
                      //             //controller: _loginpasswordController.mobileController,
                      //           ),
                      //   ),
                      // ),

                      SizedBox(
                        height: size.height * 0.075,
                        width: size.width,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 30 / 7),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    lightPrimary,
                                    darkPrimary,
                                  ]),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(-1, -1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  color: Colors.white,
                                ),
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  color: Colors.grey,
                                ),
                              ]),
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            // decoration: InputDecoration(
                            //   hintText: 'Enter Something',
                            //   contentPadding: EdgeInsets.all(20.0),
                            // ),

                            controller:
                                _doctorListController.appointmentController,
                            onTap: () {
                              _doctorListController.chooseDate();
                            },

                            cursorColor: Colors.black,
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(17.0),
                              hintText: 'Select date',
                              helperStyle: TextStyle(
                                color: black.withOpacity(0.7),
                                fontSize: 18,
                              ),
                              prefixIcon: Icon(
                                Icons.calendar_today_outlined,
                                color: black.withOpacity(0.7),
                                size: 20,
                              ),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            autofocus: true,
                            //obscureText: true,
                            //controller: _loginpasswordController.mobileController,
                          ),
                        ),
                        // ListView.builder(
                        //     shrinkWrap: true,
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: 32,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return Padding(
                        //         padding: const EdgeInsets.all(3.0),
                        //         child: PhysicalModel(
                        //           color: MyTheme.white,
                        //           borderRadius: BorderRadius.circular(5),
                        //           elevation: 20,
                        //           child: Padding(
                        //             padding: EdgeInsets.symmetric(
                        //                 horizontal: size.width * 0.01,
                        //                 vertical: size.height * 0.004),
                        //             child: Container(
                        //               //height: size.height * 0.025,
                        //               width: size.width * 0.17,
                        //               decoration: BoxDecoration(
                        //                 color: MyTheme.ThemeColors,
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   Text(
                        //                     'MAR',
                        //                     style: TextStyle(
                        //                       fontSize: size.height * 0.015,
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.white,
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     height: size.height * 0.01,
                        //                   ),
                        //                   Text(
                        //                     '${index}',
                        //                     style: TextStyle(
                        //                       fontSize: size.height * 0.016,
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.white,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     }),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Book a Time:',
                          style: TextStyle(
                            fontSize: size.height * 0.016,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.blueww,
                            //color: Colors.red.shade300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.075,
                        width: size.width,
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 30 / 7),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    lightPrimary,
                                    darkPrimary,
                                  ]),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(-1, -1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  color: Colors.white,
                                ),
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  color: Colors.grey,
                                ),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.01,
                              //vertical: size.height * 0.02
                            ),
                            child: Obx(
                              () => DropdownButtonFormField<TimeSlot>(
                                  value: _doctorListController
                                      .selectedTimeslot.value,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.place,
                                      color: Colors.black,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                  ),
                                  hint: Text('Select Time Slot'),
                                  items: _doctorListController.timeslot
                                      .map((TimeSlot timeslot) {
                                    return DropdownMenuItem(
                                      value: timeslot,
                                      child: Text(
                                        timeslot.slotTime.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: size.height * 0.015,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (TimeSlot? newValue) {
                                    _doctorListController
                                        .selectedTimeslot.value = newValue!;
                                    // _nurseBooking1Controller.selectedCity.value = null;
                                    // _hospital_2_controller.states.value =
                                    //     newValue! as List<String>;
                                    // _hospital_2_controller.selectedCity.value = null;
                                    // _hospital_2_controller.cities.clear();
                                    // _hospital_2_controller.cities
                                    //     .addAll(stateCityMap[newvalue]!);
                                  }),
                            ),
                          ),
                        ),
                        // ListView.builder(
                        //     shrinkWrap: true,
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: 32,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return Padding(
                        //         padding: const EdgeInsets.all(3.0),
                        //         child: PhysicalModel(
                        //           color: MyTheme.white,
                        //           borderRadius: BorderRadius.circular(5),
                        //           elevation: 20,
                        //           child: Padding(
                        //             padding: EdgeInsets.symmetric(
                        //                 horizontal: size.width * 0.01,
                        //                 vertical: size.height * 0.004),
                        //             child: Container(
                        //               //height: size.height * 0.025,
                        //               width: size.width * 0.17,
                        //               decoration: BoxDecoration(
                        //                 color: MyTheme.ThemeColors,
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   Text(
                        //                     'MAR',
                        //                     style: TextStyle(
                        //                       fontSize: size.height * 0.015,
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.white,
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     height: size.height * 0.01,
                        //                   ),
                        //                   Text(
                        //                     '${index}',
                        //                     style: TextStyle(
                        //                       fontSize: size.height * 0.016,
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.white,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     }),
                      ),

                      // SizedBox(
                      //   height: size.height * 0.06,
                      //   width: size.width,
                      //   child: ListView.builder(
                      //       shrinkWrap: true,
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: 32,
                      //       itemBuilder: (BuildContext context, int index) {
                      //         return Padding(
                      //           padding: const EdgeInsets.all(3.0),
                      //           child: Ink(
                      //             child: PhysicalModel(
                      //               color: MyTheme.white,
                      //               borderRadius: BorderRadius.circular(5),
                      //               elevation: 20,
                      //               child: Padding(
                      //                 padding: EdgeInsets.symmetric(
                      //                     horizontal: size.width * 0.01,
                      //                     vertical: size.height * 0.004),
                      //                 child: Container(
                      //                   //height: size.height * 0.025,
                      //                   width: size.width * 0.17,
                      //                   decoration: BoxDecoration(
                      //                     color: MyTheme.ThemeColors,
                      //                     borderRadius: BorderRadius.circular(5),
                      //                   ),
                      //                   child: Column(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.center,
                      //                     children: [
                      //                       Text(
                      //                         '10:00',
                      //                         style: TextStyle(
                      //                           fontSize: size.height * 0.015,
                      //                           fontWeight: FontWeight.w600,
                      //                           color: Colors.white,
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       }),
                      // ),

                      ///todo:starting time.........................
                      ///
                      /// time picker...........

                      // Container(
                      //   width: double.infinity,
                      //   margin: EdgeInsets.symmetric(vertical: 30 / 2),
                      //   decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //           begin: Alignment.centerLeft,
                      //           end: Alignment.centerRight,
                      //           colors: [
                      //             lightPrimary,
                      //             darkPrimary,
                      //           ]),
                      //       borderRadius: BorderRadius.circular(12),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           offset: Offset(-0, -0),
                      //           spreadRadius: 0,
                      //           blurRadius: 0,
                      //           color: darkShadow,
                      //         ),
                      //         BoxShadow(
                      //           offset: Offset(2, 2),
                      //           spreadRadius: 1,
                      //           blurRadius: 0,
                      //           color: lightShadow,
                      //         ),
                      //       ]),
                      //   child: Obx(
                      //     () => InkWell(
                      //       onTap: () {
                      //         _book_lab_book_schedule_controller.chooseTime();
                      //       },
                      //       child: Container(
                      //         height: size.height * 0.06,
                      //         child: Center(
                      //           child: Padding(
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: size.width * 0.1),
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text(
                      //                   'Choose Starting Time:',
                      //                   style: TextStyle(
                      //                     fontSize: size.height * 0.017,
                      //                     fontWeight: FontWeight.bold,
                      //                     color: MyTheme.blueww,
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   width: size.width * 0.03,
                      //                 ),
                      //                 //Spacer(),
                      //                 Text(
                      //                   "${_book_lab_book_schedule_controller.selectedTime.value.hour}:${_book_lab_book_schedule_controller.selectedTime.value.minute}",
                      //                   style: TextStyle(
                      //                     fontSize: size.height * 0.026,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      ///todo:selected time ending...
                      //
                      // NeumorphicTextFieldContainer(
                      //   child: Obx(
                      //     () => InkWell(
                      //       onTap: () {
                      //         _book_lab_controller.chooseTime2();
                      //       },
                      //       child: Container(
                      //         height: size.height * 0.06,
                      //         child: Center(
                      //           child: Padding(
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: size.width * 0.1),
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text(
                      //                   'Choose Ending Time:',
                      //                   style: TextStyle(
                      //                     fontSize: size.height * 0.017,
                      //                     fontWeight: FontWeight.bold,
                      //                     color: MyTheme.blueww,
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   width: size.width * 0.03,
                      //                 ),
                      //                 //Spacer(),
                      //                 Text(
                      //                   "${_book_lab_controller.selectedTime2.value.hour}:${_book_lab_controller.selectedTime2.value.minute}",
                      //                   style: TextStyle(
                      //                     fontSize: size.height * 0.026,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // RectangularButton(
                      //     text: 'SUBMIT',
                      //     press: () {
                      //       Get.to(UserHomePage());
                      //       //_loginpasswordController.checkLoginpassword();
                      //     })
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
