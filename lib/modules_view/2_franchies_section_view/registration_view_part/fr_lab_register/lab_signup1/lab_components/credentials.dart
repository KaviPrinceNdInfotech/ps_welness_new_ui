import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/registration_view_part/fr_lab_register/lab_signup2/lab_signup_2.dart';
// //import 'package:ps_welness/modules_view/lab_center/lab_signup2/lab_signup_2.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../../controllers/2_franchises_controller/registration_part_controller/fr_lab_controller/fr_lab_controller1/lab_controller_1.dart';

class FrLab1Credentials extends StatelessWidget {
  FrLab1Credentials({Key? key}) : super(key: key);
  Fr_Lab_1_Controller _frlab_1_controller = Get.put(Fr_Lab_1_Controller());
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _frlab_1_controller.frlab1formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO: Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _frlab_1_controller.nameController,
                onSaved: (value) {
                  _frlab_1_controller.name = value!;
                },
                validator: (value) {
                  return _frlab_1_controller.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Name',
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

            ///Todo: email.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.email],
                controller: _frlab_1_controller.emailController,
                onSaved: (value) {
                  _frlab_1_controller.email = value!;
                },
                validator: (value) {
                  return _frlab_1_controller.validEmail(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Email',
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

            ///Todo: password..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _frlab_1_controller.passwordController,
                onSaved: (value) {
                  _frlab_1_controller.password = value!;
                },
                validator: (value) {
                  return _frlab_1_controller.validPassword(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Password',
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

            ///Todo: confirm password...........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _frlab_1_controller.confirmpasswordController,
                onSaved: (value) {
                  _frlab_1_controller.confirmpassword = value!;
                },
                validator: (value) {
                  return _frlab_1_controller.validConfirmPassword(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
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

            ///todo: phone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _frlab_1_controller.mobileController,
                onSaved: (value) {
                  _frlab_1_controller.mobile = value!;
                },
                validator: (value) {
                  return _frlab_1_controller.validPhone(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Phone',
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
              height: size.height * 0.02,
            ),

            ///todo: address value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _frlab_1_controller.addressController,
                onSaved: (value) {
                  _frlab_1_controller.address = value!;
                },
                validator: (value) {
                  return _frlab_1_controller.validAddress(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Address',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.location_city_outlined,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            ///Todo: state............................
            SizedBox(
              height: size.height * 0.02,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value: _frlab_1_controller.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select State'),
                      items: _frlab_1_controller.states.map((StateModel items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items.stateName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      validator: (value) =>
                          value == null ? 'field required' : null,
                      onChanged: (StateModel? newValue) {
                        _frlab_1_controller.selectedState.value = newValue!;
                      }),
                ),
              ),
            ),

            ///Todo: city.....................................
            SizedBox(
              height: size.height * 0.02,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<City>(
                      value: _frlab_1_controller.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Selected City'),
                      items: _frlab_1_controller.cities.map((City items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items.cityName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      validator: (value) =>
                          value == null ? 'field required' : null,
                      onChanged: (City? newValue) {
                        _frlab_1_controller.selectedCity.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///TODO: Pin.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.password],
                controller: _frlab_1_controller.pinController,
                onSaved: (value) {
                  _frlab_1_controller.pin = value!;
                },
                validator: (value) {
                  return _frlab_1_controller.validPin(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Pin',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.pin,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.018,
            ),
            SizedBox(
              height: size.height * 0.00,
            ),
            RectangularButton(
                text: 'Go Next>',
                press: () {
                  _frlab_1_controller.checkLab();
                })
          ],
        ),
      ),
    );
  }
}
