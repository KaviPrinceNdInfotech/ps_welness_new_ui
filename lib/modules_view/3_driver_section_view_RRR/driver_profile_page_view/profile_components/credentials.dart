import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/user_controller/user_controller_1.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

//import '../../../../controllers/3_driver_view_controllers/driver_profile_controller/driver_profile_controller.dart';
import '../../../../controllers/3_driver_view_controllers_RRR/driver_profile_controller/driver_profile_controller.dart';

class DriverProfileCredentials extends StatelessWidget {
  DriverProfileCredentials({Key? key}) : super(key: key);
  DriverProfileController _driverProfileController =
      Get.put(DriverProfileController());
  User_1_Controller _user_1_controller = Get.put(User_1_Controller());
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
      key: _driverProfileController.driverrprofileformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///todo: Id..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.IdEditText,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Id',
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

            ///todo: Driver name..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.DriverNameEditText,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Driver name',
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

            ///todo: Phone..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.PhoneEditText,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Phone',
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

            ///todo: Vehicle name..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.VehicleNameEditText,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Vehicle name',
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

            ///todo: State..........
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value: _driverProfileController.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select State'),
                      items: _driverProfileController.states
                          .map((StateModel state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(
                            state.stateName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (StateModel? newValue) {
                        _driverProfileController.selectedState.value =
                            newValue!;
                        _driverProfileController.selectedCity.value = null;
                        // _driverProfileController.selectedState.value = newValue!;
                      }),
                ),
              ),
            ),

            ///todo: City.........
            SizedBox(
              height: size.height * 0.02,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<City>(
                      value: _driverProfileController.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Selected City'),
                      items: _driverProfileController.cities.map((City city) {
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
                        _driverProfileController.selectedCity.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: Location.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.LocationEditText,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Location',
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

            ///todo: Dl number.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.DlNumberEditText,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Dl number',
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

            ///todo: Dl image.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.DlImageEditText,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Dl image',
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

            ///todo: Dl image name.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.DlImageNameEditText,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Dl image name',
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

            ///todo: Admin login id.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.adminLogin_idEditTxt,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Adminlogin id',
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

            ///todo: Account no.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.AccountNoEditTxt,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Account no',
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

            ///todo: Ifsc code.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.IFSCCodeEditTxt,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Ifsc code',
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

            ///todo: Branch Name.........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _driverProfileController.BranchName,
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.telephoneNumber],
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Branch name',
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
            RectangularButton(
                text: 'UPDATE',
                press: () {
                  _driverProfileController.checkDriverUpdateProfile();
                })
          ],
        ),
      ),
    );
  }
}
