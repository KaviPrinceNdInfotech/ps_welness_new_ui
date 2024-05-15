//
// //import 'package:ps_welness_new_ui/controllers/4_nurse_controller/nurse_upload_report/nurseUploadReportController.dart';
//
// class NurseUploadReport extends StatelessWidget {
//   NurseUploadReportController _nurseUploadReportController =
//       Get.put(NurseUploadReportController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload Report"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 300,
//               width: 300,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.blue, width: 1.0),
//                   borderRadius: BorderRadius.circular(20)),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Obx(
//                   () =>
//                       _nurseUploadReportController.selectedImagePath.value == ''
//                           ? Center(child: Text("No Image"))
//                           : Image.file(File(_nurseUploadReportController
//                               .selectedImagePath.value)),
//                 ),
//               ),
//             ),
//             // Container(
//             //     height: 300,
//             //     width: 300,
//             //   decoration: new BoxDecoration(
//             //     color: Colors.white,
//             //     border: new Border.all(color: Colors.blueAccent, width: 2.0),
//             //     borderRadius: new BorderRadius.circular(10.0),
//             //   ),
//             //     child: imagepath != null ? Image.file(imagepath!,fit: BoxFit.cover,)
//             //         : Center(child: Text("Image Not Choosen yet"))
//             // ),
//             // imagepath != null ?
//             // Container(
//             //   height: 300,
//             //   width: 300,
//             // child: Image.file(imagepath!),)  :
//             //
//             // Container(
//             //     height: 300,width: 300,
//             //     child: Text("Image Not Choose yet")),
//
//             const SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               //controller: _textEdit,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(), label: Text("Enter Id")),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () {
//                 _modelBottomSheet(context);
//               },
//               child: Container(
//                 height: 50.0,
//                 decoration: BoxDecoration(
//                   color: Colors.blueAccent,
//                   border: Border.all(color: Colors.white, width: 2.0),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Choose Image',
//                     style: TextStyle(fontSize: 18.0, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 height: 50.0,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.blue, width: 0.5),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Upload Image',
//                     style: TextStyle(fontSize: 18.0, color: Colors.black),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   _modelBottomSheet(BuildContext context) {
//     return showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 leading: new Icon(Icons.camera_alt_sharp),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   _nurseUploadReportController.getImage(ImageSource.camera);
//                   Navigator.pop(context);
//                 },
//               ),
//               Divider(),
//               ListTile(
//                 leading: new Icon(Icons.image_outlined),
//                 title: new Text('Gallery'),
//                 onTap: () {
//                   _nurseUploadReportController.getImage(ImageSource.gallery);
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           );
//         });
//   }
// }

///
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_welness_new_ui/controllers/4_nurse_controllerRRR33344new/nurse_upload_report_controller/nurse_upload_report_controller.dart';
import 'package:ps_welness_new_ui/model/4_nurse_all_models_RRR/dropdown_list_patient_nurse.dart';
import 'package:ps_welness_new_ui/modules_view/4_nurse_section_view_RRR/nurse_home/nurse_home_page.dart';

import '../../../widgets/widgets/neumorphic_text_field_container.dart';
import '../../../widgets/widgets/rectangular_button.dart';
//import 'package:ps_welness_new_ui/controllers/4_nurse_controller/nurse_upload_report/nurseUploadReportController.dart';

class NurseUploadReport extends StatelessWidget {
  NurseUploadReportController _nursdeUploadReportController =
      Get.put(NurseUploadReportController());

  String textHolder = '268 ';
  RxInt selectedimg = 0.obs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color(0xffffdb61),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: InkWell(
            onTap: () {
              Get.to(NurseHomePage());
            },
            child: Icon(Icons.arrow_circle_left)),
        title: Text("Upload Patient Feedback"),
      ),
      body: Obx(
        () => (_nursdeUploadReportController.isLoading.isFalse)
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
                        () => _nursdeUploadReportController
                                    .selectedPath.value !=
                                ''
                            ? Image.file(File(_nursdeUploadReportController
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
                      height: 30,
                    ),
                    NeumorphicTextFieldContainer(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: Obx(
                          () => DropdownButtonFormField<PatientNameNurse>(
                              value: _nursdeUploadReportController
                                  .selectedpatients.value,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                              hint: Text('Select Patient'),
                              items: _nursdeUploadReportController.patientss
                                  .map((PatientNameNurse patients) {
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
                              onChanged: (PatientNameNurse? newValue) {
                                _nursdeUploadReportController
                                    .selectedpatients.value = newValue!;
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
                    // NeumorphicTextFieldContainer(
                    //   child: Padding(
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: size.width * 0.00),
                    //     child: Obx(
                    //       () => DropdownButtonFormField(
                    //           // menuMaxHeight: size.height * 0.06,
                    //           //icon: Icon(Icons.location_city),
                    //           value: _nursdeUploadReportController
                    //               .selectedTest.value,
                    //           decoration: InputDecoration(
                    //             prefixIcon: Icon(
                    //               Icons.text_snippet_outlined,
                    //               color: Colors.black,
                    //             ),
                    //             enabledBorder: InputBorder.none,
                    //             border: InputBorder.none,
                    //           ),
                    //           hint: Text('Selected Test'),
                    //           items: _nursdeUploadReportController.tests
                    //               .map((TestModel test) {
                    //             return DropdownMenuItem(
                    //               value: test,
                    //               child: Text(
                    //                 test.testName,
                    //                 style: TextStyle(
                    //                   fontWeight: FontWeight.w600,
                    //                   fontSize: size.height * 0.010,
                    //                 ),
                    //               ),
                    //             );
                    //           }).toList(),
                    //           onChanged: (TestModel? newValue) {
                    //             _nursdeUploadReportController
                    //                 .selectedTest.value = newValue!;
                    //           }),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    RectangularButton(
                        text: 'SUBMIT FEEDBACK',
                        press: () async {
                          //CallLoader.loader();

                          ///todo: calling api....
                          _nursdeUploadReportController
                              .postnurseUploadreportApi();
                          // Clear selected image path
                          _nursdeUploadReportController.selectedPath.value = '';

                          // Clear dropdown value
                          _nursdeUploadReportController.selectedpatients.value =
                              null;

                          ///Clear dropdown value

                          _nursdeUploadReportController.imagePath.clear();
                          _nursdeUploadReportController.selectedImagePath
                              .close();

                          //resetSelection();
                          /// await optionsController.selectOption();

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
                _nursdeUploadReportController.getImage(ImageSource.camera);
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
                _nursdeUploadReportController.getImage(ImageSource.gallery);
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

class OptionsController extends GetxController {
  RxBool isOptionSelected = false.obs;

  void resetSelection() {
    isOptionSelected.value = false;
  }

  Future<void> selectOption() async {
    isOptionSelected.value = true;
  }
}
