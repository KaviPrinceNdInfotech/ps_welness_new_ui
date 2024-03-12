import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/lab_controller/lab_controller1/lab_controller_1.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_center/lab_signup2/lab_signup_2.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../../model/1_user_model/city_model/city_modelss.dart';
import '../../../../../model/1_user_model/states_model/state_modells.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/lab_controller/lab_controller1/lab_controller_1.dart';
// import 'package:ps_welness/modules_view/10_lab_section_view/lab_center/lab_signup2/lab_signup_2.dart';
// //import 'package:ps_welness/modules_view/lab_center/lab_signup2/lab_signup_2.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class Lab1Credentials extends StatelessWidget {
  Lab1Credentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  Lab_1_Controller _lab_1_controller = Get.put(Lab_1_Controller());

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      // key: _lab_1_controller.lab1formkey,
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
                controller: _lab_1_controller.nameController,
                onSaved: (value) {
                  _lab_1_controller.labName = value!;
                },
                validator: (value) {
                  return _lab_1_controller.validName(value!);
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
                controller: _lab_1_controller.emailController,
                onSaved: (value) {
                  _lab_1_controller.emailId = value!;
                },
                validator: (value) {
                  return _lab_1_controller.validEmail(value!);
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
                controller: _lab_1_controller.passwordController,
                onSaved: (value) {
                  _lab_1_controller.password = value!;
                },
                validator: (value) {
                  return _lab_1_controller.validPassword(value!);
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
                controller: _lab_1_controller.confirmpasswordController,
                onSaved: (value) {
                  _lab_1_controller.confirmPassword = value!;
                },
                validator: (value) {
                  return _lab_1_controller.validConfirmPassword(value!);
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
                //obscureText: true,
                //controller: _loginpasswordController.mobileController,
              ),
            ),

            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: mobile number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _lab_1_controller.mobileController,
                onSaved: (value) {
                  _lab_1_controller.mobileNumber = value!;
                },
                validator: (value) {
                  return _lab_1_controller.validMobile(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Mobile',
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
            // RectangularInputField(
            //   hintText: 'Password',
            //   icon: Icons.lock,
            //   obscureText: true,
            // ),

            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: teliphone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _lab_1_controller.phoneController,
                onSaved: (value) {
                  _lab_1_controller.phoneNumber = value!;
                },
                validator: (value) {
                  return _lab_1_controller.validPhone(value!);
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
                    Icons.call_rounded,
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

            ///todo: pan number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _lab_1_controller.panController,
                onSaved: (value) {
                  _lab_1_controller.pan = value!;
                },
                validator: (value) {
                  return _lab_1_controller.validPan(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Pan number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.add_card_outlined,
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
                controller: _lab_1_controller.locationController,
                onSaved: (value) {
                  _lab_1_controller.location = value!;
                },
                validator: (value) {
                  return _lab_1_controller.validAddress(value!);
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
                      value: _lab_1_controller.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select State'),
                      items: _lab_1_controller.states.map((StateModel model) {
                        return DropdownMenuItem(
                          value: model,
                          child: Text(
                            model.stateName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (StateModel? newValue) {
                        _lab_1_controller.selectedState.value = newValue!;
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
                      value: _lab_1_controller.selectedCity.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Selected City'),
                      items: _lab_1_controller.cities.map((City city) {
                        return DropdownMenuItem(
                          value: city,
                          child: Text(
                            city.cityName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (City? newValue) {
                        _lab_1_controller.selectedCity.value = newValue!;
                      }),
                ),
              ),
            ),

            // child: DropdownButton(
            //     value: _hospital_2_controller.selectedState.value,
            //     menuMaxHeight: size.height * 0.3,
            //     items: items.map((String items) {
            //       return DropdownMenuItem(
            //         value: items,
            //         child: Text(items),
            //       );
            //     }).toList(),
            //     // _hospital_2_controller.states.map((String value) {
            //     //   return DropdownMenuItem(
            //     //     value: value,
            //     //
            //     //   )
            //     onChanged: (String? newValue) {
            //       _hospital_2_controller.states.value =
            //           newValue! as List<String>;
            //       _hospital_2_controller.selectedCity.value = null;
            //       _hospital_2_controller.cities.clear();
            //       _hospital_2_controller.cities
            //           .addAll(stateCityMap[newvalue]!);
            //     })),

            SizedBox(
              height: size.height * 0.02,
            ),

            ///TODO: Pin.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.password],
                controller: _lab_1_controller.pinController,
                onSaved: (value) {
                  _lab_1_controller.pinCode = value!;
                },
                validator: (value) {
                  return _lab_1_controller.validPin(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Pin Code',
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
              //appPadding / 2,
            ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
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
                text: 'Go Next>',
                press: () {
                  Get.to(LabSignup2());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
