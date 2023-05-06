import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';

import '../../../../../../constants/constants/constants.dart';
import '../../../../../../controllers/complaint_controller/complaint_controller.dart';
import '../../../../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../../../../../widgets/widgets/rectangular_button.dart';

class RWAComplaintCredentials extends StatelessWidget {
  RWAComplaintCredentials({Key? key}) : super(key: key);

  ComplaintController _complaintController = Get.put(ComplaintController());
  // get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _complaintController.complaintformkey,
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
                      value: _complaintController.selectedSubject.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.subject,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Select Subject'),
                      items: _complaintController.subject
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
                        _complaintController.selectedSubject.value = newValue!;
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
                maxLines: 5,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _complaintController.complainController,
                onSaved: (value) {
                  _complaintController.Complaints = value!;
                },
                validator: (value) {
                  return _complaintController.validAddress(value!);
                },
                cursorColor: Colors.black,
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
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            RectangularButton(
                text: 'SUBMIT',
                press: () {
                  _complaintController.checkUser3();
                })
          ],
        ),
      ),
    );
  }
}
