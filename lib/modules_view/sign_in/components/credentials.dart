import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/login_email/login_email_controller.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/modules_view/forget_password_view/forget_password_view.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/login_email/login_email_controller.dart';
// import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
// import 'package:ps_welness/modules_view/forget_password_view/forget_password_view.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class Credentials extends StatelessWidget {
  Credentials({Key? key}) : super(key: key);

  LoginpasswordController _loginpasswordController =
      Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _loginpasswordController.loginpasswordformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.09, vertical: size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _loginpasswordController.emailController,
                onSaved: (value) {
                  _loginpasswordController.email = value!;
                },
                validator: (value) {
                  return _loginpasswordController.validEmail(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'User ID',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_circle,
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
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _loginpasswordController.passwordController,
                onSaved: (value) {
                  _loginpasswordController.password = value!;
                },
                validator: (value) {
                  return _loginpasswordController.validPassword(value!);
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
            // RectangularInputField(
            //   hintText: 'Password',
            //   icon: Icons.lock,
            //   obscureText: true,
            // ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Get.to(() => ForgotPassword());
                },
                child: Text(
                  'Forget Password?',
                  style: GoogleFonts.alegreya(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: InkWell(
            //     onTap: () {
            //
            //       Get.to(() => ChangePassword());
            //     },
            //     child: Text(
            //       'Change Password?',
            //       style: GoogleFonts.alegreya(
            //         fontWeight: FontWeight.w600,
            //         color: Colors.grey.shade700,
            //         fontSize: size.width * 0.035,
            //       ),
            //     ),
            //   ),
            // ),

            RectangularButton(
                text: 'Sign In',
                press: () {
                  CallLoader.loader();
                  _loginpasswordController.checkLoginpassword();
                  //Get.to(SignUpList());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
