import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/complain_nurse_model.dart';
//import '../../../../../../controllers/6_chemist_view_controllers_RRR/chemist_complain_controller/chemist_complain_controller.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';

import '../../../../../../constants/constants/constants.dart';
import '../../../../../../controllers/4_nurse_controller_RRR/nurse_complain_controller/nurse_complain_controller.dart';
import '../../../../../../widgets/widgets/rectangular_button.dart';

class nurseComplaintssCredentials extends StatelessWidget {
  nurseComplaintssCredentials({Key? key}) : super(key: key);
  NurseComplaintController _nurseComplaintController =
      Get.put(NurseComplaintController());

  get newvalue => null!;

  //..............................................
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => (_nurseComplaintController.isLoading.value)
          ? Center(child: CircularProgressIndicator())
          : Form(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child:
                            //Obx(
                            //() =>
                            DropdownButtonFormField<ComplaintNurse41Patient>(
                                value: _nurseComplaintController
                                    .selectedSubject.value,
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
                                    .map((ComplaintNurse41Patient subject) {
                                  return DropdownMenuItem(
                                    value: subject,
                                    child: Text(
                                      subject.subjectName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.015,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (ComplaintNurse41Patient? newValue) {
                                  _nurseComplaintController
                                      .selectedSubject.value = newValue!;
                                }),
                        //),
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
                        controller: _nurseComplaintController.Other,
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
                        controller: _nurseComplaintController.Complain,
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
            ),
    );
  }
}
