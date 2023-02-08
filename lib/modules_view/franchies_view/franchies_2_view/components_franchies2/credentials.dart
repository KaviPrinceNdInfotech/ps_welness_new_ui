import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/franchies_controller/franchies2_controller.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/franchies_controller/franchies2_controller.dart';
// import 'package:ps_welness/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class Franchies2Credentials extends StatelessWidget {
  Franchies2Credentials({Key? key}) : super(key: key);

  Franchies_2_Controller _franchies_2_controller =
      Get.put(Franchies_2_Controller());

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
        key: _franchies_2_controller.franchies2formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  //height: size.height * 0.02,
                  ),

              ///Todo: state............................

              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField(
                        value: _franchies_2_controller.selectedState.value,
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
                          _franchies_2_controller.selectedState.value =
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
                        value: _franchies_2_controller.selectedCity.value,
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
                          _franchies_2_controller.selectedCity.value =
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

              SizedBox(
                height: size.height * 0.01,
              ),

              ///todo: address..........
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _franchies_2_controller.addressController,
                  onSaved: (value) {
                    _franchies_2_controller.address = value!;
                  },
                  validator: (value) {
                    return _franchies_2_controller.validAddress(value!);
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
                  controller: _franchies_2_controller.pinController,
                  onSaved: (value) {
                    _franchies_2_controller.pin = value!;
                  },
                  validator: (value) {
                    return _franchies_2_controller.validPin(value!);
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
                  keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _franchies_2_controller.gstController,
                  onSaved: (value) {
                    _franchies_2_controller.gst = value!;
                  },
                  validator: (value) {
                    return _franchies_2_controller.validGst(value!);
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

              ///TODO: Pan card.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _franchies_2_controller.panController,
                  onSaved: (value) {
                    _franchies_2_controller.pan = value!;
                  },
                  validator: (value) {
                    return _franchies_2_controller.validPan(value!);
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
                  controller: _franchies_2_controller.aadhaarController,
                  onSaved: (value) {
                    _franchies_2_controller.aadhaar = value!;
                  },
                  validator: (value) {
                    return _franchies_2_controller.validAadhar(value!);
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
                height: size.height * 0.018,
                //appPadding / 2,
              ),

              RectangularButton(
                  text: 'SUBMIT',
                  press: () {
                    Get.to(FranchiesHomePage());
                    //_loginpasswordController.checkLoginpassword();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
