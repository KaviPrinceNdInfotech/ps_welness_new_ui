import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/registration_part_controller/fr_doctor_controllers/doctor_controller1.dart';
import 'package:ps_welness_new_ui/controllers/hospital2_controller/hospital2_sighup_controller.dart';
import 'package:ps_welness_new_ui/model/1_user_model/slot_duration_common_model/slot_duration_model.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

class FrDoc3Credentials extends StatelessWidget {
  FrDoc3Credentials({Key? key}) : super(key: key);

  FrDoctor_1_Controller _frDoctor_1_controller =
      Get.put(FrDoctor_1_Controller());

  var items = [
    '10',
    '15',
    '20',
    '25',
    '30',
  ];
  var items1 = [
    '10',
    '15',
    '20',
    '25',
    '30',
  ];
  get newvalue => null!;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    int second = now.second;
    print('$hour $minute $second');
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: _frDoctor_1_controller.frdoctor3formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///todo: Address.................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  //keyboardType: TextInputType.number,
                  autofillHints: [AutofillHints.addressCityAndState],
                  controller: _frDoctor_1_controller.locationController,
                  onSaved: (value) {
                    _frDoctor_1_controller.address = value!;
                  },
                  validator: (value) {
                    return _frDoctor_1_controller.validAddress(value!);
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
                      Icons.place,
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

              ///file
              GetBuilder<Hospital_2_Controller>(
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _frDoctor_1_controller.getLicenceImage(ImageSource.gallery);
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
                            () => _frDoctor_1_controller
                                        .selectedLicenceImagepath.value ==
                                    ''
                                ? const Center(child: Text("No Image"))
                                : Image.file(
                                    File(_frDoctor_1_controller
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
              SizedBox(
                height: size.height * 0.02,
              ),

              ///TODO: Licence no.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _frDoctor_1_controller.licenceNumberController,
                  onSaved: (value) {
                    _frDoctor_1_controller.certificateno = value!;
                  },
                  validator: (value) {
                    return _frDoctor_1_controller.validcertificate(value!);
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

              ///TODO: licence. validity......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  controller: _frDoctor_1_controller.licenceValidityController,
                  onSaved: (value) {
                    _frDoctor_1_controller.certificatevelidity = value!;
                  },
                  validator: (value) {
                    return _frDoctor_1_controller
                        .validcertificatevalidity(value!);
                  },
                  onTap: () {
                    _frDoctor_1_controller.chooseDate();
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

              ///TODO: pin code no.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.password],
                  controller: _frDoctor_1_controller.pinController,
                  onSaved: (value) {
                    _frDoctor_1_controller.aadhar = value!;
                  },
                  validator: (value) {
                    return _frDoctor_1_controller.validaadhar(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Pin Code ',
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

              ///TODO: registration no.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.password],
                  controller: _frDoctor_1_controller.registrationController,
                  onSaved: (value) {
                    _frDoctor_1_controller.name = value!;
                  },
                  validator: (value) {
                    return _frDoctor_1_controller.validfeess(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Registration Number',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.add_chart_rounded,
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

              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _frDoctor_1_controller.panController,
                  onSaved: (value) {
                    _frDoctor_1_controller.pan = value!;
                  },
                  validator: (value) {
                    return _frDoctor_1_controller.validPan(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Pan number',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.add_card_outlined,
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

              GetBuilder<Hospital_2_Controller>(
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _frDoctor_1_controller.getPanImage(ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pan Image file',
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
                            () => _frDoctor_1_controller
                                        .selectedPanImagepath.value ==
                                    ''
                                ? const Center(child: Text("No Image"))
                                : Image.file(
                                    File(_frDoctor_1_controller
                                        .selectedPanImagepath.value),
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
              ),

              ///Todo: morning.....................................

              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<DurationSlot>(
                        value: _frDoctor_1_controller
                            .selectedtimeslotDurations.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.sunny,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Slot Timing Morning'),
                        items: _frDoctor_1_controller.timeduration
                            .map((DurationSlot timeduration) {
                          return DropdownMenuItem(
                            value: timeduration,
                            child: Text(
                              "${timeduration.durationTime.toString()}  minutes",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.017,
                              ),
                            ),
                          );
                        }).toList(),
                        validator: (value) =>
                            value == null ? '          field required' : null,
                        onChanged: (DurationSlot? newValue) {
                          _frDoctor_1_controller
                              .selectedtimeslotDurations.value = newValue!;
                        }),
                  ),
                ),
              ),

              ///todo:selected date starting...
              SizedBox(
                height: size.height * 0.02,
              ),
              NeumorphicTextFieldContainer(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      _frDoctor_1_controller.chooseTime();
                    },
                    child: Container(
                      height: size.height * 0.06,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Starting Time Morning:',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.blueww,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              //Spacer(),
                              //    print('$hour $minute $second');
                              Text(
                                "${_frDoctor_1_controller.selectedTime.value.hour}:${_frDoctor_1_controller.selectedTime.value.minute}",
                                style: TextStyle(
                                  fontSize: size.height * 0.026,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),

              ///todo:selected time ending...
              NeumorphicTextFieldContainer(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      _frDoctor_1_controller.chooseTime2();
                    },
                    child: Container(
                      height: size.height * 0.06,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ending Time Morning:',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.blueww,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              //Spacer(),
                              Text(
                                "${_frDoctor_1_controller.selectedTime2.value.hour}:${_frDoctor_1_controller.selectedTime2.value.minute}",
                                style: TextStyle(
                                  fontSize: size.height * 0.026,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///Todo: evening.....................................
              SizedBox(
                height: size.height * 0.02,
              ),
              NeumorphicTextFieldContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: Obx(
                    () => DropdownButtonFormField<DurationSlot>(
                        value: _frDoctor_1_controller
                            .selectedtimeslotDurations2.value,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.shield_moon_rounded,
                            color: Colors.black,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                        hint: Text('Slot Timing Evening'),
                        items: _frDoctor_1_controller.timeduration2
                            .map((DurationSlot timeduration2) {
                          return DropdownMenuItem(
                            value: timeduration2,
                            child: Text(
                              "${timeduration2.durationTime.toString()} minutes",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.017,
                              ),
                            ),
                          );
                        }).toList(),
                        validator: (value) =>
                            value == null ? '          field required' : null,
                        onChanged: (DurationSlot? newValue) {
                          _frDoctor_1_controller
                              .selectedtimeslotDurations2.value = newValue!;
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              NeumorphicTextFieldContainer(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      _frDoctor_1_controller.chooseTime3();
                    },
                    child: Container(
                      height: size.height * 0.06,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Starting Time Evening:',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.blueww,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              //Spacer(),
                              Text(
                                "${_frDoctor_1_controller.selectedTime3.value.hour}:${_frDoctor_1_controller.selectedTime3.value.minute}",
                                style: TextStyle(
                                  fontSize: size.height * 0.026,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              NeumorphicTextFieldContainer(
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      _frDoctor_1_controller.chooseTime4();
                    },
                    child: Container(
                      height: size.height * 0.06,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ending Time Evening:',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.blueww,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              //Spacer(),
                              Text(
                                "${_frDoctor_1_controller.selectedTime4.value.hour}:${_frDoctor_1_controller.selectedTime4.value.minute}",
                                style: TextStyle(
                                  fontSize: size.height * 0.026,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.02,
              ),

              ///TODO: qualification.......................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.password],
                  controller: _frDoctor_1_controller.qualificationController,
                  onSaved: (value) {
                    _frDoctor_1_controller.name = value!;
                  },
                  validator: (value) {
                    return _frDoctor_1_controller.validfeess(value!);
                  },
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Qualification ',
                    helperStyle: TextStyle(
                      color: black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.add_card,
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

              ///todo : About us .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _frDoctor_1_controller.aboutController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  onSaved: (value) {
                    _frDoctor_1_controller.about = value!;
                  },
                  validator: (value) {
                    return _frDoctor_1_controller.validName(value!);
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
                height: size.height * 0.02,
              ),

              ///TODO: registration no.......................
              // NeumorphicTextFieldContainer(
              //   child: TextFormField(
              //     autofillHints: [AutofillHints.password],
              //     controller: _frDoctor_1_controller.registrationController,
              //     onSaved: (value) {
              //       _frDoctor_1_controller.name = value!;
              //     },
              //     validator: (value) {
              //       return _frDoctor_1_controller.validfeess(value!);
              //     },
              //     cursorColor: Colors.black,
              //     obscureText: false,
              //     decoration: InputDecoration(
              //       hintText: 'Registration Number',
              //       helperStyle: TextStyle(
              //         color: black.withOpacity(0.7),
              //         fontSize: 18,
              //       ),
              //       prefixIcon: Icon(
              //         Icons.add_chart_rounded,
              //         color: black.withOpacity(0.7),
              //         size: 20,
              //       ),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.018,
              // ),

              GetBuilder<Hospital_2_Controller>(
                init: Hospital_2_Controller(), // intialize with the Controller
                builder: (value) => InkWell(
                  onTap: () {
                    _frDoctor_1_controller.getImage2(ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Signature Image file',
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
                                _frDoctor_1_controller.selectedImagepath2 == ''
                                    ? const Center(child: Text("No Image"))
                                    : Image.file(
                                        File(_frDoctor_1_controller
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
                height: size.height * 0.018,
              ),

              RectangularButton(
                  text: 'SUBMIT',
                  press: () {
                    _frDoctor_1_controller.checkDoctor3();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
