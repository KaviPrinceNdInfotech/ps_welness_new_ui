import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ps_welness_new_ui/controllers/2_franchises_controller/frenchiesRegistrationDetail_Controller/frenchiesChemistDetail_controller.dart';
import 'package:ps_welness_new_ui/modules_view/circular_loader/circular_loaders.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fr_registration_chemist_detailss.dart';

class EditChemist extends StatefulWidget {
  String id, name, shopName, mobile, email, location, gstNumber, licenceNo;
  EditChemist(
      {Key? key,
      required this.id,
      required this.name,
      required this.shopName,
      required this.mobile,
      required this.email,
      required this.location,
      required this.gstNumber,
      required this.licenceNo})
      : super(key: key);

  @override
  State<EditChemist> createState() => _EditChemistState();
}

class _EditChemistState extends State<EditChemist> {
  String? id1,
      name1,
      shopName1,
      mobile1,
      email1,
      location1,
      gstNumber1,
      licenceNo1;
  FrenchiesChemistDetailController _frenchiesChemistDetailController =
      Get.put(FrenchiesChemistDetailController());

  @override
  void initState() {
    id1 = widget.id;
    name1 = widget.name;
    shopName1 = widget.shopName;
    mobile1 = widget.mobile;
    email1 = widget.email;
    location1 = widget.location;
    gstNumber1 = widget.gstNumber;
    licenceNo1 = widget.licenceNo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final id = TextEditingController(text: id1);
    final name = TextEditingController(text: name1);
    final shop = TextEditingController(text: shopName1);
    final mobile = TextEditingController(text: mobile1);
    final email = TextEditingController(text: email1);
    final location = TextEditingController(text: location1);
    final gst = TextEditingController(text: gstNumber1);
    final licence = TextEditingController(text: licenceNo1);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller:
                      id, //_frenchiesChemistDetailController.chemistName,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'Chemist Id',
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 4.0))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller:
                      name, //_frenchiesChemistDetailController.chemistName,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'Chemist Name',
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 4.0))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller:
                      shop, //_frenchiesChemistDetailController.chemistName,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'Shop Name',
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 4.0))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller:
                      mobile, //_frenchiesChemistDetailController.chemistName,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'Mobile',
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 4.0))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller:
                      email, //_frenchiesChemistDetailController.chemistName,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 4.0))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller:
                      location, //_frenchiesChemistDetailController.chemistName,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'Location',
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 4.0))),
                ),
              ),

              ///gst number
              // SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //   height: 50,
              //   child: TextFormField(
              //     controller: gst,
              //     keyboardType: TextInputType.text,
              //     maxLines: 1,
              //     decoration: const InputDecoration(
              //         labelText: 'GST no.',
              //         hintMaxLines: 1,
              //         border: OutlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Colors.green, width: 4.0))),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: licence,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'Licence no.',
                      hintMaxLines: 1,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 4.0))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  _frenchiesChemistDetailController
                      .FrenchiesEditChemistDetailapi(
                    id.text,
                    name.text,
                    shop.text,
                    mobile.text,
                    email.text,
                    location.text,
                    gst.text,
                    licence.text,
                  );
                  // Timer(const Duration(seconds: 2), () =>
                  //
                  //     _frenchiesChemistDetailController.FrenchiesChemistDetailApi()
                  // Get.back();
                  _frenchiesChemistDetailController.FrenchiesChemistDetailApi();
                  _frenchiesChemistDetailController.update();
                  _frenchiesChemistDetailController.onInit();
                  CallLoader.loader();
                  await Future.delayed(Duration(milliseconds: 1900));
                  CallLoader.hideLoader();
                  await SharedPreferences.getInstance()
                      .then((value) => Get.to(ResitrationChemistDetails())
                          //text: option.productName,
                          //  )
                          );
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
      ),
    );
  }
}
