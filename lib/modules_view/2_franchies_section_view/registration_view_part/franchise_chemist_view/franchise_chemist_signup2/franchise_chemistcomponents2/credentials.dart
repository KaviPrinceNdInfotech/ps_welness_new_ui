import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/franchise_chemist_regis_controller/chemist1_fr_controller/fr_chemist_controller.dart';
import 'package:ps_welness_new_ui/controllers/hospital2_controller/hospital2_sighup_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';


class FranchiesChemist2Credentials extends StatelessWidget {
  FranchiesChemist2Credentials({Key? key}) : super(key: key);

  Fr_Chemist_1_Controller _fr_chemist_1_controller = Get.put(Fr_Chemist_1_Controller());

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
       // key: _fr_chemist_2_controller.frchemist2formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///todo: address .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _fr_chemist_1_controller.addressController,
                  onSaved: (value) {
                    _fr_chemist_1_controller.address = value!;
                  },
                  validator: (value) {
                    return _fr_chemist_1_controller.validAddress(value!);
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
                        value: _fr_chemist_1_controller.selectedState.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.real_estate_agent,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select State'),
                        items: _fr_chemist_1_controller.states.map((StateModel items) {
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
                          _fr_chemist_1_controller.selectedState.value = newValue!;
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
                        value: _fr_chemist_1_controller.selectedCity.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Selected City'),
                        items: _fr_chemist_1_controller.cities.map((City items) {
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
                          _fr_chemist_1_controller.selectedCity.value = newValue!;
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              GetBuilder<Hospital_2_Controller>(
                init: Hospital_2_Controller(),
                builder: (value) => InkWell(
                  onTap: () {
                    _fr_chemist_1_controller.getImage(ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Certificate Image ',
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 70,width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:  Border.all(color: Colors.blue, width: 1.0),
                            borderRadius:BorderRadius.circular(5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Obx(()=> _fr_chemist_1_controller.selectedImagepath.value=='' ?
                          const Center(
                              child: Text("No Image")) :
                          Image.file(File(_fr_chemist_1_controller.selectedImagepath.value),
                            fit: BoxFit.cover,
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              ///TODO: licence no.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.name],
                  controller: _fr_chemist_1_controller.licencenumberController,
                  onSaved: (value) {
                    _fr_chemist_1_controller.licenceno = value!;
                  },
                  validator: (value) {
                    return _fr_chemist_1_controller.validLicenceno(value!);
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
              ///TODO: licence validation.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.creditCardNumber],
                  controller:
                      _fr_chemist_1_controller.licencevalidityController,
                  onSaved: (value) {
                    _fr_chemist_1_controller.licencevalidity = value!;
                  },
                  validator: (value) {
                    return _fr_chemist_1_controller
                        .validLicencevalidity(value!);
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
                      Icons.videogame_asset_sharp,
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
              ///TODO: Pin.......................................................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.password],
                  controller: _fr_chemist_1_controller.pinController,
                  onSaved: (value) {
                    _fr_chemist_1_controller.pin = value!;
                  },
                  validator: (value) {
                    return _fr_chemist_1_controller.validPin(value!);
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
                    _fr_chemist_1_controller.checkChemist1();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
