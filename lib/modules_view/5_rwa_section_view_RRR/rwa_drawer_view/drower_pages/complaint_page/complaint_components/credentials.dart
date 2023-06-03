import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/5_rwa_controller_RRR/rwa_complain_controller/rwa_complain_controller.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../../../model/1_user_model/complain_dropdown_subject_model/complain_dropdown_get_model.dart';

class RWAComplaintCredentials extends StatelessWidget {
  RWAComplaintCredentials({Key? key}) : super(key: key);
  RwaComplaintController _rwaComplaintController =
      Get.put(RwaComplaintController());

  // ComplaintController _complaintController = Get.put(ComplaintController());
  // get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _rwaComplaintController.rwacomplaintformkey,
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
                      value: _rwaComplaintController.selectedSubject.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.subject,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: const Text('Select Subject'),
                      items: _rwaComplaintController.subject
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
                        _rwaComplaintController.selectedSubject.value =
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
                controller: _rwaComplaintController.otherController,
                onSaved: (value) {
                  _rwaComplaintController.Others = value!;
                },
                validator: (value) {
                  return _rwaComplaintController.validothers(value!);
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
                  // prefixIcon: Icon(
                  //   Icons.comment_bank_outlined,
                  //   color: black.withOpacity(0.7),
                  //   size: 20,
                  // ),
                  border: InputBorder.none,
                ),
              ),
            ),

            ///todo: location value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 5,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _rwaComplaintController.complaintController,
                onSaved: (value) {
                  _rwaComplaintController.complaint = value!;
                },
                validator: (value) {
                  return _rwaComplaintController.validAddress(value!);
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
                  _rwaComplaintController.checkrwa3();
                })
          ],
        ),
      ),
    );
  }
}
