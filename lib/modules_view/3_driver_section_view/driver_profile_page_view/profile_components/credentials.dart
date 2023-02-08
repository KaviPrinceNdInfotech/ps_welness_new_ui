import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view/driver_home/driver_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/modules_view/3_driver_section_view/driver_home/driver_home_page.dart';
// //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/3_driver_view_controllers/driver_profile_controller/driver_profile_controller.dart';
import '../../../../controllers/6_chemist_view_controllers/chemist_profile_controller/chemist_profile_controller.dart';

class DriverProfileCredentials extends StatelessWidget {
  DriverProfileCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  DriverProfileController _driverprofileController =
      Get.put(DriverProfileController());

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
      key: _driverprofileController.driverrprofileformkey,
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

            ///todo:  name..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _driverprofileController.mobileController,
                onSaved: (value) {
                  _driverprofileController.mobile = value!;
                },
                validator: (value) {
                  return _driverprofileController.validPhone(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Driver Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_box,
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

            ///TODO: cab Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //initialValue: "I am smart",
                autofillHints: [AutofillHints.name],
                controller: _driverprofileController.nameController,
                onSaved: (value) {
                  _driverprofileController.name = value!;
                },
                validator: (value) {
                  return _driverprofileController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Vehicle Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.car_repair,
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
                      value: _driverprofileController.selectedState.value,
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
                        _driverprofileController.selectedState.value =
                            newValue!;
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
                      value: _driverprofileController.selectedCity.value,
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
                        _driverprofileController.selectedCity.value = newValue!;
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
                controller: _driverprofileController.locatoionController,
                onSaved: (value) {
                  _driverprofileController.location = value!;
                },
                validator: (value) {
                  return _driverprofileController.validLocation(value!);
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
            SizedBox(
              height: size.height * 0.01,
              //appPadding / 2,
            ),
            // Text(
            //   'Shop Details:',
            //   style: TextStyle(
            //       fontWeight: FontWeight.w700, fontSize: size.width * 0.04),
            // ),

            SizedBox(
              height: size.height * 0.01,
              //appPadding / 2,
            ),

            ///Todo: vehicle no..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverprofileController.feesController,
                onSaved: (value) {
                  _driverprofileController.fees = value!;
                },
                validator: (value) {
                  return _driverprofileController.validFees(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Vehicle NO',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.switch_account,
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

            ///TODO: licence no.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //autofillHints: [AutofillHin],
                controller: _driverprofileController.pinController,
                onSaved: (value) {
                  _driverprofileController.pin = value!;
                },
                validator: (value) {
                  return _driverprofileController.validPin(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'LICENCE NO',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.local_police,
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

            GetBuilder<ChemistProfileController>(
              // specify type as Controller
              init: ChemistProfileController(), // intialize with the Controller
              builder: (value) => InkWell(
                onTap: () {
                  _driverprofileController.getImage(ImageSource.gallery);
                },
                child: NeumorphicTextFieldContainer(
                  child: Container(
                    height: size.height * 0.07,
                    //width: size.width * 0.5,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Licence Image',
                            style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.camera_alt),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ///TODO: bankAc  no.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     keyboardType: TextInputType.number,
            //     autofillHints: [AutofillHints.creditCardNumber],
            //     controller: _chemistprofileController.accountnoController,
            //     onSaved: (value) {
            //       _chemistprofileController.account = value!;
            //     },
            //     validator: (value) {
            //       return _chemistprofileController.validAccount(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Bank Account No.',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.account_balance_outlined,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            // ///TODO: IFSC.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.creditCardNumber],
            //     controller: _chemistprofileController.ifscController,
            //     onSaved: (value) {
            //       _chemistprofileController.ifsc = value!;
            //     },
            //     validator: (value) {
            //       return _chemistprofileController.validIfsc(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'IFSC Code',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.qr_code,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            // ///TODO:  bank name.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.name],
            //     controller: _chemistprofileController.branchController,
            //     onSaved: (value) {
            //       _chemistprofileController.branch = value!;
            //     },
            //     validator: (value) {
            //       return _chemistprofileController.validBranch(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Branch name.',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.account_balance_rounded,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

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
                  Get.to(DriverHomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
