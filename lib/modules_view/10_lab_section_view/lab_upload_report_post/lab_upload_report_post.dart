import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/modules_view/10_lab_section_view/lab_home/lab_home_page.dart';

import '../../../controllers/10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
import '../../../model/10_lab_module/lab_upload_dropdown_patient/lab_patient_dropdown_api.dart';
import '../../../model/1_user_model/test_name_model/test_name_modells.dart';
import '../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../../widgets/widgets/rectangular_button.dart';
//import 'package:ps_welness_new_ui/controllers/4_nurse_controller/nurse_upload_report/nurseUploadReportController.dart';

class LabUploadReports extends StatelessWidget {
  LabUploadReportController _labUploadReportController =
      Get.put(LabUploadReportController());

  String textHolder = '268 ';
  RxInt selectedimg = 0.obs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color(0xffffdb61),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.to(LabHomePage());
            },
            child: Icon(Icons.arrow_circle_left)),
        title: Text("Upload Patient Report"),
      ),
      body: Obx(
        () => (_labUploadReportController.isLoading.isFalse)
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
                      child: Obx(
                        () => _labUploadReportController.selectedPath.value !=
                                ''
                            ? Image.file(File(
                                _labUploadReportController.selectedPath.value))
                            : Center(
                                child: InkWell(
                                  onTap: (() {
                                    optionsImage();
                                  }),
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
                              ),
                        // Image.file(File(
                        //         _labUploadReportController.selectedImagePath.value)),
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
                          () => DropdownButtonFormField<PatientdropdownName>(
                              value: _labUploadReportController
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
                              items: _labUploadReportController.patient
                                  .map((PatientdropdownName patients) {
                                return DropdownMenuItem(
                                  value: patients,
                                  child: Text(
                                    patients.patientName.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.height * 0.015,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (PatientdropdownName? newValue) {
                                _labUploadReportController
                                    .selectedpatient.value = newValue!;
                                // _hospital_2_controller.states.value =
                                //     newValue! as List<String>;
                                // _hospital_2_controller.selectedCity.value = null;
                                // _hospital_2_controller.cities.clear();
                                // _hospital_2_controller.cities
                                //     .addAll(stateCityMap[newvalue]!);
                              }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NeumorphicTextFieldContainer(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.00),
                        child: Obx(
                          () => DropdownButtonFormField(
                              // menuMaxHeight: size.height * 0.06,
                              //icon: Icon(Icons.location_city),
                              value:
                                  _labUploadReportController.selectedTest.value,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.text_snippet_outlined,
                                  color: Colors.black,
                                ),
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                              hint: Text('Selected Test'),
                              items: _labUploadReportController.tests
                                  .map((TestModel test) {
                                return DropdownMenuItem(
                                  value: test,
                                  child: Text(
                                    test.testName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.height * 0.010,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (TestModel? newValue) {
                                _labUploadReportController.selectedTest.value =
                                    newValue!;
                              }),
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
                          _labUploadReportController.postUploadreportApi();
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

  void optionsImage() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      content: SizedBox(
        width: 780,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _labUploadReportController.getImage(ImageSource.camera);
                Get.back();
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
              onTap: () {
                _labUploadReportController.getImage(ImageSource.gallery);
                Get.back();
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
                    width: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
