import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/my_theme.dart';

class UserMobileTextField extends StatelessWidget {
  UserMobileTextField({
    Key? key,
    required this.userMobileController,
    required this.userMobileErrorText,
    required this.userMobileHintText,
    required this.userMobileHintTextColor,
    required this.userMobileErrorTextColor,
    required this.userMobileTextFieldPrefixIcon,
    required this.userMobileTextFieldPrefixIconColor,
    required this.onUserMobileValueChange,
    //required this IconData suffixIcon,
  }) : super(key: key);

  final TextEditingController userMobileController;
  final String userMobileErrorText;
  final String userMobileHintText;
  final Color userMobileHintTextColor;
  final Color userMobileErrorTextColor;
  final String userMobileTextFieldPrefixIcon;
  final Color userMobileTextFieldPrefixIconColor;
  final Function onUserMobileValueChange;

  // LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: userMobileController,
      validator: (value) {
        if (value!.isEmpty) {
          return userMobileErrorText;
        } else {
          return null;
        }
      },
      onChanged: (value) {
        onUserMobileValueChange(value);
      },
      cursorColor: MyTheme.ThemeColors,
      style: TextStyle(color: MyTheme.ThemeColors),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: userMobileHintText,
        hintStyle: TextStyle(
          color: AppColors.themecolors,
        ),
        // prefixIcon: Icon(
        //   userMobileTextFieldPrefixIcon,
        //   color: userMobileTextFieldPrefixIconColor,
        // ),
        prefix: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            userMobileTextFieldPrefixIcon,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
