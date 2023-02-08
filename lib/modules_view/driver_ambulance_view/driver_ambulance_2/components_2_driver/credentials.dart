import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/driver_controller/driver_controller_2.dart';
import 'package:ps_welness_new_ui/controllers/hospital2_controller/hospital2_sighup_controller.dart';
import 'package:ps_welness_new_ui/modules_view/3_driver_section_view/driver_home/driver_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/driver_controller/driver_controller_2.dart';
// import 'package:ps_welness/controllers/hospital2_controller/hospital2_sighup_controller.dart';
// import 'package:ps_welness/modules_view/3_driver_section_view/driver_home/driver_home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class Driver2Credentials extends StatelessWidget {
  Driver2Credentials({Key? key}) : super(key: key);

  Driver_2_Controller _driver_2_controller = Get.put(Driver_2_Controller());

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
    return SafeArea(
      child: Form(
        key: _driver_2_controller.driver2formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  //height: size.height * 0.02,
                  ),

              ///todo: phone number..........
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _driver_2_controller.addressController,
                  onSaved: (value) {
                    _driver_2_controller.address = value!;
                  },
                  validator: (value) {
                    return _driver_2_controller.validAddress(value!);
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
                    () => DropdownButtonFormField(
                        value: _driver_2_controller.selectedState.value,
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
                          _driver_2_controller.selectedState.value = newValue!;
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
                        value: _driver_2_controller.selectedCity.value,
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
                          _driver_2_controller.selectedCity.value = newValue!;
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

              GetBuilder<Hospital_2_Controller>(
                // specify type as Controller
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _driver_2_controller.getImage(ImageSource.gallery);
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
                              'DL Image 1',
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

              ///image picker....2......

              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),

              GetBuilder<Hospital_2_Controller>(
                // specify type as Controller
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _driver_2_controller.getImage(ImageSource.gallery);
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
                              'DL Image 2',
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

              ///image picker....3......

              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),

              GetBuilder<Hospital_2_Controller>(
                // specify type as Controller
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _driver_2_controller.getImage(ImageSource.gallery);
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
                              'Aadhaar Image 1',
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

              ///image picker....4......

              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),

              GetBuilder<Hospital_2_Controller>(
                // specify type as Controller
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _driver_2_controller.getImage(ImageSource.gallery);
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
                              'Aadhaar Image 2',
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

              SizedBox(
                height: size.height * 0.02,
              ),

              ///TODO: Pin.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.password],
                  controller: _driver_2_controller.pinController,
                  onSaved: (value) {
                    _driver_2_controller.pin = value!;
                  },
                  validator: (value) {
                    return _driver_2_controller.validPin(value!);
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

              RectangularButton(
                  text: 'SUBMIT',
                  press: () {
                    Get.to(DriverHomePage());
                    //_loginpasswordController.checkLoginpassword();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
