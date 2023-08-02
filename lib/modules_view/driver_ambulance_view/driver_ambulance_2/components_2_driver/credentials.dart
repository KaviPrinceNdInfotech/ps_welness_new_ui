import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/3_driver_controller_RRR/driver_controller1.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class Driver2Credentials extends StatelessWidget {
  Driver2Credentials({Key? key}) : super(key: key);
  Driver_1111_Controller _driver_1111_controller =
      Get.put(Driver_1111_Controller());

  //Driver_2_Controller _driver_2_controller = Get.put(Driver_2_Controller());

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
      key: _driver_1111_controller.driver1111formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),

            ///TODO: Pin.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.password],
                controller: _driver_1111_controller.pincontroller,
                onSaved: (value) {
                  _driver_1111_controller.PinCode = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validPin(value!);
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
            ),

            ///TODO: fees.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _driver_1111_controller.paidamountcontroller,
                onSaved: (value) {
                  _driver_1111_controller.Paidamount = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validFees(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter Charge per KM',
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
              height: size.height * 0.01,
            ),

            ///todo: location.............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _driver_1111_controller.locationcontroller,
                onSaved: (value) {
                  _driver_1111_controller.Location = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validAddress(value!);
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
              height: size.height * 0.01,
            ),

            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value: _driver_1111_controller.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Select State'),
                      items: _driver_1111_controller.states
                          .map((StateModel state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(
                            state.stateName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (StateModel? newValue) {
                        _driver_1111_controller.selectedState.value = newValue!;
                        _driver_1111_controller.selectedCity.value = null;
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
                  () => DropdownButtonFormField<City>(
                      //icon: Icon(Icons.location_city),
                      value: _driver_1111_controller.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Selected City'),
                      items: _driver_1111_controller.cities.map((City city) {
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
                      onTap: () {
                        _driver_1111_controller.refresh();
                      },
                      onChanged: (City? newValue) {
                        _driver_1111_controller.selectedCity.value = newValue!;
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

            ///image picker....1......

            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            // SizedBox(
            //   height: size.height * 0.2,
            //   child: GetBuilder<Driver_1111_Controller>(
            //     // specify type as Controller
            //     init:
            //         Driver_1111_Controller(), // intialize with the Controller
            //     builder: (value) => InkWell(
            //       onTap: () {
            //         //_rwa_11_controller.getImage(ImageSource.gallery);
            //       },
            //       child: Obx(
            ///         () => _driver_1111_controller.selectedPath.value != ''
            //             ? Image.file(
            //                 File(_driver_1111_controller.selectedPath.value))
            //             : InkWell(
            //                 onTap: (() {
            //                   optionsImage();
            //                 }),
            //                 child: NeumorphicTextFieldContainer(
            //                   child: Container(
            //                     height: size.height * 0.07,
            //                     //width: size.width * 0.5,
            //                     child: Padding(
            //                       padding: EdgeInsets.symmetric(
            //                           horizontal: size.width * 0.1),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text(
            //                             'User Image',
            //                             style: TextStyle(
            //                               fontSize: size.width * 0.03,
            //                               fontWeight: FontWeight.w700,
            //                             ),
            //                           ),
            //                           Icon(Icons.camera_alt),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //       ),
            //     ),
            //   ),
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      "Upload driver Image:",
                      style: TextStyle(
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.cyanAccent, width: 2),
                  ),
                  child: Obx(
                    () => _driver_1111_controller.selectedPath.value != ''
                        ? Image.file(
                            File(_driver_1111_controller.selectedPath.value))
                        : InkWell(
                            onTap: (() {
                              optionsImage();
                            }),
                            child: Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
                            // NeumorphicTextFieldContainer(
                            //   child: Container(
                            //     height: size.height * 0.07,
                            //     //width: size.width * 0.5,
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(
                            //           horizontal: size.width * 0.1),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             'User Image',
                            //             style: TextStyle(
                            //               fontSize: size.width * 0.03,
                            //               fontWeight: FontWeight.w700,
                            //             ),
                            //           ),
                            //           Icon(Icons.camera_alt),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            ///image picker....2......

            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      "Upload DL1 Image:",
                      style: TextStyle(
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.cyanAccent, width: 2),
                  ),
                  child: Obx(
                    () => _driver_1111_controller.selectedPath1.value != ''
                        ? Image.file(
                            File(_driver_1111_controller.selectedPath1.value))
                        : InkWell(
                            onTap: (() {
                              optionsImage1();
                            }),
                            child: Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
                            // NeumorphicTextFieldContainer(
                            //   child: Container(
                            //     height: size.height * 0.07,
                            //     //width: size.width * 0.5,
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(
                            //           horizontal: size.width * 0.1),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             'DL Image',
                            //             style: TextStyle(
                            //               fontSize: size.width * 0.03,
                            //               fontWeight: FontWeight.w700,
                            //             ),
                            //           ),
                            //           Icon(Icons.camera_alt),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ),
                  ),
                ),
              ],
            ),

            // SizedBox(
            //   height: size.height * 0.2,
            //   child: GetBuilder<Driver_1111_Controller>(
            //     // specify type as Controller
            //     init:
            //         Driver_1111_Controller(), // intialize with the Controller
            //     builder: (value) => InkWell(
            //       onTap: () {
            //         //_rwa_11_controller.getImage(ImageSource.gallery);
            //       },
            //       child: Obx(
            //         () => _driver_1111_controller.selectedPath1.value != ''
            //             ? Image.file(
            //                 File(_driver_1111_controller.selectedPath1.value))
            //             : InkWell(
            //                 onTap: (() {
            //                   optionsImage1();
            //                 }),
            //                 child: NeumorphicTextFieldContainer(
            //                   child: Container(
            //                     height: size.height * 0.07,
            //                     //width: size.width * 0.5,
            //                     child: Padding(
            //                       padding: EdgeInsets.symmetric(
            //                           horizontal: size.width * 0.1),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text(
            //                             'DL Image',
            //                             style: TextStyle(
            //                               fontSize: size.width * 0.03,
            //                               fontWeight: FontWeight.w700,
            //                             ),
            //                           ),
            //                           Icon(Icons.camera_alt),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //       ),
            //     ),
            //   ),
            // ),

            ///image picker....3......

            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      "Upload DL2 Image:",
                      style: TextStyle(
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.cyanAccent, width: 2),
                  ),
                  child: Obx(
                    () => _driver_1111_controller.selectedPath2.value != ''
                        ? Image.file(
                            File(_driver_1111_controller.selectedPath2.value))
                        : InkWell(
                            onTap: (() {
                              optionsImage2();
                            }),
                            child: Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
                            // NeumorphicTextFieldContainer(
                            //   child: Container(
                            //     height: size.height * 0.07,
                            //     //width: size.width * 0.5,
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(
                            //           horizontal: size.width * 0.1),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             'DL Image2',
                            //             style: TextStyle(
                            //               fontSize: size.width * 0.03,
                            //               fontWeight: FontWeight.w700,
                            //             ),
                            //           ),
                            //           Icon(Icons.camera_alt),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ),
                  ),
                ),
              ],
            ),

            // SizedBox(
            //   height: size.height * 0.2,
            //   child: GetBuilder<Driver_1111_Controller>(
            //     // specify type as Controller
            //     init:
            //         Driver_1111_Controller(), // intialize with the Controller
            //     builder: (value) => InkWell(
            //       onTap: () {
            //         //_rwa_11_controller.getImage(ImageSource.gallery);
            //       },
            //       child: Obx(
            //         () => _driver_1111_controller.selectedPath2.value != ''
            //             ? Image.file(
            //                 File(_driver_1111_controller.selectedPath2.value))
            //             : InkWell(
            //                 onTap: (() {
            //                   optionsImage2();
            //                 }),
            //                 child: NeumorphicTextFieldContainer(
            //                   child: Container(
            //                     height: size.height * 0.07,
            //                     //width: size.width * 0.5,
            //                     child: Padding(
            //                       padding: EdgeInsets.symmetric(
            //                           horizontal: size.width * 0.1),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text(
            //                             'DL Image2',
            //                             style: TextStyle(
            //                               fontSize: size.width * 0.03,
            //                               fontWeight: FontWeight.w700,
            //                             ),
            //                           ),
            //                           Icon(Icons.camera_alt),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //       ),
            //     ),
            //   ),
            // ),

            ///image picker....4......

            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      "Upload Aadhar1 Image:",
                      style: TextStyle(
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.cyanAccent, width: 2),
                  ),
                  child: Obx(
                    () => _driver_1111_controller.selectedPath3.value != ''
                        ? Image.file(
                            File(_driver_1111_controller.selectedPath3.value))
                        : InkWell(
                            onTap: (() {
                              optionsImage3();
                            }),
                            child: Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
                            // NeumorphicTextFieldContainer(
                            //   child: Container(
                            //     height: size.height * 0.07,
                            //     //width: size.width * 0.5,
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(
                            //           horizontal: size.width * 0.1),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             'Aadhar Image',
                            //             style: TextStyle(
                            //               fontSize: size.width * 0.03,
                            //               fontWeight: FontWeight.w700,
                            //             ),
                            //           ),
                            //           Icon(Icons.camera_alt),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ),
                  ),
                ),
              ],
            ),

            // SizedBox(
            //   height: size.height * 0.2,
            //   child: GetBuilder<Driver_1111_Controller>(
            //     // specify type as Controller
            //     init:
            //         Driver_1111_Controller(), // intialize with the Controller
            //     builder: (value) => InkWell(
            //       onTap: () {
            //         //_rwa_11_controller.getImage(ImageSource.gallery);
            //       },
            //       child: Obx(
            //         () => _driver_1111_controller.selectedPath3.value != ''
            //             ? Image.file(
            //                 File(_driver_1111_controller.selectedPath3.value))
            //             : InkWell(
            //                 onTap: (() {
            //                   optionsImage3();
            //                 }),
            //                 child: NeumorphicTextFieldContainer(
            //                   child: Container(
            //                     height: size.height * 0.07,
            //                     //width: size.width * 0.5,
            //                     child: Padding(
            //                       padding: EdgeInsets.symmetric(
            //                           horizontal: size.width * 0.1),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text(
            //                             'Aadhar Image',
            //                             style: TextStyle(
            //                               fontSize: size.width * 0.03,
            //                               fontWeight: FontWeight.w700,
            //                             ),
            //                           ),
            //                           Icon(Icons.camera_alt),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //       ),
            //     ),
            //   ),
            // ),

            ///image picker....5......

            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      "Upload Aadhar2 Image:",
                      style: TextStyle(
                        fontSize: size.height * 0.017,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.cyanAccent, width: 2),
                  ),
                  child: Obx(
                    () => _driver_1111_controller.selectedPath4.value != ''
                        ? Image.file(
                            File(_driver_1111_controller.selectedPath4.value))
                        : InkWell(
                            onTap: (() {
                              optionsImage4();
                            }),
                            child: Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
                            // NeumorphicTextFieldContainer(
                            //   child: Container(
                            //     height: size.height * 0.07,
                            //     //width: size.width * 0.5,
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(
                            //           horizontal: size.width * 0.1),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             'Aadhar Image2',
                            //             style: TextStyle(
                            //               fontSize: size.width * 0.03,
                            //               fontWeight: FontWeight.w700,
                            //             ),
                            //           ),
                            //           Icon(Icons.camera_alt),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ),
                  ),
                ),
              ],
            ),

            // SizedBox(
            //   height: size.height * 0.2,
            //   child: GetBuilder<Driver_1111_Controller>(
            //     // specify type as Controller
            //     init:
            //         Driver_1111_Controller(), // intialize with the Controller
            //     builder: (value) => InkWell(
            //       onTap: () {
            //         //_rwa_11_controller.getImage(ImageSource.gallery);
            //       },
            //       child: Obx(
            //         () => _driver_1111_controller.selectedPath4.value != ''
            //             ? Image.file(
            //                 File(_driver_1111_controller.selectedPath4.value))
            //             : InkWell(
            //                 onTap: (() {
            //                   optionsImage4();
            //                 }),
            //                 child: NeumorphicTextFieldContainer(
            //                   child: Container(
            //                     height: size.height * 0.07,
            //                     //width: size.width * 0.5,
            //                     child: Padding(
            //                       padding: EdgeInsets.symmetric(
            //                           horizontal: size.width * 0.1),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text(
            //                             'Aadhar Image2',
            //                             style: TextStyle(
            //                               fontSize: size.width * 0.03,
            //                               fontWeight: FontWeight.w700,
            //                             ),
            //                           ),
            //                           Icon(Icons.camera_alt),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //       ),
            //     ),
            //   ),
            // ),

            SizedBox(
              height: size.height * 0.02,
            ),

            RectangularButton(
                text: 'SUBMIT',
                press: () {
                  _driver_1111_controller.checkDriver1111();
                  //_driver_1111_controller.driverSignupApi();
                  // Get.to(DriverHomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }

  void optionsImage() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _driver_1111_controller.getImage(ImageSource.camera);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 70,
              indent: 70,
            ),
            InkWell(
              onTap: () {
                _driver_1111_controller.getImage(ImageSource.gallery);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void optionsImage1() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                //var ImageSource1;
                _driver_1111_controller.getImage1(ImageSource.camera);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 70,
              indent: 70,
            ),
            InkWell(
              onTap: () {
                _driver_1111_controller.getImage1(ImageSource.gallery);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void optionsImage2() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _driver_1111_controller.getImage2(ImageSource.camera);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 70,
              indent: 70,
            ),
            InkWell(
              onTap: () {
                _driver_1111_controller.getImage2(ImageSource.gallery);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void optionsImage3() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _driver_1111_controller.getImage3(ImageSource.camera);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 70,
              indent: 70,
            ),
            InkWell(
              onTap: () {
                _driver_1111_controller.getImage3(ImageSource.gallery);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void optionsImage4() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _driver_1111_controller.getImage4(ImageSource.camera);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 70,
              indent: 70,
            ),
            InkWell(
              onTap: () {
                _driver_1111_controller.getImage4(ImageSource.gallery);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
