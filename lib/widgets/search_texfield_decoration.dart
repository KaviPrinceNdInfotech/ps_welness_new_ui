import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/my_theme.dart';

class SearchFieldDecorator extends StatelessWidget {
  final Widget child;
  SearchFieldDecorator({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.96,
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      decoration: BoxDecoration(
        color: MyTheme.ContainerUnSelectedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
