import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../../constants/constants/constants.dart';
import '../../../../../../controllers/4_nurse_controller/nurse_complain_controller/nurse_complain_controller.dart';
import '../../../../../../controllers/complaint_controller/complaint_controller.dart';
import '../../../../../../widgets/circular_loader.dart';
import '../../../../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../../../../../widgets/widgets/rectangular_button.dart';
// import 'package:ps_welness/constants/constants/constants.dart';
// import 'package:ps_welness/controllers/complaint_controller/complaint_controller.dart';
// import 'package:ps_welness/modules_view/circular_loader/circular_loaders.dart';
// //import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
// import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
// import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

class ComplaintCredentials extends StatelessWidget {
  ComplaintCredentials({Key? key}) : super(key: key);
  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());
  NurseComplaintController _nurseComplaintController = Get.put(NurseComplaintController());
  //ComplaintController _complaintController = Get.put(ComplaintController());
  var items = [
    'Select',
    'Doctor',
    'Hospital',
    'Driver',
    'Ambulance',
    'Patient',
    'Other',
  ];

  get newvalue => null!;

  //..............................................

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

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
            ///Todo: state............................
            // ///Todo: email.....................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.email],
            //     controller: _profileController.emailController,
            //     onSaved: (value) {
            //       _profileController.email = value!;
            //     },
            //     validator: (value) {
            //       return _profileController.validEmail(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Email',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.email,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            ///Subject..........
            Text('Subject',style: TextStyle(
              fontSize: size.height*0.015,
              fontWeight: FontWeight.bold,

            ),),

            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 1,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _nurseComplaintController.subjectController,
                onSaved: (value) {
                  _nurseComplaintController.Subjects = value!;
                },
                validator: (value) {
                  return _nurseComplaintController.validsubject(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  hintText: 'Subject',
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

            // NeumorphicTextFieldContainer(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            //     child: Obx(
            //           () => DropdownButtonFormField(
            //           value: _nurseComplaintController.selectedState.value,
            //           decoration: InputDecoration(
            //             prefixIcon: Icon(
            //               Icons.subject,
            //               color: Colors.black,
            //             ),
            //             enabledBorder: InputBorder.none,
            //             border: InputBorder.none,
            //           ),
            //           hint: Text('Select Subject'),
            //           items: items.map((String items) {
            //             return DropdownMenuItem(
            //               value: items,
            //               child: Text(
            //                 items,
            //                 style: TextStyle(
            //
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: size.height * 0.015,
            //                 ),
            //               ),
            //             );
            //           }).toList(),
            //           onChanged: (String? newValue) {
            //             _nurseComplaintController.selectedState.value = newValue!;
            //             // _hospital_2_controller.states.value =
            //             //     newValue! as List<String>;
            //             // _hospital_2_controller.selectedCity.value = null;
            //             // _hospital_2_controller.cities.clear();
            //             // _hospital_2_controller.cities
            //             //     .addAll(stateCityMap[newvalue]!);
            //           }),
            //     ),
            //   ),
            // ),
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
                controller: _nurseComplaintController.otherController,
                onSaved: (value) {
                  _nurseComplaintController.Others = value!;
                },
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
                  // prefixIcon: Icon(
                  //   Icons.comment_bank_outlined,
                  //   color: black.withOpacity(0.7),
                  //   size: 20,
                  // ),
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
            Text('Write your complain',style: TextStyle(
              fontSize: size.height*0.015,
              fontWeight: FontWeight.bold,

            ),),

            ///todo: location value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                maxLines: 5,
                autofillHints: [AutofillHints.addressCityAndState],
                controller: _nurseComplaintController.complaintController,
                onSaved: (value) {
                  _nurseComplaintController.complaint = value!;
                },
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
                  // prefixIcon: Icon(
                  //   Icons.comment_bank_outlined,
                  //   color: black.withOpacity(0.7),
                  //   size: 20,
                  // ),
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
                  CallLoader.loader();
                  _nurseComplaintController.checkNurse3();
                  //_loginpasswordController.checkLoginpassword();
                  //Get.to(HomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
