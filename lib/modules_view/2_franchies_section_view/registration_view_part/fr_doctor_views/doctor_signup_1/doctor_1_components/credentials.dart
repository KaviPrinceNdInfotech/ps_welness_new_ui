import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/week_day_off/week_day_off_model.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// //import 'package:ps_welness/modules_view/doctor_views/doctor_sigup_part2/doctor_signup_part2.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../../controllers/2_franchises_controller/registration_part_controller/fr_doctor_controllers/doctor_controller1.dart';

class FrDoctor1Credentials extends StatelessWidget {
  FrDoctor1Credentials({Key? key}) : super(key: key);
  FrDoctor_1_Controller _frdoctor_1_controller =
      Get.put(FrDoctor_1_Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _frdoctor_1_controller.frdoctor1formkey,
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
                controller: _frdoctor_1_controller.doctorNameController,
                onSaved: (value) {
                  _frdoctor_1_controller.name = value!;
                },
                validator: (value) {
                  return _frdoctor_1_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Name',
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
                controller: _frdoctor_1_controller.emailController,
                onSaved: (value) {
                  _frdoctor_1_controller.email = value!;
                },
                validator: (value) {
                  return _frdoctor_1_controller.validEmail(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Email',
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
                controller: _frdoctor_1_controller.passwordController,
                onSaved: (value) {
                  _frdoctor_1_controller.password = value!;
                },
                validator: (value) {
                  return _frdoctor_1_controller.validPassword(value!);
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
                controller: _frdoctor_1_controller.confirmPasswordController,
                onSaved: (value) {
                  _frdoctor_1_controller.confirmpassword = value!;
                },
                validator: (value) {
                  return _frdoctor_1_controller.validConfirmPassword(value!);
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
                //obscureText: true,
                //controller: _loginpasswordController.mobileController,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: phone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _frdoctor_1_controller.phoneController,
                onSaved: (value) {
                  _frdoctor_1_controller.mobile = value!;
                },
                validator: (value) {
                  return _frdoctor_1_controller.validPhone(value!);
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
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: pan number..........
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.telephoneNumber],
            //     controller: _frdoctor_1_controller.panController,
            //     onSaved: (value) {
            //       _frdoctor_1_controller.pan = value!;
            //     },
            //     validator: (value) {
            //       return _frdoctor_1_controller.validPan(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Pan number',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.add_card_outlined,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///todo: experince..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                //autofillHints: [AutofillHints.telephoneNumber],
                controller: _frdoctor_1_controller.ExperienceController,
                onSaved: (value) {
                  _frdoctor_1_controller.Experience = value!;
                },
                validator: (value) {
                  return _frdoctor_1_controller.validAddress(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Experience in year',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.add_chart_rounded,
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

            ///todo : week off Id...............
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<Day>(
                      value: _frdoctor_1_controller.selectedweekdayId.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.calendar_view_day,
                          color: Colors.black,
                          size: 20,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Week Off'),
                      items:
                          _frdoctor_1_controller.weekdayid.map((Day weekdayid) {
                        return DropdownMenuItem(
                          value: weekdayid,
                          child: SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.61,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${weekdayid.name.toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.017,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      // validator: (value) =>
                      // value == null ? '          field required' : null,
                      onChanged: (Day? newValue) {
                        _frdoctor_1_controller.selectedweekdayId.value =
                            newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),
            //CallLoader.loader();
            //                                                 await Future.delayed(
            //                                                     Duration(seconds: 1));
            //                                                 //isLoading(false);
            //                                                 CallLoader.hideLoader();
            RectangularButton(
                text: 'Go Next >',
                press: () {
                  _frdoctor_1_controller.checkDoctor1();

                  // _frdoctor_1_controller.selectedweekdayId.value == null;

                  //Get.to(FrDoctorSignup2());
                })
          ],
        ),
      ),
    );
  }
}
