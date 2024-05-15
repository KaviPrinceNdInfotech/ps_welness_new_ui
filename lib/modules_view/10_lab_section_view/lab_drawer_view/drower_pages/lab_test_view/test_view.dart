import 'package:flutter/material.dart';
//import 'package:ps_welness/constants/my_theme.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';

class LabtestView extends StatelessWidget {
  const LabtestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.ThemeColors,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyTheme.ThemeColors,
        centerTitle: true,
        title: const Text('Add Lab Test'),
      ),
    );
  }
}
