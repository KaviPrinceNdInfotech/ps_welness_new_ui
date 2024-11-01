import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
//import 'package:ps_welness_new_ui/controllers/doctor_controllers/doctor_complain_controller/doctor_complain_controllers.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../../../controllers/9_doctor_controllers_RRR/doctor_controllers_RRR/doctor_complain_controller/doctor_complain_controllers.dart';

class ComplaintCredentials extends StatelessWidget {
  ComplaintCredentials({Key? key}) : super(key: key);

  DoctorComplaintController _doctorComplaintController =
      Get.put(DoctorComplaintController());

  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _doctorComplaintController.doctorcomplaintformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Todo: state............................
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<Complaint41Patient>(
                      value: _doctorComplaintController.selectedSubject.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.subject,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Select Subject'),
                      items: _doctorComplaintController.subject
                          .map((Complaint41Patient model) {
                        return DropdownMenuItem(
                          value: model,
                          child: Text(
                            "${model.subjectName}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (Complaint41Patient? newValue) {
                        _doctorComplaintController.selectedSubject.value =
                            newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///todo: other value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 1,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _doctorComplaintController.otherController,
                validator: (value) {
                  return _doctorComplaintController.validothers(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  hintText: 'Other',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
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

            ///todo: location value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 5,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _doctorComplaintController.complaintController,
                validator: (value) {
                  return _doctorComplaintController.validAddress(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  hintText: 'Enter Your Complaint.',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),
            RectangularButton(
                text: 'SUBMIT',
                press: () {
                  _doctorComplaintController.checkDoctor();
                })
          ],
        ),
      ),
    );
  }
}
