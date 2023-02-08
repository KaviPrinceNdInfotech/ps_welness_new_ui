import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/hospital2_controller/hospital2_sighup_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/constants/my_theme.dart';
// import 'package:ps_welness/controllers/hospital2_controller/hospital2_sighup_controller.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../../controllers/2_franchises_controller/registration_part_controller/fr_doctor_controllers/doctor_controller3.dart';

class FrDoc3Credentials extends StatelessWidget {
  FrDoc3Credentials({Key? key}) : super(key: key);

  FrDoctor_3_Controller _frDoctor_3_controller =
      Get.put(FrDoctor_3_Controller());

  var items = [
    '10',
    '15',
    '20',
    '25',
    '30',
  ];

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: _frDoctor_3_controller.frdoc3formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///todo: Address.................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  //keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _frDoctor_3_controller.addressController,
                  onSaved: (value) {
                    _frDoctor_3_controller.address = value!;
                  },
                  validator: (value) {
                    return _frDoctor_3_controller.validAddress(value!);
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
                      Icons.place,
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
                  //height: size.height * 0.02,
                  ),

              ///file
              GetBuilder<Hospital_2_Controller>(
                // specify type as Controller
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _frDoctor_3_controller.getImage(ImageSource.gallery);
                  },
                  child: NeumorphicTextFieldContainer(
                    child: Container(
                      height: size.height * 0.06,
                      //width: size.width * 0.5,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Licence Image File',
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

              ///TODO: certificate.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _frDoctor_3_controller.certificateController,
                  onSaved: (value) {
                    _frDoctor_3_controller.certificateno = value!;
                  },
                  validator: (value) {
                    return _frDoctor_3_controller.validcertificate(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Licence no',
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
              SizedBox(
                height: size.height * 0.02,
              ),

              ///TODO: certificate. validity......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller:
                      _frDoctor_3_controller.certificatevelidityController,
                  onSaved: (value) {
                    _frDoctor_3_controller.certificatevelidity = value!;
                  },
                  validator: (value) {
                    return _frDoctor_3_controller
                        .validcertificatevalidity(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Licence validity',
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
              SizedBox(
                height: size.height * 0.02,
              ),

              ///TODO: pin code no.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.password],
                  controller: _frDoctor_3_controller.aadhaarController,
                  onSaved: (value) {
                    _frDoctor_3_controller.aadhar = value!;
                  },
                  validator: (value) {
                    return _frDoctor_3_controller.validaadhar(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Pin Code ',
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

              GetBuilder<Hospital_2_Controller>(
                // specify type as Controller
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _frDoctor_3_controller.getImage1(ImageSource.gallery);
                  },
                  child: NeumorphicTextFieldContainer(
                    child: Container(
                      height: size.height * 0.06,
                      //width: size.width * 0.5,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pan Image File',
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

              ///Todo: morning.....................................

              SizedBox(
                height: size.height * 0.02,
              ),

              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField(
                        //icon: Icon(Icons.location_city),
                        value: _frDoctor_3_controller.selectedCity.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.sunny,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Slot Timing Morning'),
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
                          _frDoctor_3_controller.selectedCity.value = newValue!;
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

              ///todo:selected date starting...
              SizedBox(
                height: size.height * 0.018,
              ),

              // Text(
              //   'Choose Starting Time:',
              //   style: TextStyle(
              //     fontSize: size.height * 0.016,
              //     fontWeight: FontWeight.bold,
              //     color: MyTheme.blueww,
              //   ),
              // ),

              NeumorphicTextFieldContainer(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      _frDoctor_3_controller.chooseTime();
                    },
                    child: Container(
                      height: size.height * 0.06,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Starting Time Morning:',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.blueww,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              //Spacer(),
                              Text(
                                "${_frDoctor_3_controller.selectedTime.value.hour}:${_frDoctor_3_controller.selectedTime.value.minute}",
                                style: TextStyle(
                                  fontSize: size.height * 0.026,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.018,
              ),

              ///todo:selected time ending...

              // Text(
              //   'Choose Ending Time:',
              //   style: TextStyle(
              //     fontSize: size.height * 0.016,
              //     fontWeight: FontWeight.bold,
              //     color: MyTheme.blueww,
              //   ),
              // ),

              NeumorphicTextFieldContainer(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      _frDoctor_3_controller.chooseTime2();
                    },
                    child: Container(
                      height: size.height * 0.06,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ending Time Morning:',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.blueww,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              //Spacer(),
                              Text(
                                "${_frDoctor_3_controller.selectedTime2.value.hour}:${_frDoctor_3_controller.selectedTime2.value.minute}",
                                style: TextStyle(
                                  fontSize: size.height * 0.026,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///Todo: evening.....................................

              SizedBox(
                height: size.height * 0.02,
              ),

              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField(
                        //icon: Icon(Icons.location_city),
                        value: _frDoctor_3_controller.selectedState.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.shield_moon_rounded,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Slot Timing Evening'),
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
                          _frDoctor_3_controller.selectedState.value =
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

              ///todo:selected date starting...
              SizedBox(
                height: size.height * 0.018,
              ),

              // Text(
              //   'Choose Starting Time:',
              //   style: TextStyle(
              //     fontSize: size.height * 0.016,
              //     fontWeight: FontWeight.bold,
              //     color: MyTheme.blueww,
              //   ),
              // ),

              NeumorphicTextFieldContainer(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      _frDoctor_3_controller.chooseTime();
                    },
                    child: Container(
                      height: size.height * 0.06,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Starting Time Evening:',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.blueww,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              //Spacer(),
                              Text(
                                "${_frDoctor_3_controller.selectedTime3.value.hour}:${_frDoctor_3_controller.selectedTime3.value.minute}",
                                style: TextStyle(
                                  fontSize: size.height * 0.026,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.018,
              ),

              ///todo:selected time ending...

              // Text(
              //   'Choose Ending Time:',
              //   style: TextStyle(
              //     fontSize: size.height * 0.016,
              //     fontWeight: FontWeight.bold,
              //     color: MyTheme.blueww,
              //   ),
              // ),

              NeumorphicTextFieldContainer(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      _frDoctor_3_controller.chooseTime2();
                    },
                    child: Container(
                      height: size.height * 0.06,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ending Time Evening:',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.blueww,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              //Spacer(),
                              Text(
                                "${_frDoctor_3_controller.selectedTime4.value.hour}:${_frDoctor_3_controller.selectedTime4.value.minute}",
                                style: TextStyle(
                                  fontSize: size.height * 0.026,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              RectangularButton(
                  text: 'SUBMIT',
                  press: () {
                    Get.to(() => FranchiesHomePage());
                    //Get.to(LabHomePage());
                    //_loginpasswordController.checkLoginpassword();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
