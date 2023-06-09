import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:image_picker/image_picker.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color(0xffffdb61),
      appBar: AppBar(
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
                      child: Obx(
                        () => _doctorrUploadReportController
                                    .selectedPath.value !=
                                ''
                            ? Image.file(File(_doctorrUploadReportController
                                .selectedPath.value))
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
                                  .map((PatientDropdownDoctorName patients) {
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
                              onChanged: (PatientDropdownDoctorName? newValue) {
                                _doctorrUploadReportController
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
                    RectangularButton(
                        text: 'SUBMIT REPORT',
                        press: () async {
                          //CallLoader.loader();

                          ///todo: calling api....
                          _doctorrUploadReportController
                              .postdoctorUploadreportApi();
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
                _doctorrUploadReportController.getImage(ImageSource.camera);
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
                _doctorrUploadReportController.getImage(ImageSource.gallery);
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
