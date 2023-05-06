import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/constants/constants.dart';
import '../../../../../controllers/9_doctor_controllers_RRR/doctor_controllers_RRR/doctor_controller1.dart';
import '../../../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../../../../widgets/widgets/rectangular_button.dart';
//import 'package:ps_welness_new_ui/constants/constants/constantontroller1.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/doctor_controllers/doctor_controller1.dart';
// import 'package:ps_welness/modules_view/9_doctor_section_view/home_page_view/home_page.dart';
// import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
// //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

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
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.departmentIdController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'DepartmentId',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : SpecialistId .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.specialistIdController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'SpecialistId',
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
                  decoration: InputDecoration(
                    hintText: 'Licence number',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : Licence image .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.licenceImageController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Licence image',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : Licence image name .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.licenceImageNameController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Licence image name',
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
                  decoration: InputDecoration(
                    hintText: 'PinCode',
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
                  decoration: InputDecoration(
                    hintText: 'Clinic name',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : State master id .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.stateMaster_IdController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'State masterId',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : City master id .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.cityMaster_IdController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'City masterId',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),

              ///todo : End time .................
              NeumorphicTextFieldContainer(
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: _doctor_1_controller.endTimeController,
                  cursorColor: Colors.black,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'End time',
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
                height: size.height * 0.00,
                //appPadding / 2,
              ),
              RectangularButton(
                  text: 'SUBMIT',
                  press: () {
                    _doctor_1_controller.checkDoctor1();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
