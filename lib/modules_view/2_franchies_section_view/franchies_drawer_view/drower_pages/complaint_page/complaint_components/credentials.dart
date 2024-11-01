import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/model/9_doctors_model/doctor_homepage_model/complain_doctor_model.dart';

import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../../../../controllers/2_franchises_controller/franchises_complain_controller/franchises_complain_controller.dart';
import '../../../../../../controllers/complaint_controller/complaint_controller.dart';

class ComplaintCredentials extends StatelessWidget {
  ComplaintCredentials({Key? key}) : super(key: key);

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];


  FranchisesComplaintController _franchiesComplaintController = Get.put(FranchisesComplaintController());

  get newvalue => null!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _franchiesComplaintController.franchisescomplaintformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Subject..........
            Text('Subject',style: TextStyle(
              fontSize: size.height*0.015,
              fontWeight: FontWeight.bold,
            ),),
            NeumorphicTextFieldContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                child: Obx(
                      () => DropdownButtonFormField<Complaint41Patient>(
                      value: _franchiesComplaintController.selectedSubject.value,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.subject,
                          color: Colors.black,
                        ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      hint: Text('Select Subject'),
                      items: _franchiesComplaintController.subject.map((Complaint41Patient model) {
                        return DropdownMenuItem(
                          value: model,
                          child: Text(model.subjectName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.015,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (Complaint41Patient? newValue) {
                        _franchiesComplaintController.selectedSubject.value = newValue!;
                      }),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text('Others',style: TextStyle(
              fontSize: size.height*0.015,
              fontWeight: FontWeight.bold,
            ),),
            ///todo: other value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 1,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _franchiesComplaintController.othersController,
                onSaved: (value) {
                  _franchiesComplaintController.Others = value!;
                },
                validator: (value) {
                  return _franchiesComplaintController.validothers(value!);
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
            Text('Write your complain',
              style: TextStyle(
              fontSize: size.height*0.015,
              fontWeight: FontWeight.bold,
            ),),
            ///todo: location value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 5,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _franchiesComplaintController.complaintController,
                onSaved: (value) {
                  _franchiesComplaintController.complaint = value!;
                },
                validator: (value) {
                  return _franchiesComplaintController.validAddress(value!);
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
                  _franchiesComplaintController.checkFranchisesComplain();
                })
          ],
        ),
      ),
    );
  }
}
