import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
import '../../../../controllers/2_franchises_controller/franchies_profile_controller/franchieses_profile_controller.dart';
import '../../../../controllers/6_chemist_view_controllers/chemist_profile_controller/chemist_profile_controller.dart';

class franchiesEditProfileCredentials extends StatelessWidget {
  franchiesEditProfileCredentials({Key? key}) : super(key: key);

  FranchisesEditProfileController _franchisesProfileController = Get.put(FranchisesEditProfileController());
  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _franchisesProfileController.franchisesprofileformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///todo:  name..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _franchisesProfileController.CompanyName,
                onSaved: (value) {
                  _franchisesProfileController.mobile = value!;
                },
                validator: (value) {
                  return _franchisesProfileController.validPhone(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Company Name',
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
            SizedBox(
              height: size.height * 0.02,
            ),
            ///Todo: state............................
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value: _franchisesProfileController.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select State'),
                      items: _franchisesProfileController.states.map((StateModel items) {
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
                      validator: (value) => value == null ? '  field required' : null,
                      onChanged: (StateModel? newValue) {
                        _franchisesProfileController.selectedState.value = newValue!;

                      }
                      ),
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
                      value: _franchisesProfileController.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Selected City'),
                      items: _franchisesProfileController.cities.map((City items) {
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
                      validator: (value) => value == null ? '  field required' : null,
                      onChanged: (City? newValue) {
                        _franchisesProfileController.selectedCity.value = newValue!;
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
                controller: _franchisesProfileController.Location,
                onSaved: (value) {
                  _franchisesProfileController.location = value!;
                },
                validator: (value) {
                  return _franchisesProfileController.validLocation(value!);
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
            ///Todo: gst no..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _franchisesProfileController.GSTNumber,
                onSaved: (value) {
                  _franchisesProfileController.gst = value!;
                },
                validator: (value) {
                  return _franchisesProfileController.validgst(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'GST NO',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.switch_account,
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
            ///TODO: MobileNumber.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //autofillHints: [AutofillHin],
                controller: _franchisesProfileController.MobileNumber,
                onSaved: (value) {
                  _franchisesProfileController.panaadhar = value!;
                },
                validator: (value) {
                  return _franchisesProfileController.validpanaadhar(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Mobile no',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.local_police,
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
            ///ToDo: AadharOrPANNumber..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _franchisesProfileController.AadharOrPANNumber,
                onSaved: (value) {
                  _franchisesProfileController.panaadhar = value!;
                },
                validator: (value) {
                  return _franchisesProfileController.validpanaadhar(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Aadhar or Pan no.',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.local_police,
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
            GetBuilder<ChemistProfileController>(
              init: ChemistProfileController(), // intialize with the Controller
              builder: (value) => InkWell(
                onTap: () {
                  _franchisesProfileController.getImage(ImageSource.gallery);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Aadhaar Pan Image',
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
                        child: Obx(()=> _franchisesProfileController.selectedImagepath.value=='' ?
                        const Center(
                            child: Text("No Image")) :
                        Image.file(File(_franchisesProfileController.selectedImagepath.value),
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
              height: size.height * 0.018,
              //appPadding / 2,
            ),
            RectangularButton(
                text: 'UPDATE',
                press: () {
                _franchisesProfileController.checkProfilee();
                })
          ],
        ),
      ),
    );
  }
}
