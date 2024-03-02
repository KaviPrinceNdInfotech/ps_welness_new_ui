import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:ps_welness_new_ui/controllers/nurses_controllers/nurses_controller2.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/nurse_location_model/nurse_location_models.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../constants/constants/constants.dart';
import '../../../../controllers/nurses_controllers_RRR_signuppp/nurses_controller2.dart';
import '../../../../model/1_user_model/nurse_type_model/nurse_type_model.dart';

class Nurses2Credentials extends StatelessWidget {
  Nurses2Credentials({Key? key}) : super(key: key);

  Nurses_22_Controller _nurses_22_controller = Get.put(Nurses_22_Controller());
  // Nurses_3_controller _nurses_3_controller = Get.put(Nurses_3_controller());

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
    return SafeArea(
      child: Form(
        key: _nurses_22_controller.nurse2formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///TODO: NurseType_Id.......................
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<NurseModels>(
                        value: _nurses_22_controller.selectedNurse.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select Nurse'),
                        items: _nurses_22_controller.nurse
                            .map((NurseModels nurse) {
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
                        onTap: () {
                          _nurses_22_controller.refresh();
                        },
                        onChanged: (NurseModels? newValue) {
                          _nurses_22_controller.selectedNurse.value = newValue!;
                          // _nurseBooking1Controller.selectedCity.value = null;
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
                height: size.height * 0.0,
              ),

              /// todo State master id
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<StateModel>(
                        value: _nurses_22_controller.selectedState.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.real_estate_agent,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select State'),
                        items: _nurses_22_controller.states
                            .map((StateModel model) {
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
                          _nurses_22_controller.selectedState.value = newValue!;
                          _nurses_22_controller.selectedCity.value = null;
                        }),
                  ),
                ),
              ),

              ///Todo: city.....................................
              SizedBox(
                height: size.height * 0.0,
              ),
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<City>(
                        value: _nurses_22_controller.selectedCity.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Selected City'),
                        items: _nurses_22_controller.cities.map((City city) {
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
                          _nurses_22_controller.selectedCity.value = newValue!;
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.0,
                //appPadding / 2,
              ),

              ///location drop down..
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.00),
                  child: Obx(
                    () => DropdownButtonFormField<NurseLocationModel>(
                        value:
                            _nurses_22_controller.selectedNurseLocation.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.place,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select Locations'),
                        items: _nurses_22_controller.locations
                            .map((NurseLocationModel locations) {
                          return DropdownMenuItem(
                            value: locations,
                            child: SizedBox(
                              height: size.height * 0.06,
                              width: size.width * 0.55,
                              child: Text(
                                locations.locationName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.015,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (NurseLocationModel? newValue) {
                          _nurses_22_controller.selectedNurseLocation.value =
                              newValue!;
                        }),
                  ),
                ),
              ),

              ///TODO: Location.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _nurses_22_controller.LocationControllerdetail,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _nurses_22_controller.Location = value!;
                  },
                  validator: (value) {
                    return _nurses_22_controller.validAddress(value!);
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Address',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.web,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              ///TODO: Location.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _nurses_22_controller.experienceController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _nurses_22_controller.experience = value!;
                  },
                  validator: (value) {
                    return _nurses_22_controller.validexperince(value!);
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Experience',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.offline_pin_rounded,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              ///todo:imagess....pan

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        "Upload Pan Image:",
                        style: TextStyle(
                          fontSize: size.height * 0.017,
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      _nurses_22_controller
                          .clearImage(); // Call a method to clear the selected image
                    },
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.cyanAccent, width: 2),
                      ),
                      child: Obx(
                        () => _nurses_22_controller.selectedPath.value != ''
                            ? Image.file(
                                File(_nurses_22_controller.selectedPath.value))
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
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              ///image picker....2 nurse.........

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
                        "Upload Nurse Image:",
                        style: TextStyle(
                          fontSize: size.height * 0.017,
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      _nurses_22_controller.clearImage1();
                    },
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.cyanAccent, width: 2),
                      ),
                      child: Obx(
                        () => _nurses_22_controller.selectedPath1.value != ''
                            ? Image.file(
                                File(_nurses_22_controller.selectedPath1.value))
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
                  ),
                ],
              ),

              ///image picker....3. certificate.....

              SizedBox(
                height: size.height * 0.036,
                //appPadding / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        "Upload Certificate Image:",
                        style: TextStyle(
                          fontSize: size.height * 0.017,
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      _nurses_22_controller.clearImage2();
                    },
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.cyanAccent, width: 2),
                      ),
                      child: Obx(
                        () => _nurses_22_controller.selectedPath2.value != ''
                            ? Image.file(
                                File(_nurses_22_controller.selectedPath2.value))
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
                  ),
                ],
              ),

              ///image picker....5......

              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),
              RectangularButton(
                  text: 'Submit',
                  press: () {
                    _nurses_22_controller.checknurse2();
                    //_nurses_22_controller.onInit();
                    // _nurses_22_controller.dispose();
                  })
            ],
          ),
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
                //var ImageSource1;
                _nurses_22_controller.getImage(ImageSource.camera);
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
                _nurses_22_controller.getImage(ImageSource.gallery);
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
                _nurses_22_controller.getImage1(ImageSource.camera);
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
                _nurses_22_controller.getImage1(ImageSource.gallery);
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
                _nurses_22_controller.getImage2(ImageSource.camera);
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
                _nurses_22_controller.getImage2(ImageSource.gallery);
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
                _nurses_22_controller.getImage3(ImageSource.camera);
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
                _nurses_22_controller.getImage3(ImageSource.gallery);
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
                _nurses_22_controller.getImage4(ImageSource.camera);
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
                _nurses_22_controller.getImage4(ImageSource.gallery);
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
