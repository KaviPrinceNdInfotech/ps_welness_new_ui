// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:gyros_app/constants/app_colors.dart';
// import 'package:gyros_app/controllers/login_controllerss/login_controllerssss.dart';
// import 'package:gyros_app/view/login_page/login_main_page/login_controller.dart';
//
// class UserIdTextField extends StatelessWidget {
//   LoginPageController _loginPageController = Get.find();
//   UserIdTextField({
//     Key? key,
//     required this.useridController,
//     required this.userIdErrorText,
//     required this.userIdHintText,
//     required this.userIdHintTextColor,
//     required this.userIdErrorTextColor,
//     required this.useridTextFieldPrefixIcon,
//     required this.useridTextFieldPrefixIconColor,
//     required this.onUseridValueChange,
//     //required this IconData suffixIcon,
//   }) : super(key: key);
//
//   final TextEditingController useridController;
//   final String userIdErrorText;
//   final String userIdHintText;
//   final Color userIdHintTextColor;
//   final Color userIdErrorTextColor;
//   final IconData useridTextFieldPrefixIcon;
//   final Color useridTextFieldPrefixIconColor;
//   final Function onUseridValueChange;
//
//   LoginController _loginController = Get.put(LoginController());
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       controller: _loginPageController.emailController,
//       onSaved: (value) {
//         _loginPageController.email = value!;
//       },
//       onChanged: (value) {
//         onUseridValueChange(value);
//       },
//       validator: (value) {
//         return _loginPageController.validateEmail(value!);
//       },
//       cursorColor: Theme.of(context).colorScheme.secondary,
//       style: TextStyle(color: Theme.of(context).colorScheme.secondary),
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         hintText: userIdHintText,
//         hintStyle: TextStyle(
//           color: AppColors.themecolors,
//         ),
//         prefixIcon: Icon(
//           useridTextFieldPrefixIcon,
//           color: useridTextFieldPrefixIconColor,
//         ),
//       ),
//     );
//   }
// }
