import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_doctor_controllers/doctor_controller1.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../../../model/1_user_model/get_department_list_model/department_model.dart';
import '../../../../../../model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';

class FrDoctor2Credentials extends StatelessWidget {
  FrDoctor2Credentials({Key? key}) : super(key: key);

  FrDoctor_1_Controller _frdoctor_1_controller =
      Get.put(FrDoctor_1_Controller());

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
        key: _frdoctor_1_controller.frdoctor2formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///todo: phone number..........
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _frdoctor_1_controller.mobileNumberController,
                  onSaved: (value) {
                    _frdoctor_1_controller.mobile = value!;
                  },
                  validator: (value) {
                    return _frdoctor_1_controller.validPhone(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Landline Phone number',
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
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _frdoctor_1_controller.clinicNameController,
                  onSaved: (value) {
                    _frdoctor_1_controller.clinic_name = value!;
                  },
                  validator: (value) {
                    return _frdoctor_1_controller.validClinicname(value!);
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
                      Icons.home_work,
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
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _frdoctor_1_controller.FeesController,
                  onSaved: (value) {
                    _frdoctor_1_controller.Fees = value!;
                  },
                  validator: (value) {
                    return _frdoctor_1_controller.validfeess(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Fees',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.currency_rupee,
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
                        value: _frdoctor_1_controller.selectedState.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.real_estate_agent,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select State'),
                        items: _frdoctor_1_controller.states
                            .map((StateModel items) {
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
                          _frdoctor_1_controller.selectedState.value =
                              newValue!;
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
                        value: _frdoctor_1_controller.selectedCity.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: const Text('Selected City'),
                        items: _frdoctor_1_controller.cities.map((City items) {
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
                          _frdoctor_1_controller.selectedCity.value = newValue!;
                        }),
                  ),
                ),
              ),

              ///Todo: department............................
              SizedBox(
                height: size.height * 0.01,
              ),

              // Text(
              //   'Choose Department',
              //   style: TextStyle(
              //     fontSize: size.height * 0.016,
              //     fontWeight: FontWeight.bold,
              //     color: MyTheme.blueww,
              //   ),
              // ),

              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<DepartmentModel>(
                        value: _frdoctor_1_controller.selectedDepartment.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.space_dashboard_outlined,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: const Text('Select Department'),
                        items: _frdoctor_1_controller.department
                            .map((DepartmentModel department) {
                          return DropdownMenuItem(
                            value: department,
                            child: Text(
                              department.departmentName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.013,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (DepartmentModel? newValue) {
                          _frdoctor_1_controller.selectedDepartment.value =
                              newValue!;
                          _frdoctor_1_controller.selectedSpecialist.value =
                              null;
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

              ///Todo: speacilist.....................................

              SizedBox(
                height: size.height * 0.02,
              ),

              // Text(
              //   'Choose Specialist',
              //   style: TextStyle(
              //     fontSize: size.height * 0.016,
              //     fontWeight: FontWeight.bold,
              //     color: MyTheme.blueww,
              //   ),
              // ),

              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<SpecialistModel>(
                        //icon: Icon(Icons.location_city),
                        value: _frdoctor_1_controller.selectedSpecialist.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.folder_special,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: const Text(' Choose Specialist'),
                        items: _frdoctor_1_controller.specialist
                            .map((SpecialistModel specialist) {
                          return DropdownMenuItem(
                            value: specialist,
                            child: Text(
                              specialist.specialistName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.015,
                              ),
                            ),
                          );
                        }).toList(),
                        onTap: () {
                          _frdoctor_1_controller.refresh();
                        },
                        onChanged: (SpecialistModel? newValue) {
                          _frdoctor_1_controller.selectedSpecialist.value =
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
                height: size.height * 0.018,
                //appPadding / 2,
              ),
              RectangularButton(
                  text: 'GO NEXT>',
                  press: () {
                    _frdoctor_1_controller.checkDoctor2();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
