import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    Key? key,
    required this.useridController,
    required this.userIdErrorText,
    required this.userIdHintText,
    required this.userIdHintTextColor,
    required this.userIdErrorTextColor,
    required this.useridTextFieldPrefixIcon,
    required this.useridTextFieldPrefixIconColor,
    required this.onUseridValueChange,
    //required this IconData suffixIcon,
  }) : super(key: key);

  final TextEditingController useridController;
  final String userIdErrorText;
  final String userIdHintText;
  final Color userIdHintTextColor;
  final Color userIdErrorTextColor;
  final IconData useridTextFieldPrefixIcon;
  final Color useridTextFieldPrefixIconColor;
  final Function onUseridValueChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: useridController,
      validator: (value) {
        if (value!.isEmpty) {
          return userIdErrorText;
        } else {
          return null;
        }
      },
      onChanged: (value) {
        onUseridValueChange(value);
      },
      cursorColor: Theme.of(context).colorScheme.secondary,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: userIdHintText,
          hintStyle: TextStyle(
            color: Colors.black45,
          ),
          prefixIcon: Icon(
            useridTextFieldPrefixIcon,
            color: Colors.black87,
          ),
          suffixIcon: Icon(Icons.menu_open_rounded)),
    );
  }
}
