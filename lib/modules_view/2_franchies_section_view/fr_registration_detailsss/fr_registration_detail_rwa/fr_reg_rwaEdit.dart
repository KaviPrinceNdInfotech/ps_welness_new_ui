import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesRWADetail_controller.dart';

class EditRWA extends StatefulWidget {
  String id,name,phone,mobile,email,location,c_number;
  EditRWA({Key? key,required this.id,required this.name,required this.phone,required this.mobile,
    required this.email,required this.location,required this.c_number}) : super(key: key);

  @override
  State<EditRWA> createState() => _EditChemistState();
}
class _EditChemistState extends State<EditRWA> {
  String? id1,name1,phone1,mobile1,email1,location1,c_number1;
  FrenchiesRWADetailController _frenchiesRWADetailController = Get.put(FrenchiesRWADetailController());
  @override
  void initState() {
    id1 = widget.id;
    name1 = widget.name;
    phone1 = widget.phone;
    mobile1 = widget.mobile;
    email1 = widget.email;
    location1 =widget.location;
    c_number1 = widget.c_number;
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
    final c_number = TextEditingController(text: c_number1);
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
                controller: c_number,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Certificate number',
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4.0))),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                _frenchiesRWADetailController.frenchiesEditRWADetailapi(id.text,name.text,phone.text,mobile.text,
                    email.text,location.text,c_number.text);
                Timer(const Duration(seconds: 2), () =>
                    _frenchiesRWADetailController.frenchiesRWADetailApi());
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
