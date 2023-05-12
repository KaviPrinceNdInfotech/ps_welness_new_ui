import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controllers/10_lab_controller/lab_upload_report_controller/lab_upload_report_controllers.dart';
//import 'package:ps_welness_new_ui/controllers/4_nurse_controller/nurse_upload_report/nurseUploadReportController.dart';

class LabUploadReports extends StatelessWidget {
  LabUploadReportController _labUploadReportController =
      Get.put(LabUploadReportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Patient Report"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Obx(
                  () => _labUploadReportController.selectedImagePath.value == ''
                      ? Center(child: Text("No Image"))
                      : Image.file(File(
                          _labUploadReportController.selectedImagePath.value)),
                ),
              ),
            ),
            // Container(
            //     height: 300,
            //     width: 300,
            //   decoration: new BoxDecoration(
            //     color: Colors.white,
            //     border: new Border.all(color: Colors.blueAccent, width: 2.0),
            //     borderRadius: new BorderRadius.circular(10.0),
            //   ),
            //     child: imagepath != null ? Image.file(imagepath!,fit: BoxFit.cover,)
            //         : Center(child: Text("Image Not Choosen yet"))
            // ),
            // imagepath != null ?
            // Container(
            //   height: 300,
            //   width: 300,
            // child: Image.file(imagepath!),)  :
            //
            // Container(
            //     height: 300,width: 300,
            //     child: Text("Image Not Choose yet")),

            const SizedBox(
              height: 20,
            ),
            TextFormField(
              //controller: _textEdit,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter patient Name")),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              //controller: _textEdit,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Enter Test Name")),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _modelBottomSheet(context);
              },
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    'Choose Image',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    'Upload Image',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _modelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.camera_alt_sharp),
                title: const Text('Camera'),
                onTap: () {
                  _labUploadReportController.getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: new Icon(Icons.image_outlined),
                title: new Text('Gallery'),
                onTap: () {
                  _labUploadReportController.getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
