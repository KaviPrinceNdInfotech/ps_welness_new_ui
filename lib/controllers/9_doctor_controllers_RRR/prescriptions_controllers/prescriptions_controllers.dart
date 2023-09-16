import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ps_welness_new_ui/modules_view/9_doctor_section_view_RRR/home_page_view/home_page.dart';

import '../../../modules_view/circular_loader/circular_loaders.dart';
import '../../../servicess_api/api_services_all_api.dart';

class Prescriptions_doctor_Controller extends GetxController {
  final GlobalKey<FormState> prescriptionsdrformkey = GlobalKey<FormState>();

  late TextEditingController weightController,
      ageController,
      complainController,
      medicinesurgeryController,
      alergyController,
      primerydiagnosisController,
      prescribetestController,
      med1Controller,
      med2Controller,
      med3Controller,
      med4Controller,
      med5Controller,
      med6Controller,
      med7Controller,
      med8Controller,
      med9Controller,
      med10Controller,
      dose1Controller,
      dose2Controller,
      dose3Controller,
      dose4Controller,
      dose5Controller,
      dose6Controller,
      dose7Controller,
      dose8Controller,
      dose9Controller,
      dose10Controller,
      instruction1Controller,
      instruction2Controller,
      instruction3Controller,
      instruction4Controller,
      instruction5Controller,
      instruction6Controller,
      instruction7Controller,
      instruction8Controller,
      instruction9Controller,
      instruction10Controller;

  var weight = '';
  var age = '';
  var complain = '';
  var medicinesurgery = '';
  var alergy = '';
  var primerydiagnosis = '';
  var prescribetest = '';
  var med1 = '';
  var med2 = '';
  var med3 = '';
  var med4 = '';
  var med5 = '';
  var med6 = '';
  var med7 = '';
  var med8 = '';
  var med9 = '';
  var med10 = '';
  var dose1 = '';
  var dose2 = '';
  var dose3 = '';
  var pin = '';
  var dose4 = '';
  var dose5 = '';
  var dose6 = '';
  var dose7 = '';
  var dose8 = '';
  var dose9 = '';
  var dose10 = '';
  var instruction1 = '';
  var instruction2 = '';
  var instruction3 = '';
  var instruction4 = '';
  var instruction5 = '';
  var instruction6 = '';
  var instruction7 = '';
  var instruction8 = '';
  var instruction9 = '';
  var instruction10 = '';

