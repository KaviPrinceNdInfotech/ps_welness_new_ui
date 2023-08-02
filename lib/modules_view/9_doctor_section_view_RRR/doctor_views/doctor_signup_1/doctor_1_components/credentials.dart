import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_controllers_RRR/doctor_controller1.dart';
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
            SizedBox(
              height: size.height * 0.02,
            ),

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
            SizedBox(
              height: size.height * 0.02,
            ),

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
            SizedBox(
              height: size.height * 0.02,
            ),

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
            SizedBox(
              height: size.height * 0.02,
            ),

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
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            ///todo : Fee .................
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
                  hintText: 'Fee',
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
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            ///todo : Phone number .................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _doctor_1_controller.phoneNumberController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _doctor_1_controller.DoctorName = value!;
                },
                validator: (value) {
                  return _doctor_1_controller.validPhone(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.call_rounded,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            // ///todo : start Timing .................
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
            //                   "Choose Start time",
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
            // ///todo : Slot Timing .................
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
            //                   "Choose Slot time",
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

            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),
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
