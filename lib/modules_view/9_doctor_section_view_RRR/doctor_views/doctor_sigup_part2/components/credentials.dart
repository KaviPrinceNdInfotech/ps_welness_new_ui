import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_controllers_RRR/doctor_controller1.dart';
import 'package:ps_welness_new_ui/model/1_user_model/city_model/city_modelss.dart';
import 'package:ps_welness_new_ui/model/1_user_model/get_department_list_model/department_model.dart';
import 'package:ps_welness_new_ui/model/1_user_model/get_speacilist_bydeptid_model/get_speacilist_bydeptid.dart';
import 'package:ps_welness_new_ui/model/1_user_model/states_model/state_modells.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/week_day_off/week_day_off_model.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class Doctor2Credentials extends StatelessWidget {
  Doctor2Credentials({Key? key}) : super(key: key);
  Doctor_1_Controller _doctor_1_controller = Get.find();

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
        key: _doctor_1_controller.doctor11formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///todo : DepartmentId .................
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<DepartmentModel>(
                        value: _doctor_1_controller.selectedDepartment.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.space_dashboard_outlined,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: const Text('Select Department'),
                        items: _doctor_1_controller.department
                            .map((DepartmentModel department) {
                          return DropdownMenuItem(
                            value: department,
                            child: Text(
                              department.departmentName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.0134,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (DepartmentModel? newValue) {
                          _doctor_1_controller.selectedDepartment.value =
                              newValue!;
                          _doctor_1_controller.selectedSpecialist.value = null;
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
                height: size.height * 0.00,
              ),

              ///todo : SpecialistId .................
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<SpecialistModel>(
                        //icon: Icon(Icons.location_city),
                        value: _doctor_1_controller.selectedSpecialist.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.folder_special,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: const Text(' Choose Specialist'),
                        items: _doctor_1_controller.specialist
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
                          _doctor_1_controller.refresh();
                        },
                        onChanged: (SpecialistModel? newValue) {
                          _doctor_1_controller.selectedSpecialist.value =
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : Licence number .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.licenceNumberController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _doctor_1_controller.DoctorName = value!;
                  },
                  validator: (value) {
                    return _doctor_1_controller.validName(value!);
                  },
                  decoration: InputDecoration(
                    hintText: 'Licence number',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : Licence image .................
              GetBuilder<Doctor_1_Controller>(
                init: Doctor_1_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _doctor_1_controller.getLicenceImage(ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Licence Image file',
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Obx(
                            () => _doctor_1_controller
                                        .selectedLicenceImagepath.value ==
                                    ''
                                ? const Center(child: Text("No Image"))
                                : Image.file(
                                    File(_doctor_1_controller
                                        .selectedLicenceImagepath.value),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///TODO: licence. validity......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _doctor_1_controller.licenceValidityController,
                  onSaved: (value) {
                    _doctor_1_controller.certificatevelidity = value!;
                  },
                  validator: (value) {
                    return _doctor_1_controller
                        .validcertificatevalidity(value!);
                  },
                  onTap: () {
                    _doctor_1_controller.chooseDate();
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
                      Icons.credit_card_sharp,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : RegistrationNumber .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.registrationController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _doctor_1_controller.experience = value!;
                  },
                  // validator: (value) {
                  //   return _doctor_1_controller.validexperince(value!);
                  // },
                  decoration: InputDecoration(
                    hintText: 'Registration Number',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.app_registration,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : PinCode .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.pinCodeController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _doctor_1_controller.PinCode = value!;
                  },
                  validator: (value) {
                    return _doctor_1_controller.validPin(value!);
                  },
                  decoration: InputDecoration(
                    hintText: 'PinCode',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : Clinic name .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.clinicNameController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _doctor_1_controller.DoctorName = value!;
                  },
                  validator: (value) {
                    return _doctor_1_controller.validName(value!);
                  },
                  decoration: InputDecoration(
                    hintText: 'Clinic name',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.store,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : experience name .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.experienceController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _doctor_1_controller.experience = value!;
                  },
                  validator: (value) {
                    return _doctor_1_controller.validexperince(value!);
                  },
                  decoration: InputDecoration(
                    hintText: 'Experience in Year',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.expand,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              ///todo : week off Id...............
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<Day>(
                        value: _doctor_1_controller.selectedweekdayId.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.calendar_view_day,
                            color: Colors.black,
                            size: 20,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select Week Off'),
                        items:
                            _doctor_1_controller.weekdayid.map((Day weekdayid) {
                          return DropdownMenuItem(
                            value: weekdayid,
                            child: SizedBox(
                              height: size.height * 0.05,
                              width: size.width * 0.61,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${weekdayid.name.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height * 0.017,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        // validator: (value) =>
                        // value == null ? '          field required' : null,
                        onChanged: (Day? newValue) {
                          _doctor_1_controller.selectedweekdayId.value =
                              newValue!;
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : Location .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.locationController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _doctor_1_controller.DoctorName = value!;
                  },
                  validator: (value) {
                    return _doctor_1_controller.validName(value!);
                  },
                  decoration: InputDecoration(
                    hintText: 'Address',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.place,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : State master id .................
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<StateModel>(
                        value: _doctor_1_controller.selectedState.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.real_estate_agent,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Select State'),
                        items:
                            _doctor_1_controller.states.map((StateModel items) {
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
                            value == null ? '            field required' : null,
                        onChanged: (StateModel? newValue) {
                          _doctor_1_controller.selectedState.value = newValue!;
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : City master id .................
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<City>(
                        value: _doctor_1_controller.selectedCity.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: const Text('Selected City'),
                        items: _doctor_1_controller.cities.map((City items) {
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
                            value == null ? '            field required' : null,
                        onChanged: (City? newValue) {
                          _doctor_1_controller.selectedCity.value = newValue!;
                        }),
                  ),
                ),
              ),

              ///todo : Qualification .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.qualificationController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _doctor_1_controller.experience = value!;
                  },
                  validator: (value) {
                    return _doctor_1_controller.validexperince(value!);
                  },
                  decoration: InputDecoration(
                    hintText: 'Qualification',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.description,
                      color: black.withOpacity(0.7),
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : About us .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.aboutController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _doctor_1_controller.about = value!;
                  },
                  validator: (value) {
                    return _doctor_1_controller.validexperince(value!);
                  },
                  decoration: InputDecoration(
                    hintText: 'About Us',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : signature image .................
              GetBuilder<Doctor_1_Controller>(
                init: Doctor_1_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _doctor_1_controller.getImage2(ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Signature Image ',
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Obx(
                            () =>
                                _doctor_1_controller.selectedImagepath2.value ==
                                        ''
                                    ? const Center(child: Text("No Image"))
                                    : Image.file(
                                        File(_doctor_1_controller
                                            .selectedImagepath2.value),
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),
              // SizedBox(
              //   height: size.height * 0.00,
              //   //appPadding / 2,
              // ),
              //
              // ///todo : End time .................
              // NeumorphicTextFieldContainer(
              //   child: Obx(
              //     () => InkWell(
              //       onTap: () {
              //         _doctor_1_controller.chooseEndTime();
              //       },
              //       child: Container(
              //         height: size.height * 0.06,
              //         child: Center(
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: size.width * 0.1),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   "Choose end time",
              //                   style: TextStyle(
              //                     fontSize: size.height * 0.017,
              //                     fontWeight: FontWeight.bold,
              //                     color: MyTheme.blueww,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: size.width * 0.03,
              //                 ),
              //                 //Spacer(),
              //                 Text(
              //                   "${_doctor_1_controller.selectedEndTime.value.hour}:${_doctor_1_controller.selectedEndTime.value.minute}",
              //                   style: TextStyle(
              //                     fontSize: size.height * 0.026,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: size.height * 0.00,
                //appPadding / 2,
              ),
              RectangularButton(
                  text: 'SUBMIT',
                  press: () async {
                    _doctor_1_controller.checkDoctor1();

                    await Future.delayed(Duration(seconds: 3));

                    ///Clear dropdown value
                    _doctor_1_controller.selectedState.value = null;
                    _doctor_1_controller.selectedFranchiseId.value = null;
                    _doctor_1_controller.selectedweekdayId.value = null;
                  })
            ],
          ),
        ),
      ),
    );
  }
}
