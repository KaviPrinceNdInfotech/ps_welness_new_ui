import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesLabDetail_controller.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesRWADetail_controller.dart';

class EditLab extends StatefulWidget {
  String id,name,phone,mobile,email,location,gst,licence,aadhar;
  EditLab({Key? key,required this.id,required this.name,required this.phone,required this.mobile,
    required this.email,required this.location,required this.gst,required this.licence,required this.aadhar}) : super(key: key);
  @override
  State<EditLab> createState() => _EditLabState();
}
class _EditLabState extends State<EditLab> {
  String? id1,name1,phone1,mobile1,email1,location1,gst1,licence1,aadhar1;
  FrenchiesLabDetailController _frenchiesLabDetailController = Get.put(FrenchiesLabDetailController());
  @override
  void initState() {
    id1 = widget.id;
    name1 = widget.name;
    phone1 = widget.phone;
    mobile1 = widget.mobile;
    email1 = widget.email;
    location1 =widget.location;
    gst1 = widget.gst;
    licence1 = widget.licence;
    aadhar1 = widget.aadhar;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final id = TextEditingController(text: id1);
    final name = TextEditingController(text: name1);
    final phone = TextEditingController(text: phone1);
    final mobile = TextEditingController(text: mobile1);
    final email = TextEditingController(text: email1);
    final location = TextEditingController(text: location1);
    final gst = TextEditingController(text: gst1);
    final licence = TextEditingController(text: licence1);
    final aadhar = TextEditingController(text: aadhar1);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Name',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: phone,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Phone',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: mobile,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Mobile',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: location,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Location',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: gst,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'GST number',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: licence,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Licence number',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: aadhar,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Aadhar number',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                _frenchiesLabDetailController.frenchiesEditLabDetailapi(id.text,name.text,phone.text,mobile.text,
                    email.text,location.text,gst.text,licence.text,aadhar.text);
                Timer(const Duration(seconds: 2), () =>
                    _frenchiesLabDetailController.frenchiesLabDetailApi());
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.teal,
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
