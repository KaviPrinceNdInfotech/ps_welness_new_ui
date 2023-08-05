import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_type_model/nurse_type_model.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_nurses_view/nurses_sighup2/nurses_signup2.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../../controllers/2_franchises_controller/registration_part_controller/fr_nurses_controllers/nurses_controller1.dart';

class FrNurses1Credentials extends StatelessWidget {
  FrNurses1Credentials({Key? key}) : super(key: key);

  FrNurses_1_controller _frnurses_1_controller =
      Get.put(FrNurses_1_controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _frnurses_1_controller.frnursesformkey,
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
                controller: _frnurses_1_controller.nameController,
                onSaved: (value) {
                  _frnurses_1_controller.name = value!;
                },
                validator: (value) {
                  return _frnurses_1_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'NurseName',
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
                controller: _frnurses_1_controller.emailController,
                onSaved: (value) {
                  _frnurses_1_controller.email = value!;
                },
                validator: (value) {
                  return _frnurses_1_controller.validEmail(value!);
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
                controller: _frnurses_1_controller.passwordController,
                onSaved: (value) {
                  _frnurses_1_controller.password = value!;
                },
                validator: (value) {
                  return _frnurses_1_controller.validPassword(value!);
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
                controller: _frnurses_1_controller.confirmpasswordController,
                onSaved: (value) {
                  _frnurses_1_controller.confirmpassword = value!;
                },
                validator: (value) {
                  return _frnurses_1_controller.validConfirmPassword(value!);
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
                controller: _frnurses_1_controller.mobileController,
                onSaved: (value) {
                  _frnurses_1_controller.mobile = value!;
                },
                validator: (value) {
                  return _frnurses_1_controller.validPhone(value!);
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
              height: size.height * 0.00,
              //appPadding / 2,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<NurseModels>(
                      value: _frnurses_1_controller.selectedNurse.value,
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
                          _frnurses_1_controller.nurse.map((NurseModels nurse) {
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
                      validator: (value) =>
                          value == null ? 'field required' : null,
                      onChanged: (NurseModels? newValue) {
                        _frnurses_1_controller.selectedNurse.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            RectangularButton(
                text: 'Go Next >',
                press: () {
                  _frnurses_1_controller.checkNurses1();
                })
          ],
        ),
      ),
    );
  }
}
