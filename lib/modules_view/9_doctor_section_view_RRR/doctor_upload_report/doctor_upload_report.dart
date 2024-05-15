import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/constants/my_theme.dart';
import 'package:ps_welness_new_ui/controllers/9_doctor_controllers_RRR/doctor_upload_report_controller/doctor_upload_report_controllers.dart';
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';
import 'package:ps_welness_new_ui/widgets/widgets/neumorphic_text_field_container.dart';
import 'package:ps_welness_new_ui/widgets/widgets/rectangular_button.dart';

import '../../../model/9_doctors_model_RRR/doctor_homepage_model/dropdown_patient_list_model/dropdown_patient_list_model.dart';
//import 'package:ps_welness_new_ui/controllers/4_nurse_controller/nurse_upload_report/nurseUploadReportController.dart';

class DoctorUploadReport extends StatelessWidget {
  DoctorrUploadReportController _doctorrUploadReportController =
      Get.put(DoctorrUploadReportController());
  String textHolder = '268 ';
  RxInt selectedimg = 0.obs;
  // Track whether image is being loaded
  bool isLoadingImage = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Function to handle image selection
    Future<void> handleImageSelection() async {
      optionsImage();
      await optionsController.selectOption();
      //await _doctorrUploadReportController.getdoctorrpatientApi();
    }

    return Scaffold(
      // backgroundColor: Color(0xffffdb61),
      appBar: AppBar(
        backgroundColor: MyTheme.ThemeColors,
        leading: InkWell(
            onTap: () {
              Get.to(DoctorHomePage());
            },
            child: Icon(Icons.arrow_circle_left)),
        title: Text("Upload Patient Report"),
      ),
      body: Obx(
        () => (_doctorrUploadReportController.isLoading.isFalse)
            ? Center(child: CircularProgressIndicator())

            ///TODO: here we can use layout builder and we can use stack under list view in flutter............
            : Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: size.height * 0.3,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.cyanAccent, width: 2),
                      ),
                      child: GestureDetector(
                        onTap: handleImageSelection,
                        child: Obx(
                          () => _doctorrUploadReportController
                                      .selectedPath.value !=
                                  ''
                              ? Image.file(File(_doctorrUploadReportController
                                  .selectedPath.value))
                              : Center(
                                  child: Container(
                                    height: size.height * 0.4,
                                    width: size.width * 0.95,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        border: Border.all(
                                            width: 5,
                                            color: Color.fromARGB(
                                                255, 58, 141, 208))),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_box,
                                        color:
                                            Color.fromARGB(255, 58, 141, 208),
                                      ),
                                    ),
                                  ),
                                ),
                          // Image.file(File(
                          //         _labUploadReportController.selectedImagePath.value)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NeumorphicTextFieldContainer(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: Obx(
                          () => DropdownButtonFormField<
                              PatientDropdownDoctorName>(
                            value: _doctorrUploadReportController
                                .selectedpatient.value,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                            hint: Text('Select Patient'),
                            items: _doctorrUploadReportController.patient
                                .map((PatientDropdownDoctorName patient2) {
                              return DropdownMenuItem(
                                value: patient2,
                                child: Text(
                                  patient2.patientName.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height * 0.015,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (PatientDropdownDoctorName? newValue) {
                              // Check if the new value is different from the currently selected value
                              if (_doctorrUploadReportController
                                      .selectedpatient.value !=
                                  newValue) {
                                _doctorrUploadReportController
                                    .selectedpatient.value = newValue!;
                                // Perform any additional actions here
                              } else {
                                // Handle same value error, maybe display a message or perform some action
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RectangularButton(
                        text: 'SUBMIT REPORT',
                        press: () async {
                          //CallLoader.loader();

                          ///todo: calling api....
                          await _doctorrUploadReportController
                              .postdoctorUploadreportApi();

                          // Clear selected image path
                          _doctorrUploadReportController.selectedPath.value =
                              '';

                          // Clear dropdown value
                          _doctorrUploadReportController.selectedpatient.value =
                              null;

                          // Navigate back to DoctorHomePage or any other necessary screen
                          //await Get.to(DoctorHomePage());
                          await Get.to(DoctorHomePage());

                          ///Clear dropdown value
                          _doctorrUploadReportController.selectedpatient.value =
                              null;
                          _doctorrUploadReportController.imagePath.clear();
                          _doctorrUploadReportController.selectedImagePath
                              .close();

                          //resetSelection();
                          optionsController.resetSelection();

                          // Clear selected image from image picker
                          ///_doctorrUploadReportController.selectedImage.value = null;

                          //_doctorrUploadReportController.getdoctorrpatientApi();
                          // Get.to(LabCatagaryDetails());
                          // LabListPage());
                          //_loginpasswordController.checkLoginpassword();
                        })
                  ],
                ),
              ),
      ),
    );
  }

  // void optionsImage() {
  //   Get.defaultDialog(
  //     title: "Selcet an option",
  //     titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
  //     content: SizedBox(
  //       width: 780,
  //       child: Column(
  //         children: [
  //           InkWell(
  //             onTap: () {
  //               _doctorrUploadReportController.getImage(ImageSource.camera);
  //               Get.back();
  //             },
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   Icons.camera_enhance,
  //                   color: Color.fromARGB(255, 34, 126, 201),
  //                   size: 25,
  //                 ),
  //                 SizedBox(
  //                   width: 20,
  //                 ),
  //                 Text(
  //                   "Camera",
  //                   style: TextStyle(
  //                     color: Color.fromARGB(255, 34, 126, 201),
  //                     fontSize: 25,
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //           Divider(
  //             color: Color.fromARGB(255, 34, 126, 201),
  //             endIndent: 70,
  //             indent: 70,
  //           ),
  //           InkWell(
  //             onTap: () {
  //               _doctorrUploadReportController.getImage(ImageSource.gallery);
  //               Get.back();
  //             },
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   Icons.photo,
  //                   color: Color.fromARGB(255, 34, 126, 201),
  //                   size: 25,
  //                 ),
  //                 SizedBox(
  //                   width: 20,
  //                 ),
  //                 Text(
  //                   "Gallery",
  //                   style: TextStyle(
  //                     color: Color.fromARGB(255, 34, 126, 201),
  //                     fontSize: 25,
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

// Instantiate the controller
  final OptionsController optionsController = Get.put(OptionsController());

// Modify your optionsImage function to utilize this controller
  void optionsImage() {
    Get.defaultDialog(
      title: "Select an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                _doctorrUploadReportController.getImage(ImageSource.camera);
                optionsController.selectOption();
                await optionsController.selectOption();

                // await _doctorrUploadReportController
                //     .getdoctorrpatientApi(); // Set option as selected
                Get.back();
                //optionsController.resetSelection();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 70,
              indent: 70,
            ),
            InkWell(
              onTap: () async {
                _doctorrUploadReportController.getImage(ImageSource.gallery);
                await optionsController.selectOption();
                // await _doctorrUploadReportController
                //     .getdoctorrpatientApi(); // Set option as selected
// Set option as selected
                Get.back();
                //optionsController.resetSelection();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 25,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    " Gallery ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),

            ///
          ],
        ),
      ),
    );
  }
}

// Define a controller class to manage the state
class OptionsController extends GetxController {
  RxBool isOptionSelected = false.obs;

  void resetSelection() {
    isOptionSelected.value = false;
  }

  Future<void> selectOption() async {
    isOptionSelected.value = true;
  }
}
