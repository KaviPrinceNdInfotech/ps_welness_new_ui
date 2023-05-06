// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:ps_welness_new_ui/constants/constants/constants.dart';
// import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// //import 'package:ps_welness/constants/constants/constants.dart';
// //import 'package:ps_welness/controllers/nurses_controllers/nurse_controller3container.dart';
// //import 'package:ps_welness/widgets/widgets/rectangular_button.dart';
//
// import '../../../../controllers/nurses_controllers/nurse_controller3.dart';
// import '../../../../widgets/widgets/neumorphic_text_field_container.dart';
// import '../../../4_nurse_section_view/nurse_home/nurse_home_page.dart';
//
// class Nurses3Credentials extends StatelessWidget {
//   Nurses3Credentials({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Form(
//
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Padding(
//         padding: EdgeInsets.all(30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ///TODO: Nurse type id.......................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 keyboardType: TextInputType.number,
//                 autofillHints: [AutofillHints.transactionAmount],
//                 controller: _nurses_3_controller.NurseType_IdController,
//                 validator: (value) {
//                   return _nurses_3_controller.validDay(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Nurse Type Id',
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
//             ///Todo: Certificate number.....................
//             NeumorphicTextFieldContainer(
//               child: TextFormField(
//                 autofillHints: [AutofillHints.name],
//                 controller: _nurses_3_controller.CertificateNumberController,
//                 validator: (value) {
//                   return _nurses_3_controller.validLocation(value!);
//                 },
//                 cursorColor: Colors.black,
//                 obscureText: false,
//                 decoration: InputDecoration(
//                   hintText: 'Certificate number',
//                   helperStyle: TextStyle(
//                     color: black.withOpacity(0.7),
//                     fontSize: 18,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.location_on,
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
//             SizedBox(
//               height: size.height * 0.00,
//             ),
//             SizedBox(
//               height: size.height * 0.01,
//             ),
//             RectangularButton(
//                 text: 'SUBMIT',
//                 press: () {
//                   _nurses_3_controller.checkNurses3();
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