  void prescriptionsApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.DoctorPrescriptionsApi(
      //VendorName.text,
      weightController.text,
      complainController.text,
      alergyController.text,
      primerydiagnosisController.text,

      med1Controller.text,
      dose1Controller.text,
      instruction1Controller.text,

      med2Controller.text,
      dose2Controller.text,
      instruction2Controller.text,

      med3Controller.text,
      dose3Controller.text,
      instruction3Controller.text,

      med4Controller.text,
      dose4Controller.text,
      instruction4Controller.text,

      med5Controller.text,
      dose5Controller.text,
      instruction5Controller.text,

      med6Controller.text,
      dose6Controller.text,
      instruction6Controller.text,

      med7Controller.text,
      dose7Controller.text,
      instruction7Controller.text,

      med8Controller.text,
      dose8Controller.text,
      instruction8Controller.text,

      med9Controller.text,
      dose9Controller.text,
      instruction9Controller.text,

      med10Controller.text,
      dose10Controller.text,
      instruction10Controller.text,

      prescribetestController.text,
      medicinesurgeryController.text,
    );
    if (r.statusCode == 200) {
      Get.snackbar(
        'Success',
        "${r.body}",
        duration:
            const Duration(seconds: 1), //Get.to(DoctorHomePage(key: 12345,));
      );
      CallLoader.loader();
      Get.to(DoctorHomePage());

      // CallLoader.hideLoader();

      //Get.snackbar('message', "${r.body}");
      /// we can navigate to user page.....................................
      // Get.to(SignInScreen());
      //CallLoader.loader();
      // await Future.delayed(Duration(milliseconds: 500));
      // //CallLoader.hideLoader();
      // await SharedPreferences.getInstance()
      //     .then((value) => Get.offAll(() => SignInScreen()));
    } else {
      Get.snackbar(
        'Error',
        "${r.body}",
        duration: const Duration(seconds: 1),
      );
    }
  }

  //get stateCitymap => null;

  @override
  void onInit() {
    weightController = TextEditingController();
    //ageController = TextEditingController();
    complainController = TextEditingController();
    medicinesurgeryController = TextEditingController();
    alergyController = TextEditingController();
    primerydiagnosisController = TextEditingController();
    prescribetestController = TextEditingController();
    med1Controller = TextEditingController();
    med2Controller = TextEditingController();
    med3Controller = TextEditingController();
    med4Controller = TextEditingController();
    med5Controller = TextEditingController();
    med6Controller = TextEditingController();
    med7Controller = TextEditingController();
    med8Controller = TextEditingController();
    med9Controller = TextEditingController();
    med10Controller = TextEditingController();

    dose1Controller = TextEditingController();
    dose2Controller = TextEditingController();
    dose3Controller = TextEditingController();
    dose4Controller = TextEditingController();
    dose5Controller = TextEditingController();
    dose6Controller = TextEditingController();
    dose7Controller = TextEditingController();
    dose8Controller = TextEditingController();
    dose9Controller = TextEditingController();
    dose10Controller = TextEditingController();

    instruction1Controller = TextEditingController();
    instruction2Controller = TextEditingController();
    instruction3Controller = TextEditingController();
    instruction4Controller = TextEditingController();
    instruction5Controller = TextEditingController();
    instruction6Controller = TextEditingController();
    instruction7Controller = TextEditingController();
    instruction8Controller = TextEditingController();
    instruction9Controller = TextEditingController();
    instruction10Controller = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    weightController.dispose();
    // ageController.dispose();
    complainController.dispose();
    medicinesurgeryController.dispose();
    alergyController.dispose();
    primerydiagnosisController.dispose();
    prescribetestController.dispose();
    med1Controller.dispose();
    med2Controller.dispose();
    med3Controller.dispose();
    med4Controller.dispose();
    med5Controller.dispose();
    med6Controller.dispose();
    med7Controller.dispose();
    med8Controller.dispose();
    med9Controller.dispose();
    med10Controller.dispose();

    dose1Controller.dispose();
    dose2Controller.dispose();
    dose3Controller.dispose();
    dose4Controller.dispose();
    dose5Controller.dispose();
    dose6Controller.dispose();
    dose7Controller.dispose();
    dose8Controller.dispose();
    dose9Controller.dispose();
    dose10Controller.dispose();

    instruction1Controller.dispose();
    instruction2Controller.dispose();
    instruction3Controller.dispose();
    instruction4Controller.dispose();
    instruction5Controller.dispose();
    instruction6Controller.dispose();
    instruction7Controller.dispose();
    instruction8Controller.dispose();
    instruction9Controller.dispose();
    instruction10Controller.dispose();
  }

  String? Weight(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    // if (value.length < 1) {
    //   return '              A valid pin should be of 6 digits';
    // }
    return null;
  }

  String? Complane(String value) {
    if (value.isEmpty) {
      return 'This field is required';

      // return '              This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? Alergy(String value) {
    if (value.isEmpty) {
      return 'This field is required';
      // return '              This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? Medicinesurgery(String value) {
    if (value.isEmpty) {
      return 'This field is required';
      //return '              This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? Alergy22(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? Primerydiagnosis(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? Prescribetest(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? Med1(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? Dose1(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  String? Inst1(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    // if (value.length != 10) {
    //   return '              A valid phone number should be of 10 digits';
    // }
    return null;
  }

  void checkPrescription1() {
    if (prescriptionsdrformkey.currentState!.validate()) {
      prescriptionsApi();
    }
    prescriptionsdrformkey.currentState!.save();
  }
  //   prescriptionsdrformkey.currentState!.save();
  //   final isValid = prescriptionsdrformkey.currentState!.validate();
  //   if (!isValid) {
  //     prescriptionsApi();
  //     return;
  //   }
  //   prescriptionsdrformkey.currentState!.save();
  //   //Get.to(() => HomePage());
  // }
}
