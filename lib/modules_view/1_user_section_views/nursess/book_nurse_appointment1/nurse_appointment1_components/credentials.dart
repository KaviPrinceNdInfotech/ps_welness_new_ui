import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_location_model/nurse_location_models.dart';
import 'package:ps_welness_new_ui/modules_view/1_user_section_views/nursess/nurse_appointment_section/nurse_lists/nurse_list_appointment.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/model/1_user_model/nurse_location_model/nurse_location_models.dart';
// import 'package:ps_welness/model/1_user_model/nurse_type_model/nurse_type_model.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/nursess/appointment_history_nurse/nurse_history_appointment.dart';
// import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
// //mport 'package:ps_welness/modules_view/1_user_section_views/nursess/nurse_type_model/nurse_type_model.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../constants/my_theme.dart';
import '../../../../../controllers/1_user_view_controller/nurse_appointment_controller/nurse_booking_1_controller.dart';
import '../../../../../model/1_user_model/nurse_type_model/nurse_type_model.dart';
import '../../../../../widgets/circular_loader.dart';
import '../../../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../../../../widgets/widgets/rectangular_button.dart';
import '../../appointment_history_nurse/nurse_history_appointment.dart';

class Nursebooking1Credentials extends StatelessWidget {
  Nursebooking1Credentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  NurseBooking1Controller _nurseBooking1Controller =
      Get.put(NurseBooking1Controller());

  // User_1_Controller _user_1_controller = Get.put(User_1_Controller());

