import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_controllers_RRR/doctor_controller1.dart';
import 'package:ps_welness_new_ui/model/1_user_model/slot_duration_common_model/slot_duration_model.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/franchise_model_comman/franchise_model_id.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/doctor_controllers/doctor_controller1.dart';
// //import 'package:ps_welness/modules_view/doctor_views/doctor_sigup_part2/doctor_signup_part2.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../doctor_sigup_part2/doctor_signup_part2.dart';

class Doctor1Credentials extends StatelessWidget {
  Doctor1Credentials({Key? key}) : super(key: key);
  Doctor_1_Controller _doctor_1_controller = Get.put(Doctor_1_Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      // key: _doctor_1_controller.doctor11formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO: Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _doctor_1_controller.doctorNameController,
                onSaved: (value) {
                  _doctor_1_controller.DoctorName = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Doctor Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline_sharp,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///Todo: email.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.email],
                controller: _doctor_1_controller.emailIdController,
                onSaved: (value) {
                  _doctor_1_controller.EmailId = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validEmail(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Email ID',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///Todo: password..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _doctor_1_controller.passwordController,
                onSaved: (value) {
                  _doctor_1_controller.Password = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validPassword(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Password',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///Todo: confirm password...........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _doctor_1_controller.confirmPasswordController,
                onSaved: (value) {
                  _doctor_1_controller.ConfirmPassword = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validConfirmPassword(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phonelink_lock,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///todo: mobile number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _doctor_1_controller.mobileNumberController,
                onSaved: (value) {
                  _doctor_1_controller.MobileNumber = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validPhone(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Mobile number',
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

            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///todo: phone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _doctor_1_controller.phoneNumberController,
                onSaved: (value) {
                  _doctor_1_controller.phonenumber = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validPhone(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.call,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///todo: pan number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _doctor_1_controller.panController,
                onSaved: (value) {
                  _doctor_1_controller.pan = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validPan(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Pan number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.add_card_outlined,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            ///todo : pan image .................
            GetBuilder<Doctor_1_Controller>(
              ///
              init: Doctor_1_Controller(), // intialize with the Controller
              builder: (value) => InkWell(
                onTap: () {
                  _doctor_1_controller.getPanImage(ImageSource.gallery);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pan Image ',
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 1.0),
                          borderRadius: BorderRadius.circular(5)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Obx(
                          () =>
                              _doctor_1_controller.selectedPanImagepath.value ==
                                      ''
                                  ? const Center(child: Text("No Image"))
                                  : Image.file(
                                      File(_doctor_1_controller
                                          .selectedPanImagepath.value),
                                      fit: BoxFit.cover,
                                    ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            ///todo : Fee .normal................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _doctor_1_controller.feeController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _doctor_1_controller.DoctorName = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validName(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Fee Normal',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.currency_rupee,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            ///todo : Fee ..virtual...............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _doctor_1_controller.virtualfeesController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _doctor_1_controller.DoctorName = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validName(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Fee Virtual',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.currency_rupee,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            ///Todo: morning.....................................

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<DurationSlot>(
                      value:
                          _doctor_1_controller.selectedtimeslotDurations.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.sunny,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Slot Timing Morning'),
                      items: _doctor_1_controller.timeduration
                          .map((DurationSlot timeduration) {
                        return DropdownMenuItem(
                          value: timeduration,
                          child: Text(
                            "${timeduration.durationTime.toString()}  minutes",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.017,
                            ),
                          ),
                        );
                      }).toList(),
                      validator: (value) =>
                          value == null ? '          field required' : null,
                      onChanged: (DurationSlot? newValue) {
                        _doctor_1_controller.selectedtimeslotDurations.value =
                            newValue!;
                      }),
                ),
              ),
            ),

            ///todo:selected date starting...
            // SizedBox(
            //   height: size.height * 0.018,
            // ),
            NeumorphicTextFieldContainer(
              child: Obx(
                () => InkWell(
                  onTap: () {
                    _doctor_1_controller.chooseTime();
                  },
                  child: Container(
                    height: size.height * 0.06,
                    child: Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Starting Time Morning:',
                              style: TextStyle(
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.blueww,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            //Spacer(),
                            //    print('$hour $minute $second');
                            Text(
                              "${_doctor_1_controller.selectedTime.value.hour}:${_doctor_1_controller.selectedTime.value.minute}",
                              style: TextStyle(
                                fontSize: size.height * 0.026,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.018,
            // ),

            ///todo:selected time ending...
            NeumorphicTextFieldContainer(
              child: Obx(
                () => InkWell(
                  onTap: () {
                    _doctor_1_controller.chooseTime2();
                  },
                  child: Container(
                    height: size.height * 0.06,
                    child: Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ending Time Morning:',
                              style: TextStyle(
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.blueww,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            //Spacer(),
                            Text(
                              "${_doctor_1_controller.selectedTime2.value.hour}:${_doctor_1_controller.selectedTime2.value.minute}",
                              style: TextStyle(
                                fontSize: size.height * 0.026,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            ///Todo: evening.....................................
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<DurationSlot>(
                      value:
                          _doctor_1_controller.selectedtimeslotDurations2.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.shield_moon_rounded,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Slot Timing Evening'),
                      items: _doctor_1_controller.timeduration2
                          .map((DurationSlot timeduration2) {
                        return DropdownMenuItem(
                          value: timeduration2,
                          child: Text(
                            "${timeduration2.durationTime.toString()} minutes",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.017,
                            ),
                          ),
                        );
                      }).toList(),
                      validator: (value) =>
                          value == null ? '          field required' : null,
                      onChanged: (DurationSlot? newValue) {
                        _doctor_1_controller.selectedtimeslotDurations2.value =
                            newValue!;
                      }),
                ),
              ),
            ),

            ///
            // NeumorphicTextFieldContainer(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            //     child: Obx(
            //       () => DropdownButtonFormField<TimeSlot>(
            //           value: _doctor_1_controller.selectedTimeslot2.value,
            //           decoration: const InputDecoration(
            //             prefixIcon: Icon(
            //               Icons.shield_moon_rounded,
            //               color: Colors.black,
            //             ),
            //             enabledBorder: InputBorder.none,
            //             border: InputBorder.none,
            //           ),
            //           hint: Text('Slot Timing Evening'),
            //           items: _doctor_1_controller.timeslot2
            //               .map((TimeSlot timeslot2) {
            //             return DropdownMenuItem(
            //               value: timeslot2,
            //               child: Text(
            //                 timeslot2.slotTime.toString(),
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: size.height * 0.015,
            //                 ),
            //               ),
            //             );
            //           }).toList(),
            //           validator: (value) =>
            //               value == null ? '          field required' : null,
            //           onChanged: (TimeSlot? newValue) {
            //             _doctor_1_controller.selectedTimeslot2.value =
            //                 newValue!;
            //           }),
            //     ),
            //   ),
            // ),
            ///
            // SizedBox(
            //   height: size.height * 0.018,
            // ),
            NeumorphicTextFieldContainer(
              child: Obx(
                () => InkWell(
                  onTap: () {
                    _doctor_1_controller.chooseTime3();
                  },
                  child: Container(
                    height: size.height * 0.06,
                    child: Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Starting Time Evening:',
                              style: TextStyle(
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.blueww,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            //Spacer(),
                            Text(
                              "${_doctor_1_controller.selectedTime3.value.hour}:${_doctor_1_controller.selectedTime3.value.minute}",
                              style: TextStyle(
                                fontSize: size.height * 0.026,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: size.height * 0.018,
            // ),
            NeumorphicTextFieldContainer(
              child: Obx(
                () => InkWell(
                  onTap: () {
                    _doctor_1_controller.chooseTime4();
                  },
                  child: Container(
                    height: size.height * 0.06,
                    child: Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ending Time Evening:',
                              style: TextStyle(
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.blueww,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            //Spacer(),
                            Text(
                              "${_doctor_1_controller.selectedTime4.value.hour}:${_doctor_1_controller.selectedTime4.value.minute}",
                              style: TextStyle(
                                fontSize: size.height * 0.026,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///todo : franchise Id...............
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<Vendor>(
                      value: _doctor_1_controller.selectedFranchiseId.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.currency_franc,
                          color: Colors.black,
                          size: 20,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Franchise'),
                      items: _doctor_1_controller.franchiseid
                          .map((Vendor franchiseid) {
                        return DropdownMenuItem(
                          value: franchiseid,
                          child: SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.61,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${franchiseid.companyName.toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      // validator: (value) =>
                      // value == null ? '          field required' : null,
                      onChanged: (Vendor? newValue) {
                        _doctor_1_controller.selectedFranchiseId.value =
                            newValue!;
                      }),
                ),
              ),
            ),

            // ///todo : Phone number .................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.telephoneNumber],
            //     controller: _doctor_1_controller.phoneNumberController,
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     onSaved: (value) {
            //       _doctor_1_controller.DoctorName = value!;
            //     },
            //     validator: (value) {
            //       return _doctor_1_controller.validPhone(value!);
            //     },
            //     decoration: InputDecoration(
            //       hintText: 'Phone number',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.call_rounded,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.00,
            //   //appPadding / 2,
            // ),
            //
            // ///todo : start Timing mg................
            // NeumorphicTextFieldContainer(
            //   child: Obx(
            //     () => InkWell(
            //       onTap: () {
            //         _doctor_1_controller.chooseStartTime();
            //       },
            //       child: Container(
            //         height: size.height * 0.06,
            //         child: Center(
            //           child: Padding(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: size.width * 0.1),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   "Starting time Morning",
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
            //                   "${_doctor_1_controller.selectedStartTime.value.hour}:${_doctor_1_controller.selectedStartTime.value.minute}",
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
            // SizedBox(
            //   height: size.height * 0.00,
            //   //appPadding / 2,
            // ),
            //
            // ///todo : end Timing .mg................
            // NeumorphicTextFieldContainer(
            //   child: Obx(
            //     () => InkWell(
            //       onTap: () {
            //         _doctor_1_controller.chooseSlotTime();
            //       },
            //       child: Container(
            //         height: size.height * 0.06,
            //         child: Center(
            //           child: Padding(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: size.width * 0.1),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   "End time Morning",
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
            //                   "${_doctor_1_controller.selectedSlotTime.value.hour}:${_doctor_1_controller.selectedSlotTime.value.minute}",
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
            //
            // SizedBox(
            //   height: size.height * 0.00,
            //   //appPadding / 2,
            // ),
            //
            // ///todo : start Timing evening................
            // NeumorphicTextFieldContainer(
            //   child: Obx(
            //     () => InkWell(
            //       onTap: () {
            //         _doctor_1_controller.chooseStartTime();
            //       },
            //       child: Container(
            //         height: size.height * 0.06,
            //         child: Center(
            //           child: Padding(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: size.width * 0.1),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   "Starting time Evening",
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
            //                   "${_doctor_1_controller.selectedStartTime.value.hour}:${_doctor_1_controller.selectedStartTime.value.minute}",
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
            // SizedBox(
            //   height: size.height * 0.00,
            //   //appPadding / 2,
            // ),
            //
            // ///todo : end Timing .mg................
            // NeumorphicTextFieldContainer(
            //   child: Obx(
            //     () => InkWell(
            //       onTap: () {
            //         _doctor_1_controller.chooseSlotTime();
            //       },
            //       child: Container(
            //         height: size.height * 0.06,
            //         child: Center(
            //           child: Padding(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: size.width * 0.1),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   "End time Evening",
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
            //                   "${_doctor_1_controller.selectedSlotTime.value.hour}:${_doctor_1_controller.selectedSlotTime.value.minute}",
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
            //
            // SizedBox(
            //   height: size.height * 0.00,
            //   //appPadding / 2,
            // ),
            RectangularButton(
                text: 'Go Next >',
                press: () async {
                  //_doctor_1_controller.onInit();
                  ///_doctor_1_controller.getdepartmentApi();
                  // _doctor_1_controller.update();
                  /// _doctor_1_controller.getStateLabApi();
                  //RxStatus.loading();
                  CallLoader.loader();
                  await Future.delayed(Duration(seconds: 1));
                  CallLoader.hideLoader();
                  await Get.to(DoctorSignup2());
                })
          ],
        ),
      ),
    );
  }
}
