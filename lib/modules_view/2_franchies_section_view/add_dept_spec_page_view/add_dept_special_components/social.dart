// import 'package:flutter/material.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/sign_in/sigin_screen.dart';
// import 'package:ps_welness/widgets/widgets/account_check.dart';
// import 'package:ps_welness/widgets/widgets/rounded_button.dart';
//
// class RwaProfileSocial extends StatelessWidget {
//   const RwaProfileSocial({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'OR',
//           style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: appPadding),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               RoundedButton(imageSrc: 'assets/images/google.png', press: () {}),
//               RoundedButton(
//                   imageSrc: 'assets/images/facebook.png', press: () {}),
//               RoundedButton(
//                   imageSrc: 'assets/images/twitter.png', press: () {}),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: appPadding,
//         ),
//         AccountCheck(
//           login: false,
//           press: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return SignInScreen();
//                 },
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
