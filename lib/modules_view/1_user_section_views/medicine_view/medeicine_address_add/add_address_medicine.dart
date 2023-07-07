

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/user_views/user_components/credentials.dart';
import 'package:ps_welness_new_ui/modules_view/user_views/user_components/head_text.dart';

import '../../../../controllers/1_user_view_controller/medicine_controllers/add_delivery_post_controller.dart';
import '../../../../controllers/1_user_view_controller/medicine_controllers/medicine_address_controller/medicine_address_controller.dart';
import 'medicine_add_address_credential.dart';
import 'medicine_head_text_addaddress.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/user_views/user_components/credentials.dart';
// import 'package:ps_welness/modules_view/user_views/user_components/head_text.dart';

class AddAdderessMedicine extends StatelessWidget {
   AddAdderessMedicine({Key? key}) : super(key: key);

  // medicine_address_Controller _medicine_address_controller = Get.put(medicine_address_Controller());


   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                lightPrimary,
                darkPrimary,
              ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -size.height * 0.01,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  right: size.width * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.220,
                      width: size.width * 0.50,
                      decoration: BoxDecoration(
                        //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/background_stack_png/ambulance1.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MedicineAddressHeadText(),
                    AddaddressmedicineCredentials(),
                   // User1HeadText(),
                    //User1Credentials(),
                    //HospitalSocial(),
                    //Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

