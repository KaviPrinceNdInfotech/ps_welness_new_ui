import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/controllers/nurses_controllers/nurse_controller3container.dart';
//import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/nurses_controllers/nurse_controller3.dart';
import '../../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../../4_nurse_section_view/nurse_home/nurse_home_page.dart';

class Nurses3Credentials extends StatelessWidget {
  Nurses3Credentials({Key? key}) : super(key: key);

  Nurses_3_controller _nurses_3_controller = Get.put(Nurses_3_controller());

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _nurses_3_controller.nursesformkey3,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO: day.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.transactionAmount],
                controller: _nurses_3_controller.dayController,
                onSaved: (value) {
                  _nurses_3_controller.day = value!;
                },
                validator: (value) {
                  return _nurses_3_controller.validDay(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Fee/Day',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.currency_rupee,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///Todo: location.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _nurses_3_controller.locationController,
                onSaved: (value) {
                  _nurses_3_controller.location = value!;
                },
                validator: (value) {
                  return _nurses_3_controller.validLocation(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter Location',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            // RectangularInputField(
            //   hintText: 'Password',
            //   icon: Icons.lock,
            //   obscureText: true,
            // ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            SizedBox(
              height: size.height * 0.01,
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: InkWell(
            //     onTap: () {},
            //     child: Text(
            //       'Forget Password?',
            //       style: GoogleFonts.alegreya(
            //         fontWeight: FontWeight.w500,
            //         fontSize: size.width * 0.035,
            //       ),
            //     ),
            //   ),
            // ),
            RectangularButton(
                text: 'SUBMIT',
                press: () {
                  Get.to(NurseHomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
