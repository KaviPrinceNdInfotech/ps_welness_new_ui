import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/image_option_controller.dart';
import 'package:ps_welness_new_ui/controllers/franchies_controller/franchies1_controllers.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class Franchies2Credentials extends StatelessWidget {
  Franchies2Credentials({Key? key}) : super(key: key);

  Franchies_1_Controller _franchies_1_controller =
      Get.put(Franchies_1_Controller());
  final OptionsControllerfr optionsControllerfr2 =
      Get.put(OptionsControllerfr());

  final OptionsControllerfr optionsControllerfr =
      Get.put(OptionsControllerfr());
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  get newvalue => null!;

  ///todo: Function to handle image selection
  ///1
  Future<void> handleImageSelection1() async {
    optionsImage();
    await optionsControllerfr.selectOption1();
    //await _doctorrUploadReportController.getdoctorrpatientApi();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Todo: state............................
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<StateModel>(
                        value: _franchies_1_controller.selectedState.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.real_estate_agent,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select State'),
                        items: _franchies_1_controller.states
                            .map((StateModel items) {
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
                        onChanged: (StateModel? newValue) {
                          _franchies_1_controller.selectedState.value =
                              newValue!;
                          _franchies_1_controller.selectedCity.value = null;
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
                        value: _franchies_1_controller.selectedCity.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Selected City'),
                        items: _franchies_1_controller.cities.map((City items) {
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
                        onChanged: (City? newValue) {
                          _franchies_1_controller.selectedCity.value =
                              newValue!;
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),

              ///todo: address..........
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _franchies_1_controller.Location,
                  onSaved: (value) {
                    _franchies_1_controller.address = value!;
                  },
                  validator: (value) {
                    return _franchies_1_controller.validAddress(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Enter your address',
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

              ///TODO: Pin.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _franchies_1_controller.PinCode,
                  onSaved: (value) {
                    _franchies_1_controller.pin = value!;
                  },
                  validator: (value) {
                    return _franchies_1_controller.validPin(value!);
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
                height: size.height * 0.02,
              ),

              ///TODO: Gst.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  //keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _franchies_1_controller.GSTNumber,
                  onSaved: (value) {
                    _franchies_1_controller.gst = value!;
                  },
                  validator: (value) {
                    return _franchies_1_controller.validGst(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Gst number',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.currency_exchange,
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

              ///TODO: Pan card..number.....................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _franchies_1_controller.PanNumber,
                  onSaved: (value) {
                    _franchies_1_controller.pan = value!;
                  },
                  validator: (value) {
                    return _franchies_1_controller.validPan(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Pan Number',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.credit_card_outlined,
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

              ///TODO: Aadhaar card.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.password],
                  controller: _franchies_1_controller.AadharOrPANNumber,
                  onSaved: (value) {
                    _franchies_1_controller.aadhaar = value!;
                  },
                  validator: (value) {
                    return _franchies_1_controller.validAadhar(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Aadhaar Number',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.credit_card_outlined,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

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
                  // Container(
                  //   height: size.height * 0.1,
                  //   width: size.width * 0.3,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: Colors.cyanAccent, width: 2),
                  //   ),
                  //   child: Obx(
                  //     () => _franchies_1_controller.selectedPath.value != ''
                  //         ? Image.file(
                  //             File(_franchies_1_controller.selectedPath.value))
                  //         : InkWell(
                  //             onTap: (() {
                  //               handleImageSelection1;
                  //               optionsImage();
                  //             }),
                  //             child: Center(
                  //               child: Icon(Icons.camera_enhance_rounded),
                  //             ),
                  //           ),
                  //   ),
                  // ),

                  ///
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
                        () => _franchies_1_controller.selectedPath.value != ''
                            ? Image.file(File(
                                _franchies_1_controller.selectedPath.value))
                            : Center(
                                child: Icon(Icons.camera_enhance_rounded),
                              ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.00,
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              RectangularButton(
                  text: 'SUBMIT',
                  press: () async {
                    _franchies_1_controller.checkFranchies1();

                    await Future.delayed(Duration(seconds: 4));

                    _franchies_1_controller.selectedState.value = null;

                    //_franchies_1_controller.selectedPath.close();
                    //_franchies_1_controller.selectedimg.close();

                    _franchies_1_controller.MobileNumber.clear();
                    _franchies_1_controller.EmailId.clear();
                    _franchies_1_controller.VendorName.clear();
                    _franchies_1_controller.CompanyName.clear();
                    _franchies_1_controller.Password.clear();
                    _franchies_1_controller.GSTNumber.clear();
                    _franchies_1_controller.PanNumber.clear();
                    _franchies_1_controller.PinCode.clear();
                    _franchies_1_controller.AadharOrPANNumber.clear();
                    _franchies_1_controller.selectedPath.value == null;

                    await optionsControllerfr.resetSelection1();
                    _franchies_1_controller.selectedPath.close();

                    optionsControllerfr.onInit();
                    optionsControllerfr.update();

                    //_franchies_1_controller.getclearImage();
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
                _franchies_1_controller.getImage(ImageSource.camera);
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
                _franchies_1_controller.getImage(ImageSource.gallery);
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

// class OptionsControllerfr2 extends GetxController {
//   RxBool isOptionSelected1 = false.obs;
//   RxBool isOptionSelected2 = false.obs;
//   RxBool isOptionSelected3 = false.obs;
//   RxBool isOptionSelected4 = false.obs;
//   RxBool isOptionSelected5 = false.obs;
//
//   void resetSelection1() {
//     isOptionSelected1.value = false;
//   }
//
//   Future<void> selectOption1() async {
//     isOptionSelected1.value = true;
//   }
//
//   ///2
//
//   void resetSelection2() {
//     isOptionSelected2.value = false;
//   }
//
//   Future<void> selectOption2() async {
//     isOptionSelected2.value = true;
//   }
//
//   ///3
//   void resetSelection3() {
//     isOptionSelected3.value = false;
//   }
//
//   Future<void> selectOption3() async {
//     isOptionSelected3.value = true;
//   }
//
//   ///4
//   void resetSelection4() {
//     isOptionSelected4.value = false;
//   }
//
//   Future<void> selectOption4() async {
//     isOptionSelected4.value = true;
//   }
//
//   ///5
//   void resetSelection5() {
//     isOptionSelected5.value = false;
//   }
//
//   Future<void> selectOption5() async {
//     isOptionSelected5.value = true;
//   }
// }
