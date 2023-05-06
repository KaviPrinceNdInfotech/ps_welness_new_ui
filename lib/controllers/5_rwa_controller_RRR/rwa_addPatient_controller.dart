import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../servicess_api/rahul_api_provider/api_provider_RRR.dart';

//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
class RWAAddPatientController extends GetxController {
  TextEditingController? AdminLogin_Id,
      PatientName,
      EmailId,
      MobileNumber,
      Password,
      ConfirmPassword,
      Location,
      PinCode;
  void rwaAddPatientApi() async {
    http.Response r = await ApiProvider.RWAAddPatientApi(
      AdminLogin_Id?.text,
      PatientName?.text,
      EmailId?.text,
      MobileNumber?.text,
      Password?.text,
      ConfirmPassword?.text,
      Location?.text,
      PinCode?.text,
    );
    if (r.statusCode == 200) {
    } else {}
  }

  @override
  void onInit() {
    AdminLogin_Id = TextEditingController(text: '1');
    PatientName = TextEditingController(text: 'Rahul singh');
    EmailId = TextEditingController(text: 'rahul@gmail.com');
    MobileNumber = TextEditingController(text: '1111111111');
    Password = TextEditingController(text: '123456');
    ConfirmPassword = TextEditingController(text: '123456');
    Location = TextEditingController(text: 'noida');
    PinCode = TextEditingController(text: '201303');
    super.onInit();
  }
}
