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
import 'package:ps_welness_new_ui/model/9_doctors_model/franchise_model_comman/franchise_model_id.dart';
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

    ///todo: Function to handle image selection
    ///1
    Future<void> handleImageSelection1() async {
      optionsImage();
      await optionsController2.selectOption1();
      //await _doctorrUploadReportController.getdoctorrpatientApi();
    }

    ///2
    Future<void> handleImageSelection2() async {
      optionsImage1();
      await optionsController2.selectOption2();
      //await _doctorrUploadReportController.getdoctorrpatientApi();
    }

    ///3

    Future<void> handleImageSelection3() async {
      optionsImage2();
      await optionsController2.selectOption3();
      //await _doctorrUploadReportController.getdoctorrpatientApi();
    }

    ///4
    Future<void> handleImageSelection4() async {
      optionsImage3();
      await optionsController2.selectOption4();
      //await _doctorrUploadReportController.getdoctorrpatientApi();
    }

    ///5
    Future<void> handleImageSelection5() async {
      optionsImage4();
      await optionsController2.selectOption5();
      //await _doctorrUploadReportController.getdoctorrpatientApi();
    }

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
                keyboardType: TextInputType.number,
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

            // SizedBox(
            //   height: size.height * 0.01,
            // ),

            ///TODO: fees.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     keyboardType: TextInputType.number,
            //     autofillHints: [AutofillHints.telephoneNumber],
            //     controller: _driver_1111_controller.paidamountcontroller,
            //     onSaved: (value) {
            //       _driver_1111_controller.Paidamount = value!;
            //     },
            //     validator: (value) {
            //       return _driver_1111_controller.validFees(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Enter Charge per KM',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.currency_rupee,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

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
              height: size.height * 0.01,
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

            SizedBox(
              height: size.height * 0.01,
            ),

            ///todo : franchise Id...............
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<Vendor>(
                      value: _driver_1111_controller.selectedFranchiseId.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.currency_franc,
                          color: Colors.black,
                          size: 20,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Franchise'),
                      items: _driver_1111_controller.franchiseid
                          .map((Vendor franchiseid) {
                        return DropdownMenuItem(
                          value: franchiseid,
                          child: SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.61,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${franchiseid.companyName.toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      // validator: (value) =>
                      // value == null ? '          field required' : null,
                      onChanged: (Vendor? newValue) {
                        _driver_1111_controller.selectedFranchiseId.value =
                            newValue!;
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
                  child: GestureDetector(
                    onTap: handleImageSelection1,
                    child: Obx(
                      () => _driver_1111_controller.selectedPath.value != ''
                          ? Image.file(
                              File(_driver_1111_controller.selectedPath.value))
                          : Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            // ///SizedBox(
            //   height: 20,
            // ),
            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),

            ///Todo: dlnumber.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.nickname],
                controller: _driver_1111_controller.dlnumbercontroller,
                onSaved: (value) {
                  _driver_1111_controller.DlNumber = value!;
                },
                validator: (value) {
                  return _driver_1111_controller.validAddress(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Dl number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.numbers,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            // SizedBox(
            //   height: size.height * 0.02,
            // ),

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
                  child: GestureDetector(
                    onTap: handleImageSelection2,
                    child: Obx(
                      () => _driver_1111_controller.selectedPath1.value != ''
                          ? Image.file(
                              File(_driver_1111_controller.selectedPath1.value))
                          : Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
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
                  child: GestureDetector(
                    onTap: handleImageSelection3,
                    child: Obx(
                      () => _driver_1111_controller.selectedPath2.value != ''
                          ? Image.file(
                              File(_driver_1111_controller.selectedPath2.value))
                          : Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
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
                  child: GestureDetector(
                    onTap: handleImageSelection4,
                    child: Obx(
                      () => _driver_1111_controller.selectedPath3.value != ''
                          ? Image.file(
                              File(_driver_1111_controller.selectedPath3.value))
                          : Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
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
                  child: GestureDetector(
                    onTap: handleImageSelection5,
                    child: Obx(
                      () => _driver_1111_controller.selectedPath4.value != ''
                          ? Image.file(
                              File(_driver_1111_controller.selectedPath4.value))
                          : Center(
                              child: Icon(Icons.camera_enhance_rounded),
                            ),
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
                press: () async {
                  _driver_1111_controller.checkDriver1111();

                  await Future.delayed(Duration(seconds: 3));

                  ///Clear dropdown value
                  _driver_1111_controller.selectedState.value = null;
                  _driver_1111_controller.selectedFranchiseId.value = null;

                  // _driver_1111_controller.selectedimg4.close();

                  _driver_1111_controller.selectedPath.close();
                  _driver_1111_controller.selectedPath1.close();
                  _driver_1111_controller.selectedPath2.close();
                  _driver_1111_controller.selectedPath3.close();
                  _driver_1111_controller.selectedPath4.close();

                  //resetSelection();
                  optionsController2.resetSelection1();
                  optionsController2.resetSelection2();
                  optionsController2.resetSelection3();
                  optionsController2.resetSelection4();
                  optionsController2.resetSelection5();

                  //_driver_1111_controller.driverSignupApi();
                  // Get.to(DriverHomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }

  final OptionsController2 optionsController2 = Get.put(OptionsController2());

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

// Define a controller class to manage the state
class OptionsController2 extends GetxController {
  RxBool isOptionSelected1 = false.obs;
  RxBool isOptionSelected2 = false.obs;
  RxBool isOptionSelected3 = false.obs;
  RxBool isOptionSelected4 = false.obs;
  RxBool isOptionSelected5 = false.obs;

  void resetSelection1() {
    isOptionSelected1.value = false;
  }

  Future<void> selectOption1() async {
    isOptionSelected1.value = true;
  }

  ///2

  void resetSelection2() {
    isOptionSelected2.value = false;
  }

  Future<void> selectOption2() async {
    isOptionSelected2.value = true;
  }

  ///3
  void resetSelection3() {
    isOptionSelected3.value = false;
  }

  Future<void> selectOption3() async {
    isOptionSelected3.value = true;
  }

  ///4
  void resetSelection4() {
    isOptionSelected4.value = false;
  }

  Future<void> selectOption4() async {
    isOptionSelected4.value = true;
  }

  ///5
  void resetSelection5() {
    isOptionSelected5.value = false;
  }

  Future<void> selectOption5() async {
    isOptionSelected5.value = true;
  }
}
