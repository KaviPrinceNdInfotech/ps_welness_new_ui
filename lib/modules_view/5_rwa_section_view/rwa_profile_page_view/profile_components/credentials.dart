import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller/rwa_profile/rwa_profile_controller.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/5_rwa_controller/rwa_profile/rwa_profile_controller.dart';
// import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
// //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/6_chemist_view_controllers/chemist_profile_controller/chemist_profile_controller.dart';

class RwaProfileCredentials extends StatelessWidget {
  RwaProfileCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  RwaProfileController _rwaProfileController = Get.put(RwaProfileController());

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
      key: _rwaProfileController.rwaprofileformkey,
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
                controller: _rwaProfileController.mobileController,
                onSaved: (value) {
                  _rwaProfileController.mobile = value!;
                },
                validator: (value) {
                  return _rwaProfileController.validPhone(value!);
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

            ///TODO: Shop Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //initialValue: "I am smart",
                autofillHints: [AutofillHints.name],

                controller: _rwaProfileController.nameController,
                onSaved: (value) {
                  _rwaProfileController.name = value!;
                },
                validator: (value) {
                  return _rwaProfileController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Landline no',
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
                      value: _rwaProfileController.selectedState.value,
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
                        _rwaProfileController.selectedState.value = newValue!;
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
                      value: _rwaProfileController.selectedCity.value,
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
                        _rwaProfileController.selectedCity.value = newValue!;
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
                controller: _rwaProfileController.locatoionController,
                onSaved: (value) {
                  _rwaProfileController.location = value!;
                },
                validator: (value) {
                  return _rwaProfileController.validLocation(value!);
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
            //
            // SizedBox(
            //   height: size.height * 0.01,
            //   //appPadding / 2,
            // ),
            //
            // ///Todo: gst no..............
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     controller: _rwaProfileController.feesController,
            //     onSaved: (value) {
            //       _rwaProfileController.fees = value!;
            //     },
            //     validator: (value) {
            //       return _rwaProfileController.validFees(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'GST NO',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.switch_account,
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
            //
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            //
            // ///TODO: licence no.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     //autofillHints: [AutofillHin],
            //     controller: _rwaProfileController.pinController,
            //     onSaved: (value) {
            //       _rwaProfileController.pin = value!;
            //     },
            //     validator: (value) {
            //       return _rwaProfileController.validPin(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'LICENCE NO',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.local_police,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.018,
            //   //appPadding / 2,
            // ),

            GetBuilder<ChemistProfileController>(
              // specify type as Controller
              init: ChemistProfileController(), // intialize with the Controller
              builder: (value) => InkWell(
                onTap: () {
                  _rwaProfileController.getImage(ImageSource.gallery);
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
                            'Certificate Image',
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
                  Get.to(ChemistHomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
