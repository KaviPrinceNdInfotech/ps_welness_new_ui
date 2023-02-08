import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/profile_u_controller/profile_update_controller.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../home_page_user_view/user_home_page.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/profile_u_controller/profile_update_controller.dart';
// import 'package:ps_welness/modules_view/1_user_section_views/home_page_user_view/user_home_page.dart';
// //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class ProfileCredentials extends StatelessWidget {
  ProfileCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  ProfileController _profileController = Get.put(ProfileController());

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
      key: _profileController.profileformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ///Todo: email.....................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.email],
            //     controller: _profileController.emailController,
            //     onSaved: (value) {
            //       _profileController.email = value!;
            //     },
            //     validator: (value) {
            //       return _profileController.validEmail(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Email',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.email,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),

            ///todo: phone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _profileController.mobileController,
                onSaved: (value) {
                  _profileController.mobile = value!;
                },
                validator: (value) {
                  return _profileController.validPhone(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Phone No',
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

            ///TODO: Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //initialValue: "I am smart",
                autofillHints: [AutofillHints.name],
                controller: _profileController.nameController,
                onSaved: (value) {
                  _profileController.name = value!;
                },
                validator: (value) {
                  return _profileController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Clinic Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.home_repair_service_outlined,
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

            ///Todo: state............................

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField(
                      value: _profileController.selectedState.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select State'),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        _profileController.selectedState.value = newValue!;
                        // _hospital_2_controller.states.value =
                        //     newValue! as List<String>;
                        // _hospital_2_controller.selectedCity.value = null;
                        // _hospital_2_controller.cities.clear();
                        // _hospital_2_controller.cities
                        //     .addAll(stateCityMap[newvalue]!);
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
                  () => DropdownButtonFormField(
                      //icon: Icon(Icons.location_city),
                      value: _profileController.selectedCity.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Selected City'),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        _profileController.selectedCity.value = newValue!;
                        // _hospital_2_controller.states.value =
                        //     newValue! as List<String>;
                        // _hospital_2_controller.selectedCity.value = null;
                        // _hospital_2_controller.cities.clear();
                        // _hospital_2_controller.cities
                        //     .addAll(stateCityMap[newvalue]!);
                      }),
                ),
              ),
            ),

            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: location value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _profileController.locatoionController,
                onSaved: (value) {
                  _profileController.location = value!;
                },
                validator: (value) {
                  return _profileController.validLocation(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Location',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.pin_drop,
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

            ///Todo: fees..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _profileController.feesController,
                onSaved: (value) {
                  _profileController.fees = value!;
                },
                validator: (value) {
                  return _profileController.validFees(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Fees',
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

            SizedBox(
              height: size.height * 0.02,
            ),

            ///TODO: Pin.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.password],
                controller: _profileController.pinController,
                onSaved: (value) {
                  _profileController.pin = value!;
                },
                validator: (value) {
                  return _profileController.validPin(value!);
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
              height: size.height * 0.01,
              //appPadding / 2,
            ),
            Text(
              'Bank Details:',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: size.width * 0.04),
            ),

            SizedBox(
              height: size.height * 0.01,
              //appPadding / 2,
            ),

            ///TODO: bankAc  no.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.creditCardNumber],
                controller: _profileController.accountnoController,
                onSaved: (value) {
                  _profileController.account = value!;
                },
                validator: (value) {
                  return _profileController.validAccount(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Bank Account No.',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_balance_outlined,
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

            ///TODO: IFSC.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.creditCardNumber],
                controller: _profileController.ifscController,
                onSaved: (value) {
                  _profileController.ifsc = value!;
                },
                validator: (value) {
                  return _profileController.validIfsc(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'IFSC Code',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.qr_code,
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

            ///TODO:  bank name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _profileController.branchController,
                onSaved: (value) {
                  _profileController.branch = value!;
                },
                validator: (value) {
                  return _profileController.validBranch(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Branch name.',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_balance_rounded,
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

            RectangularButton(
                text: 'UPDATE',
                press: () {
                  Get.to(UserHomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
