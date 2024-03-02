import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/drawer_page_franchies_controller/franchies_profile_franchies.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesProfileDetail_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/modules_view/2_franchies_section_view/franchies_home/franchises_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class FranchiesProfileCredentials extends StatelessWidget {
  FranchiesProfileCredentials({Key? key}) : super(key: key);
  FrenchiesProfileDetailController _frenchiesProfileDetailController =
      Get.put(FrenchiesProfileDetailController());

  DraweerFranchiesProfileController _draweerFranchiesProfileController =
      Get.put(DraweerFranchiesProfileController());

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
      key: _draweerFranchiesProfileController.drawerfranchiesprofileformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),

            ///TODO: Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _draweerFranchiesProfileController.VendorName,
                onSaved: (value) {
                  _draweerFranchiesProfileController.vendornamerr = value!;
                },
                validator: (value) {
                  return _draweerFranchiesProfileController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Vendor Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_circle,
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

            ///TODO: email.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _draweerFranchiesProfileController.EmailId,
                onSaved: (value) {
                  _draweerFranchiesProfileController.emailId = value!;
                },
                validator: (value) {
                  return _draweerFranchiesProfileController.validEmail(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'EmailId',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
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

            ///todo: phone number..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _draweerFranchiesProfileController.MobileNumber,
                onSaved: (value) {
                  _draweerFranchiesProfileController.mobile = value!;
                },
                validator: (value) {
                  return _draweerFranchiesProfileController.validPhone(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Phone No',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
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

            ///TODO:clinic  Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _draweerFranchiesProfileController.CompanyName,
                onSaved: (value) {
                  _draweerFranchiesProfileController.name = value!;
                },
                validator: (value) {
                  return _draweerFranchiesProfileController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Clinic Name',
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

            ///Todo: state............................
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value: _draweerFranchiesProfileController
                          .selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text(
                          "${_frenchiesProfileDetailController.getfrenchiesProfileDetailModel?.stateName.toString()}"),
                      items: _draweerFranchiesProfileController.states
                          ?.map((StateModel items) {
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
                        _draweerFranchiesProfileController.selectedState.value =
                            newValue!;
                        _draweerFranchiesProfileController.selectedCityy.value =
                            null;
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
                      value: _draweerFranchiesProfileController
                          .selectedCityy.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text(
                          "${_frenchiesProfileDetailController.getfrenchiesProfileDetailModel?.cityname.toString()}"),
                      items: _draweerFranchiesProfileController.cities
                          .map((City city) {
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
                        _draweerFranchiesProfileController.refresh();
                      },
                      onChanged: (City? newValue) {
                        _draweerFranchiesProfileController.selectedCityy.value =
                            newValue!;
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
                controller: _draweerFranchiesProfileController.Location,
                onSaved: (value) {
                  _draweerFranchiesProfileController.location = value!;
                },
                validator: (value) {
                  return _draweerFranchiesProfileController
                      .validLocation(value!);
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

            ///TODO: Pin.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.password],
                controller: _draweerFranchiesProfileController.PinCode,
                onSaved: (value) {
                  _draweerFranchiesProfileController.pin = value!;
                },
                validator: (value) {
                  return _draweerFranchiesProfileController.validPin(value!);
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
              height: size.height * 0.018,
            ),
            SizedBox(
              height: size.height * 0.00,
            ),

            RectangularButton(
                text: 'UPDATE',
                press: () async {
                  _draweerFranchiesProfileController
                      .checkFrenchiesEditProfilee();

                  await _frenchiesProfileDetailController
                      .frenchiesProfileDetailApi();
                  _frenchiesProfileDetailController.onInit();
                  _draweerFranchiesProfileController.clearSelectedState();
                  // _draweerFranchiesProfileController.states?.clear();
                  await Future.delayed(Duration(seconds: 0));
                  await Get.offAll(FranchiesHomePage());
                })
          ],
        ),
      ),
    );
  }
}
