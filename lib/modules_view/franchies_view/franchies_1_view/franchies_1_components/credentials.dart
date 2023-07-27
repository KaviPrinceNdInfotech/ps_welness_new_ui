// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:ps_welness_new_ui/constants/constants/constants.dart';
// import 'package:ps_welness_new_ui/controllers/franchies_controller/franchies1_controllers.dart';
// import 'package:ps_welness_new_ui/modules_view/franchies_view/franchies_2_view/franchies_signup_part2.dart';
// import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
//
// //import '../../../../controllers/franchies_controller/franchies1_controllers.dart';
// // import 'package:ps_welness/constants/constants/constants.dart';
// // import 'package:ps_welness/controllers/franchies_controller/franchies1_controllers.dart';
// // import 'package:ps_welness/modules_view/franchies_view/franchies_2_view/franchies_signup_part2.dart';
// // import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// // import 'package:ps_welness/widgets/widgets/rectangular_button.dart';
// // import 'package:ps_welness/constants/constants/constants.dart';
// // import 'package:ps_welness/controllers/hospital_1_controller/hospital_login_controllers.dart';
// // import 'package:ps_welness/modules_view/hospital_view/hospital_sigup_step2/hospital_sighup_part2_view.dart';
// // import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// // import 'package:ps_welness/widgets/widgets/rectangular_button.dart';
//
// class Franchies1Credentials extends StatelessWidget {
//   Franchies1Credentials({Key? key}) : super(key: key);
//
//   Franchies_1_Controller _franchies_1_controller =
//       Get.put(Franchies_1_Controller());
//
//   // LoginpasswordController _loginpasswordController =
//   //     Get.put(LoginpasswordController());
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Form(
//       key: _franchies_1_controller.franchies1formkey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Padding(
//         padding: EdgeInsets.all(30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ///TODO: Name.......................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.name],
//                 controller: _franchies_1_controller.nameController,
//                 onSaved: (value) {
//                   _franchies_1_controller.name = value!;
//                 },
//                 validator: (value) {
//                   return _franchies_1_controller.validName(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Name',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.person_outline_sharp,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///Todo: email.....................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.email],
//                 controller: _franchies_1_controller.emailController,
//                 onSaved: (value) {
//                   _franchies_1_controller.email = value!;
//                 },
//                 validator: (value) {
//                   return _franchies_1_controller.validEmail(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.email,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///Todo: password..............
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 controller: _franchies_1_controller.passwordController,
//                 onSaved: (value) {
//                   _franchies_1_controller.password = value!;
//                 },
//                 validator: (value) {
//                   return _franchies_1_controller.validPassword(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.lock,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///Todo: confirm password...........
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 controller: _franchies_1_controller.confirmpasswordController,
//                 onSaved: (value) {
//                   _franchies_1_controller.confirmpassword = value!;
//                 },
//                 validator: (value) {
//                   return _franchies_1_controller.validConfirmPassword(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Confirm Password',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.phonelink_lock,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//                 keyboardType: TextInputType.visiblePassword,
//                 //obscureText: true,
//                 //controller: _loginpasswordController.mobileController,
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///todo: phone number..........
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.telephoneNumber],
//                 controller: _franchies_1_controller.mobileController,
//                 onSaved: (value) {
//                   _franchies_1_controller.mobile = value!;
//                 },
//                 validator: (value) {
//                   return _franchies_1_controller.validPhone(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Phone',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.phone_android_outlined,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             // RectangularInputField(
//             //   hintText: 'Password',
//             //   icon: Icons.lock,
//             //   obscureText: true,
//             // ),
//             SizedBox(
//               height: size.height * 0.00,
//               //appPadding / 2,
//             ),
//             // Align(
//             //   alignment: Alignment.centerLeft,
//             //   child: InkWell(
//             //     onTap: () {},
//             //     child: Text(
//             //       'Forget Password?',
//             //       style: GoogleFonts.alegreya(
//             //         fontWeight: FontWeight.w500,
//             //         fontSize: size.width * 0.035,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             RectangularButton(
//                 text: 'Go Next >',
//                 press: () {
//                   Get.to(FranchiesSignup2());
//                   //_loginpasswordController.checkLoginpassword();
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
///
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/franchies_view/franchies_2_view/franchies_signup_part2.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/franchies_controller/franchies1_controllers.dart';

class Franchies1Credentials extends StatelessWidget {
  Franchies1Credentials({Key? key}) : super(key: key);
  Franchies_1_Controller _franchies_1_controller =
      Get.put(Franchies_1_Controller());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _franchies_1_controller.franchies1formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO: vendor Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _franchies_1_controller.VendorName,
                onSaved: (value) {
                  _franchies_1_controller.name = value!;
                },
                validator: (value) {
                  return _franchies_1_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Vendor Name',
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

            ///TODO: Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _franchies_1_controller.CompanyName,
                onSaved: (value) {
                  _franchies_1_controller.name = value!;
                },
                validator: (value) {
                  return _franchies_1_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Company Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.shop,
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
                controller: _franchies_1_controller.EmailId,
                onSaved: (value) {
                  _franchies_1_controller.email = value!;
                },
                validator: (value) {
                  return _franchies_1_controller.validEmail(value!);
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
                controller: _franchies_1_controller.Password,
                onSaved: (value) {
                  _franchies_1_controller.password = value!;
                },
                validator: (value) {
                  return _franchies_1_controller.validPassword(value!);
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
            ///todo: phone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _franchies_1_controller.MobileNumber,
                onSaved: (value) {
                  _franchies_1_controller.mobile = value!;
                },
                validator: (value) {
                  return _franchies_1_controller.validPhone(value!);
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
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      "Upload Pan Image:",
                      style: TextStyle(
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.cyanAccent, width: 2),
                  ),
                  child: Obx(
                    () => _franchies_1_controller.selectedPath.value != ''
                        ? Image.file(
                            File(_franchies_1_controller.selectedPath.value))
                        : InkWell(
                            onTap: (() {
                              optionsImage();
                            }),
                            child: Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
                          ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: size.height * 0.00,
            ),
            RectangularButton(
                text: 'Go Next >',
                press: () {
                  Get.to(FranchiesSignup2());
                })
          ],
        ),
      ),
    );
  }

  void optionsImage() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                //var ImageSource1;
                _franchies_1_controller.getImage(ImageSource.camera);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 70,
              indent: 70,
            ),
            InkWell(
              onTap: () {
                _franchies_1_controller.getImage(ImageSource.gallery);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