  // var items = [
  //   'Technician',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _nurseBooking1Controller.NurseBookingformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NeumorphicTextFieldContainer(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              //     child: Obx(
              //       () => DropdownButtonFormField(
              //           //icon: Icon(Icons.location_city),
              //           value: _nurseBooking1Controller.selectednurse.value,
              //           decoration: InputDecoration(
              //             prefixIcon: Icon(
              //               Icons.account_circle,
              //               color: Colors.black,
              //             ),
              //             enabledBorder: InputBorder.none,
              //             border: InputBorder.none,
              //           ),
              //           hint: Text('Selected Nurse'),
              //           items: items.map((String items) {
              //             return DropdownMenuItem(
              //               value: items,
              //               child: Text(
              //                 items,
              //                 style: TextStyle(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: size.height * 0.015,
              //                 ),
              //               ),
              //             );
              //           }).toList(),
              //           onChanged: (String? newValue) {
              //             _nurseBooking1Controller.selectednurse.value =
              //                 newValue!;
              //             // _hospital_2_controller.states.value =
              //             //     newValue! as List<String>;
              //             // _hospital_2_controller.selectedCity.value = null;
              //             // _hospital_2_controller.cities.clear();
              //             // _hospital_2_controller.cities
              //             //     .addAll(stateCityMap[newvalue]!);
              //           }),
              //     ),
              //   ),
              // ),
              Text(
                'Nurse Type',
                style: TextStyle(
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blueww,
                ),
              ),
              SizedBox(
                height: size.height * 0.0,
              ),
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                        () => DropdownButtonFormField<NurseModels>(
                        value: _nurseBooking1Controller.selectedNurse.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select Nurse'),
                        items:
                        _nurseBooking1Controller.nurse.map((NurseModels nurse) {
                          return DropdownMenuItem(
                            value: nurse,
                            child: Text(
                              nurse.nurseTypeName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.015,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (NurseModels? newValue) {
                          _nurseBooking1Controller.selectedNurse.value = newValue!;
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

              ///nurse type...radio button.....
              //
              // Container(
              //   height: size.height * 0.066,
              //   width: double.infinity,
              //   margin: EdgeInsets.symmetric(vertical: 25 / 2),
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
              //           offset: Offset(-2, -2),
              //           spreadRadius: 1,
              //           blurRadius: 4,
              //           color: darkShadow,
              //         ),
              //         BoxShadow(
              //           offset: Offset(2, 2),
              //           spreadRadius: 1,
              //           blurRadius: 4,
              //           color: lightShadow,
              //         ),
              //       ]),
              //   child: SizedBox(
              //     //width: size.width * 0.40,
              //     child: Container(
              //       //width: size.width * 40,
              //       height: size.height * 0.065,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         //color: Colors.white,
              //       ),
              //       child: Padding(
              //         padding:
              //             EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Obx(
              //               () => Radio(
              //                 visualDensity: VisualDensity(
              //                   horizontal: VisualDensity.minimumDensity,
              //                   vertical: VisualDensity.minimumDensity,
              //                 ),
              //                 // title: Text("Male"),
              //                 value: "Anm",
              //                 groupValue: _nurseBooking1Controller
              //                     .selectedServicee.value,
              //                 onChanged: (value) {
              //                   _nurseBooking1Controller
              //                       .onChangeServicee(value!);
              //                   // setState(() {
              //                   //   gender = value.toString();
              //                   // });
              //                 },
              //               ),
              //             ),
              //             Text(
              //               'ANM',
              //               style: TextStyle(
              //                 fontSize: size.width * 0.03,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //             Obx(
              //               () => Radio(
              //                 visualDensity: VisualDensity(
              //                   horizontal: VisualDensity.minimumDensity,
              //                   vertical: VisualDensity.minimumDensity,
              //                 ),
              //                 // title: Text("Male"),
              //                 value: "GNM",
              //                 groupValue: _nurseBooking1Controller
              //                     .selectedServicee.value,
              //                 onChanged: (value) {
              //                   _nurseBooking1Controller
              //                       .onChangeServicee(value!);
              //                   // setState(() {
              //                   //   gender = value.toString();
              //                   // });
              //                 },
              //               ),
              //             ),
              //             Text(
              //               'GNM',
              //               style: TextStyle(
              //                 fontSize: size.width * 0.03,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //             Obx(
              //               () => Radio(
              //                 visualDensity: VisualDensity(
              //                   horizontal: VisualDensity.minimumDensity,
              //                   vertical: VisualDensity.minimumDensity,
              //                 ),
              //                 // title: Text("Male"),
              //                 value: "Product",
              //                 groupValue: _nurseBooking1Controller
              //                     .selectedServicee.value,
              //                 onChanged: (value) {
              //                   _nurseBooking1Controller
              //                       .onChangeServicee(value!);
              //                   // setState(() {
              //                   //   gender = value.toString();
              //                   // });
              //                 },
              //               ),
              //             ),
              //             Text(
              //               'Technician',
              //               style: TextStyle(
              //                 fontSize: size.width * 0.03,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //             Obx(
              //               () => Radio(
              //                 visualDensity: VisualDensity(
              //                   horizontal: VisualDensity.minimumDensity,
              //                   vertical: VisualDensity.minimumDensity,
              //                 ),
              //                 // title: Text("Male"),
              //                 value: "Attendance",
              //                 groupValue: _nurseBooking1Controller
              //                     .selectedServicee.value,
              //                 onChanged: (value) {
              //                   _nurseBooking1Controller
              //                       .onChangeServicee(value!);
              //                   // setState(() {
              //                   //   gender = value.toString();
              //                   // });
              //                 },
              //               ),
              //             ),
              //             Text(
              //               'Attedant',
              //               style: TextStyle(
              //                 fontSize: size.width * 0.03,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              SizedBox(
                height: size.height * 0.02,
              ),

              SizedBox(
                height: size.height * 0.00,
              ),

              ///working hours...
              ///
              ///
              Text(
                'Choose working hours.',
                style: TextStyle(
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blueww,
                ),
              ),

              Container(
                height: size.height * 0.066,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 25 / 2),
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
                    ]),
                child: SizedBox(
                  //width: size.width * 0.40,
                  child: Container(
                    //width: size.width * 40,
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Radio(
                              visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              // title: Text("Male"),
                              value: "24",
                              groupValue:
                                  _nurseBooking1Controller.selectedhours.value,
                              onChanged: (value) {
                                _nurseBooking1Controller.onChangeHours(value!);
                                // setState(() {
                                //   gender = value.toString();
                                // });
                              },
                            ),
                          ),
                          Text(
                            '24 Hours',
                            style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => Radio(
                              visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              // title: Text("Male"),
                              value: "12",
                              groupValue:
                                  _nurseBooking1Controller.selectedhours.value,
                              onChanged: (value) {
                                _nurseBooking1Controller.onChangeHours(value!);
                                // setState(() {
                                //   gender = value.toString();
                                // });
                              },
                            ),
                          ),
                          Text(
                            '12 Hourss',
                            style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => Radio(
                              visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              // title: Text("Male"),
                              value: "Other",
                              groupValue:
                                  _nurseBooking1Controller.selectedhours.value,
                              onChanged: (value) {
                                _nurseBooking1Controller.onChangeHours(value!);
                                // setState(() {
                                //   gender = value.toString();
                                // });
                              },
                            ),
                          ),
                          Text(
                            'Other',
                            style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //shifting...........

              SizedBox(
                height: size.height * 0.02,
              ),

              ///nurse shift type...

              Text(
                'Choose Shift.',
                style: TextStyle(
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blueww,
                ),
              ),

              Container(
                height: size.height * 0.154,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 25 / 2),
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
                    ]),
                child: SizedBox(
                  // width: size.width * 0.40,
                  //height: size.height * 0.1,
                  child: Container(
                    //width: size.width * 40,
                    height: size.height * 0.095,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () =>_nurseBooking1Controller.selectedshift.value,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => RadioListTile(
                              title: Text(
                                'Day',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),

                              // title: Text("Male"),
                              value:
                              //_nurseBooking1Controller.selectedshift.value,
                              "Day",
                              groupValue:
                                  _nurseBooking1Controller.selectedshift.value,
                              onChanged: (value) {
                                _nurseBooking1Controller.onChangeShifts(value!);
                                // setState(() {
                                //   gender = value.toString();
                                // });
                              },

                            ),
                          ),
                          Obx(
                            () => RadioListTile(
                              title: Text(
                                'Night               ',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              // title: Text("Male"),
                              value:
                              //_nurseBooking1Controller.selectedshift.value,
                              "Night",
                              groupValue:
                                  _nurseBooking1Controller.selectedshift.value,
                              onChanged: (value) {
                                _nurseBooking1Controller.onChangeShifts(value!);
                                // setState(() {
                                //   gender = value.toString();
                                // });
                              },
                            ),
                          ),
                          Obx(
                            () => RadioListTile(
                              title: Text(
                                'Both               ',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              // title: Text("Male"),
                              value:
                              "Both",
                              //_nurseBooking1Controller.selectedshift.value,

                              groupValue:
                                  _nurseBooking1Controller.selectedshift.value,
                              onChanged: (value) {
                                _nurseBooking1Controller.onChangeShifts(value!);
                                // setState(() {
                                //   gender = value.toString();
                                // });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              ///todo:selected date starting...

              Text(
                'Choose Starting Date:',
                style: TextStyle(
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blueww,
                ),
              ),
              ///........................

              NeumorphicTextFieldContainer(
                child: Obx(
                      () => (_nurseBooking1Controller.isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                      : TextFormField(
                    controller:
                    _nurseBooking1Controller.appointmentController1,
                    onTap: () {
                      _nurseBooking1Controller.chooseDate();
                    },

                    cursorColor: Colors.black,
                    obscureText: false,
                    decoration: InputDecoration(
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
              ),


              SizedBox(
                height: size.height * 0.02,
              ),

              ///todo:selected date ending...

              Text(
                'Choose Ending Date:',
                style: TextStyle(
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blueww,
                ),
              ),

              NeumorphicTextFieldContainer(
                child: Obx(
                      () => (_nurseBooking1Controller.isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                      : TextFormField(
                    controller:
                    _nurseBooking1Controller.appointmentController2,
                    onTap: () {
                      _nurseBooking1Controller.chooseDate2();
                    },

                    cursorColor: Colors.black,
                    obscureText: false,
                    decoration: InputDecoration(
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
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              ///todo:phone no...

              Text(
                'Enter your phone no:',
                style: TextStyle(
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blueww,
                ),
              ),

              ///todo: phone number..........
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _nurseBooking1Controller.mobileNumberController,
                  onSaved: (value) {
                    _nurseBooking1Controller.MobileNumber = value!;
                  },
                  validator: (value) {
                    return _nurseBooking1Controller.validPhone(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.phone_android_outlined,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              // RectangularInputField(
              //   hintText: 'Password',
              //   icon: Icons.lock,
              //   obscureText: true,
              // ),

              SizedBox(
                height: size.height * 0.02,
              ),

              ///todo: address value..........

              Text(
                'Enter your Location:',
                style: TextStyle(
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.blueww,
                ),
              ),
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                        () => DropdownButtonFormField<NurseLocationModel>(
                        value: _nurseBooking1Controller.selectedNurseLocation.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.place,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select Nurse'),
                        items:
                        _nurseBooking1Controller.locations.map((NurseLocationModel locations) {
                          return DropdownMenuItem(
                            value: locations,
                            child: SizedBox(
                              height: size.height*0.06,
                              width: size.width*0.65,
                              child: Text(
                                locations.locationName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (NurseLocationModel? newValue) {
                          _nurseBooking1Controller.selectedNurseLocation.value = newValue!;
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
              // NeumorphicTextFieldContainer(
              //   child: TextFormField(
              //     autofillHints: [AutofillHints.addressCityAndState],
              //     controller: _nurseBooking1Controller.addressController,
              //     onSaved: (value) {
              //       _nurseBooking1Controller.address = value!;
              //     },
              //     validator: (value) {
              //       return _nurseBooking1Controller.validAddress(value!);
              //     },
              //     cursorColor: Colors.black,
              //     obscureText: false,
              //     decoration: InputDecoration(
              //       hintText: 'Location',
              //       helperStyle: TextStyle(
              //         color: black.withOpacity(0.7),
              //         fontSize: 18,
              //       ),
              //       prefixIcon: Icon(
              //         Icons.location_city_outlined,
              //         color: black.withOpacity(0.7),
              //         size: 20,
              //       ),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),

              // ///Todo: state............................
              // SizedBox(
              //   height: size.height * 0.02,
              // ),
              //
              // NeumorphicTextFieldContainer(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              //     child: Obx(
              //       () => DropdownButtonFormField(
              //           value: _nurseBooking1Controller.selectedState.value,
              //           decoration: InputDecoration(
              //             prefixIcon: Icon(
              //               Icons.real_estate_agent,
              //               color: Colors.black,
              //             ),
              //             enabledBorder: InputBorder.none,
              //             border: InputBorder.none,
              //           ),
              //           hint: Text('Select State'),
              //           items: items.map((String items) {
              //             return DropdownMenuItem(
              //               value: items,
              //               child: Text(
              //                 items,
              //                 style: TextStyle(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: size.height * 0.015,
              //                 ),
              //               ),
              //             );
              //           }).toList(),
              //           onChanged: (String? newValue) {
              //             _nurseBooking1Controller.selectedState.value =
              //                 newValue!;
              //             // _hospital_2_controller.states.value =
              //             //     newValue! as List<String>;
              //             // _hospital_2_controller.selectedCity.value = null;
              //             // _hospital_2_controller.cities.clear();
              //             // _hospital_2_controller.cities
              //             //     .addAll(stateCityMap[newvalue]!);
              //           }),
              //     ),
              //   ),
              // ),
              //
              // ///Todo: city.....................................
              //
              // SizedBox(
              //   height: size.height * 0.02,
              // ),
              //
              // NeumorphicTextFieldContainer(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              //     child: Obx(
              //       () => DropdownButtonFormField(
              //           //icon: Icon(Icons.location_city),
              //           value: _nurseBooking1Controller.selectedCity.value,
              //           decoration: InputDecoration(
              //             prefixIcon: Icon(
              //               Icons.location_city,
              //               color: Colors.black,
              //             ),
              //             enabledBorder: InputBorder.none,
              //             border: InputBorder.none,
              //           ),
              //           hint: Text('Selected City'),
              //           items: items.map((String items) {
              //             return DropdownMenuItem(
              //               value: items,
              //               child: Text(
              //                 items,
              //                 style: TextStyle(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: size.height * 0.015,
              //                 ),
              //               ),
              //             );
              //           }).toList(),
              //           onChanged: (String? newValue) {
              //             _nurseBooking1Controller.selectedCity.value = newValue!;
              //             // _hospital_2_controller.states.value =
              //             //     newValue! as List<String>;
              //             // _hospital_2_controller.selectedCity.value = null;
              //             // _hospital_2_controller.cities.clear();
              //             // _hospital_2_controller.cities
              //             //     .addAll(stateCityMap[newvalue]!);
              //           }),
              //     ),
              //   ),
              // ),
              ///
              // child: DropdownButton(
              //     value: _hospital_2_controller.selectedState.value,
              //     menuMaxHeight: size.height * 0.3,
              //     items: items.map((String items) {
              //       return DropdownMenuItem(
              //         value: items,
              //         child: Text(items),
              //       );
              //     }).toList(),
              //     // _hospital_2_controller.states.map((String value) {
              //     //   return DropdownMenuItem(
              //     //     value: value,
              //     //
              //     //   )
              //     onChanged: (String? newValue) {
              //       _hospital_2_controller.states.value =
              //           newValue! as List<String>;
              //       _hospital_2_controller.selectedCity.value = null;
              //       _hospital_2_controller.cities.clear();
              //       _hospital_2_controller.cities
              //           .addAll(stateCityMap[newvalue]!);
              //     })),
              SizedBox(
                height: size.height * 0.00,
              ),

              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),
              SizedBox(
                height: size.height * 0.00,
                //appPadding / 2,
              ),
              RectangularButton(
                  text: 'Book',
                  press: () {
                    CallLoader.loader();
                    _nurseBooking1Controller.checkNurse1();
                    //Get.to(()=>NurseListUser());
                    //Get.to(NurseAppointmentHistory());


                    //_loginpasswordController.checkLoginpassword();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
