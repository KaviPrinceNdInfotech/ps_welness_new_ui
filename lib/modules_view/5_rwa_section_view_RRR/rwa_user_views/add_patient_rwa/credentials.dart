// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/user_controller/user_controller_1.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';
//
// class Rwa1Credentials extends StatelessWidget {
//   Rwa1Credentials({Key? key}) : super(key: key);
//
//   // Hospital_1_Controller _hospital_1_controller =
//   //     Get.put(Hospital_1_Controller());
//
//   User_1_Controller _user_1_controller = Get.put(User_1_Controller());
//
//   var items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];
//
//   get newvalue => null!;
//
//   // LoginpasswordController _loginpasswordController =
//   //     Get.put(LoginpasswordController());
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Form(
//       key: _user_1_controller.user1formkey,
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
//                 controller: _user_1_controller.nameController,
//                 onSaved: (value) {
//                   _user_1_controller.name = value!;
//                 },
//                 validator: (value) {
//                   return _user_1_controller.validName(value!);
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
//                 controller: _user_1_controller.emailController,
//                 onSaved: (value) {
//                   _user_1_controller.email = value!;
//                 },
//                 validator: (value) {
//                   return _user_1_controller.validEmail(value!);
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
//                 controller: _user_1_controller.passwordController,
//                 onSaved: (value) {
//                   _user_1_controller.password = value!;
//                 },
//                 validator: (value) {
//                   return _user_1_controller.validPassword(value!);
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
//                 controller: _user_1_controller.confirmpasswordController,
//                 onSaved: (value) {
//                   _user_1_controller.confirmpassword = value!;
//                 },
//                 validator: (value) {
//                   return _user_1_controller.validConfirmPassword(value!);
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
//                 controller: _user_1_controller.mobileController,
//                 onSaved: (value) {
//                   _user_1_controller.mobile = value!;
//                 },
//                 validator: (value) {
//                   return _user_1_controller.validPhone(value!);
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
//
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///todo: address value..........
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.addressCityAndState],
//                 controller: _user_1_controller.addressController,
//                 onSaved: (value) {
//                   _user_1_controller.address = value!;
//                 },
//                 validator: (value) {
//                   return _user_1_controller.validAddress(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Address',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.location_city_outlined,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//
//             ///Todo: state............................
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             NeumorphicTextFieldContainer(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
//                 child: Obx(
//                   () => DropdownButtonFormField(
//                       value: _user_1_controller.selectedState.value,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.real_estate_agent,
//                           color: Colors.black,
//                         ),
//                         enabledBorder: InputBorder.none,
//                         border: InputBorder.none,
//                       ),
//                       hint: Text('Select State'),
//                       items: items.map((String items) {
//                         return DropdownMenuItem(
//                           value: items,
//                           child: Text(
//                             items,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: size.height * 0.015,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         _user_1_controller.selectedState.value = newValue!;
//                         // _hospital_2_controller.states.value =
//                         //     newValue! as List<String>;
//                         // _hospital_2_controller.selectedCity.value = null;
//                         // _hospital_2_controller.cities.clear();
//                         // _hospital_2_controller.cities
//                         //     .addAll(stateCityMap[newvalue]!);
//                       }),
//                 ),
//               ),
//             ),
//
//             ///Todo: city.....................................
//
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             NeumorphicTextFieldContainer(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
//                 child: Obx(
//                   () => DropdownButtonFormField(
//                       //icon: Icon(Icons.location_city),
//                       value: _user_1_controller.selectedCity.value,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.location_city,
//                           color: Colors.black,
//                         ),
//                         enabledBorder: InputBorder.none,
//                         border: InputBorder.none,
//                       ),
//                       hint: Text('Selected City'),
//                       items: items.map((String items) {
//                         return DropdownMenuItem(
//                           value: items,
//                           child: Text(
//                             items,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: size.height * 0.015,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         _user_1_controller.selectedCity.value = newValue!;
//                         // _hospital_2_controller.states.value =
//                         //     newValue! as List<String>;
//                         // _hospital_2_controller.selectedCity.value = null;
//                         // _hospital_2_controller.cities.clear();
//                         // _hospital_2_controller.cities
//                         //     .addAll(stateCityMap[newvalue]!);
//                       }),
//                 ),
//               ),
//             ),
//
//             // child: DropdownButton(
//             //     value: _hospital_2_controller.selectedState.value,
//             //     menuMaxHeight: size.height * 0.3,
//             //     items: items.map((String items) {
//             //       return DropdownMenuItem(
//             //         value: items,
//             //         child: Text(items),
//             //       );
//             //     }).toList(),
//             //     // _hospital_2_controller.states.map((String value) {
//             //     //   return DropdownMenuItem(
//             //     //     value: value,
//             //     //
//             //     //   )
//             //     onChanged: (String? newValue) {
//             //       _hospital_2_controller.states.value =
//             //           newValue! as List<String>;
//             //       _hospital_2_controller.selectedCity.value = null;
//             //       _hospital_2_controller.cities.clear();
//             //       _hospital_2_controller.cities
//             //           .addAll(stateCityMap[newvalue]!);
//             //     })),
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///TODO: Pin.......................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.password],
//                 controller: _user_1_controller.pinController,
//                 onSaved: (value) {
//                   _user_1_controller.pin = value!;
//                 },
//                 validator: (value) {
//                   return _user_1_controller.validPin(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Pin',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.pin,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//
//             SizedBox(
//               height: size.height * 0.018,
//               //appPadding / 2,
//             ),
//             SizedBox(
//               height: size.height * 0.00,
//               //appPadding / 2,
//             ),
//
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
//                 text: 'Submit',
//                 press: () {
//                   Get.to(UserHomePage());
//                   //_loginpasswordController.checkLoginpassword();
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/5_rwa_controller_RRR/rwa_addPatient_controller.dart';

class RwaAddPatientCredentials extends StatelessWidget {
  RWAAddPatientController _rwaAddPatientController =
      Get.put(RWAAddPatientController());
  // User_1_Controller _user_1_controller = Get.put(User_1_Controller());

  var items = [
    'UP',
    'Noida',
    'Bihar',
    'Patna',
    'MP',
  ];
  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _rwaAddPatientController.rwaaddformkey,
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
                controller: _rwaAddPatientController.PatientNameController,
                onSaved: (value) {
                  _rwaAddPatientController.name = value!;
                },
                validator: (value) {
                  return _rwaAddPatientController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'PatientName',
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
                controller: _rwaAddPatientController.EmailIdController,
                onSaved: (value) {
                  _rwaAddPatientController.email = value!;
                },
                validator: (value) {
                  return _rwaAddPatientController.validEmail(value!);
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

            // ///Todo: password..............
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     controller: _rwaAddPatientController.Password,
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Password',
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
            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///todo: phone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //maxLength: 10,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _rwaAddPatientController.MobileNumberController,
                onSaved: (value) {
                  _rwaAddPatientController.phone = value!;
                },
                validator: (value) {
                  return _rwaAddPatientController.validPhone(value!);
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

            ///todo: address value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _rwaAddPatientController.LocationController,
                onSaved: (value) {
                  _rwaAddPatientController.location = value!;
                },
                validator: (value) {
                  return _rwaAddPatientController.validAddress(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Address',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.location_city_outlined,
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

            ///TODO: Pin.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.password],
                controller: _rwaAddPatientController.PinCodeController,
                onSaved: (value) {
                  _rwaAddPatientController.pin = value!;
                },
                validator: (value) {
                  return _rwaAddPatientController.validPin(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Pin',
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
              ),
            ),
            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),
            RectangularButton(
                text: 'Submit',
                press: () {
                  _rwaAddPatientController.checkadd11();
                })
          ],
        ),
      ),
    );
  }
}
