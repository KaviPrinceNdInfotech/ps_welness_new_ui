// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:ps_welness_new_ui/constants/constants/constants.dart';
// import 'package:ps_welness_new_ui/controllers/4_nurse_controller_RRR/nurse_drawer_controllers/nurse_profile_controller.dart';
// import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';
// //import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view/nurse_home/nurse_home_page.dart';
// import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// // import 'package:ps_welness/constants/constants/constants.dart';
// // import 'package:ps_welness/modules_view/4_nurse_section_view/nurse_home/nurse_home_page.dart';
// // //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// // import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// // import 'package:ps_welness/widgets/widgets/rectangular_button.dart';
//
// //import '../../../../../../controllers/4_nurse_controller/nurse_drawer_controllers/nurse_profile_controller.dart';
//
// class NurseProfileCredentials extends StatelessWidget {
//   NurseProfileCredentials({Key? key}) : super(key: key);
//
//   // Hospital_1_Controller _hospital_1_controller =
//   //     Get.put(Hospital_1_Controller());
//
//   //NurseProfileController _nurseprofileController =
//       //Get.put(NurseProfileController());
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
//       key: _nurseprofileController.nurseprofileformkey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Padding(
//         padding: EdgeInsets.all(30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ///Todo: email.....................
//             // NeumorphicTextFieldContainer(
//             //   child: TextFormField(
//             //     autofillHints: [AutofillHints.email],
//             //     controller: _profileController.emailController,
//             //     onSaved: (value) {
//             //       _profileController.email = value!;
//             //     },
//             //     validator: (value) {
//             //       return _profileController.validEmail(value!);
//             //     },
//             //     cursorColor: Colors.black,
//             //     obscureText: false,
//             //     decoration: InputDecoration(
//             //       hintText: 'Email',
//             //       helperStyle: TextStyle(
//             //         color: black.withOpacity(0.7),
//             //         fontSize: 18,
//             //       ),
//             //       prefixIcon: Icon(
//             //         Icons.email,
//             //         color: black.withOpacity(0.7),
//             //         size: 20,
//             //       ),
//             //       border: InputBorder.none,
//             //     ),
//             //   ),
//             // ),
//             // SizedBox(
//             //   height: size.height * 0.02,
//             // ),
//
//             ///todo: phone number..........
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 keyboardType: TextInputType.number,
//                 autofillHints: [AutofillHints.telephoneNumber],
//                 controller: _nurseprofileController.mobileController,
//                 validator: (value) {
//                   return _nurseprofileController.validPhone(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Phone No',
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
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///TODO: Name.......................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 //initialValue: "I am smart",
//                 autofillHints: [AutofillHints.name],
//                 controller: _nurseprofileController.nameController,
//                 validator: (value) {
//                   return _nurseprofileController.validName(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Clinic Name',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.home_repair_service_outlined,
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
//             ///Todo: state............................
//
//             NeumorphicTextFieldContainer(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
//                 child: Obx(
//                   () => DropdownButtonFormField(
//                       value: _nurseprofileController.selectedState.value,
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
//                         _nurseprofileController.selectedState.value = newValue!;
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
//                       value: _nurseprofileController.selectedCity.value,
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
//                         _nurseprofileController.selectedCity.value = newValue!;
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
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///todo: location value..........
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.addressCityAndState],
//                 controller: _nurseprofileController.locationController,
//                 validator: (value) {
//                   return _nurseprofileController.validLocation(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Location',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.pin_drop,
//                     color: black.withOpacity(0.7),
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///Todo: fees..............
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 controller: _nurseprofileController.feeController,
//                 validator: (value) {
//                   return _nurseprofileController.validFees(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Fees',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.currency_rupee,
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
//             SizedBox(
//               height: size.height * 0.02,
//             ),
//
//             ///TODO: Pin.......................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.password],
//                 controller: _nurseprofileController.pinController,
//                 validator: (value) {
//                   return _nurseprofileController.validPin(value!);
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
//               height: size.height * 0.01,
//               //appPadding / 2,
//             ),
//             Text(
//               'Bank Details:',
//               style: TextStyle(
//                   fontWeight: FontWeight.w700, fontSize: size.width * 0.04),
//             ),
//
//             SizedBox(
//               height: size.height * 0.01,
//               //appPadding / 2,
//             ),
//
//             ///TODO: bankAc  no.......................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 keyboardType: TextInputType.number,
//                 autofillHints: [AutofillHints.creditCardNumber],
//                 controller: _nurseprofileController.accountnoController,
//                 validator: (value) {
//                   return _nurseprofileController.validAccount(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Bank Account No.',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.account_balance_outlined,
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
//
//             ///TODO: IFSC.......................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.creditCardNumber],
//                 controller: _nurseprofileController.ifscController,
//                 validator: (value) {
//                   return _nurseprofileController.validIfsc(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'IFSC Code',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.qr_code,
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
//
//             ///TODO:  bank name.......................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.name],
//                 controller: _nurseprofileController.branchNameController,
//                 validator: (value) {
//                   return _nurseprofileController.validBranch(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Branch name.',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.account_balance_rounded,
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
//             RectangularButton(
//                 text: 'UPDATE',
//                 press: () {
//                   Get.to(NurseHomePage());
//                   //_loginpasswordController.checkLoginpassword();
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
