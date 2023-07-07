import 'package:flutter/material.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class SkilsView extends StatelessWidget {
  const SkilsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyTheme.ThemeColors,
        centerTitle: true,
        title: Text('Add Skils'),
      ),
    );
  }
}
