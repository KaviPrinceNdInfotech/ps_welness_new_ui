import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/registration_view_part/franchise_chemist_view/franchise_chemist_signup2/franchies_chemist_signup2.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/franchise_chemist_view/franchise_chemist_signup2/franchies_chemist_signup2.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../../controllers/2_franchises_controller/registration_part_controller/franchise_chemist_regis_controller/chemist1_fr_controller/fr_chemist_controller.dart';

class FranchiesChemist1Credentials extends StatelessWidget {
  FranchiesChemist1Credentials({Key? key}) : super(key: key);

  Fr_Chemist_1_Controller _fr_chemist_1_controller =
      Get.put(Fr_Chemist_1_Controller());

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _fr_chemist_1_controller.frchemist1formkey,
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
                controller: _fr_chemist_1_controller.nameController,
                onSaved: (value) {
                  _fr_chemist_1_controller.name = value!;
                },
                validator: (value) {
                  return _fr_chemist_1_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Chemist Name',
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

            ///TODO: Shop Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _fr_chemist_1_controller.shopController,
                onSaved: (value) {
                  _fr_chemist_1_controller.shopname = value!;
                },
                validator: (value) {
                  return _fr_chemist_1_controller.validShopname(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Shop Name',
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

            ///Todo: email.....................

            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.email],
                controller: _fr_chemist_1_controller.emailController,
                onSaved: (value) {
                  _fr_chemist_1_controller.email = value!;
                },
                validator: (value) {
                  return _fr_chemist_1_controller.validEmail(value!);
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
                controller: _fr_chemist_1_controller.passwordController,
                onSaved: (value) {
                  _fr_chemist_1_controller.password = value!;
                },
                validator: (value) {
                  return _fr_chemist_1_controller.validPassword(value!);
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
                controller: _fr_chemist_1_controller.confirmpasswordController,
                onSaved: (value) {
                  _fr_chemist_1_controller.confirmpassword = value!;
                },
                validator: (value) {
                  return _fr_chemist_1_controller.validConfirmPassword(value!);
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
                controller: _fr_chemist_1_controller.mobileController,
                onSaved: (value) {
                  _fr_chemist_1_controller.mobile = value!;
                },
                validator: (value) {
                  return _fr_chemist_1_controller.validPhone(value!);
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
                  Get.to(FranchiseChemistSignup2());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
