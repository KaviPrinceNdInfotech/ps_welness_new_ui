import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_type_model/nurse_type_model.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurses_view_RRR_sighup/nurses_sighup2/nurses_signup2.dart';
//import 'package:ps_welness_new_ui/controllers/nurses_controllers/nurses_controller2.dart';
//import 'package:ps_welness_new_ui/model/1_user_model/nurse_type_model/nurse_type_model.dart';
//import 'package:ps_welness_new_ui/modules_view/nurses_view/nurses_sighup2/nurses_signup2.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/nurses_controllers_RRR_signuppp/nurses_controller2.dart';

class Nurses1Credentials extends StatelessWidget {
  Nurses1Credentials({Key? key}) : super(key: key);

  Nurses_2_Controller _nurses_2_controller = Get.put(Nurses_2_Controller());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO: NurseType_Id.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _nurses_2_controller.NurseType_IdController,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Nurse type id',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline_sharp,
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

            ///Todo: CertificateNumber.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.email],
                controller: _nurses_2_controller.CertificateNumberController,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Certificate number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
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

            ///Todo: City Name..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _nurses_2_controller.CityNameController,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'City name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
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

            ///Todo: PinCode...........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _nurses_2_controller.PinCodeController,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Pin Code',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phonelink_lock,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: NurseName..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _nurses_2_controller.NurseNameController,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Nurse name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            // todo Phone number
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _nurses_2_controller.PhoneNumberController,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            // todo Mobile number
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _nurses_2_controller.MobileNumberController,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Mobile number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            // todo Email Id
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _nurses_2_controller.EmailIdController,
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Email Id',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<NurseModels>(
                      value: _nurses_2_controller.selectedNurse.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Nurse'),
                      items:
                          _nurses_2_controller.nurse.map((NurseModels nurse) {
                        return DropdownMenuItem(
                          value: nurse,
                          child: Text(
                            nurse.nurseTypeName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (NurseModels? newValue) {
                        _nurses_2_controller.selectedNurse.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            RectangularButton(
                text: 'Go Next >',
                press: () {
                  Get.to(NursesSignup2());
                })
          ],
        ),
      ),
    );
  }
}
