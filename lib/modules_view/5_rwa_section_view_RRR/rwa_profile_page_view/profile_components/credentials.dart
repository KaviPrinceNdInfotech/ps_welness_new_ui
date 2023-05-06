import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/6_chemist_view_controllers/chemist_profile_controller/chemist_profile_controller.dart';
//import 'package:ps_welness_new_ui/controllers/5_rwa_controller/rwa_profile/rwa_profile_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/5_rwa_controller_RRR/rwa_profile/rwa_profile_controller.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/5_rwa_controller/rwa_profile/rwa_profile_controller.dart';
// import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
// //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

//import '../../../../controllers/6_chemist_view_controllers/chemist_profile_controller/chemist_profile_controller.dart';

class RwaProfileCredentials extends StatelessWidget {
  RwaProfileCredentials({Key? key}) : super(key: key);

  RwaProfileController _rwaProfileController = Get.put(RwaProfileController());

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
    return Form(
      key: _rwaProfileController.rwaprofileformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ///Todo: email.....................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.email],
            //     controller: _profileController.emailController,
            //     onSaved: (value) {
            //       _profileController.email = value!;
            //     },
            //     validator: (value) {
            //       return _profileController.validEmail(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Email',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.email,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            ///todo:  name..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _rwaProfileController.nameController,
                onSaved: (value) {
                  _rwaProfileController.mobile = value!;
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Name',
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
            /// todo Landline number..................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _rwaProfileController.LandlineNumber,
                validator: (value) {
                  return _rwaProfileController.validPhone(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Landline number',
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
            ///Todo: state............................
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value: _rwaProfileController.selectedState.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select State'),
                      items: _rwaProfileController.states.map((StateModel model) {
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
                        _rwaProfileController.selectedState.value = newValue!;
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
                      value: _rwaProfileController.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Selected City'),
                      items: _rwaProfileController.cities.map((City city) {
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
                        _rwaProfileController.selectedCity.value = newValue!;
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
                controller: _rwaProfileController.locatoionController,
                onSaved: (value) {
                  _rwaProfileController.location = value!;
                },
                validator: (value) {
                  return _rwaProfileController.validLocation(value!);
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
            SizedBox(
              height: size.height * 0.01,
              //appPadding / 2,
            ),
            GetBuilder<ChemistProfileController>(
              // specify type as Controller
              init: ChemistProfileController(), // intialize with the Controller
              builder: (value) => InkWell(
                onTap: () {
                  _rwaProfileController.getImage(ImageSource.gallery);
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
              height: size.height * 0.036,
            ),
            RectangularButton(
                text: 'UPDATE',
                press: () {
                 _rwaProfileController.checkRWAProfilee();
                })
          ],
        ),
      ),
    );
  }
}
