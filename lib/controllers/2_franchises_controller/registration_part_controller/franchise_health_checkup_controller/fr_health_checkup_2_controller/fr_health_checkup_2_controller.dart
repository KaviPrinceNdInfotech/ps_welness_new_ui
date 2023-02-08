import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Fr_CheckUp_2_Controller extends GetxController {
  final GlobalKey<FormState> frhealthcheckup2formkey = GlobalKey<FormState>();

  ///TODO: image picker.................
  ///
  var selectedTime = TimeOfDay.now().obs;
  var selectedTime2 = TimeOfDay.now().obs;

  ///TODO: image picker.................
  ///
  var selectedImagepath = ''.obs;
  var selectedImagepath1 = ''.obs;
  var selectedImagepath2 = ''.obs;
  var selectedImagepath3 = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///
  void getImage1(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath1.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///
  void getImage2(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath2.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///

  void getImage3(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagepath3.value = pickedFile.path;
    } else {
      print('No image selected');
    }
  }

  ///this is for State....................................
  Rx<String?> selectedCity = (null as String?).obs;
  RxList<String> cities = <String>[].obs;

  //this is for City.................................
  Rx<String?> selectedState = (null as String?).obs;
  RxList<String> states = <String>[].obs;

  late TextEditingController pinController,
      addressController,
      franchiesController,
      gstController,
      licencenumberController,
      panController,
      licencevalidityController,
      aadharController,
      regicertiController;

  var pin = '';
  var address = '';
  var franchiesid = '';
  var gstno = '';
  var licenceno = '';
  var licencevalidity = '';
  var pan = '';
  var aadhar = '';
  var registercertificate = '';

  //get stateCitymap => null;

  @override
  void onInit() {
    // stateCitymap((key, value) {
    //   states.add(key);
    // }
    //);
    states.refresh();

    pinController = TextEditingController();
    addressController = TextEditingController();
    franchiesController = TextEditingController();

    gstController = TextEditingController();
    licencenumberController = TextEditingController();
    licencevalidityController = TextEditingController();
    panController = TextEditingController();
    aadharController = TextEditingController();
    regicertiController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pinController.dispose();
    addressController.dispose();
    franchiesController.dispose();
    gstController.dispose();
    licencenumberController.dispose();
    licencevalidityController.dispose();
    panController.dispose();
    aadharController.dispose();
    regicertiController.dispose();
  }

  ///time 1........................
  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime.value,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        },
        initialEntryMode: TimePickerEntryMode.input,
        helpText: 'Select Departure Time',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorInvalidText: 'Provide valid time',
        hourLabelText: 'Select Hour',
        minuteLabelText: 'Select Minute');

    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }

  ///time 2...................

  chooseTime2() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime2.value,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        },
        initialEntryMode: TimePickerEntryMode.input,
        helpText: 'Select Departure Time',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorInvalidText: 'Provide valid time',
        hourLabelText: 'Select Hour',
        minuteLabelText: 'Select Minute');
    if (pickedTime != null && pickedTime != selectedTime2.value) {
      selectedTime2.value = pickedTime;
    }
  }

  String? validPin(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 6) {
      return '              A valid pin should be of 6 digits';
    }
    return null;
  }

  String? validAddress(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validCertificate(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validFranchiesid(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validGstno(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validLicenceno(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validLicencevalidity(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validaadhar(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validpan(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  String? validregistercerti(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    return null;
  }

  void checkchemist2() {
    final isValid = frhealthcheckup2formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    frhealthcheckup2formkey.currentState!.save();
    //Get.to(() => HomePage());
  }
}
