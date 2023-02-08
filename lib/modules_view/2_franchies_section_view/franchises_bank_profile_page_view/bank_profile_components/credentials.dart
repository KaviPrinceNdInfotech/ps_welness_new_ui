import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';
//import 'package:ps_welness/constants/constants/constants.dart';
//import 'package:ps_welness/modules_view/6_chemist_section_view/chemist_home/chemist_home_page.dart';
//import 'package:ps_welness/modules_view/home_page_view/home_page.dart';
//import 'package:ps_welness/widgets/widgets/neumorphic_text_field_container.dart';
//import 'package:ps_welness/widgets/widgets/rectangular_button.dart';

import '../../../../controllers/2_franchises_controller/franchieses_bank_profile_controller/franchises_bank_profile_controllers.dart';

class FranchiesBankCredentials extends StatelessWidget {
  FranchiesBankCredentials({Key? key}) : super(key: key);

  // Hospital_1_Controller _hospital_1_controller =
  //     Get.put(Hospital_1_Controller());

  FranchisesBankProfileController _franchisesBankProfileController =
      Get.put(FranchisesBankProfileController());

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  get newvalue => null!;

  // LoginpasswordController _loginpasswordController =
  //     Get.put(LoginpasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _franchisesBankProfileController.franchisesbankprofileformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            ///TODO: account number.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //initialValue: "I am smart",
                autofillHints: [AutofillHints.name],

                controller: _franchisesBankProfileController.accountController,
                onSaved: (value) {
                  _franchisesBankProfileController.account = value!;
                },
                validator: (value) {
                  return _franchisesBankProfileController
                      .validaccountNumber(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Account Number',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    FontAwesomeIcons.piggyBank,
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

            ///todo:  bank name..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                keyboardType: TextInputType.name,
                autofillHints: [AutofillHints.telephoneNumber],
                controller: _franchisesBankProfileController.nameController,
                onSaved: (value) {
                  _franchisesBankProfileController.name = value!;
                },
                validator: (value) {
                  return _franchisesBankProfileController.validName(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Bank Name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.account_balance_outlined,
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

            ///todo: location value..........
            NeumorphicTextFieldContainer(
              child: TextFormField(
                autofillHints: [AutofillHints.addressCityAndState],
                controller:
                    _franchisesBankProfileController.locatoionController,
                onSaved: (value) {
                  _franchisesBankProfileController.location = value!;
                },
                validator: (value) {
                  return _franchisesBankProfileController.validLocation(value!);
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
                    Icons.pin_drop,
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

            ///Todo: account holder no..............
            NeumorphicTextFieldContainer(
              child: TextFormField(
                controller: _franchisesBankProfileController
                    .accountholdernameController,
                onSaved: (value) {
                  _franchisesBankProfileController.accountholdername = value!;
                },
                validator: (value) {
                  return _franchisesBankProfileController
                      .validaccountNumber(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Account Holder name',
                  helperStyle: TextStyle(
                    color: black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.switch_account,
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

            ///TODO: ifsc no.......................
            NeumorphicTextFieldContainer(
              child: TextFormField(
                //autofillHints: [AutofillHin],
                controller: _franchisesBankProfileController.ifscController,
                onSaved: (value) {
                  _franchisesBankProfileController.ifsc = value!;
                },
                validator: (value) {
                  return _franchisesBankProfileController.validIfsc(value!);
                },
                cursorColor: Colors.black,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'valid IFSC',
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

            // ///TODO: bankAc  no.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     keyboardType: TextInputType.number,
            //     autofillHints: [AutofillHints.creditCardNumber],
            //     controller: _chemistprofileController.accountnoController,
            //     onSaved: (value) {
            //       _chemistprofileController.account = value!;
            //     },
            //     validator: (value) {
            //       return _chemistprofileController.validAccount(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Bank Account No.',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.account_balance_outlined,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            // ///TODO: IFSC.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.creditCardNumber],
            //     controller: _chemistprofileController.ifscController,
            //     onSaved: (value) {
            //       _chemistprofileController.ifsc = value!;
            //     },
            //     validator: (value) {
            //       return _chemistprofileController.validIfsc(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'IFSC Code',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.qr_code,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            // ///TODO:  bank name.......................
            // NeumorphicTextFieldContainer(
            //   child: TextFormField(
            //     autofillHints: [AutofillHints.name],
            //     controller: _chemistprofileController.branchController,
            //     onSaved: (value) {
            //       _chemistprofileController.branch = value!;
            //     },
            //     validator: (value) {
            //       return _chemistprofileController.validBranch(value!);
            //     },
            //     cursorColor: Colors.black,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Branch name.',
            //       helperStyle: TextStyle(
            //         color: black.withOpacity(0.7),
            //         fontSize: 18,
            //       ),
            //       prefixIcon: Icon(
            //         Icons.account_balance_rounded,
            //         color: black.withOpacity(0.7),
            //         size: 20,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            SizedBox(
              height: size.height * 0.018,
              //appPadding / 2,
            ),
            SizedBox(
              height: size.height * 0.00,
              //appPadding / 2,
            ),

            RectangularButton(
                text: 'UPDATE',
                press: () {
                  Get.to(ChemistHomePage());
                  //_loginpasswordController.checkLoginpassword();
                })
          ],
        ),
      ),
    );
  }
}
