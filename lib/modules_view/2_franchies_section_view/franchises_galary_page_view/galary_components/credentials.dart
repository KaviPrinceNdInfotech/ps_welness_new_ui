import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/constants/constants.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/add_gallary/add_galary_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchies_getGallery_controller.dart';

class franchiesGalarryCredentials extends StatelessWidget {
  franchiesGalarryCredentials({Key? key}) : super(key: key);
  FranchisesgalaryController _franchisesgalaryController = Get.put(FranchisesgalaryController());
  FrenchiesGetGalleryController frenchiesGetGalleryController = Get.put(FrenchiesGetGalleryController());

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
    return Form(
      key: _franchisesgalaryController.franchisesgalaryformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///todo:  name..........
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.37,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            lightPrimary,
                            darkPrimary,
                          ]),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(-2, -2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          color: darkShadow,
                        ),
                        BoxShadow(
                          offset: Offset(2, 2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          color: lightShadow,
                        ),
                      ]),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    autofillHints: [AutofillHints.telephoneNumber],
                    controller: _franchisesgalaryController.nameController,
                    onSaved: (value) {
                      _franchisesgalaryController.name = value!;
                    },
                    validator: (value) {
                      return _franchisesgalaryController.validName(value!);
                    },
                    cursorColor: Colors.black,
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      hintText: 'Enter Image Name',
                      helperStyle: TextStyle(
                        color: black.withOpacity(0.7),
                        fontSize: 12,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.40,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            lightPrimary,
                            darkPrimary,
                          ]),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(-2, -2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          color: darkShadow,
                        ),
                        BoxShadow(
                          offset: Offset(2, 2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          color: lightShadow,
                        ),
                      ]),
                  child: GetBuilder<FranchisesgalaryController>(
                    // specify type as Controller
                    init: FranchisesgalaryController(), // intialize with the Controller
                    builder: (value) => InkWell(
                      onTap: () {
                        _franchisesgalaryController.getImage(ImageSource.gallery);
                      },
                      child: Container(
                        height: size.height * 0.03,
                        width: size.width * 0.4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Choose File',
                                style: TextStyle(
                                  fontSize: size.width * 0.025,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(Icons.camera_alt),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                   _franchisesgalaryController.checkAddGallery();

                   Timer(const Duration(seconds: 1), () =>
                       frenchiesGetGalleryController.FrenchiesGetGalleryApi()
                   );
                  },
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.15,
                    margin: EdgeInsets.symmetric(vertical: appPadding / 3),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              lightPrimary1,
                              darkPrimary2,
                            ]),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-2, -2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: darkShadow,
                          ),
                          BoxShadow(
                            offset: Offset(2, 2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: lightShadow,
                          ),
                        ]),
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.1,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.0),
                        child: Center(
                          child: Text(
                            'Post',
                            style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
