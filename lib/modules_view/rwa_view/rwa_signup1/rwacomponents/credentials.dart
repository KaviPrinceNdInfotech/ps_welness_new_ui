import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/rwa_controller/rwa_controller1.dart';
import 'package:ps_welness_new_ui/modules_view/rwa_view/rwa_signup2/rwa_signup2.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/rwa_controller/rwa_controller1.dart';
// import 'package:ps_welness/modules_view/rwa_view/rwa_signup2/rwa_signup2.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class Rwa1Credentials extends StatelessWidget {
  Rwa1Credentials({Key? key}) : super(key: key);

  Rwa_11_controller _rwa_11_controller = Get.put(Rwa_11_controller());

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      //key: _rwa_1_controller.rwa1formkey,
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
                controller: _rwa_11_controller.nameController,
                onSaved: (value) {
                  _rwa_11_controller.name = value!;
                },
                validator: (value) {
                  return _rwa_11_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'RwaName',
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
                controller: _rwa_11_controller.emailController,
                onSaved: (value) {
                  _rwa_11_controller.email = value!;
                },
                validator: (value) {
                  return _rwa_11_controller.validEmail(value!);
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
                controller: _rwa_11_controller.passwordController,
                onSaved: (value) {
                  _rwa_11_controller.password = value!;
                },
                validator: (value) {
                  return _rwa_11_controller.validPassword(value!);
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
                controller: _rwa_11_controller.confirmpasswordController,
                onSaved: (value) {
                  _rwa_11_controller.confirmpassword = value!;
                },
                validator: (value) {
                  return _rwa_11_controller.validConfirmPassword(value!);
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
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _rwa_11_controller.phoneController,
                onSaved: (value) {
                  _rwa_11_controller.mobile = value!;
                },
                validator: (value) {
                  return _rwa_11_controller.validPhone(value!);
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
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            SizedBox(
              height: size.height * 0.03,
            ),

            // Container(
            //   height: size.height * 0.066,
            //   width: double.infinity,
            //   margin: EdgeInsets.symmetric(vertical: appPadding / 2),
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
            //                 groupValue:
            //                     _nurses_1_controller.selectedServicee.value,
            //                 onChanged: (value) {
            //                   _nurses_1_controller.onChangeServicee(value!);
            //                   // setState(() {
            //                   //   gender = value.toString();
            //                   // });
            //                 },
            //               ),
            //             ),
            //             Text(
            //               'ANM',
            //               style: TextStyle(
            //                 fontSize: 11,
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
            //                 groupValue:
            //                     _nurses_1_controller.selectedServicee.value,
            //                 onChanged: (value) {
            //                   _nurses_1_controller.onChangeServicee(value!);
            //                   // setState(() {
            //                   //   gender = value.toString();
            //                   // });
            //                 },
            //               ),
            //             ),
            //             Text(
            //               'GNM',
            //               style: TextStyle(
            //                 fontSize: 11,
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
            //                 groupValue:
            //                     _nurses_1_controller.selectedServicee.value,
            //                 onChanged: (value) {
            //                   _nurses_1_controller.onChangeServicee(value!);
            //                   // setState(() {
            //                   //   gender = value.toString();
            //                   // });
            //                 },
            //               ),
            //             ),
            //             Text(
            //               'Technician',
            //               style: TextStyle(
            //                 fontSize: 11,
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
            //                 groupValue:
            //                     _nurses_1_controller.selectedServicee.value,
            //                 onChanged: (value) {
            //                   _nurses_1_controller.onChangeServicee(value!);
            //                   // setState(() {
            //                   //   gender = value.toString();
            //                   // });
            //                 },
            //               ),
            //             ),
            //             Text(
            //               'Attedant',
            //               style: TextStyle(
            //                 fontSize: 11,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: InkWell(
            //     onTap: () {},
            //     child: Text(
            //       'Forget Password?',
            //       style: GoogleFonts.alegreya(
            //         fontWeight: FontWeight.w500,
            //         fontSize: size.width * 0.035,
            //       ),
            //     ),
            //   ),
            // ),
            RectangularButton(
                text: 'Go Next >',
                press: () {
                  Get.to(RwaSignup2());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
