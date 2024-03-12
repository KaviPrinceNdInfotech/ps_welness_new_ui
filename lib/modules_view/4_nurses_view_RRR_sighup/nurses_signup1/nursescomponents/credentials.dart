import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurses_view_RRR_sighup/nurses_sighup2/nurses_signup2.dart';
//import 'package:ps_welness_new_ui/controllers/nurses_controllers/nurses_controller2.dart';
//import 'package:ps_welness_new_ui/model/1_user_model/nurse_type_model/nurse_type_model.dart';
//import 'package:ps_welness_new_ui/modules_view/nurses_view/nurses_sighup2/nurses_signup2.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/nurses_controllers_RRR_signuppp/nurses_controller2.dart';
import '../../../../widgets/circular_loader.dart';

class Nurses1Credentials extends StatelessWidget {
  Nurses1Credentials({Key? key}) : super(key: key);

  Nurses_22_Controller _nurses_22_controller = Get.put(Nurses_22_Controller());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Todo: nurse Name..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _nurses_22_controller.NurseNameController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _nurses_22_controller.Name = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validName(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Nurse Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_circle_outlined,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.0,
            ),

            ///Todo: nurse email..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _nurses_22_controller.EmailIdController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _nurses_22_controller.EmailId = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validEmail(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Email Name',
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
              height: size.height * 0.0,
            ),

            SizedBox(
              height: size.height * 0.0,
            ),

            ///Todo: CertificateNumber.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.nickname],
                controller: _nurses_22_controller.CertificateNumberController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _nurses_22_controller.LicenceNumber = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validcertificate(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Certificate number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.numbers,
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
            //
            // ///Todo: City Name..............
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     controller: _nurses_22_controller.CityNameController,
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'City name',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.lock,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: size.height * 0.0,
            ),

            ///Todo: PinCode...........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _nurses_22_controller.PinCodeController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _nurses_22_controller.PinCode = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validPin(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Pin Code',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.pin,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),

            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.telephoneNumber],
            //     controller: _nurses_22_controller.PhoneNumberController,
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Phone number',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.phone,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            // todo Mobile number
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _nurses_22_controller.MobileNumberController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _nurses_22_controller.MobileNumber = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validPhone(value!);
                },
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

            ///pan...
            ///todo: pan number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _nurses_22_controller.panController,
                onSaved: (value) {
                  _nurses_22_controller.pan = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validPan(value!);
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
              height: size.height * 0.02,
            ),
            // todo fees
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _nurses_22_controller.FeeController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _nurses_22_controller.Fee = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validName(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Fees',
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

            /// Todo Password ................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _nurses_22_controller.PasswordController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _nurses_22_controller.Password = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validPassword(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.password,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            /// Todo Confirm Password............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _nurses_22_controller.ConfirmPasswordController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _nurses_22_controller.ConfirmPassword = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validConfirmPassword(value!);
                },
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.offline_pin_rounded,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            ///...
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            ///todo : About us .................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _nurses_22_controller.aboutController,
                cursorColor: Colors.black,
                obscureText: false,
                onSaved: (value) {
                  _nurses_22_controller.about = value!;
                },
                validator: (value) {
                  return _nurses_22_controller.validexperince(value!);
                },
                decoration: InputDecoration(
                  hintText: 'About Us',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_box,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(
              height: size.height * 0.01,
            ),
            RectangularButton(
                text: 'Go Next >',
                press: () async {
                  //_doctor_1_controller.onInit();
                  //_nurses_22_controller.getStateApi();
                  // _doctor_1_controller.update();
                  // _nurses_22_controller.getNurseLocationregistrationApi();
                  //_nurses_22_controller.getNurseTypeApi();
                  //RxStatus.loading();
                  CallLoader.loader();
                  await Future.delayed(Duration(seconds: 1));
                  CallLoader.hideLoader();
                  //await Get.to(DoctorSignup2());
                  await Get.to(NursesSignup2());
                })
          ],
        ),
      ),
    );
  }
}
