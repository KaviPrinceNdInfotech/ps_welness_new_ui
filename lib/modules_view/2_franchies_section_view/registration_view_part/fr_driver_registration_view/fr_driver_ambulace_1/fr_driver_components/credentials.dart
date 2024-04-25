import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulance_2/fr_driver_registation_2.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_driver_registration_view/fr_driver_ambulance_2/fr_driver_registation_2.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../../controllers/2_franchises_controller/registration_part_controller/fr_driver_registration_controller/fr_driver_controller1.dart';

class FrDriver1Credentials extends StatelessWidget {
  FrDriver1Credentials({Key? key}) : super(key: key);

  Fr_Driver_1_Controller _frdriver_1_controller =
      Get.put(Fr_Driver_1_Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      // key: _frdriver_1_controller.frdriver1formkey,
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
                controller: _frdriver_1_controller.nameController,
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

            ///Todo: password..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //keyboardType: TextInputType.number,
                controller: _frdriver_1_controller.passwordController,
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
                controller: _frdriver_1_controller.confirmpasswordController,
                //keyboardType: TextInputType.number,
                // onSaved: (value) {
                //   _frdriver_1_controller.confirmpassword = value!;
                // },
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
                maxLength: 10,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _frdriver_1_controller.mobileController,
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
                    counterText: ''),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
              //appPadding / 2,
            ),

            ///todo:email__id..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                ///maxLength: 10,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _frdriver_1_controller.emailController,
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
                    counterText: ''),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
              //appPadding / 2,
            ),

            ///todo: pan number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //maxLength: 10,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _frdriver_1_controller.panController,
                onSaved: (value) {
                  _frdriver_1_controller.pan = value!;
                },
                validator: (value) {
                  return _frdriver_1_controller.validPan(value!);
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
            SizedBox(
              height: size.height * 0.00,
            ),
            RectangularButton(
                text: 'Go Next >',
                press: () async {
                  if (_frdriver_1_controller.nameController!.text.isEmpty ||
                      _frdriver_1_controller.passwordController!.text.isEmpty ||
                      _frdriver_1_controller
                          .confirmpasswordController!.text.isEmpty ||
                      _frdriver_1_controller.mobileController!.text.isEmpty) {
                    Get.snackbar("title", "please fill all data");
                  } else if (_frdriver_1_controller
                          .mobileController!.text.length <
                      10) {
                    Get.snackbar("title", "Mobile Number must be of 10 digit");
                  } else {
                    //refresh();
                    CallLoader.loader();
                    await Future.delayed(Duration(milliseconds: 900));
                    CallLoader.hideLoader();
                    Get.to(FrDriverSignup2());
                  }
                })
          ],
        ),
      ),
    );
  }
}
