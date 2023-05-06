import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness_new_ui/controllers/5_rwa_controller/rwa_signup_controller.dart';
import 'package:ps_welness_new_ui/controllers/hospital2_controller/hospital2_sighup_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/5_rwa_controller_RRR/rwa_signup_controller.dart';

class Rwa2Credentials extends StatelessWidget {
  Rwa2Credentials({Key? key}) : super(key: key);

  RWASignupController _rwaSignupController = Get.put(RWASignupController());

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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  //height: size.height * 0.02,
                  ),

              ///todo: address .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _rwaSignupController.Location,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.location_history_outlined,
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
                        value: _rwaSignupController.selectedState.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.real_estate_agent,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select State'),
                        items:
                            _rwaSignupController.states.map((StateModel model) {
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
                          _rwaSignupController.selectedState.value = newValue!;
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
                        value: _rwaSignupController.selectedCity.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: const Text('Selected City'),
                        items: _rwaSignupController.cities.map((City city) {
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
                          _rwaSignupController.selectedCity.value = newValue!;
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.018,
                //appPadding / 2,
              ),
              GetBuilder<Hospital_2_Controller>(
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    // _rwaSignupController.getImage(ImageSource.gallery);
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
              SizedBox(
                height: size.height * 0.02,
              ),

              ///TODO: certificate.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _rwaSignupController.CertificateImage,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Certificate Image',
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

              ///TODO: Pin.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.password],
                  controller: _rwaSignupController.Pincode,
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
                    _rwaSignupController.rwaSignupApi();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
