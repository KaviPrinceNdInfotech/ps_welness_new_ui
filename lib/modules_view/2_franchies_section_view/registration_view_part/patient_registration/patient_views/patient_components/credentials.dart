import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../../../controllers/2_franchises_controller/registration_part_controller/patient_user_controller/patient_user_controllerss.dart';

class PatientCredentials extends StatelessWidget {
  PatientCredentials({Key? key}) : super(key: key);
  Patients_Controller _patient_controller = Get.put(Patients_Controller());
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
      key: _patient_controller.patientformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TODO: Name.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.name],
                controller: _patient_controller.nameController,
                onSaved: (value) {
                  _patient_controller.name = value!;
                },
                validator: (value) {
                  return _patient_controller.validName(value!);
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
                    Icons.person_outline_sharp,
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

            ///TODO: phone.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.number,
                autofillHints: [AutofillHints.name],
                controller: _patient_controller.mobileController,
                onSaved: (value) {
                  _patient_controller.mobile = value!;
                },
                validator: (value) {
                  return _patient_controller.validPhone(value!);
                },
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

            ///Todo: email.....................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.email],
                controller: _patient_controller.emailController,
                onSaved: (value) {
                  _patient_controller.email = value!;
                },
                validator: (value) {
                  return _patient_controller.validEmail(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Email',
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

            ///gender...
            Container(
              height: size.height * 0.066,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 25 / 2),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        lightPrimary,
                        darkPrimary,
                      ]),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-2, -2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: darkShadow,
                    ),
                    BoxShadow(
                      offset: Offset(2, 2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      color: lightShadow,
                    ),
                  ]),
              child: SizedBox(
                //width: size.width * 0.40,
                child: Container(
                  //width: size.width * 40,
                  height: size.height * 0.065,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Radio(
                            visualDensity: VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            // title: Text("Male"),
                            value: "Male",
                            groupValue:
                                _patient_controller.selectedgender.value,
                            onChanged: (value) {
                              _patient_controller.onChangeGender(value!);
                              // setState(() {
                              //   gender = value.toString();
                              // });
                            },
                          ),
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Obx(
                          () => Radio(
                            visualDensity: VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            // title: Text("Male"),
                            value: "Female",
                            groupValue:
                                _patient_controller.selectedgender.value,
                            onChanged: (value) {
                              _patient_controller.onChangeGender(value!);
                              // setState(() {
                              //   gender = value.toString();
                              // });
                            },
                          ),
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///date..
            SizedBox(
              height: size.height * 0.075,
              width: size.width,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 30 / 7),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          lightPrimary,
                          darkPrimary,
                        ]),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(-1, -1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        color: Colors.white,
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        spreadRadius: 1,
                        blurRadius: 0,
                        color: Colors.grey,
                      ),
                    ]),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  // decoration: InputDecoration(
                  //   hintText: 'Enter Something',
                  //   contentPadding: EdgeInsets.all(20.0),
                  // ),
                  controller: _patient_controller.appointmentController,
                  onTap: () {
                    _patient_controller.chooseDate();
                  },

                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(17.0),
                    hintText: 'Select DOB',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  autofocus: true,
                  //obscureText: true,
                  //controller: _loginpasswordController.mobileController,
                ),
              ),
              // ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 32,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: PhysicalModel(
              //           color: MyTheme.white,
              //           borderRadius: BorderRadius.circular(5),
              //           elevation: 20,
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: size.width * 0.01,
              //                 vertical: size.height * 0.004),
              //             child: Container(
              //               //height: size.height * 0.025,
              //               width: size.width * 0.17,
              //               decoration: BoxDecoration(
              //                 color: MyTheme.ThemeColors,
              //                 borderRadius: BorderRadius.circular(5),
              //               ),
              //               child: Column(
              //                 mainAxisAlignment:
              //                     MainAxisAlignment.center,
              //                 children: [
              //                   Text(
              //                     'MAR',
              //                     style: TextStyle(
              //                       fontSize: size.height * 0.015,
              //                       fontWeight: FontWeight.w600,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: size.height * 0.01,
              //                   ),
              //                   Text(
              //                     '${index}',
              //                     style: TextStyle(
              //                       fontSize: size.height * 0.016,
              //                       fontWeight: FontWeight.w600,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///Todo: password..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _patient_controller.passwordController,
                onSaved: (value) {
                  _patient_controller.password = value!;
                },
                validator: (value) {
                  return _patient_controller.validPassword(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Password',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
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

            ///Todo: confirm password...........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _patient_controller.confirmpasswordController,
                onSaved: (value) {
                  _patient_controller.confirmpassword = value!;
                },
                validator: (value) {
                  return _patient_controller.validConfirmPassword(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.phonelink_lock,
                    color: black.withOpacity(0.7),
                    size: 20,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.visiblePassword,
                //obscureText: true,
                //controller: _loginpasswordController.mobileController,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: address value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _patient_controller.addressController,
                onSaved: (value) {
                  _patient_controller.address = value!;
                },
                validator: (value) {
                  return _patient_controller.validAddress(value!);
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
              height: size.height * 0.02,
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<StateModel>(
                      value: _patient_controller.selectedState.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.real_estate_agent,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select State'),
                      items: _patient_controller.states.map((StateModel items) {
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
                      validator: (value) =>
                          value == null ? 'field required' : null,
                      onChanged: (StateModel? newValue) {
                        _patient_controller.selectedState.value = newValue!;
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
                      value: _patient_controller.selectedCity.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Selected City'),
                      items: _patient_controller.cities.map((City items) {
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
                      validator: (value) =>
                          value == null ? 'field required' : null,
                      onChanged: (City? newValue) {
                        _patient_controller.selectedCity.value = newValue!;
                      }),
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
                controller: _patient_controller.pinController,
                onSaved: (value) {
                  _patient_controller.pin = value!;
                },
                validator: (value) {
                  return _patient_controller.validPin(value!);
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
            SizedBox(
              height: size.height * 0.018,
            ),
            SizedBox(
              height: size.height * 0.00,
            ),
            RectangularButton(
                text: 'Submit',
                press: () {
                  _patient_controller.checkpatient();
                })
          ],
        ),
      ),
    );
  }
}
