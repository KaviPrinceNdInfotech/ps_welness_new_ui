import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class UserPassTextField extends StatelessWidget {
  UserPassTextField({
    Key? key,
    required this.userPassController,
    required this.userPassErrorText,
    required this.userPassHintText,
    required this.userPassHintTextColor,
    required this.userPassErrorTextColor,
    required this.userPassTextFieldPrefixIcon,
    required this.userPassTextFieldSufixIcon,
    required this.userPassTextFieldSufixIconColor,
    required this.userPassTextFieldPrefixIconColor,
    required this.onUserPassValueChange,
  }) : super(key: key);

  final TextEditingController userPassController;
  final String userPassErrorText;
  final String userPassHintText;
  final Color userPassHintTextColor;
  final Color userPassErrorTextColor;
  final IconData userPassTextFieldPrefixIcon;
  final Color userPassTextFieldPrefixIconColor;
  final Function onUserPassValueChange;
  final IconData userPassTextFieldSufixIcon;
  final Color userPassTextFieldSufixIconColor;

  //LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        //obscureText: _loginController.isVisible.value,
        controller: userPassController,
        validator: (value) {
          if (value!.isEmpty) {
            return userPassErrorText;
          } else {
            return null;
          }
        },
        onChanged: (value) {
          onUserPassValueChange(value);
        },
        cursorColor: Theme.of(context).colorScheme.secondary,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIcon: Icon(
            userPassTextFieldPrefixIcon,
            color: userPassTextFieldPrefixIconColor,
          ),
          //suffixIcon:
          //IconButton(
          //   icon: Icon(
          //     _loginController.isVisible.value
          //         ? Icons.visibility_off
          //         : Icons.visibility,
          //   ),
          //   color: userPassTextFieldSufixIconColor,
          //   onPressed: () {
          //     _loginController.isVisible.value =
          //         !_loginController.isVisible.value;
          //     print('hello prefix');
          //     //TODO : will use getx here.............
          //   },
          // ),
          // hintText: userPassHintText,
          //  hintStyle: TextStyle(
          //    color: AppColors.themecolors,
          //  ),
          //prefixIcon: Icons.person,
          // prefixIcon: userPassTextFieldPrefixIcon,
        ),
      ),
    );
  }
}
