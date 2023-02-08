import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/my_theme.dart';
//import 'package:ps_welness/constants/my_theme.dart';

class RiderInfo extends StatelessWidget {
  const RiderInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 16),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage("assets/Avatar.png"),
          ),
          title: const Text(
            "Mike Rojnidoost",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: const Text("860m - 28min"),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: MyTheme.containercolor6,
              shape: const CircleBorder(),
              minimumSize: const Size(48, 48),
            ),
            onPressed: () {},
            child: SvgPicture.asset(
              "assets/icons/chat.svg",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
