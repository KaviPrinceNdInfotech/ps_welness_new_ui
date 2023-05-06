import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/controllers/doctor_controllers/doctor_complain_controller/doctor_complain_controllers.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';

import '../../../../../../constants/constants/constants.dart';
import '../../../../../../controllers/4_nurse_controller_RRR/nurse_complain_controller/nurse_complain_controller.dart';
import '../../../../../../model/9_doctors_model_RRR/doctor_homepage_model/complain_doctor_model.dart';
import '../../../../../../widgets/widgets/rectangular_button.dart';

//import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';
// import '../../../../../../constants/constants/constants.dart';
// //import '../../../../../../controllers/4_nurse_controller/nurse_complain_controller/nurse_complain_controller.dart';
// import '../../../../../../controllers/4_nurse_controller_RRR/nurse_complain_controller/nurse_complain_controller.dart';
// import '../../../../../../controllers/complaint_controller/complaint_controller.dart';
// import '../../../../../../model/9_doctors_model_RRR/doctor_homepage_model/complain_doctor_model.dart';
// import '../../../../../../widgets/circular_loader.dart';
// import '../../../../../../widgets/widgets/neumorphic_text_field_container.dart';
// import '../../../../../../widgets/widgets/rectangular_button.dart';
class ComplaintCredentials extends StatelessWidget {
  ComplaintCredentials({Key? key}) : super(key: key);
  NurseComplaintController _nurseComplaintController =
      Get.put(NurseComplaintController());
  DoctorComplaintController _doctorComplaintController =
      Get.put(DoctorComplaintController());
  get newvalue => null!;

  //..............................................
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _nurseComplaintController.nursecomplaintformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subject',
              style: TextStyle(
                fontSize: size.height * 0.015,
                fontWeight: FontWeight.bold,
              ),
            ),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                  () => DropdownButtonFormField<Complaint41Patient>(
                      value: _nurseComplaintController.selectedSubject.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.subject,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Subject'),
                      items: _nurseComplaintController.subject
                          .map((Complaint41Patient model) {
                        return DropdownMenuItem(
                          value: model,
                          child: Text(
                            model.subjectName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (Complaint41Patient? newValue) {
                        _nurseComplaintController.selectedSubject.value =
                            newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Others',
              style: TextStyle(
                fontSize: size.height * 0.015,
                fontWeight: FontWeight.bold,
              ),
            ),

            ///todo: other value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 1,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _nurseComplaintController.otherController,
                validator: (value) {
                  return _nurseComplaintController.validothers(value!);
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
            Text(
              'Write your complain',
              style: TextStyle(
                fontSize: size.height * 0.015,
                fontWeight: FontWeight.bold,
              ),
            ),

            ///todo: location value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 5,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _nurseComplaintController.complaintController,
                validator: (value) {
                  return _nurseComplaintController.validAddress(value!);
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
            ),
            RectangularButton(
                text: 'SUBMIT',
                press: () {
                  _nurseComplaintController.checkNurse3();
                })
          ],
        ),
      ),
    );
  }
}
